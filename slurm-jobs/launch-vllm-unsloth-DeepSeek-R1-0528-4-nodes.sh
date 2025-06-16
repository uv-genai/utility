#!/usr/bin/env bash

#SBATCH --job-name=vLLM
#SBATCH --account=pawsey0001-gpu
#SBATCH --reservation=PAWSEY_GPU_COS_TESTING
#SBATCH --exclusive
#SBATCH --time=1-00:00:00
#SBATCH --nodes=4
#SBATCH --partition=gpu
module load singularity/4.1.0-slurm
module load rocm/6.3.1
export VLLM_DISABLE_COMPILE_CACHE=1
export PYTORCH_CUDA_ALLOC_CONF="expandable_segments:True"
srun -u ~/projects/uv-genai/vllm-ray-cluster/start-cluster.py singularity ~/.opt/vLLM/vllm_latest.sif \
	--container-args "--bind $HOME/tmp/app:/app" \
	--slurm --auto --model $HOME/scratch_0001/models/DeepSeek-R1-0528-BF16 \
	--enable-expert-parallel --gpu-memory-utilization 0.99 --enforce-eager
