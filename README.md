# 📦 Sistema TCC – UNEMAT (Flask + MySQL)

Aplicação web desenvolvida para fins acadêmicos 🎓 na disciplina de Programação Orientada a Objetos (POO) do curso de Ciência da Computação – UNEMAT.  
O sistema gerencia Trabalhos de Conclusão de Curso (TCC), permitindo cadastro de usuários, upload de TCC em PDF e disponibilização pública para download.

## 🔧 Pré-requisitos

Antes de executar o sistema, instale na máquina:

- 🧩 **Git** - [https://git-scm.com/downloads](https://git-scm.com/downloads)
- 🐍 **Python 3.x** (3.10+ recomendado) - [https://www.python.org/downloads/](https://www.python.org/downloads/)
- 🗄️ **MySQL Server** - [https://dev.mysql.com/downloads/](https://dev.mysql.com/downloads/)
- 🌐 **Navegador web moderno**

> Durante a instalação do Python, marque a opção "Add Python to PATH".

## 🗄️ Configuração do banco de dados

1. Acesse o MySQL (Workbench, DBeaver ou terminal).
2. Execute o script `SCRIPT-DB.sql` fornecido no projeto para criar o banco `tcc_db` e todas as tabelas necessárias (usuarios, cursos, tccs, orientador, download, etc.).
3. **Opcional:** ajuste usuário/senha do MySQL no arquivo `app.py`:

```python
SQLALCHEMY_DATABASE_URI = "mysql+pymysql://USUARIO:SENHA@localhost/tcc_db"
```

Substitua `USUARIO` e `SENHA` pelos dados do seu MySQL.

## 📥 Clonando o projeto

No terminal ou prompt de comando:

```bash
git clone https://github.com/Rays3107/Sistema-TCC---UNEMAT
cd POO
```

## 🧩 Criando o ambiente virtual

```bash
python -m venv .venv
```

### Windows
```bash
.venv\Scripts\activate
```

### Linux/macOS
```bash
source .venv/bin/activate
```

## 📦 Instalando as dependências

As dependências estão listadas em `requirements.txt` (Flask, Flask-WTF, Flask-Login, Flask-SQLAlchemy, email-validator, PyMySQL, etc.).

```bash
pip install -r requirements.txt
```

## ▶️ Executando o sistema

Com o ambiente virtual ativado e o banco já criado:

```bash
python app.py
```

O servidor iniciará em modo desenvolvimento na porta padrão 5000.

## 🌐 Acessando o sistema

Abra o navegador e acesse:

```
http://127.0.0.1:5000
```

### Funcionalidades principais:

- ✅ Cadastro de usuário (com curso vinculado e senha criptografada)
- 🔐 Login/Logout com controle de sessão
- 📤 Upload de TCC em PDF vinculado ao usuário logado
- 📋 Listagem de TCCs públicos com autor, curso e botão para download
- 📊 Dashboard do usuário com seus TCCs enviados

## 📁 Estrutura básica do projeto

```
Projeto-novo-POO/
├─ app.py               # Aplicação Flask, modelos SQLAlchemy, rotas e formulários
├─ SCRIPT-DB.sql        # Script completo do banco de dados MySQL
├─ requirements.txt     # Dependências do projeto (Flask, SQLAlchemy, PyMySQL, etc.)
├─ README.md            # Este arquivo
├─ templates/           # Páginas HTML
│  ├─ base.html
│  ├─ index.html
│  ├─ login.html
│  ├─ register.html
│  ├─ dashboard.html
│  ├─ tccs_publicos.html
│  └─ upload.html
├─ uploads/             # Pasta onde os PDFs enviados são armazenados
└─ static/              # Arquivos estáticos (CSS, JS, imagens) – se aplicável
```

## ℹ️ Observações

- Projeto desenvolvido exclusivamente para fins educacionais 📚
- Estrutura pensada para demonstrar uso de Flask, SQLAlchemy (ORM), validação de formulários (Flask-WTF) e autenticação (Flask-Login) 💻
- Pode ser utilizado como base de estudo para integração Flask + MySQL e organização de projetos web em Python ✨
- Utilizado como atividade acadêmica na UNEMAT 🏫

## 🛠️ Tecnologias utilizadas

- **Flask** - Framework web Python
- **Flask-SQLAlchemy** - ORM para banco de dados
- **Flask-Login** - Sistema de autenticação
- **Flask-WTF** - Validação de formulários
- **PyMySQL** - Driver MySQL para Python
- **MySQL** - Banco de dados relacional
- **Bootstrap** - Framework CSS (templates)

## 👩‍💻 Autora

**Rayse Kawane Sousa de Oliveira**  
Acadêmica de Ciência da Computação – UNEMAT

---

Desenvolvido com 💙 para a disciplina de Programação Orientada a Objetos
