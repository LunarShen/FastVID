#!/bin/bash

conda create -n fastvid python=3.10 -y

source activate fastvid
conda activate fastvid

pip install --upgrade pip
pip install setuptools_scm
pip install pyarrow==20.0.0
conda install sentencepiece==0.1.99 -y

cd ../lmms-eval
pip install -e . 

pip install accelerate==1.1.0
pip install datasets==2.20.0
pip install transformers==4.51.3
pip install huggingface_hub==0.34.4

wget https://github.com/Dao-AILab/flash-attention/releases/download/v2.7.2.post1/flash_attn-2.7.2.post1+cu12torch2.1cxx11abiFALSE-cp310-cp310-linux_x86_64.whl
pip install flash_attn-2.7.2.post1+cu12torch2.1cxx11abiFALSE-cp310-cp310-linux_x86_64.whl