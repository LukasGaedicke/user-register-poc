# User Registration App
Este é um exemplo de aplicativo Flutter para realizar cadastro e login de usuários. O aplicativo permite que os usuários se cadastrem fornecendo nome, sobrenome, e-mail, senha e nível de acesso. Ele também permite que os usuários façam login usando suas credenciais.

## Arquitetura
Este aplicativo segue a arquitetura Clean Architecture, que promove a separação de preocupações e a modularidade do código e também utiliza a biblioteca flutter_bloc para implementar a gerência de estado com BLoC (Business Logic Component), facilitando a separação entre a lógica de negócios e a interface do usuário.

## Instruções de Uso
### Pré-requisitos:

* Certifique-se de ter o Flutter instalado no seu ambiente de desenvolvimento. Para obter mais informações sobre como instalar o Flutter, consulte a documentação oficial do Flutter.
* Este projeto utiliza o Firestore e o Firebase Auth. Você precisa configurar um projeto Firebase e adicionar suas credenciais ao arquivo **firebase_options.dart** no diretório **/lib**.

#### Instalar Dependências:
Navegue até o diretório do projeto e execute o seguinte comando para instalar as dependências:

```
cd user-registration-app
flutter pub get
```

#### Executar o Aplicativo:
Execute o aplicativo em um emulador ou dispositivo conectado usando o seguinte comando:

```
flutter run
```

#### Explorar o Aplicativo:
Explore as funcionalidades do aplicativo, incluindo o cadastro de novos usuários e o login usando as credenciais fornecidas durante o cadastro.

