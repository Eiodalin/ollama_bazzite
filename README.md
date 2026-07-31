This is a very simple project. I was unhappy with how much of a pain it is to get ROCm working with ollama on Silverblue/Bazzite.

So i made this. If you don't have https://brew.sh/ setup on your machine you should run the brew_install.sh first 

Just make sure that start.sh is executable to get this rolling.
Easy teardown is just to run stop.sh

Both AMD (ROCm) and Nvidia (CUDA via nvidia-container-toolkit/CDI) are supported. start.sh and stop.sh
auto-detect which one you have (AMD via /dev/kfd, else falls back to nvidia-smi) and drive the matching
config under amd/ or nvidia/.
