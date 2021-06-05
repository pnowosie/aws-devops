# Homeworks

## Moduł 2
- [Zabezpieczenie konta root i konta IAM](https://github.com/pnowosie/aws-devops/issues/1)
- [Budżet i alerty](https://github.com/pnowosie/aws-devops/issues/2)

## Moduł 3
- [Deployed website](http://website-single-template-website-dev-s3website-alr6n2kn5srl.s3-website-eu-west-1.amazonaws.com/)
- [Makefile](https://github.com/pnowosie/aws-devops/blob/master/M03/homework/Makefile) - deployment i upload plików

Niestety proces nie jest w pełni automatyczny (bo nie umiem `make`) i nazwa bucketu jest na sztywno ustawiona po `make deploy`. Poza tym nazwa bucketu powinna być brana z `aws cloudformation describe-stacks` by uniknąć grzebania w innym wiaderku...

