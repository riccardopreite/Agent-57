# Agent57(Deep Reinforcement Learning) for Keras-RL
Please use python 3.7.5 and cuda 10.1.

To install cuda and pip package:

sudo chmod +x config_cuda.sh\n
sudo ./config_cuda.sh


## Working example:

### Cartpole:

python examples/cartpole.py

### Pendulum:

python examples/pendulum.py

### MountainCar:
Please note that mountaincar in my case doesn't improve during the training. I didn't figured out why.

python examples/mountaincar.py

## Working environment:

If you want to train just run the python programs. If you want only to test you should go to the bottom of the file, and in the ""if True"" **change enable_train** to **True**

# NB
Please check the config_cuda.sh because I created it from the scratch of my configuration but I installed a lot of version in different way so I'm not sure it will work.
