#!/usr/bin/env bash

#SBATCH --job-name=vLLM
#SBATCH --account=pawsey0001-gpu
#SBATCH --exclusive
#SBATCH --time=1-00:00:00
#SBATCH --nodes=8
#SBATCH --partition=gpu
module load singularity/4.1.0-slurm
export VLLM_DISABLE_COMPILE_CACHE=1
export PYTORCH_CUDA_ALLOC_CONF="expandable_segments:True"
srun -u ~/projects/raycluster/start-cluster.py singularity ~/.opt/vLLM/vllm_latest.sif \
	--container-args "--bind ./app:/app" \
	--slurm --auto --model Qwen/Qwen3-235B-A22B --max-model-len 200000 \
	--enable-expert-parallel --gpu-memory-utilization 0.98 --enforce-eager --kv-cache-dtype fp8
