# Homeworks

## Moduł 2
- [Zabezpieczenie konta root i konta IAM](https://github.com/pnowosie/aws-devops/issues/1)
- [Budżet i alerty](https://github.com/pnowosie/aws-devops/issues/2)

## Moduł 3
- [Deployed website](http://website-single-template-website-dev-s3website-dtxgarz9vgv7.s3-website-eu-west-1.amazonaws.com/)
- [Makefile](https://github.com/pnowosie/aws-devops/blob/master/M03/homework/Makefile) - deployment i upload plików

Proces tworzenia stack-a i deployment stronki jest całkowicie automatyczny dzięki [df83394](https://github.com/pnowosie/aws-devops/commit/df8339475a609deca887e30641dd91aea5d53b60).

Spróbuj sam:
```
make up
# zabawa stronką
make down
```

## Moduł 4

<details>
  <summary><b>Stacki</b></summary>

![image](https://user-images.githubusercontent.com/1813036/122029481-34a2b400-cdcd-11eb-8664-0f98e134085a.png)
</details>

Linków do stron nie publikuję gdyż usuwam i stawiam stack-i automatycznie (w terminalu, z katalogu `M04/homework`)
odpalam:

```bash
make up COMPONENT=component
```

gdzie `component` to jeden ze sposobów deploymentu:
- export-import
- nested
- parametrized

Proces deploymentu jest **w pełni automatyczny** (w tym kopiowanie plików strony WWW), ale:

- ~~Kopiowanie plików strony WWW do bucket-u dla "nested" nie działa jeszcze w pełni automatycznie~~
    dodane w [[6bf61d5](https://github.com/pnowosie/aws-devops/commit/6bf61d5e954266c2176302b8151bbdfd489affae)]

Patrz także: [[Issue #3](https://github.com/pnowosie/aws-devops/issues/3)]

## Moduł 5

<details>
  <summary><b>Cost allocation tags</b></summary>

<img width="783" alt="obraz" src="https://user-images.githubusercontent.com/1813036/122638908-3cc56100-d0f7-11eb-8e81-1a6c6820b66e.png">
</details>


Ponownie proces deploymentu ubrany w Makefile, polecenia:
- `up` - stawia wszystko
- `down` - usuwa nat gateway-e by ciąć koszty


<details>
  <summary><b>Utworzenie zasobów</b></summary>

**Terminal - AWS CLI**
<img width="1312" alt="obraz" src="https://user-images.githubusercontent.com/1813036/122639872-b3b12880-d0fc-11eb-9c26-77d807c4de9b.png">

**AWS - Web console**

- Stacki
<br/>
<img width="1154" alt="obraz" src="https://user-images.githubusercontent.com/1813036/122639955-19051980-d0fd-11eb-9ab4-509654d04e24.png">

- VPC
<br/>
<img width="632" alt="obraz" src="https://user-images.githubusercontent.com/1813036/122640006-4651c780-d0fd-11eb-8524-a4e730a6d393.png">

</details>


**Rozwiązanie zagadki**
https://github.com/pnowosie/aws-devops/issues/4

## Moduł 6

### Tworzenie instancji

Odpalenie skryptu - niepowodzenie. 
<details>
  <summary><i>Uwaga spoiler</i></summary>
W poleceniu `memes-generator/operations/commands/deploy-jumphost.sh` brakuje capability `--capabilities CAPABILITY_NAMED_IAM`

Prosta poprawka - brawo :clap: Karolina.
</details>
<br/>

<details>
  <summary><b>Próba utworzenia instancji bez klucza - niepowodzenie. Condition działa!</b></summary>

![image](https://user-images.githubusercontent.com/1813036/123264523-67018f00-d4fa-11eb-9f67-b7351bd9ddce.png)
</details>

<details>
  <summary><b>Tworzę klucz</b></summary>

```bash
aws ec2 create-key-pair --key-name memes-generator-dev-jumphost-key (...)

aws ec2 describe-key-pairs \
  --key-names memes-generator-dev-jumphost-key \
  --output yaml | tee
KeyPairs:
- KeyFingerprint: 27:30:8c:95:4d:c1:c8:31:fd:cc:35:24:92:df:e4:40:37:6c:dd:26
  KeyName: memes-generator-dev-jumphost-key
  KeyPairId: key-01e515XXXXXXXXXXX
  Tags: []
```
</details>

<details>
  <summary><b>Tworzę stack ponownie - Działa :bangbang:</b></summary>

```bash
make up

...
aws cloudformation deploy --template-file memes-generator/operations/templates/jumphost.yaml ...

Waiting for changeset to be created..
Waiting for stack create/update to complete
Successfully created/updated stack - memes-generator-operations-jumphost-dev
make[1]: Leaving directory '/home/pnowosie/Proj/edu/aws-devops/project'
touch .network
```

![image](https://user-images.githubusercontent.com/1813036/123268042-f65c7180-d4fd-11eb-83e6-e25f8c358d5e.png)

</details>

<details>
  <summary><b>Połączenie do instancji</b></summary>

**1. SSH**

```bash
ssh -i "~/.aws/jumphost-key.pem" ec2-user@ec2-XXXXXXXXXXXXX.eu-west-1.compute.amazonaws.com
Last login: Thu Jun 24 13:17:40 2021 from XXX

       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-2/
[ec2-user@ip-10-0-46-21 ~]$ ls -la
razem 16
drwx------ 3 ec2-user ec2-user  95 06-24 13:18 .
drwxr-xr-x 3 root     root      22 06-24 12:59 ..
-rw------- 1 ec2-user ec2-user  13 06-24 13:18 .bash_history
-rw-r--r-- 1 ec2-user ec2-user  18 2020-07-15  .bash_logout
-rw-r--r-- 1 ec2-user ec2-user 193 2020-07-15  .bash_profile
-rw-r--r-- 1 ec2-user ec2-user 231 2020-07-15  .bashrc
drwx------ 2 ec2-user ec2-user  29 06-24 12:59 .ssh
[ec2-user@ip-10-0-46-21 ~]$ logout
Connection to ec2-XXXXXXXXXXXXX.eu-west-1.compute.amazonaws.com closed.
```

**2. Session Manager**

Do połączenia się z Jumphost-em użyję Session Manager-a z AWS CLI. W tym celu instaluję [plugin dla CLI](https://docs.aws.amazon.com/systems-manager/latest/userguide/session-manager-working-with-install-plugin.html)

```bash
make-network show-jumphost | tee
aws cloudformation describe-stacks     --stack-name memes-generator-operations-jumphost-dev     --output yaml     --query Stacks[].Outputs[]     --region eu-west-1
- Description: The ID of Jump Host Instance
  OutputKey: JumpHostInstanceId
  OutputValue: i-05bcaXXXXXXXXXXXX
- Description: Public IP address of the jumphost instance
...

aws ssm start-session --target i-05bcaXXXXXXXXXXXX --region $REGION

Starting session with SessionId: cli-admin-0XXXXXXXXXXXXXXXX
sh-4.2$ whoami
ssm-user
sh-4.2$ ls /
bin  boot  dev	etc  home  lib	lib64  local  media  mnt  opt  proc  root  run	sbin  srv  sys	tmp  usr  var
sh-4.2$ ls /home
ec2-user  ssm-user
sh-4.2$ exit


Exiting session with sessionId: cli-admin-0XXXXXXXXXXXXXXXX.
```

Zaobserwuj, ze na maszynie są konta dla dwóch userów:
* ec2-user - przy połączeniu przez SSH
* ssm-user - przy połączeniu przez SSM

</details>
<br/>
