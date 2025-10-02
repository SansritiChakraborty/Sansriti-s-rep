** VEP Annotation Nextflow Pipeline**

This Nextflow pipeline annotates VCF files using Ensembl VEP (Variant Effect Predictor) and Docker. It is designed for running in a reproducible, containerized environment using nf-core standards.

Workflow Objective

The pipeline takes one or more VCF files as input and produces VEP-annotated VCFs with transcript- and variant-level annotations.

Input

The pipeline requires the following command-line parameters:



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

Input file format:

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



Errors shown:

* Permission denied in `.command.sh`
* Unable to figure out the root cause



---

 Errors made and how they were corrected:


1. Permission fix

```bash
chmod +x ./*
```

* Attempted to make scripts executable.

2. Running manually in work dir

```bash
bash .command.run
```

* Revealed the actual error: `vep: command not found`.

3. Checking VEP input files

```bash
ls -l /home/mimi/nextflow-vep/input_vcfs/test*.vcf
```

* Verified VCF files exist and have correct permissions.

4. Navigating and cleaning folders

* Tried moving `nextflow_project` to a backup folder.
* Checked folder paths using `find` and `ls -l`.

5. Running Nextflow with Docker

```bash
nextflow run ../ensembl-vep-release-115/main.nf \
    --samplesheet samplesheet.csv \
    --outdir results \
    -with-docker ensemblorg/ensembl-vep:release_115 \
    -resume
```

* Attempted to force correct Docker image (`release_115`) to fix VEP not found.

---<img width="1902" height="964" alt="Screenshot 2025-10-02 153757" src="https://github.com/user-attachments/assets/38923e14-7b95-4716-a414-c767d75d6740" />
<img width="1904" height="957" alt="Screenshot 2025-10-02 150520" src="https://github.com/user-attachments/assets/7f9a9223-662f-4a21-beac-f3450215ccea" />
<img width="1904" height="165" alt="Screenshot 2025-10-02 150814" src="https://github.com/user-attachments/assets/4bfa7061-a066-48e6-8eab-f1f928c83c57" />
<img width="1918" height="957" alt="Screenshot 2025-09-30 201417" src="https://github.com/user-attachments/assets/8fb1d398-1ad6-4363-b118-0624a46115ef" />
<img width="1915" height="939" alt="Screenshot 2025-09-30 201634" src="https://github.com/user-attachments/assets/3978ce96-b2a3-482c-9ceb-83b06b2babcf" />
<img width="1882" height="244" alt="Screenshot 2025-10-01 145253" src="https://github.com/user-attachments/assets/a4912fd4-fd52-4f37-a588-e028b695f813" />
<img width="1899" height="837" alt="Screenshot 2025-09-30 201814" src="https://github.com/user-attachments/assets/61125ab2-0560-4b92-8ea4-3fc34d5e42b2" />
<img width="1885" height="929" alt="Screenshot 2025-09-30 201725" src="https://github.com/user-attachments/assets/5d34d767-908b-4071-87f4-5c0aac90f87c" />
<img width="1919" height="945" alt="Screenshot 2025-10-01 145331" src="https://github.com/user-attachments/assets/a25423fa-6311-4672-b122-24884bd05a8a" />
<img width="1626" height="853" alt="Screenshot 2025-10-02 145509" src="https://github.com/user-attachments/assets/7cacbb72-4201-4762-9853-a45b57010209" />
<img width="1895" height="725" alt="Screenshot 2025-10-02 154051" src="https://github.com/user-attachments/assets/d5aea540-0a19-44e8-909a-08b7601cc04d" />


---
Workflow Diagram

```mermaid
flowchart TB
    subgraph "Nextflow VEP Pipeline"
        A["Samplesheet CSV"] --> B["VCF files"]
        B --> C["VEP Annotation (Docker)"]
        C --> D["VEP-Annotated VCFs"]
        D --> E["Cleaned CSV / Summary files"]
    end
```
