rule star_index:
    input:
        genome = "resources/gencode/gencode_human/release_{release}/GRCh38.primary_assembly.genome.fa",
        annotation = "resources/gencode/gencode_human/release_{release}/gencode.v{release}.primary_assembly.annotation.gtf"
    output:
        directory("resources/gencode/gencode_human/release_{release}/STAR_index_gencode_human_{release}")
    log:
        "log/star/star_index_gencode_human_{release}.log"
    threads:
        40
    resources:
        mem_mb = 40000,
        runtime = 30
    cache:
        "omit-software"
    conda:
        "../envs/star.yaml"
    shell:
        "mkdir {output} && \
         STAR --runMode genomeGenerate \
            --runThreadN {threads} \
            --genomeDir {output} \
            --genomeFastaFiles {input.genome} \
            --sjdbGTFfile {input.annotation} \
            --outTmpDir {output}_temp \
            > {log}"
