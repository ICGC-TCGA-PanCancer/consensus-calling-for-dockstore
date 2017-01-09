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

baseCommand: filter header_from_tsv

inputs:
    - id: "#header_name"
      type: string
      inputBinding:
          position: 1
          prefix: "-n"

    - id: "#sample_ID"
      type: File
      inputBinding:
          position: 2
          prefix: "-I"

    - id: "#column"
      type: string
      inputBinding:
          position: 3
          prefix: "-c"

    - id: "#tsv"
      type: File
      inputBinding:
          position: 4
          prefix: "-t"

    - id: "#input"
      type: File
      inputBinding:
          position: 5
          prefix: "-i"

outputs:
    output_vcf:
        type: File
        outputBinding:
            glob: "output.vcf"
