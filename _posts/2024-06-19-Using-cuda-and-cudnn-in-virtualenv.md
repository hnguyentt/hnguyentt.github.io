---
layout: post
title: Using CUDA and CuDNN in virtual environment
tags: tips gpu bugs
last_modified_on: 2024-06-19
read_time: true
---

# Tensorflow
* Update pip: `pip install --upgrade pip`
* Install tensorflow together with cuda and cudnn: `pip install "tensorflow[and-cuda]"`. For specific version, for example 2.15.1, use: `pip install "tensorflow[and-cuda]==2.15.1"`
* Go to conda environment and create these subdirectories:
    ```
    cd $CONDA_PREFIX
    mkdir -p ./etc/conda/activate.d
    mkdir -p ./etc/conda/deactivate.d
    touch ./etc/conda/activate.d/env_vars.sh
    touch ./etc/conda/deactivate.d/env_vars.sh
    ```

* `nano ./etc/conda/activate.d/env_vars.sh` and edit as follow:
    ```
    #!/bin/sh

    # Store original LD_LIBRARY_PATH 
    export ORIGINAL_LD_LIBRARY_PATH="${LD_LIBRARY_PATH}" 

    # Get the CUDNN directory 
    CUDNN_DIR=$(dirname $(dirname $(python -c "import nvidia.cudnn; print(nvidia.cudnn.__file__)")))

    # Set LD_LIBRARY_PATH to include CUDNN directory
    export LD_LIBRARY_PATH=$(find ${CUDNN_DIR}/*/lib/ -type d -printf "%p:")${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}

    # Get the ptxas directory  
    PTXAS_DIR=$(dirname $(dirname $(python -c "import nvidia.cuda_nvcc; print(nvidia.cuda_nvcc.__file__)")))

    # Set PATH to include the directory containing ptxas
    export PATH=$(find ${PTXAS_DIR}/*/bin/ -type d -printf "%p:")${PATH:+:${PATH}}
    ```

* `nano ./etc/conda/deactivate.d/env_vars.sh` and edit as follow:
    ```
    #!/bin/sh

    # Restore original LD_LIBRARY_PATH
    export LD_LIBRARY_PATH="${ORIGINAL_LD_LIBRARY_PATH}"

    # Unset environment variables
    unset CUDNN_DIR
    unset PTXAS_DIR
    ```

* Deactivate the environment: `conda deactivate` and activate again: `conda activate <virtualenv_name>`

* Verify GPU: `python -c "import tensorflow as tf; print(tf.config.list_physical_devices('GPU'))"
`

Ref: [sotiris.gkouzias's answer on Tensorflow Discuss](https://discuss.tensorflow.org/t/what-versions-of-cuda-and-cudnn-are-required-for-tensorflow-2-16/24711/3?u=hoa_nguyen)

# PyTorch
Update soon