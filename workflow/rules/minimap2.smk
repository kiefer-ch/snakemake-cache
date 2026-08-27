rule minimap2_index_genome:
    input:
        "resources/gencode/gencode_human/release_{release}/GRCh38.primary_assembly.genome.fa"
    output:
        "resources/gencode/gencode_human/release_{release}/minimap2_index_gencode_human_genome_{release}_{preset}.mmi"
    log:                                                    
        "log/minimap2/minimap2_index_gencode_human_genome_{release}_{preset}.log"
    wildcard_constraints:
        preset = "splice|splice:hq"
    conda:
        "../envs/minimap2.yaml"
    cache:
        "omit-software"
    threads:
        3
    resources:
        runtime = 10,
        mem_mb = 20000
    shell:
        "minimap2 \
            -ax {wildcards.preset} \
            -t {threads} \
            -d {output} \
            {input} \
            2> {log}"


rule minimap2_index_transcriptome:
    input:
        "resources/gencode/gencode_human/release_{release}/gencode.v{release}.transcripts.fa"
    output:
        "resources/gencode/gencode_human/release_{release}/minimap2_index_gencode_human_transcriptome_{release}_{preset}.mmi"
    log:
        "log/minimap2/minimap2_index_gencode_human_transcriptome_{release}_{preset}.log"
    wildcard_constraints:
        preset = "map-ont|map-hifi"
    conda:
        "../envs/minimap2.yaml"
    cache:
        "omit-software"
    threads:
        3
    resources:
        runtime = 10,
        mem_mb = 4000
    shell:
        "minimap2 \
            -ax {wildcards.preset} \
            -t {threads} \
            -d {output} \
            {input} \
            2> {log}"
