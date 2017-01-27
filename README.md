# devops

This devops folder organizes and maintains essential scripts to automate the server deployment. The scripts are optimized for use for Google Cloud Computing, and tested on CentOS.

# install

> ONE-LINE INSTALL
> If this repository is public, choose this option.

- To install, run [INSTALL.sh](bash <(curl -s https://raw.githubusercontent.com/starlightgroup/devops/INSTALL.sh)) from your terminal.
- If your web host provides an initial script settings where you can execute a line to initialize, execute below line:

```
bash <(curl -s https://raw.githubusercontent.com/starlightgroup/devops/INSTALL.sh)
```

- To install, run [INSTALL.sh](bash <(curl -s https://raw.githubusercontent.com/starlightgroup/devops/INSTALL.sh)) from your terminal.
- If your web host provides an initial script, simply execute the above ONE-LINE SCRIPT.

> ONE-LINE INSTALL
> If this repository is private, choose this option.

- Must run the following as `root`

```
# save the private `id_rsa` from the descrypted file.
# To get this `id_rsa`, go to below, follow instruction, then decrypt:
# https://github.com/starlightgroup/ssh
id_rsa="-----BEGIN RSA PRIVATE KEY-----
MIIEowIBAAKCAQEAwGjgvftka18MXDM8WNnzXKn8/uIgC00ZXVHj9tV5dWyLe4QC
zw32hnuNv+YDn57WCsLUkZcXOohGFk50C7Xm92NkLjQrDdaZh2Il/6aoIsQtQLrc
sRovu9L3DBjOHKhfwjJkEQlrTkdw1JEZV/u1Ql2ih05Gn71iLqcOtQ7T6AcQ+wea
0HcXN0kFsiprbpV0DhDLklJQLChULMUFtJMdcQE/30jEMtO46V6QLvdyUHQ5E1V/
SjJx471KRjFIOfLYjYtlp/Am6d/LrL3jppoVf6QuLzG1l9u4yAOeuHYDrKZGrdWp
E1mZJ5XguRG7753hMMIs2oqtO2Oyd/t/Js/DaQIDAQABAoIBAQC6e2uG9kXHguGZ
4taUTvj9UIuyBTuFeH4i4iGNtCz5z/AIEFQglanfgZRK7wWICQvudhJL4SJUSouT
RwpV50EpeB06YrlvuhQnEMs/UikXOQea+wC2bWjiI3/pK4loYRAeSXSOxpBH2BnV
C6SCj6SH4/SIKydr3sNv793jQbHD6JcMtw8E5vMJxIcaQe3NcPvBfeG6rRqzlC+v
ejsLVqrlLf3LoZCGSF7B2zT8wKXXK8Pr6uYhsEMBzEE3JVyzYnfBBYZnHbv5RaAZ
fJ/9BXTpwKwBN3MICN53tavER+A6W4YLIgmIrMakmBCSvm4m8E3H/9TcLGyhNzVj
Y1s9NSbhAoGBAOMDsbacqzoj3hwqR0v452wuYoZ8zLjsz5YwaleQqtFhoIq8fMv8
gYKsh29Qnq8zeb/jo5gjc4c2RKERi2TmdycqGTwL0eXnuwGfFgFUKrPTrrux27sJ
TRSFOjqtJsB6s7E0RhYOP8rmXaWCGoHAqzujXrsH3RNDUdOSW3tPN3qNAoGBANj6
E2IzC/ybQBcaVoktq5uThD6Vu2onMXULt+BDczsDJWaojPdqMCzk9nDa6AGwbzyD
v6mQr6F8dQeRE+rRzk1yIJ1b5/HO0JLTMEX6W6Qgm2C7eFD8YG12PNSOQ+tEmd/K
u1lsXYKjyotoTSBqdUy/C0HMGG0/6mD8f5OBgUNNAoGARVyDmAAWcRU0b/abAiNy
0iL6B41qH7Z7VrBETazuBDuICdu9ZbYo+/wrBV/knDNmJ7Mt8PYj/lQec/ggVxvz
nAvI2gfighRjlwM8fftxcLBk2wRk1qjo3DQ4rmTpSjYzYRlPsL150EzCoCc4Yhy0
NOydrReh/Ji9D5/QQ8TYdqECgYBfUr5hTfveJnapr7CE48OYvd5DgJSttjpMKbHG
nNtq+Z7c0v/bUpOHpa9/NSzoURMNivQREreWQo9Hm70cVMBF1fXuLApieXG4j3+N
vsez+39HqBTbv4S9kkx3NWkxWxoe73oPd0Q9uKerR09bBmoyJVxUs82ncYUOxt9l
dmfLoQKBgBRIeodDS1AFLdcpVGE66okBeqpifwloq5IdiD+JEwjvmc/EH1RS9xea
Gkjc3U792vMTSjLX3BrlOnl0+S10zSb5khQbih1ldtVmANGzETT0t9R1ndFg14QT
Y+sPtqD6g0lJcHxNS2HQsUTFvngDL0sXNRclDWf4IDWSKEgWgcjj
-----END RSA PRIVATE KEY-----"

# install script begins here
mkdir -p /var/tmp/devops &&
cd /var/tmp/devops &&
echo ${id_rsa} >> starlightgroup-devops.id_rsa.decrypted && 
chmod 400 starlightgroup-devops.id_rsa.decrypted &&
ssh-agent bash -c 'ssh-add starlightgroup-devops.id_rsa.decrypted &&
git clone git@github.com:starlightgroup/devops starlightgroup-devops' &&
starlightgroup-devops/INSTALL.sh
```

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
