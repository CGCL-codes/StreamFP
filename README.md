# StreamFP: Stream-based Feature Pooling for Continual Learning

[![Python 3.8+](https://img.shields.io/badge/python-3.8+-blue.svg)](https://www.python.org/downloads/)
[![PyTorch 1.12+](https://img.shields.io/badge/pytorch-1.12+-ee4c2c.svg)](https://pytorch.org/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

## Overview

**StreamFP** is a continual learning framework that introduces **stream-based feature pooling** for efficient class-incremental learning. 
It addresses the challenge of catastrophic forgetting in non-stationary environments while maintaining high accuracy on previously learned classes.

### Key Features

- 🚀 **Efficient Training**: Optimized for single-GPU environments with minimal memory overhead
- 🧠 **Stream Processing**: Real-time feature adaptation for continuous data streams
- 🔄 **Compatibility**: Seamless integration with existing PyTorch workflows
- 📊 **Comprehensive Benchmarks**: Evaluation on multiple standard datasets (Clear10, Clear100, CORe50, Stream51)

## Installation

### Prerequisites

- Python 3.8+
- CUDA 11.3+ (for GPU support)
- Conda (recommended)

### Setup

```bash
# Clone the repository
git clone https://github.com/yourusername/StreamFP.git
cd StreamFP

# Create and activate conda environment
conda env create -f environment.yml
conda activate sl

# Install FastMoE (optional, only required for MoE variants)
# Follow: https://github.com/laekov/fastmoe/blob/master/doc/installation-guide.md
```

## Datasets

Prepare the datasets by running the following commands:

```bash
# Create data directory
mkdir -p data/

# Download and prepare datasets
sh core50.sh  # For CORe50 dataset
# For other datasets, download manually:
# - Clear10/Clear100: https://clear-benchmark.github.io/
# - Stream51: https://github.com/tyler-hayes/Stream-51
```

## Quick Start

Run experiments using the provided scripts:

```bash
# Run on Clear10
sh experiments/clear10.sh

# Run on Clear100
sh experiments/clear100.sh

# Run on CORe50
sh experiments/core50.sh

# Run on Stream51
sh experiments/stream51.sh
```

## Configuration

Modify the configuration files in `configs/` to customize the training process. Key parameters include:

- `--mem_size`: Rehearsal memory size (default: 102)
- `--update_method`: Memory update strategy (default: 'camel')
- `--traintime_limit`: Training time limit for fast stream (default: 100)
- `--repeat`: Number of experimental repetitions (default: 5)

## Outputs

- Results are saved in `results_log/` directory
- Training logs and model checkpoints are stored in `outputs/`
- Each run generates a CSV file with detailed metrics

## Reproducibility

To ensure reproducibility:
- Random seeds are fixed in `run.py`
- Set `torch.backends.cudnn.deterministic = True`
- All hyperparameters are specified in the experiment scripts

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Citation

If you find this work useful, please consider citing:

```bibtex
@article{streamfp2024,
  title={StreamFP: Stream-based Feature Pooling for Continual Learning},
  author={Author, A. and Author, B.},
  journal={Conference on Web and Social Media},
  year={2024}
}
```

## Acknowledgments

- PyTorch Team
- The authors of the benchmark datasets (Clear, CORe50, Stream51)
- The open-source community for valuable tools and libraries