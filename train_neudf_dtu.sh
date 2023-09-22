#!/bin/bash

getenv=True
source /home/yxiu/miniconda3/bin/activate neuraludf

usage() {
  echo "Usage: ${0} [-c|--case]"  1>&2
  exit 1
}
while [[ $# -gt 0 ]];do
  key=${1}
  case ${key} in
    -c|--case)
      CASE=${2}
      shift 2
      ;;
    *)
      usage
      shift
      ;;
  esac
done

# python exp_runner.py --mode train --conf ./confs/womask_open.conf --case ${CASE}
python exp_runner.py --mode train --conf ./confs/wmask_dtu.conf --case ${CASE}