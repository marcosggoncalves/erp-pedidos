# Sistema de Gestão de Pedidos

## Descrição

Sistema simples para gerenciar pedidos. Ele permite cadastrar produtos, cadastrar clientes, criar pedidos e gerar relatórios de vendas por cliente. Além disso, possui um sistema de login para garantir que apenas pessoas autorizadas acessem o sistema.

## Funcionalidades

- **Cadastro de Produtos**: Permite cadastrar produtos com nome, preço e estoque.
- **Cadastro de Clientes**: Permite cadastrar clientes com nome, endereço e contato.
- **Criação de Pedidos**: Possibilita a criação de pedidos, associando clientes e produtos.
- **Relatório de Vendas**: Gera relatórios com o total de vendas por cliente em formato PDF.
- **Login de Usuário**: Implementa controle de acesso para garantir que apenas usuários autenticados possam utilizar o sistema.

## Justificativa de Arquitetura

### Design Patterns: **Factory e Repository**

Os padrões **Factory** e **Repository** foram escolhidos para manter o código mais organizado e de fácil manutenção. Já trabalho com esses padrões em outros projetos, o que facilita e agiliza a implementação.

- **Factory**: Responsável por criar objetos de forma centralizada, tornando o código mais limpo e flexível para futuras modificações.
- **Repository**: Facilita a organização e o acesso ao banco de dados, permitindo maior manutenção e testes eficazes.

## Tecnologias Utilizadas

- **Delphi 10.3 Rio**
- **Firebird 3**
- **Aplicativo desenvolvido com VCL**
- **FastReport** (para geração de relatórios em PDF)

## Estrutura de projeto/Pasta

O projeto está organizado para facilitar manutenção, as pastas seguem um padrão modular, garantindo separação clara entre a lógica de negócios, persistência de dados e interface gráfica.

```
/bin/          - Contém os arquivos executáveis (.exe) e bibliotecas necessárias para rodar o sistema.
/database/     - Armazena o banco de dados, incluindo arquivos de configuração e tabelas.
/documents/    - Documentação do projeto, como manuais e especificações técnicas.
/src/          - Diretório principal contendo todo o código-fonte do sistema.
  /common/     - Módulos compartilhados entre diferentes partes do sistema.
    /conexao/  - Gerencia a conexão com o banco de dados.
    /sessao/   - Armazena dados do usuário logado, permitindo compartilhamento entre telas.
  /utils/      - Conjunto de funções auxiliares para reutilização no sistema.
    constants.pas   - Define mensagens padrão usadas nos formulários, facilitando manutenção.
    mascaras.pas    - Contém funções para formatação de CPF/CNPJ, garantindo padronização.
    validation.pas  - Implementa validações genéricas para campos de entrada ('edit' e 'maskedit'), utilizando 'TextHint' para exibir mensagens.
  /modules/    - Contém a lógica de cada funcionalidade do sistema.
   /<modulo>/
      entity_<modulo>.pas      - Define a estrutura da entidade principal do módulo.
      factory_<modulo>.pas     - Responsável pela criação de instâncias das entidades do módulo.
      interface_<modulo>.pas   - Define contratos para as operações do módulo, facilitando desacoplamento.
      repository_<modulo>.pas  - Implementa a lógica de acesso ao banco de dados.
  /forms/    - Interface gráfica da aplicação em VCL.
```

## Instalação

### 1. Instalação Firebird 3

Baixe e instale o Firebird 3 em seu sistema:
- Link oficial: [https://firebirdsql.org/en/firebird-3-0/](https://firebirdsql.org/en/firebird-3-0/)

Durante a instalação, mantenha as configurações padrão e certifique-se que o serviço do Firebird está em execução.

### 2. Configuração da conexão com o banco de dados

Será necessário configurar os parametros de acesso do banco de dados `conf.ini`, localizado na basta `/bin/`;

O arquivos de dados está localizado `database\dados\ERP.FDB`, só alterar o caminho no seu arquivo cong=f;

```
[CONEXAO]
SERVER=localhost
USER=SYSDBA
SENHA=masterkey
PORT=3050
DATABASE=C:\Users\Marcos Lopes\Desktop\Projetos\erp-pedidos\database\dados\ERP.FDB
```

### 3. Executar o sistema

1. Navegue até a pasta `/bin/`.
2. Execute o arquivo `erp_pedidos.exe`.

