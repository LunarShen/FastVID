#!/bin/bash

conda create -n fastvid python=3.10 -y

conda activate fastvid

pip install --upgrade pip
pip install setuptools_scm

cd ../lmms-eval
pip install -e .

cd ../LLaVA-NeXT
pip install -e .

pip install transformers==4.47.0

wget https://github.com/Dao-AILab/flash-attention/releases/download/v2.7.2.post1/flash_attn-2.7.2.post1+cu12torch2.1cxx11abiFALSE-cp310-cp310-linux_x86_64.whl
pip install flash_attn-2.7.2.post1+cu12torch2.1cxx11abiFALSE-cp310-cp310-linux_x86_64.whl