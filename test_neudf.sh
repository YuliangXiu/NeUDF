getenv=True
source /home/yxiu/miniconda3/bin/activate neuraludf

#!/bin/bash
usage() {
  echo "Usage: ${0} [-g|--gpu] [-c|--case]"  1>&2
  exit 1
}
while [[ $# -gt 0 ]];do
  key=${1}
  case ${key} in
    -g|--gpu)
      GPU=${2}
      shift 2
      ;;
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

# CUDA_VISIBLE_DEVICES=${GPU} python exp_runner.py --mode validate_image --conf ./confs/womask_open.conf \
# --case ${CASE} --is_continue --resolution 512
# CUDA_VISIBLE_DEVICES=${GPU} python exp_runner.py --mode validate_mesh --conf ./confs/womask_open.conf \
# --case ${CASE} --is_continue --resolution 512
# CUDA_VISIBLE_DEVICES=${GPU} python exp_runner.py --mode validate_mesh_udf --conf ./confs/womask_open.conf \
# --case ${CASE} --is_continue --resolution 512

CUDA_VISIBLE_DEVICES=${GPU} python exp_runner.py --mode validate_image --conf ./confs/wmask_open.conf \
--case ${CASE} --is_continue --resolution 512
CUDA_VISIBLE_DEVICES=${GPU} python exp_runner.py --mode validate_mesh --conf ./confs/wmask_open.conf \
--case ${CASE} --is_continue --resolution 512
CUDA_VISIBLE_DEVICES=${GPU} python exp_runner.py --mode validate_mesh_udf --conf ./confs/wmask_open.conf \
--case ${CASE} --is_continue --resolution 512