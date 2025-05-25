# 🎬 SwiftMovieDB

Um aplicativo elegante de navegação e busca de filmes, feito com **SwiftUI**, arquitetura **Clean Architecture + MVVM**, e consumindo dados da **TMDb API**.

## ✨ Funcionalidades

- 🔍 Pesquisa dinâmica de filmes
- 📈 Listagem de filmes mais bem avaliados
- 🎞️ Tela de detalhes com avaliação e sinopse
- ▶️ Botão para assistir trailer (em breve!)
- 🧠 Código organizado por camadas (Domain, Data, Presentation)
- 🎨 Visual bonito, limpo e adaptado para iPhone

## 📱 Imagens do App

(Imagem do aplicativo hoje... conforme for avancando no projeto estarei atualizando)

## 🏗️ Arquitetura

A estrutura segue os princípios de **Clean Architecture**, separando responsabilidades entre:

- `Data`: Requisições da API
- `Domain`: Modelos e contratos
- `Presentation`: Views e ViewModels (MVVM)

```
MovieBrowserApp/
├── Data/
│   ├── API/
│   └── Models/
├── Domain/
│   └── Entities/
├── Presentation/
│   ├── Views/
│   └── ViewModels/
├── Resources/
└── SupportingFiles/
```

## 🔧 Tecnologias

- Swift 5.9+
- SwiftUI 3+
- Xcode 15+ (compatível com 16.2)
- TMDb API

## 🚀 Como rodar

1. Clone o projeto
2. Substitua sua API Key no arquivo:
   ```swift
   let API_KEY = "SUA_CHAVE_AQUI"
   ```
3. Rode no simulador ou no seu dispositivo

## 🧪 Testes

*(Em breve)*

## 📝 Licença

MIT. Sinta-se livre para usar e adaptar!

---

Feito com ❤️ por Camila Roque

