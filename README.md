# FastVID: Dynamic Density Pruning for Fast Video Large Language Models

## TODO:

Currently, the implementation provided is a **parallelized version** for computing density scores, as described in the Efficiency Comparison section on page 8 of the main paper.
We also plan to release a **more readable reference implementation** to facilitate better understanding and ease of customization.

- [x] FastVID on **LLaVA-OneVision**
- [ ] FastVID on **LLaVA-Video**
- [ ] FastVID on **Qwen2-VL**

## Installation

To set up the environment:

```bash
cd scripts
bash create_env.sh
```

## Evaluation

To evaluate FastVID on LLaVA-OneVision-7B:

```bash
cd scripts
bash eval.sh
```

## Acknowledgement

This project builds upon the following open-source works: **[LLaVA-NeXT](https://github.com/LLaVA-VL/LLaVA-NeXT)** and **[lmms-eval](https://github.com/EvolvingLMMs-Lab/lmms-eval)**.

## Citation

```bibtex
@article{shen2025fastvid,
  title={FastVID: Dynamic Density Pruning for Fast Video Large Language Models},
  author={Shen, Leqi and Gong, Guoqiang and He, Tao and Zhang, Yifeng and Liu, Pengzhang and Zhao, Sicheng and Ding, Guiguang},
  journal={arXiv preprint arXiv:2503.11187},
  year={2025}
}
```