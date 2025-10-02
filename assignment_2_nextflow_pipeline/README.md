** VEP Annotation Nextflow Pipeline**

This Nextflow pipeline annotates VCF files using Ensembl VEP (Variant Effect Predictor) and Docker. It is designed for running in a reproducible, containerized environment using nf-core standards.

Workflow Objective

The pipeline takes one or more VCF files as input and produces VEP-annotated VCFs with transcript- and variant-level annotations.

Input

The pipeline requires the following command-line parameters:

```bash
nextflow run main.nf \
  --samplesheet 'samplesheet.csv' \
  --outdir 'results'
```

| Parameter       | Type   | Description                                                          |
| --------------- | ------ | -------------------------------------------------------------------- |
| `--samplesheet` | file   | CSV file containing sample metadata and VCF paths (see format below) |
| `--outdir`      | string | Directory to store all outputs                                       |

---

Samplesheet Format

The `samplesheet.csv` should have at least the following columns:

| Column             | Description                                       |
| ------------------ | ------------------------------------------------- |
| `sample_id`        | Unique sample identifier                          |
| `vcf_path`         | Full or relative path to the input VCF file       |
| `vcf_tumor_sample` | Tumor sample name as it appears in the VCF header |



```csv
sample_id,vcf_path,vcf_tumor_sample
Sample_001,data/vcfs/sample_001.vcf.gz,TUMOR_SAMPLE_001
Sample_002,data/vcfs/sample_002.vcf.gz,TUMOR_SAMPLE_002
```

Output

For each sample, the workflow aims to produce:

1. VEP-annotated VCF files
2. Optional cleaned CSV files containing key annotations for downstream analysis

The directory structure under `--outdir` will look like:

```
results/
├── vep_annotated_vcfs/     # Annotated VCF files
├── clean_vcfs/             # Processed VCFs and CSV summaries
```

---

Running the Pipeline

With Docker:

```bash
nextflow run main.nf -profile docker \
  --samplesheet 'samplesheet.csv' \
  --outdir 'results'
```

Required Tools / Versions

* Nextflow v25.04.7
* Docker (e.g., `ensemblorg/ensembl-vep:release_115`)
* WSL2 / Linux environment (if on Windows)
* VEP (inside Docker)

Troubleshooting

* Permission denied in `.command.sh`: Ensure Docker mounts are writable and `NXF_DOCKER_EXTRA_ARGS="-u $(id -u):$(id -g)"` is set.

Future Improvements

* Support multi-sample VCFs
* Add optional transcript-level expression annotation
* Include automated testing via `nf-test`



---
Workflow Diagram

```mermaid
flowchart TB
    subgraph "Nextflow VEP Pipeline"
        A["Samplesheet CSV"] --> B["VCF files"]
        B --> C["VEP Annotation (Docker/Singularity)"]
        C --> D["VEP-Annotated VCFs"]
        D --> E["Cleaned CSV / Summary files"]
    end
```