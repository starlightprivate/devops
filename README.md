# devops

This devops folder organizes and maintains essential scripts to automate the server deployment. The scripts are optimized for use for Google Cloud Computing, and tested on CentOS.

# install

> ONE-LINE INSTALL
> If this repository is public, chose this option.

- To install, run [INSTALL.sh](bash <(curl -s https://raw.githubusercontent.com/starlightgroup/devops/INSTALL.sh)) from your terminal.
- If your web host provides an initial script settings where you can execute a line to initialize, execute below line:

```
bash <(curl -s https://raw.githubusercontent.com/starlightgroup/devops/INSTALL.sh)
```

- To install, run [INSTALL.sh](bash <(curl -s https://raw.githubusercontent.com/starlightgroup/devops/INSTALL.sh)) from your terminal.
- If your web host provides an initial script, simply execute the above ONE-LINE SCRIPT.

> DOCKER
> This requries this repository to be public, or you have an access to this
> repository from your login credential. Alternatively, you can build the 
> docker image on local, then send it to your own Docker host.

- Highly advised to deploy and install through Docker image.
- To install through docker:
    
```
# build docker file
# First, make sure you're at this repo's root where `Dockerfile` is located
# Then build the docker image called `centos-7.3.nodeserver`, if not built.
docker build -t centos-7.3-nodeserver .

# run docker image
docker run -a stdin -a stdout -i -t centos-7.3-nodeserver
```

# compatibility

- Tested on CentOS Linux release 7.3.1611 (Core)