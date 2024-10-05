# Diletta Chanllenge

Projeto de construção do aplicativo de wish-list, como desafio técnico da Diletta.

O propósito do projeto é a construção de um aplicação Android e IOS, com Flutter.

Para esse desafio foi escolhida a API de StarWars que retorna diversos dados referentes a este universo.
Mais especificamente, foi selecionada a feature de starships.

## 🗂️ Estrutura de arquivos

O projeto utiliza uma arquitetura `feature-based` que é focada em organizar o projeto por recursos(ex: auth, home…).  
Essa arquitetura suporta projetos de grande, possibilitando que times trabalhem de forma autônoma em cada recursos sem causar interdependência entre as equipes.  

Por ser um projeto pequeno, não há necessidade de implementação ao pé da letra do Clean Arch, mas mesmo sem sua adoção completa, não diversos pontos do código 
temos aplicado os princípios do SOLID e alguns DesignPatterns.

Atualmente a estrutura do projeto está seguindo esse padrão: 

```
📦 lib  
 ┣ 📂 core
 ┃ ┣ 📂 adapters  
 ┃ ┣ 📂 constants  
 ┃ ┣ 📂 entity  
 ┃ ┗ 📂 service_locator 
 ┣ 📂 ui  
 ┃ ┣ 📂 theme  
 ┃ ┗ 📂 widgets  
 ┣ 📂 src  
 ┃ ┣ 📂 shared  
 ┃ ┃ ┣ 📂 models  
 ┃ ┃ ┗ 📂 controller  
 ┃ ┣ 📂 features  
 ┃ ┃ ┣ 📂 featureA  
 ┃ ┃ ┃ ┣ 📂 datasource
 ┃ ┃ ┃ ┣ 📂 repository
 ┃ ┃ ┃ ┣ 📂 models  
 ┃ ┃ ┃ ┣ 📂 screens  
 ┃ ┃ ┃ ┃ ┣ 📂 widgets  
 ┃ ┃ ┃ ┗ 📂 controller
 ┃ ┣ 📜 app.dart  
 ┃ ┗ 📜 router.dart  
 ┗ 📜 main.dart  
```

`core` - Armazena funcionalidades core da aplicação (http, image, extensions, mixins, adapters)

`ui` - Pasta que centraliza toda a parte de componentização visual da aplicação (themas, tipografias, cores e widgets)

`src` - Pasta que centraliza o código da aplicação

`shared` - Armazena funcionalidades que podem ser compartilhadas


### 📋 Pré-requisitos

Para rodar o projeto localmente na sua máquina é necessário ter instalado o [Flutter](https://docs.flutter.dev/get-started/install).

### 🔧 Instalação

Com o Flutter instalado na sua máquina, basta clonar este repositório localmente e executar o seguinte comando para instalar os pacotes necessários:

```
flutter pub get

flutter run
```

### Make

Existe um arquivo na raiz do projeto chamado makefile, nele contém alguns alias para alguns comandos utilizados no dia a dia. 
Para executa-los deve-se primeiro instalar o MAKE, em seu sistema operacional.
