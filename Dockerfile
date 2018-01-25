# FROM gets an initial image to build from
FROM ubuntu:latest
# MAINTAINER is the maintainer's name and email
MAINTAINER Guillaume Maiano (guillaume@maiano.fr)
# CMD is an instruction that gets executed when the container runs
## It uses the format CMD ["executable","param1","param2"] (and other more complex forms).
## For example, CMD ["ls", "-la"] should list the files at container root
# ENTRYPOINT is a related instruction which specifies the default app (for example, a Kitura server app)
## It can then use the CMD instruction to provide it with parameters (such as, for example, keys )
ENTRYPOINT ["/bin/echo"]
CMD ["hello world"]
# RUN will execute a command (useful for modifying the state of the machine)
RUN apt-get update
RUN apt-get install -y curl
RUN apt-get install -y nginx

# ADD will copy a given directory at the specified location
ADD demoes/ examples/
# WORKDIR will set the current directory
WORKDIR examples

# EXPOSE will listen on a given port
## For example, port 80
EXPOSE 80 

## Not a very useful container, but Mysql is a bit too involved (it requires setting it for non-interactive apt-get, which means setting the settings via a dpkg script, and that's ridiculous to rewrite what others did just fine

