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
--model llava_vid \
--model_args pretrained=lmms-lab/LLaVA-Video-7B-Qwen2,conv_template=qwen_1_5,max_frames_num=64,force_sample=True,mm_spatial_pool_mode=average,attn_implementation=flash_attention_2,fastvid_retention_ratio=${fastvid_retention_ratio},fastvid_DySeg_c=${fastvid_DySeg_c},fastvid_DySeg_tau=${fastvid_DySeg_tau},fastvid_STPrune_d=${fastvid_STPrune_d},fastvid_DTM_p=${fastvid_DTM_p},fastvid_DTM_beta=${fastvid_DTM_beta} \
--tasks videomme \
--batch_size 1 \
--log_samples_suffix llava_vid \
--output_path ./logs/ \
2>&1 | tee -a llava_vid.log
