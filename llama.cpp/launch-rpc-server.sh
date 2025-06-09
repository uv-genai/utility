#!/usr/bin/env bash
echo `hostname`
source $HOME/.opt/llama.cpp-rpc/activate-llama.cpp-rpc.sh
rpc-server --host 0.0.0.0 -p 6666 -c
# CUDA_VISIBLE_DEVICES=0 rpc-server --host 0.0.0.0 -p 6660 & 
# CUDA_VISIBLE_DEVICES=1 rpc-server --host 0.0.0.0 -p 6661 &
# CUDA_VISIBLE_DEVICES=2 rpc-server --host 0.0.0.0 -p 6662 &
# CUDA_VISIBLE_DEVICES=3 rpc-server --host 0.0.0.0 -p 6663 &
# CUDA_VISIBLE_DEVICES=4 rpc-server --host 0.0.0.0 -p 6664 &
# CUDA_VISIBLE_DEVICES=5 rpc-server --host 0.0.0.0 -p 6665 &
# CUDA_VISIBLE_DEVICES=6 rpc-server --host 0.0.0.0 -p 6666 &
# CUDA_VISIBLE_DEVICES=7 rpc-server --host 0.0.0.0 -p 6667 &
