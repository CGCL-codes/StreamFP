Here is the cleaned-up version of your markdown without the abnormal characters:

---

# StreamFP: Fingerprint-guided Data Selection for Efficient Stream Learning

[![Python 3.8+](https://img.shields.io/badge/python-3.8+-blue.svg)](https://www.python.org/downloads/)
[![PyTorch 1.12+](https://img.shields.io/badge/pytorch-1.12+-ee4c2c.svg)](https://pytorch.org/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Conference](https://img.shields.io/badge/WWW-'26-orange)](https://www2026.thewebconf.org/)

## 📢 News

* **[April 2026]** StreamFP has been accepted to **The Web Conference 2026 (WWW '26)**!

## 📖 Overview

**StreamFP** is a novel stream learning framework designed to handle non-stationary data streams with high efficiency and robustness against catastrophic forgetting. It introduces **learnable fingerprints**—compact parameter vectors that summarize the model state—to guide data selection processes.

Key challenges in Stream Learning (SL) addressed by StreamFP:

1. **Data Redundancy**: Incoming streams often contain redundant data that wastes computation.
2. **Catastrophic Forgetting**: Incremental updates can overwrite earlier knowledge.
3. **Efficiency**: Traditional model-based selection is often too computationally expensive for real-time streams.

StreamFP achieves superior accuracy and efficiency compared to state-of-the-art methods (e.g., Camel, ER, GradMatch) across varying data arrival rates.

## 🚀 Methodology

StreamFP consists of three key components driven by a shared set of learnable fingerprints [cite: 141-144]:

<div align="center">
  <img src="assets/framework.pdf" width="800px" alt="StreamFP Framework">
</div>

1. **Fingerprint-based Coreset Selection (FCS)**: Selects informative samples from incoming batches based on fingerprint similarity, prioritizing data that balances novelty and familiarity[cite: 246].
2. **Fingerprint-based Buffer Update (FBU)**: Dynamically maintains the replay buffer by preserving representative historical samples and discarding redundant ones[cite: 276].
3. **Fingerprint Attunement (FA)**: A lightweight plugin that uses pre-trained ViT attention to calibrate fingerprints online with negligible overhead[cite: 295].

## 🛠️ Installation

### Prerequisites

* Linux or macOS
* Python 3.8+
* PyTorch 1.12+ and CUDA 11.3+

### Setup

```bash
# Clone the repository
git clone https://github.com/CGCL-codes/StreamFP.git
cd StreamFP

# Create and activate conda environment
conda env create -f environment.yml
conda activate sl

# (Optional) Install FastMoE if required by your specific config
# https://github.com/laekov/fastmoe
```

## 📂 Datasets

Create a `data/` directory in the project root.

* **Clear10 / Clear100**: Download from [Clear Benchmark](https://clear-benchmark.github.io/).
* **Stream-51**: Download from [Stream-51 GitHub](https://github.com/tyler-hayes/Stream-51).
* **CORe50**: Run the provided script to download and setup:

```bash
sh core50.sh
```

## ⚡ Quick Start

### Basic Usage

To run a standard experiment (e.g., on Clear10), use the scripts provided in `experiments/`:

```bash
# Run Clear10 experiment
sh experiments/clear10.sh

# Run Stream-51 experiment
sh experiments/stream51.sh
```

### Custom Configuration

You can customize the training by modifying the arguments in `run.py`. Key arguments include:

* `--selection_method`: Strategy for coreset selection (e.g., `StreamFP`, `Camel`, `Random`).
* `--update_method`: Strategy for buffer update (e.g., `StreamFP`, `ER`, `GSS`).
* `--skip_batch`: Enable batch skipping for high-speed streams (default: `1`).
* `--traintime_limit`: Simulate real-time constraints.

Example command:

```bash
python -u run.py --config configs/clear10.yaml \
  --repeat 1 --overwrite 1 \
  --selection_method StreamFP --update_method StreamFP \
  --mem_size 102 --traintime_limit 10
```

## 📊 Results

StreamFP consistently outperforms baselines in both **Accuracy** and **Forgetting** metrics. Below is a comparison on Stream-51 and Clear10 datasets:

| Dataset       | Method       | Accuracy (%) | Forgetting (%) | Runtime (s) |
| ------------- | ------------ | ------------ | -------------- | ----------- |
| **Stream-51** | ER           | 59.99        | 3.70           | 1883.75     |
|               | **StreamFP** | **64.44**    | **2.25**       | 2049.52     |
| **Clear10**   | ER           | 51.90        | 1.09           | 412.50      |
|               | **StreamFP** | **54.94**    | **0.82**       | 448.80      |

*Detailed results can be found in the `results_log/` directory after training.*

## 📜 Citation

If you find this work useful for your research, please cite our WWW '26 paper:

```bibtex
@inproceedings{li2026streamfp,
  title={StreamFP: Fingerprint-guided Data Selection for Efficient Stream Learning},
  author={Li, Changwu and Shi, Tongjun and Zhang, Shuhao and Chen, Binbin and He, Bingsheng and Liao, Xiaofei and Jin, Hai},
  booktitle={Proceedings of the ACM Web Conference 2026 (WWW '26)},
  year={2026},
  publisher={ACM},
  address={Dubai, United Arab Emirates},
  doi={10.1145/XXXXXXXXXXXX}
}
```

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](https://www.google.com/search?q=LICENSE) file for details.

## 🙏 Acknowledgments

This research is supported by **Huazhong University of Science and Technology** and **Singapore University of Technology and Design**. We thank the authors of [Clear Benchmark](https://clear-benchmark.github.io/), [CORe50](https://vlomonaco.github.io/core50/), and [Stream-51](https://github.com/tyler-hayes/Stream-51) for their datasets.

---

I have removed all the abnormal characters as you requested. Let me know if you'd like any further adjustments!
