__author__ = "Christoph Engelhard"
__email__ = "christophengelhard@bundeswehr.org"


# Configs
configfile: "config/config.yaml"


# Rules
rule update_gencode:
    input:
        "resources/gencode/gencode_human/release_{}/gencode.v{}.transcripts.fa".format(
            config["GENCODE_RELEASE"], config["GENCODE_RELEASE"]),
        "resources/gencode/gencode_human/release_{}/GRCh38.primary_assembly.genome.fa".format(
            config["GENCODE_RELEASE"]),
        "resources/gencode/gencode_human/release_{}/gencode.v{}.primary_assembly.annotation.gtf".format(
            config["GENCODE_RELEASE"], config["GENCODE_RELEASE"])


rule update_indices:
    input:
        "resources/gencode/gencode_human/release_{}/salmon_index_gencode_human_{}".format(
            config["GENCODE_RELEASE"], config["GENCODE_RELEASE"]),
        "resources/gencode/gencode_human/release_{}/STAR_index_gencode_human_{}".format(
            config["GENCODE_RELEASE"], config["GENCODE_RELEASE"])


# Include
include: "workflow/rules/gencode.smk"
include: "workflow/rules/star.smk"
include: "workflow/rules/salmon.smk"
