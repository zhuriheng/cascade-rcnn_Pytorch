#!/usr/bin/env bash
set -eux
set -o pipefail

source activate torch0.3.1py2.7

cd ../../

CUDA_VISIBLE_DEVICES=0  \
nohup python trainval_net.py \
                        --exp_name detnet59_cascade \
                        --dataset pascal_voc_0712 \
                        --net detnet59 \
                        --bs 4 \
                        --nw 5 \
                        --lr 1e-3 \
                        --epochs 12 \
                        --save_dir ckpts \
                        --cuda \
                        --use_tfboard True \
                        --cag \
                        --cascade \
             > pascal_voc_0712_detnet59_cascade_v0.1.log 2>&1 &