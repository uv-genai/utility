#!/usr/bin/env bash
#SBATCH --job-name=vLLM
#SBATCH --account=pawsey0001-gpu
#SBATCH --reservation=PAWSEY_GPU_COS_TESTING
#SBATCH --exclusive
#SBATCH --time=1-00:00:00
#SBATCH --nodes=$1
#SBATCH --partition=gpu
module load singularity/4.1.0-slurm
srun ~/projects/raycluster/start-cluster.py singularity ~/.opt/vLLM/vllm_latest.sif \
	--slurm --auto --model Qwen/Qwen3-30B-A3B
