# Sistema de Gestão - Supermaket (Delphi)

![Status do Projeto](https://img.shields.io/badge/status-em%20desenvolvimento-yellow)
![Plataforma](https://img.shields.io/badge/plataforma-Windows-blue)
![Licença](https://img.shields.io/badge/licen%C3%A7a-MIT-blue)

Supermaket é um sistema de gestão (ERP) de desktop para pequenos e médios mercados, projetado para centralizar e simplificar as operações do dia a dia.

## 🌟 Funcionalidades Principais

* **🛒 Frente de Caixa (PDV):** Módulo de vendas rápido e intuitivo.
* **📦 Gestão de Estoque:** Controle de entrada, saída, perdas e inventário.
* **👤 Cadastros Gerais:** Clientes, Usuários, Fornecedores e Transportadoras.
* **🛍️ Gestão de Produtos:** Cadastro completo de produtos, categorias e marcas.
* **📊 Relatórios:** Módulo para geração de relatórios financeiros, de vendas e de estoque.
* **💻 Dashboard Administrativo:** Painel com indicadores visuais para tomada de decisão.

## 🛠️ Tecnologias e Componentes

* **Linguagem:** Object Pascal
* **IDE:** Embarcadero Delphi (versão 11 Alexandria ou superior)
* **Framework:** VCL (Visual Component Library) para interface nativa do Windows.
* **Banco de Dados:** Firebird (versão 4.0 ou superior)
* **Acesso a Dados:** Componentes FireDAC

## ⚙️ Pré-requisitos

Antes de compilar o projeto, você precisa ter instalado em sua máquina:

* **[Embarcadero Delphi](https://www.embarcadero.com/products/delphi)** (versão 11 ou superior).
* **Servidor de Banco de Dados [Firebird](https://firebirdsql.org/)** (versão 4.0 ou superior) instalado e rodando.
* **[Git](https://git-scm.com/)** para clonar o repositório.

## 🚀 Instalação e Execução

Siga os passos abaixo para configurar e executar o projeto.

**1. Clone o repositório:**
```bash
git clone [https://github.com/seu-usuario/supermaket-delphi.git](https://github.com/seu-usuario/supermaket-delphi.git)
cd supermaket-delphi
```

**2. Configure o Banco de Dados:**
1.  Certifique-se de que o serviço do Firebird está ativo.
2.  Localize o script de criação do banco de dados no diretório `/database/create_database.sql`.
3.  Utilize uma ferramenta de administração do Firebird (como o IBExpert ou o `isql-fb` via linha de comando) para executar o script e criar o banco `SUPERMAKET.FDB`.
4.  Verifique o arquivo de configuração de conexão no projeto (geralmente um `TFDConnection` em um Data Module) e ajuste os parâmetros (usuário, senha, caminho do banco) se necessário.

**3. Abra e Compile o Projeto no Delphi:**
1.  Abra o Delphi IDE.
2.  Vá em `File > Open Project...` e localize o arquivo do projeto no diretório clonado (ex: `Supermaket.dproj`).
3.  O Delphi carregará o projeto e seus formulários. Se houver dependências de componentes de terceiros, instale-os usando o GetIt Package Manager.
4.  Pressione a tecla **`F9`** ou vá até o menu **`Run > Run`** para compilar e executar a aplicação.

## 🔑 Acesso Padrão ao Sistema

Ao executar o programa, a tela de login será exibida.


