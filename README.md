# devops

This devops folder organizes and maintains essential scripts to automate the server deployment. The scripts are optimized for use for Google Cloud Computing, and tested on CentOS.

# install

> ONE-LINE INSTALL
>
> If this repository is public, choose this option.

- To install, run [INSTALL.sh](bash <(curl -s https://raw.githubusercontent.com/starlightgroup/devops/INSTALL.sh)) from your terminal.
- If your web host provides an initial script settings where you can execute a line to initialize, execute below line:

```
bash <(curl -s https://raw.githubusercontent.com/starlightgroup/devops/INSTALL.sh)
```

- To install, run [INSTALL.sh](bash <(curl -s https://raw.githubusercontent.com/starlightgroup/devops/INSTALL.sh)) from your terminal.
- If your web host provides an initial script, simply execute the above ONE-LINE SCRIPT.

> ONE-LINE INSTALL
>
> If this repository is private, choose this option.

- Must run the following as `root`

```
# save the private `id_rsa` from the descrypted file.
# To get this `id_rsa`, go to below, follow instruction, then decrypt:
# https://github.com/starlightgroup/ssh
# The following private key is just to illustrate the example.
# Please do not use below PRIVATE KEY as this won't work.

# set variable for initialization
DIR_DEVOPS="/var/tmp/devops/starlightgroup-devops" &&
PASSWORD_PRIVATE_RSA_KEY=""

# move to the folder
mkdir -p /var/tmp/devops &&
cd /var/tmp/devops &&

# inject private RSA key
cat > starlightgroup-devops.id_rsa.decrypted << 'EOF'
-----BEGIN RSA PRIVATE KEY-----
Proc-Type: 4,ENCRYPTED
DEK-Info: AES-128-CBC,13C08240D4666008762681326ADBF1D0

JY042C1/7g/E/Zk6BJpHnP2N++Vu1ZWKijOcf9ZLzfGCRwjVeRTtK/SWuulim1+h
9V+TSnkArq/e69Wcab5k4Ky3MZbdy4SyDKPP0kA9LBVgvTlzjUEXZOo4UGehNM+U
LKuUzUHBJAnG+0U9kBQe61y8u7xiItB8kTK3Ll1Y7jME7ZGlUjgwMMxUwL70Oe/Q
559+JWNqpcFDzw3FaLTUwerVWkCexdPXYa26/dR4nHxDwi5GihAXcu2YfavhiE5C
yHct4ibfBlANhJk3afCCAC3F4WKMMGoFwruB+RAf/kufSdJwctG2Dx1m+q0XRYvG
hFffMz4sXLT+ViLQgiVWLmlPzPbaDiqHtouFsU9TF2aRFwoUYe2TVekBFbfJUvXk
T/YLNpRE+OuCBHq9ouBNT+mh9NABuh+6iQO1aq7qB8VA2S416Lr2TI8jo9RFTUV2
iw54aGlweruZQqsHwL+ZEgOjDLdvLl445OgYbJ48y7c02jTZ/RCnJUdlVlDBNJ0p
QfK43HMODp/B8QMYnd2Op/wu84FwISvIAjmm9BY4OPQ5sdWMxvtj9oAJErYv9eeT
XbB+s7GkugF28yHPk57KkdBilEo338PcKStDXOs6KarTrj1/ySZXnPO/IGZZcjMs
QEGUhAuT4Wr+4Kqaj32VLYx0Gb4j5JCVj7eV7O46BckjsQKihsQwFOPBI2of2ozG
ZwZRUc983IXCY8X+Zu2qMFfqZKAgdULKjCU+eTozmFvysru/zPR5LRktCz9wSydJ
aEj80GUTsAEuXA7xDlBffwFcNxQ6TwarLBhMROaDgRS5M/P1t+DiDLyAk1Z5aKfT
fPJRSLFNwho1ze8YwPxJLul3V9w67rMRhOmYSztGvjE3kiV0ZhjAm/bgnWHMG8Yc
0yo+Ihmlt7BxIJNbQ8SD/nAB5MntOzL5OQ2Df+HdWD0IlYhKwGOri7I2tznJldn9
T6szQcjYDEQStjjEl9QZscarPJb7OBfL1whQh7NHa/JqPLMpheOdIL0H4bKDxSx0
7Gol5WfjAgqJAQ7kXh/48cg02kC1ks15sJuhsa4XWPThnW+Mlj2US7AL/BpTaOWA
pu7MyNlmbFAAtvnljdktxCGmAu/mM96LZpRLFhugPw7UDinj7Wx0MxEBCdXNd127
h3pCeymhVizoCagN2Tsvu/fUAtGIv2ur7gjne5dqo9fpAvzoSZEDeHuWkv6kN/Sm
DUT1sNh5V5zNlHUdmpK5Ttu6FI/urVy15GuDbp8xAAjAg5gwXG0nyTv5OBVLQT/L
3WkR+GP6wrPANoR7fjboa41sCbmCG+G+J+IoOq7Z25uxjEtd5ATuWtq2ISaAzNbx
CEXU1EPOwzECCjY4/xp6PL8qVYZ1Brfgdn4C8ZqjQvS1JqlVi1JRrhUJG+6fLHP6
KoL0Yicggwdhck6oU7S0W0bnJzqoF1Phhj/TX0DnxAeRjCOOPetLDvzm8XyjhUMi
MFOfELhYEwYixYnhZdhuKgSC7pkzP9pHJLzg6uaszzuhyaghNc0tnCdeEAcq99cC
+udocty/4vWt1Q4TwDFT1zEWEMrvk6XsWRtQbwbCIqqJTlXqUcJgvj3HvA4EyFrD
-----END RSA PRIVATE KEY-----
EOF &&

# install script begins here
yum install -y git &&
echo ${id_rsa} >> starlightgroup-devops.id_rsa.decrypted && 
chmod 400 starlightgroup-devops.id_rsa.decrypted &&
ssh-agent bash -c 'ssh-add starlightgroup-devops.id_rsa.decrypted &&
git clone git@github.com:starlightgroup/devops starlightgroup-devops' <<< 'yes' &&
${DIR_DEVOPS}/INSTALL.sh ${DIR_DEVOPS}
```

> DOCKER
> 
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
