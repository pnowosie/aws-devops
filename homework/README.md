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