!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool
id: "ConsensusCalling"
label: "ConsensusCalling"

description: |
    This is the MAF post-consensus-call filtering tool used in the PCAWG project.
    These filters were created by Jonathan Dursi (jonathan.dursi@sickkids.ca).
    This CWL wrapper was created by Solomon Shorser.
    For more information about ConsensusCalling & filtering, see: https://github.com/ljdursi/consensus_call_docker

dct:creator:
    foaf:name: "Solomon Shorser"
    foaf:mbox: "solomon.shorser@oicr.on.ca"

dct:contributor:
  foaf:name: "Jonathan Dursi"
  foaf:mbox: "jonathan.dursi@sickkids.ca"

requirements:
    - class: DockerRequirement
      dockerPull: pancancer/consensus_call
    - class: InlineJavascriptRequirement

baseCommand: filter

inputs:

    # This can be either "presence_in_maf" or "column_of_maf"
    - id: "#filter_option"
      type: string
      inputBinding:
          position: 1

    - id: "#input_file"
      type: File
      inputBinding:
          position: 2
          prefix: "-i"

    - id: "#description"
      type: string
      inputBinding:
          position: 3
          prefix: "-d"

    # This is only needed if "#filter_option" is "column_of_maf"
    - id: "#column":
        type: [string, null]
        inputBinding:
            position: 4
            prefix: "-c"

outputs:
    output_vcf:
        type: File
        outputBinding:
            glob: "output.vcf"
