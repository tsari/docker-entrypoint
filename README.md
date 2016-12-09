# docker-entrypoint
Default entrypoint script for dockerfiles to ensure the user/group when running docker containers as binary replacement.
An example is to run composer in a docker container.

### Why I am doing this?
Assume you have composer installed on you pc. You would type `composer install` to install dependencies.
In docker you would run this like `docker run -it --rm ...`.

In case of docker, root is running the command. That's not what I want. I want to run the command as the user currently logged in.
Otherwise the vendor directory will be created with `root` as owner. 

So I wrap the docker run command in a shell script named like the binary I want to run.
This is `composer` in our example.

I places these shell scripts in the `home/bin` directory and add this to my PATH if it's not already in.
So I can call it from everywhere.

For each "binary" I create this way, I have to create a docker file that inherits from the official image and adds and runs the entrypoint script.

Each wrapper shell script has to pass 
- the uid/gid
- USER and HOME env's for the current user
- current working dir and
- mount the user's home

### Content of this repository
This repo only contains the entrypoint script that is used in all my "binaries". So I don't have to copy it over and over.



