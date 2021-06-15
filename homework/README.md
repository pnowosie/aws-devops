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

![image](https://user-images.githubusercontent.com/1813036/122029481-34a2b400-cdcd-11eb-8664-0f98e134085a.png)

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

- Kopiowanie plików strony WWW do bucket-u dla "nested" nie działa jeszcze w pełni automatycznie - gdyż nie wyciągam poprawnie nazwy bucket-u 
(nested stack `website-nested-nested-dev-...` ma losową nazwę :) )

Patrz także: [[Issue #3](https://github.com/pnowosie/aws-devops/issues/3)]
