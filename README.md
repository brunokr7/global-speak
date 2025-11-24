# 📚 Sistema de Gestão para a Escola de Idiomas "Global Speak"

## 📌 Visão Geral do Projeto

Este projeto consiste em um sistema de banco de dados relacional desenvolvido como parte da disciplina de Modelagem de Banco de Dados. O objetivo é simular a gestão completa de uma escola de idiomas, cobrindo o ciclo de vida do aluno, a alocação em turmas e o controle de frequência.

O projeto foi desenvolvido em três fases principais:
1.  Definição do Minimundo (Escola de Idiomas).
2.  Criação e Normalização do Diagrama Entidade-Relacionamento (DER).
3.  Implementação e Manipulação de Dados (DDL e DML) em SQL.

---

## 🛠️ Tecnologias Utilizadas

* **SGBD:** MySQL / PostgreSQL 
* **Ferramenta de Modelagem:** (Lucidchart)
* **Versionamento:** Git / GitHub
* **Linguagem:** SQL (DDL e DML)

---

## 🏗️ Estrutura do Banco de Dados (Modelo Lógico)

O modelo é composto por 7 tabelas normalizadas (3FN), com ênfase na resolução dos relacionamentos Muitos para Muitos (N:N) através de tabelas associativas.

### Entidades Principais:

* **ALUNO**
* **PROFESSOR**
* **CURSO**
* **TURMA** (Associa Professor e Curso)

### Entidades Associativas:

* **MATRICULA:** Resolve N:N entre `ALUNO` e `TURMA`.
* **AULA:** Mapeia as ocorrências das aulas da `TURMA`.
* **FREQUENCIA:** Resolve N:N entre `ALUNO` e `AULA` (registro de presença/falta).

**Diagrama Entidade-Relacionamento (DER) Final:**

<img width="1024" height="1536" alt="ChatGPT Image 24 de nov  de 2025, 02_16_48" src="https://github.com/user-attachments/assets/f37fd671-6410-4e50-95ea-0327dde36e27" />


## 🚀 Instruções de Execução dos Scripts SQL

Para replicar o banco de dados e os testes, siga os passos abaixo:

### Pré-requisitos
* Ter um SGBD (como MySQL ou PostgreSQL) instalado e em execução.
* Ter acesso a um cliente de banco de dados (MySQL Workbench, PGAdmin, ou linha de comando).

### Passos
1.  **Criação do Banco de Dados:** Crie um novo schema/database (Ex: `CREATE DATABASE globalspeak;`).
2.  **Execução do DDL:** Execute o script `DDL_SETUP.sql`. Este script criará todas as 7 tabelas, definindo Chaves Primárias (`PRIMARY KEY`), Chaves Estrangeiras (`FOREIGN KEY`) e restrições de integridade.
3.  **Povoamento dos Dados:** Execute o script `DML_INSERT_DATA.sql`. Este script irá inserir dados iniciais nas tabelas para simular alunos, turmas e professores.
4.  **Testes de Manipulação:** Execute os scripts de consulta e modificação na ordem que desejar:
    * `DML_SELECT_QUERIES.sql`: Para visualizar consultas complexas.
    * `DML_UPDATE_DELETE.sql`: Para testar modificações e a integridade referencial.

---

## 📂 Conteúdo dos Scripts (Artefatos de Avaliação)

### 1. DDL_SETUP.sql
Contém os comandos `CREATE TABLE` para todas as 7 entidades, com aplicação de `ON DELETE CASCADE` e `ON UPDATE CASCADE/NO ACTION` nas chaves estrangeiras.

### 2. DML_INSERT_DATA.sql
Povoa o banco com dados iniciais:
* 3 Cursos, 2 Professores.
* 3 Turmas, 3 Alunos.
* Matrículas, Aulas e Registros de Frequência coerentes.

### 3. DML_SELECT_QUERIES.sql (Consultas Essenciais)
Exemplos de consultas:
* Listagem de Alunos, Curso e Professor (uso de 4 `JOINs`).
* Cálculo de Faltas por Aluno (`GROUP BY`, `HAVING`).
* Filtro de Turmas Noturnas (`WHERE`, `ORDER BY`, `LIMIT`).

### 4. DML_UPDATE_DELETE.sql (Modificação e Integridade)
Comandos com condições:
* `UPDATE`: Trancamento de Matrícula, Alteração de Horário de Turma.
* `DELETE`: Exclusão de registro de frequência, exclusão de aluno (`ON DELETE CASCADE` em ação).
