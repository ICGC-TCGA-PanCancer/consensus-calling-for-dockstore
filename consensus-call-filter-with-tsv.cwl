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

baseCommand: filter sex

inputs:
    - id: "#sex"
      type: string
      inputBinding:
          position: 1
          prefix: "-s"

    - id: "#input_file"
      type: File
      inputBinding:
          position: 2
          prefix: "-i"

outputs:
    output_vcf:
        type: File
        outputBinding:
            glob: "output.vcf"
