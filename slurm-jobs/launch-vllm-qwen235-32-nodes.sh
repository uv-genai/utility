#!/usr/bin/env bash

#SBATCH --job-name=vLLM
#SBATCH --account=pawsey0001-gpu
#SBATCH --exclusive
#SBATCH --time=1-00:00:00
#SBATCH --nodes=32
#SBATCH --partition=gpu
module load singularity/4.1.0-slurm
module load rocm/6.3.1
export VLLM_DISABLE_COMPILE_CACHE=1
export PYTORCH_CUDA_ALLOC_CONF="expandable_segments:True"
srun -u ~/projects/uv-genai/vllm-ray-cluster/start-cluster.py singularity ~/.opt/vLLM/vllm_latest.sif \
	--slurm --auto --model Qwen/Qwen3-235B-A22B --max-model-len 40000 \
	--enable-expert-parallel --gpu-memory-utilization 0.99 --enforce-eager --dtype bfloat16 --kv-cache-dtype fp8
