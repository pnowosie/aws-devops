# Frontend aplikacji Memy w Chmurze

Jest to prosta aplikacja napisana w React używana podczas kursu 'AWS w praktyce - pierwszy projekt w chmurze'

## Build i deploy do bucketu S3

### Wymagania

Na swoim komputerze musisz mieć zainstalowane **AWS CLI** oraz **NodeJS i NPM**

### Konfiguracja i  Budowanie aplikacji

W zależności od Twojego postępu w kursie będziesz musiał odpowiednio skonfigurować plik **public/configurations.js** w pola *ApiURL* i *PhotosURL* musisz wpisać adres pod którym znajduje się twój backend.
Jeśli uruchamiasz backend jako pojedynczą instancje EC2, będzie to adres IP lub DNS instancji.
Jeśli masz już Application Load Balancer - adresem będzie adres LoadBalancera
Jeśli jest skonfigurowany już Amazon CloudFront, możesz zostawić pola puste (w konfiguracji CloudFront backend i frontend używają tego samego adresu).

Po wpisaniu adresów możesz przejść do instalowania zależności i budowania aplikacji.

Żeby zainstalować zależności wykonaj polecenie:

```
npm install
```

Następnie - żeby zbudować aplikację - wykonaj polecenie:
```
npm run build
```

Zbudowana aplikacja pojawi się w folderze build.


### Deploy aplikacji

Żeby przenieść aplikacje z folderu build do bucketu s3 wykonaj polecenie:

```
 aws s3 cp build/ s3://$BUCKET_NAME> --recursive
```

Pamiętaj o zmianie nazwy bucketu.

Gotowe pliki strony znajdują już się w buckecie.