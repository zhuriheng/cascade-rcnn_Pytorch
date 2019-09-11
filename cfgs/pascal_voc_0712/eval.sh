#!/usr/bin/env bash
set -eux
set -o pipefail

source activate torch0.3.1py2.7

cd ../../

exp_name="detnet59_baseline"
dataset="pascal_voc_0712"
net="detnet59"
log_time="2019-09-09-21-42"
checkepoch="11"

CUDA_VISIBLE_DEVICES=0 \
python test_net.py --exp_name ${exp_name} \
                        --dataset $dataset \
                        --net $net \
                        --log_time $log_time \
                        --checksession 1 \
                        --checkepoch $checkepoch \
                        --checkpoint 8274 \
                        --cuda \
                  > eval_${exp_name}_${dataset}_${net}_${log_time}_${checkepoch}.log 2>&1 &
#                    --cag \
#                    --cascade \
#                    --load_name
#                    --soft_nms
