#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool
id: "ConsensusCalling"
label: "ConsensusCalling"

description: |
    This is the ConsensusCalling tool used in the PCAWG project.
    ConsensusCalling was created by Jonathan Dursi (jonathan.dursi@sickkids.ca).
    This CWL wrapper was created by Solomon Shorser.
    For more information about ConsensusCalling, see: https://github.com/ljdursi/consensus_call_docker

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

inputs:
    - id: "#variant_type"
      type: string
      inputBinding:
        position: 1
      secondaryFiles:
        - .tbi

    - id: "#broad_input_file"
      type: File
      inputBinding:
        position: 2
        prefix: "-b"
      secondaryFiles:
        - .tbi

    - id: "#dkfz_embl_input_file"
      type: File
      inputBinding:
        position: 3
        prefix: "-d"
      secondaryFiles:
        - .tbi

    - id: "#muse_input_file"
      type: File
      inputBinding:
        position: 4
        prefix: "-m"
      secondaryFiles:
        - .tbi

    - id: "#sanger_input_file"
      type: File
      inputBinding:
        position: 5
        prefix: "-s"
      secondaryFiles:
        - .tbi

    - id: "#dbs_dir"
      type: Directory

    - id: "#output_file_name"
      type: string
      inputBinding:
        position: 6
        prefix: "-o"

outputs:
    consensus_file:
      type: File
      outputBinding:
          glob: "*$(input.output_file_name)"

baseCommand: consensus
