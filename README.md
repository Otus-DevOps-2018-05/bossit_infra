# bossit_infra
bossit Infra repository

## HW3
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

## HW4
testapp_IP = 35.230.7.97
testapp_port = 9292

#### Добавление правила для firewall:
```bash
gcloud compute firewall-rules create "allow-puma" --allow tcp:9292
```

#### Создание инстанса и запуск локального `bash-скрипта`
```bash
gcloud compute instances create reddit-app2 \
    --boot-disk-size=10GB \
    --image-family=ubuntu-1604-lts \
    --image-project=ubuntu-os-cloud \
    --machine-type=g1-small \
    --tags=puma-server \
    --restart-on-failure \
    --zone=us-east1-b \
    --metadata-from-file startup-script=startup-script.sh
```

#### Создание инстанса и запуск удаленного `bash-скрипта`
```bash
gcloud compute instances create reddit-app2 \
    --boot-disk-size=10GB \
    --image-family=ubuntu-1604-lts \
    --image-project=ubuntu-os-cloud \
    --machine-type=g1-small \
    --tags=puma-server \
    --restart-on-failure \
    --zone=us-east1-b \
    --metadata startup-script-url=https://gist.githubusercontent.com/bossit/c3f515eb7cd3b588f965e070af7f672d/raw/4e6046baa72077bc50936e2b169ae8dde6aadda7/otus-after-create-instance.sh
```

## HW5
Создание обзраза VM:

```bash
$ packer build \                                                
    -var 'project_id=XXX' \
    -var 'source_image_family=ubuntu-1604-lts' \
    -var-file=variables.json \
    ubuntu16.json
```