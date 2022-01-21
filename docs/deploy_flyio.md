# add steps here

commands to use

```
# build image with name "learntron"
docker build -t learntron .

# run image locall to verify it works
# after running, go to web browser with address localhost:5557 to verify it works
docker run -d --rm -p 5557:80 --name learntronlocal learntron

# stop the container
docker stop learntron

# create new tag of image for use with DockerHub
# syntax of tag is userid/imagename

docker tag learntron rpodcast/learntron
```

Install dockercli https://docs.docker.com/get-docker/

Authenticate to Docker Hub from the command line by running `docker login` and entering your Docker Hub user ID and password at the prompts

Push the container image to Docker Hub: 

```
docker push rpodcast/learntron
```

Log in to your DockerHub account and verify the image appears

Deploy to fly.io using the procedure in https://hosting.analythium.io/make-your-shiny-app-fly/


