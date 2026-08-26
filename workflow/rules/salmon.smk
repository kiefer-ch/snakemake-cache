rule salmon_prepareDecoys:
    input:
        transcripts = "resources/gencode/gencode_human/release_{release}/gencode.v{release}.transcripts.fa",
        genome = "resources/gencode/gencode_human/release_{release}/GRCh38.primary_assembly.genome.fa",
        annotation = "resources/gencode/gencode_human/release_{release}/gencode.v{release}.primary_assembly.annotation.gtf"
    output:
        gentrome = temp("resources/gencode/gencode_human/release_{release}/salmon_decoy/gentrome.fa"),
        decoys = temp("resources/gencode/gencode_human/release_{release}/salmon_decoy/decoys.txt")
    log:
        "log/salmon/generateDecoyTranscriptome_gencode_human_{release}.log"
    params:
        out_dir = subpath(output.decoys, parent=True)
    conda:
        "../envs/mashmap.yaml"
    threads:
        40
    resources:
        runtime = 240,
        mem_mb = 160000
    cache:
        "omit-software"
    shell:
        "bash workflow/scripts/generateDecoyTranscriptome.sh \
            -j {threads} \
            -g {input.genome} \
            -t {input.transcripts} \
            -a {input.annotation} \
            -o {params.out_dir} \
            > {log}"


rule salmon_index:
    input:
        gentrome = "resources/gencode/gencode_human/release_{release}/salmon_decoy/gentrome.fa",
        decoys = "resources/gencode/gencode_human/release_{release}/salmon_decoy/decoys.txt"
    output:
        directory("resources/gencode/gencode_human/release_{release}/salmon_index_gencode_human_{release}")
    log:
        "log/salmon/salmon_index_gencode_human_{release}.log"
    conda:
        "../envs/salmon.yaml"
    threads:
        20
    resources:
        runtime = 10,
        mem_mb = 10000
    cache:
        "omit-software"
    shell:
        "salmon index \
            --gencode \
            -t {input.gentrome} \
            -d {input.decoys} \
            -i {output} \
            -p {threads} \
            2> {log}"
