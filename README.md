# Docker for CARMA

This is a environment for runing and testing project CARMA. The image is about 2GB large.

## Included Libraries
- Ubuntu 18.04 LTS
- Python 3.6.8
- Tensorflow 1.14.0
- Tensorflow-gpu 1.14.0
- Jupyter Notebook

## Building the Docker Image
If you are building the image off the Docker file:
```
docker build [docker file dir] -t paulzhang1992/carma_docker:latest
```
If you are building off a github repo:
```
docker build github.com/paulzhang1992/carma_docker.git -t paulzhang1992/carma_docker:latest
```

## Runing the Docker Image
```
docker run -it -p 8888:8888 -p 6006:6006 -v [carma project dir]:/home paulzhang1992/carma_docker:latest
```
Note -p port before : is the fowarding port on your machine. Port 8888 is for jupyter notebook, 6666 is for tensorboard.

## Running Jupyter Notebook
While inside the Docker container (see previous section) run this command, then navigate to: http://localhost:8888/

```bash
cd /home    # So Jupyter Notebook uses this as it's root
jupyter notebook --allow-root
```

## Issues/Suggestions
Submit issues to zzhang@shelltechworks.com
