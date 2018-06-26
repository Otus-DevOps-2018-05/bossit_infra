# bossit_infra
bossit Infra repository

## HW5

bastion_IP=35.206.179.241
someinternalhost_IP=10.132.0.3 

#### Как подключиться к серверу "someinternalhost" в одну команду с локальной машины?

```bash
$ ssh -A bossit@35.206.179.241 ssh bossit@10.132.0.3
```

#### Как подключиться к внутреннему хосту через команду `ssh someinternalhost`?

Добавить в ~/.ssh/config два алиаса:
```
#bastion
Host bastion
HostName 35.206.179.241
ForwardAgent yes

#someinternalhost
Host someinternalhost
HostName 10.132.0.3
ForwardAgent yes
ProxyCommand ssh bastion nc %h %p
```

И после этого можно подлючиться в внутреннему хосту через:

```bash
$ ssh someinternalhost
```


## HW6

testapp_IP = 35.230.7.97
testapp_port = 9292
