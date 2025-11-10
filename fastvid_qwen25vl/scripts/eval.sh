#!/bin/bash

source activate fastvid
conda activate fastvid

# Due to dynamic sampling in Qwen2.5VL, a 27% retention ratio ended up retaining 24.1% of tokens in practice.
fastvid_retention_ratio=0.27
fastvid_DySeg_c=8
fastvid_DySeg_tau=0.84
fastvid_DySeg_ignore=0.95
fastvid_STPrune_d=0.4
fastvid_DTM_p=4
fastvid_DTM_beta=0.6
accelerate launch --num_processes=4 --main_process_port=12345 -m lmms_eval \
--model qwen2_5_vl \
--model_args pretrained=Qwen/Qwen2.5-VL-7B-Instruct,use_flash_attention_2=True,fastvid_retention_ratio=${fastvid_retention_ratio},fastvid_DySeg_c=${fastvid_DySeg_c},fastvid_DySeg_tau=${fastvid_DySeg_tau},fastvid_DySeg_ignore=${fastvid_DySeg_ignore},fastvid_STPrune_d=${fastvid_STPrune_d},fastvid_DTM_p=${fastvid_DTM_p},fastvid_DTM_beta=${fastvid_DTM_beta} \
--tasks videomme \
--batch_size 1 \
--log_samples_suffix qwen2_5_vl \
--output_path ./logs/ \
2>&1 | tee -a qwen2_5_vl.log
