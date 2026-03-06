# MangoBench: A Benchmark for Multi-Agent Goal-Conditioned Offline Reinforcement Learning

Official implementation of **MangoBench** (CVPR 2026).

## Installation
```bash
conda create -n mangobench python=3.10
conda activate mangobench
```

Follow [OGBench](https://github.com/seohongpark/ogbench) to set up the base environment, then install additional dependencies:
```bash
cd impls
pip install -r requirements.txt
```

## Running
```bash
bash ./impls/hyperparameters_multi.sh
```

## Citation

If you find this work useful, please cite:
```bibtex
@inproceedings{Wang2026MangoBench,
  title={MangoBench: A Benchmark for Multi-Agent Goal-Conditioned Offline Reinforcement Learning},
  author={Wang, Yi and Zhong, Ningze and Fu, Zhiheng and Wang, Longguang and Zhang, Ye and Guo, Yulan},
  booktitle={IEEE/CVF Conference on Computer Vision and Pattern Recognition (CVPR)},
  year={2026}
}
```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
