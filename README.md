Kuma CI
=======


Small shell script to read pipelines requests from github
the default installation read the scripts in the folder
`/etc/kuma-ci/scripts.d` and exports the variables.

- PIPELINE_REPO_NAME 
- PIPELINE_REF
- PIPELINE_PREVIOUS_COMMIT
- PIPELINE_CURRENT_COMMIT

Requirements
------------

- `nc`
- `jq`
- `cat`
- `grep`
- `tr`
- `sed`