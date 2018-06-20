# bossit_infra
bossit Infra repository

## Сервера на GCP

* bastion_IP = 35.206.179.241
* someinternalhost_IP = 10.132.0.3 

## Как подключиться к серверу "someinternalhost" в одну команду с локальной машины?

```bash
$ ssh -A bossit@35.206.179.241 ssh bossit@10.132.0.3
```