# Create a virtualenv accessible by a container

1. Share a directory with the containers: e.g. container's `/app` --> local `app/`.
2. Crate a vitual env with the python interpreter inside the container:
   ```
   singularity exec --bind $HOME/tmp/app:/app $HOME/.opt/vLLM/vllm_latest.sif python3 -m venv app/venv
   ```
3. (optional) Add local directory to path, link in `app/` directory and use `--env PATH=` on command line:
   ```
   ln -s ~/.local/bin app/bin
   ```
3. Activate (not sure it's needed, since we'll be invoking directly the interpreter inside the container's venv):
   ```
   singularity exec --bind $HOME/tmp/app:/app $HOME/.opt/vLLM/vllm_latest.sif sh app/venv/bin/activate
   ```
4. Install packages inside the virtual env using the python iterpreter from the virtual env:
   ```
   singularity exec --bind $HOME/tmp/app:/app $HOME/.opt/vLLM/vllm_latest.sif app/vvv/bin/python3 -m pip install pyright
   ```
5. Link to an editor:
   ```
   ln -s ~/.local/bin/nvim app/nvim
   ```
6. Start the editor from within the container:
   ```
   singularity exec --env PATH="/app/bin:$PATH" --bind $HOME/tmp/app:/app $HOME/.opt/vLLM/vllm_latest.sif /app/nvim
   ```

