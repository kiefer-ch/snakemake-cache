rule gencode_transcripts:
    output:
        "resources/gencode/gencode_human/release_{release}/gencode.v{release}.transcripts.fa"
    resources:
        runtime = 5
    cache:
        "omit-software"
    shell:
        "wget -q -O"
        " - https://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_human/release_{wildcards.release}/gencode.v{wildcards.release}.transcripts.fa.gz"
        " | gunzip > {output}"


rule gencode_genome:
    output:
        "resources/gencode/gencode_human/release_{release}/GRCh38.primary_assembly.genome.fa"
    resources:
        runtime = 5
    cache:
        "omit-software"
    shell:
        "wget -q -O"
        " - https://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_human/release_{wildcards.release}/GRCh38.primary_assembly.genome.fa.gz"
        " | gunzip > {output}"


rule gencode_annotation:
    output:
        "resources/gencode/gencode_human/release_{release}/gencode.v{release}.primary_assembly.annotation.gtf"
    cache:
        "omit-software"
    resources:
        runtime = 5
    shell:
        "wget -q -O"
        " - https://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_human/release_{wildcards.release}/gencode.v{wildcards.release}.primary_assembly.annotation.gtf.gz"
        " | gunzip > {output}"
