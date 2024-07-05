<h1><div align="center"> 📱 Herois Marvel</div></h1>

## 📖 Sobre o Projeto
O Herois Marvel é um aplicativo iOS desenvolvido em Swift que permite aos usuários pesquisar e visualizar informações detalhadas sobre heróis da Marvel. Utiliza a API oficial da Marvel para buscar os dados e exibir imagens, nomes e descrições dos heróis. Além disso, permite aos usuários visualizar mais detalhes sobre cada herói através de uma webview.

## Estrutura do projeto 📁

### Controllers

- <b>ViewController.swift:</b> Controla a tela inicial do aplicativo onde os usuários inserem o nome do herói para pesquisa. Ele gerencia a transição para a tela de listagem de heróis.
- <b>HeroesTableViewController.swift:</b> Responsável por gerenciar a tabela que exibe os heróis encontrados pela pesquisa. Controla o carregamento dos heróis da API da Marvel, a apresentação na tabela e a navegação para a tela de detalhes do herói.
- <b>HeroTableViewCell.swift:</b> Define a célula personalizada usada na tabela de heróis (HeroesTableViewController). Configura a exibição do nome, descrição e imagem de cada herói.
- <b>HeroViewController.swift:</b> Gerencia a tela que exibe os detalhes de um herói específico usando uma WKWebView. Controla o carregamento da página da web com informações adicionais do herói selecionado.

### Services

- <b>MarvelAPI.swift:</b> Implementa a lógica para fazer requisições à Marvel API. Configura as URLs, gera hashes MD5 para autenticação e trata os dados recebidos da API.

### Models

- <b>MarvelClasses.swift:</b> Define as estruturas de dados (MarvelInfo, MarvelData, Hero, Thumbnail, HeroURL) usadas para decodificar as respostas JSON da Marvel API.



## 📚 Bibliotecas Utilizadas
O projeto utiliza as seguintes bibliotecas para facilitar o desenvolvimento:

- Alamofire: Uma biblioteca utilizada para fazer requisições HTTP de forma simplificada.

 <a href="https://github.com/Alamofire/Alamofire" target="_blank">GitHub - Alamofire

- Kingfisher: Uma biblioteca para baixar e gerenciar imagens de forma eficiente em Swift.

 <a href="https://github.com/onevcat/Kingfisher" target="_blank">GitHub - Kingfisher</a>
- SwiftHash: Uma biblioteca para gerar hashes MD5.

<a href="https://github.com/onmyway133/SwiftHash" target="_blank">GitHub - SwiftHash

## API Utilizada 🌐
- API da Marvel: <a href="https://developer.marvel.com/documentation/getting_started" target="_blank">Marvel API</a>

 ## 🚀 Como Rodar

### Clone o repositório:

```sh
git clone https://github.com/vrortega/HeroisMarvel.git
cd HeroisMarvel
```

* **Abra o Projeto no Xcode:**

Navegue até o arquivo `HeroisMarvel.xcodeproj` e abra-o com o Xcode.

* **Instale as Dependências:**

Como o projeto utiliza CocoaPods, execute `pod install` para instalar as dependências necessárias.

* **Compile e Rode o Projeto:**

Pressione `Cmd + R` ou clique no botão de rodar no Xcode.

# 📖 Referência
Projeto desenvolvido como parte do <a href="https://www.udemy.com/course/curso-completo-de-desenvolvimento-ios11swift4" target="_blank">
curso de desenvolvimento iOS, do Desenvolvedor Eric Alves Brito</a>.
