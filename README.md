# StreamFP: Fingerprint-guided Data Selection for Efficient Stream

[![Python 3.8+](https://img.shields.io/badge/python-3.8+-blue.svg)](https://www.python.org/downloads/)
[![PyTorch 1.12+](https://img.shields.io/badge/pytorch-1.12+-ee4c2c.svg)](https://pytorch.org/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

## Overview

**StreamFP** is a continual learning framework for **fingerprint-guided data selection** in streaming/class-incremental learning. 
It targets efficient online/stream training by selecting informative samples under strict time and memory budgets, while mitigating catastrophic forgetting.

### Key Features

- 🔎 **Fingerprint-guided selection**: Select representative samples in a stream for efficient rehearsal
- ⏱️ **Efficiency-oriented**: Supports training-time limits (`--traintime_limit`) and skip strategy (`--skip_batch`)
- 🧰 **Modular continual learning pipeline**: Pluggable learners, buffers, and selection/update methods
- 📊 **Multi-benchmark evaluation**: Clear10 / Clear100 / CORe50 / Stream51

## Installation

### Prerequisites

- Python 3.8 (recommended, aligned with `environment.yml`)
- CUDA 11.3+ (GPU)
- Conda (recommended)

### Setup

```bash
# Clone the repository
git clone https://github.com/CGCL-codes/StreamFP.git
cd StreamFP

# Create and activate conda environment
conda env create -f environment.yml
conda activate sl

# FastMoE (optional, only required if your configuration imports fastmoe)
# See: https://github.com/laekov/fastmoe/blob/master/doc/installation-guide.md
```

## Datasets

Create a folder `data/` in the project root and download datasets:

- Clear10 / Clear100: https://clear-benchmark.github.io/
- Stream51: https://github.com/tyler-hayes/Stream-51
- CORe50:

```bash
sh core50.sh
```

## Quick Start

All commands should be run under the project root directory. The provided scripts assume **1 GPU** by default.

```bash
sh experiments/clear10.sh
sh experiments/clear100.sh
sh experiments/core50.sh
sh experiments/stream51.sh
```

## Experiments

Experiment scripts are in `experiments/` and typically call:

```bash
python -u run.py --config <CONFIG_YAML> \
  --repeat <N> --overwrite 1 \
  --selection_method <METHOD> --update_method <METHOD> \
  --mem_size <MEMORY> --skip_batch <SKIP> --traintime_limit <LIMIT>
```

See `configs/` for dataset/model-specific settings.

## Outputs

- Results are appended to CSV files under `results_log/` (configured via `--file_name`).
- Training outputs (checkpoints/logs) are stored under `outputs/` (configured via `--log_dir`).

## Reproducibility

- Each trial sets seeds for `random`, `numpy`, and `torch` in `run.py`.
- `torch.backends.cudnn.deterministic=True` is enabled.
- Due to CUDA/cuDNN/driver differences, results may vary slightly; we recommend matching **mean ± confidence interval** across `--repeat` runs.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Citation

If you find this work useful, please cite the WWW paper:

```bibtex
@inproceedings{streamfp_www,
  title={StreamFP: Fingerprint-guided Data Selection for Efficient Stream},
  author={TODO},
  booktitle={Proceedings of the ACM Web Conference (WWW)},
  year={TODO}
}
```

## Acknowledgments

- PyTorch
- Clear Benchmark / CORe50 / Stream-51 dataset authors
