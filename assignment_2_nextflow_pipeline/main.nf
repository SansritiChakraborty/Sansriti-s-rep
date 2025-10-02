!/usr/bin/env nextflow
nextflow.enable.dsl=2

// Ensure parameters are defined
params.samplesheet  ='samplesheet.csv'
params.outdir       ='results'
params.vep_threads  = 4

// Create output directory if it doesn't exist
new File(params.outdir).mkdirs()

samples_ch = Channel.fromPath(params.samplesheet)
    .splitCsv(header:true)
    .map { row -> tuple(row.Sample_Name, file(row.VCF_File_Path), row.Gender, row.Case_Control) }


// VEP annotation process
process annotate_vcf {

    tag { sample_name }

    input:
    tuple val(sample_name), path(vcf), val(gender), val(case_control)

    output:
    tuple val(sample_name), path("${sample_name}.annotated.vcf")

    cpus 1
    memory '1.5 GB'
    time '2h'
    container 'ensemblorg/ensembl-vep:release_113.4'

     script:

    """
    vep \
      -i ${vcf} \
      -o ${sample_name}.annotated.vcf \
      --species homo_sapiens \
      --assembly GRCh38 \
      --vcf \
      --everything \
      --fork ${task.cpus} \
      --offline
    """
}

// Workflow
workflow {
    annotated_vcfs = annotate_vcf(samples_ch)
    annotated_vcfs.view()

}