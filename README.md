# flutter_app_symba

Aplicação Flutter para jogadores de RPG de Symbaroum.

## Descrição

Este projeto tem como objetivo fornecer uma interface mobile para jogadores de Symbaroum gerenciarem suas fichas de personagem. A aplicação permite visualizar, editar e salvar fichas, conectando-se a uma API local (backend em Django, veja o repositório `api_symbaroum`).

## Funcionalidades

- Visualização e edição de fichas de personagem.
- Integração com backend Django via API localhost.
- Acesso às raças e habilidades oficiais do Symbaroum.
- Personalização completa do personagem.
- Emissão de ficha em PDF no formato oficial do jogo ou ficha em branco.

## Tecnologias

- Flutter (mobile)
- API REST (localhost, backend Django)

## Como usar

1. Certifique-se de que a API backend (`api_symbaroum`) está rodando em localhost.
2. Clone este repositório e execute o projeto Flutter:
   ```sh
   flutter pub get
   flutter run
   ```
3. Crie ou edite sua ficha de personagem, personalize com raças e habilidades, e salve as alterações.
4. Gere o PDF da ficha quando desejar.

## Observações

- O projeto está em desenvolvimento inicial.
- Para o backend, acesse: [api_symbaroum](https://github.com/RaulMigSN/api_symbaroum)

## Contribuição

Contribuições são bem-vindas! Sinta-se livre para abrir issues ou pull requests.

Desenvolvido para