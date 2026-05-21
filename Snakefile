__author__ = "Christoph Engelhard"
__email__ = "christophengelhard@bundeswehr.org"


configfile: "config/config.yaml"


rule update_gencode:
    input:
        "resources/gencode/gencode_human/release_{}/gencode.v{}.transcripts.fa".format(
            config["GENCODE_RELEASE"], config["GENCODE_RELEASE"]),
        "resources/gencode/gencode_human/release_{}/GRCh38.primary_assembly.genome.fa".format(
            config["GENCODE_RELEASE"]),
        "resources/gencode/gencode_human/release_{}/gencode.v{}.transcripts.fa".format(
            config["GENCODE_RELEASE"], config["GENCODE_RELEASE"])


include: "workflow/rules/gencode.smk"
