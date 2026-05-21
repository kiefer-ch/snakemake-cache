__author__ = "Christoph Engelhard"
__email__ = "christophengelhard@bundeswehr.org"


configfile: "config/config.yaml"


rule update_gencode:
    input:
        "resources/gencode/gencode_{}/release_{}/gencode.v{}.transcripts.fa".format(
            "human", "49", "49")

include: "workflow/rules/gencode.smk"
