rpc-server -H 10.253.133.110 -p 6002 -d ROCm0 & # or -dev ROCm0
rpc-server -H 10.253.133.110 -p 6003 -d ROCm1 &
rpc-server -H 10.253.133.85 -p 6002 -d ROCm2 &
rpc-server -H 10.253.133.85 -p 6003 -d ROCm3 &
rpc-server -H 10.253.133.82 -p 6002 -d ROCm4 &
rpc-server -H 10.253.133.82 -p 6003 -d ROCm5 &
rpc-server -H 10.253.133.79 -p 6002 -d ROCm6 &
rpc-server -H 10.253.133.79 -p 6003 -d ROCm7 &
#USE hsn0 IP address for devices 0,1; hsn1 IP address for devices 2,3 etc.
#llama-server -hf unsloth/Qwen3-30B-A3B-GGUF:Q8_0 --host 0.0.0.0 -ngl 999 \
#	--rpc "10.253.133.110:50052,10.253.133.110:50053" # hsn0
