# Docker for CARMA

This is a environment for runing and testing project CARMA. The image is about 2GB large.

## Included Libraries
- Ubuntu 18.04 LTS
- Python 3.6.8
- Tensorflow 1.14.0
- Tensorflow-gpu 1.14.0
- Jupyter Notebook

## Building the Docker Image
You can pull the pre-built image from docker hub or build it yourself.

For pulling image:
```
docker pull paulzhang1992/docker_carma
```

For build it yourself:

If you are building the image off the Docker file:
```
docker build [docker file dir] -t paulzhang1992/docker_carma:latest
```
If you are building off a github repo:
```
docker build github.com/paulzhang1992/carma_docker.git -t paulzhang1992/docker_carma:latest
```

## Runing the Docker Image
```
docker run -it -p 8888:8888 -p 6006:6006 -v [carma project dir]:/home paulzhang1992/docker_carma:latest
```
Note -p port before : is the fowarding port on your machine. Port 8888 is for jupyter notebook, 6666 is for tensorboard.

## Running Jupyter Notebook
While inside the Docker container (see previous section) run this command, then navigate to: http://localhost:8888/

```bash
# cd /home    # This should be you default starting folder, if not change to where you mounted you project dir.
jupyter notebook --allow-root
```

## Issues/Suggestions
Submit issues to zzhang@shelltechworks.com
