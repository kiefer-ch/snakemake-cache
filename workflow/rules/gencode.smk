rule gencode_transcripts:
    output:
        "resources/gencode/gencode_{species}/release_{release}/gencode.v{release}.transcripts.fa"
    resources:
        runtime = 5
    cache:
        "omit-software"
    shell:
        "wget -q -O"
        " - https://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_{wildcards.species}/release_{wildcards.release}/gencode.v{wildcards.release}.transcripts.fa.gz"
        " | gunzip > {output}"
