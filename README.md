# [NeurIPS 2025] FastVID: Dynamic Density Pruning for Fast Video Large Language Models

We propose FastVID, a novel **training-free** pruning framework that employs Dynamic Temporal Segmentation to partition videos into temporally ordered segments and Density Spatiotemporal Pruning to retain global segment information and key details.
On LLaVA-OneVision-7B, FastVID effectively prunes **90.3%** of video tokens, reduces FLOPs to **8.3%**, and accelerates the prefilling stage by **7.1x**, while maintaining **98.0%** of the original accuracy. 

## Implementation

The FastVID implementation in LLaVA-OneVision adopts a **parallelized design** for computing density scores, as detailed in the Efficiency Comparison section on page 8 of the main paper.

- [x] FastVID on **LLaVA-OneVision** [\[Core code\]](fastvid_llavaonevision/LLaVA-NeXT/llava/model/language_model/modeling_qwen2.py#L901) [\[Log\]](fastvid_llavaonevision/scripts/llava_onevision.log) 

For the other models, we provide a straightforward implementation.

- [x] FastVID on **LLaVA-Video** [\[Core code\]](fastvid_llavavideo/LLaVA-NeXT/llava/model/language_model/modeling_qwen2.py#L893) [\[Log\]](fastvid_llavavideo/scripts/llava_vid.log) 
- [x] FastVID on **Qwen2.5-VL** [\[Core code\]](fastvid_qwen25vl/lmms-eval/lmms_eval/models/qwenvlutils/modeling_qwen2_5_vl.py#L1889) [\[Log\]](fastvid_qwen25vl/scripts/qwen2_5_vl.log) 

## Installation and Evaluation

For running FastVID on different models, please change the working directory to the corresponding folder.

To set up the environment:

```bash
bash scripts/create_env.sh
```

To evaluate FastVID:

```bash
bash scripts/eval.sh
```

## Acknowledgement

This project builds upon the following open-source works: **[LLaVA-NeXT](https://github.com/LLaVA-VL/LLaVA-NeXT)** and **[lmms-eval](https://github.com/EvolvingLMMs-Lab/lmms-eval)**.

## Citation

```bibtex
@inproceedings{
shen2025fastvid,
title={Fast{VID}: Dynamic Density Pruning for Fast Video Large Language Models},
author={Leqi Shen and Guoqiang Gong and Tao He and Yifeng Zhang and pengzhang liu and Sicheng Zhao and Guiguang Ding},
booktitle={The Thirty-ninth Annual Conference on Neural Information Processing Systems},
year={2025},
url={https://openreview.net/forum?id=2xS4VtpApy}
}
```
