---
layout: post
title: Fix "Failed to initialize NVML Driver/library version mismatch"
tags: tips gpu bugs
last_modified_on: 2024-01-23
read_time: true
---

I often follow the work of GPU by `nvidia-smi` and normally it works. However, one day, I faced an error:
```bash
$ nvidia-smi
Failed to initialize NVML: Driver/library version mismatch
NVLM librry version: 535.154
```

Here is some steps to do:

**Step 1**: Check kernel version
```bash
$ cat /proc/driver/nvidia/version
NVRM version: NVIDIA UNIX x86_64 Kernel Module  535.146.02  Thu Dec 19 18:56:32 UTC 2023
GCC version:  gcc version 9.4.0 (Ubuntu 9.4.0-1ubuntu1~20.04)

$ cat /sys/module/nvidia/version
535.146.02
```

So there is a mismatch between nvidia driver (`535.154`) and kernel version (`535.146.02``).

**Step 2**: I purged all drivers and libraries
```bash
$ sudo apt purge "nvidia-*" && sudo apt purge "libnvidia-*"
```

*Note: Double quote ("") is important for for `zsh`.*

Then checked if there are any nvidia drivers installed. The result of following command should be nothing:

```bash
$ dpkg -l "nvidia-*" |grep ^ii
```

**Step 3**: Download the correct version of driver for corresponding product line [here](https://www.nvidia.com/download/index.aspx?lang=en-us). Mine is **GeForce RTX 4080**.

Some sources (for example: https://www.gpu-mart.com/blog/failed-to-initialize-nvml-driver-library-version-mismatch) recommend using `sudo apt install nvidia-driver-<version>` but it didn't install the correct version for me. I executed `sudo apt install nvidia-driver-535` but it installed the NVIDIA driver version `545`, leading to the unsolved problem.

**Step 4**: Reboot using this commend `$ sudo init 3`

**Step 5**: Install the driver
```
$ cd $HOME/Downloads
$ chmod a+x NVIDIA-Linux-x86_64-535.154.05.run
$ sudo ./chmod a+x NVIDIA-Linux-x86_64-535.154.05.run
$ sudo reboot
```

Now it should be fine!
