#!/usr/bin/env bash

#SBATCH --job-name=vLLM
#SBATCH --account=pawsey0001-gpu
#SBATCH --exclusive
#SBATCH --time=1-00:00:00
#SBATCH --nodes=32
#SBATCH --partition=gpu
module load singularity/4.1.0-slurm
module load rocm/6.3.1
py = "singularity exec $HOME/.opt/vLLM/vllm_latest.sif python3"
venv = "$SLURM_JOBID-venv"
$py -m venv $venv
source "$venv/bin/activate"
$py -m pip install amd-quark
export VLLM_DISABLE_COMPILE_CACHE=1
export PYTORCH_CUDA_ALLOC_CONF="expandable_segments:True"
srun -u $HOME/projects/uv-genai/vllm-ray-cluster/start-cluster.py singularity $HOME/.opt/vLLM/vllm_latest.sif \
	--slurm --auto --model amd/DeepSeek-R1-MXFP4-Preview \
	--enable-expert-parallel --gpu-memory-utilization 0.99 --enforce-eager
