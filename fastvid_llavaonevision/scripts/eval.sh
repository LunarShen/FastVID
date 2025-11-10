#!/bin/bash

source activate fastvid
conda activate fastvid

fastvid_retention_ratio=0.10
fastvid_DySeg_c=8
fastvid_DySeg_tau=0.9
fastvid_STPrune_d=0.4
fastvid_DTM_p=4
fastvid_DTM_beta=0.6
accelerate launch --num_processes=4 --main_process_port 12345 -m lmms_eval \
--model llava_onevision \
--model_args pretrained=lmms-lab/llava-onevision-qwen2-7b-ov,conv_template=qwen_1_5,model_name=llava_qwen,max_frames_num=32,attn_implementation=flash_attention_2,fastvid_retention_ratio=${fastvid_retention_ratio},fastvid_DySeg_c=${fastvid_DySeg_c},fastvid_DySeg_tau=${fastvid_DySeg_tau},fastvid_STPrune_d=${fastvid_STPrune_d},fastvid_DTM_p=${fastvid_DTM_p},fastvid_DTM_beta=${fastvid_DTM_beta} \
--tasks videomme \
--batch_size 1 \
--log_samples_suffix llava_onevision \
--output_path ./logs/ \
2>&1 | tee -a llava_onevision.log
