-- DDL_SETUP.sql
-- Script para criar as tabelas do Sistema de Gestão da Escola de Idiomas "Global Speak".
-- Define Chaves Primárias (PRIMARY KEY), Chaves Estrangeiras (FOREIGN KEY) e Restrições de Integridade.

-- -----------------------------------------------------------
-- 1. Entidades Principais
-- -----------------------------------------------------------

-- 1.1. Tabela ALUNO
-- PK: id_aluno | Restrições: CPF e Email são ÚNICOS e Nome é OBRIGATÓRIO.
CREATE TABLE ALUNO (
    id_aluno INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) UNIQUE NOT NULL,
    telefone VARCHAR(15),
    email VARCHAR(100) UNIQUE,
    data_nascimento DATE
);

-- 1.2. Tabela PROFESSOR
-- PK: id_professor | Restrições: CPF e Email são ÚNICOS, Nome e Data de Contratação são OBRIGATÓRIOS.
CREATE TABLE PROFESSOR (
    id_professor INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE,
    data_contratacao DATE NOT NULL
);

-- 1.3. Tabela CURSO
-- PK: id_curso | Restrições: nome_curso é ÚNICO e OBRIGATÓRIO.
CREATE TABLE CURSO (
    id_curso INT PRIMARY KEY AUTO_INCREMENT,
    nome_curso VARCHAR(50) UNIQUE NOT NULL, -- Ex: Inglês, Espanhol
    carga_horaria_total INT
);

-- -----------------------------------------------------------
-- 2. Entidades de Relacionamento Forte (1:N)
-- -----------------------------------------------------------

-- 2.1. Tabela TURMA
-- PK: id_turma | FKs: id_professor (1:N com Professor), id_curso (1:N com Curso).
CREATE TABLE TURMA (
    id_turma INT PRIMARY KEY AUTO_INCREMENT,
    id_professor INT NOT NULL,
    id_curso INT NOT NULL,
    nivel VARCHAR(50) NOT NULL,
    dia_semana VARCHAR(20) NOT NULL,
    horario_inicio TIME,
    horario_fim TIME,
    ano_semestre VARCHAR(10),

    -- Regra: Não permitir exclusão de Professor ou Curso se houver Turmas ativas.
    FOREIGN KEY (id_professor) REFERENCES PROFESSOR(id_professor)
        ON DELETE NO ACTION ON UPDATE CASCADE,
    FOREIGN KEY (id_curso) REFERENCES CURSO(id_curso)
        ON DELETE NO ACTION ON UPDATE CASCADE
);

-- 2.2. Tabela AULA
-- PK: id_aula | FK: id_turma (1:N com Turma).
CREATE TABLE AULA (
    id_aula INT PRIMARY KEY AUTO_INCREMENT,
    id_turma INT NOT NULL,
    data_aula DATE NOT NULL,
    conteudo_lecionado TEXT,

    -- Regra: Não permitir exclusão da Turma se houver registros de Aulas.
    FOREIGN KEY (id_turma) REFERENCES TURMA(id_turma)
        ON DELETE RESTRICT ON UPDATE CASCADE
);

-- -----------------------------------------------------------
-- 3. Entidades Associativas (N:N)
-- -----------------------------------------------------------

-- 3.1. Tabela MATRICULA (Associa Aluno e Turma)
-- PK Composta: (id_aluno, id_turma) | Restrição: status_matricula
CREATE TABLE MATRICULA (
    id_aluno INT,
    id_turma INT,
    data_matricula DATE NOT NULL,
    status_matricula VARCHAR(20) NOT NULL,

    PRIMARY KEY (id_aluno, id_turma), 
    
    -- Regra: Se o Aluno for excluído, sua Matrícula é excluída automaticamente.
    FOREIGN KEY (id_aluno) REFERENCES ALUNO(id_aluno)
        ON DELETE CASCADE ON UPDATE CASCADE,
        
    -- Regra: Não permitir exclusão da Turma se houver Matrículas ativas.
    FOREIGN KEY (id_turma) REFERENCES TURMA(id_turma)
        ON DELETE RESTRICT ON UPDATE CASCADE,
        
    -- Regra de Domínio: Garante que o status seja um dos valores definidos.
    CHECK (status_matricula IN ('Ativa', 'Inativa', 'Trancada'))
);

-- 3.2. Tabela FREQUENCIA (Associa Aula e Aluno)
-- PK Composta: (id_aula, id_aluno) | Restrição: status_presenca
CREATE TABLE FREQUENCIA (
    id_aula INT,
    id_aluno INT,
    status_presenca CHAR(1) NOT NULL, -- P=Presente, F=Falta
    observacao VARCHAR(255),

    PRIMARY KEY (id_aula, id_aluno), 
    
    -- Regra: Se a Aula for excluída, seus registros de Frequência são excluídos.
    FOREIGN KEY (id_aula) REFERENCES AULA(id_aula)
        ON DELETE CASCADE ON UPDATE CASCADE,
        
    -- Regra: Se o Aluno for excluído, seus registros de Frequência são excluídos.
    FOREIGN KEY (id_aluno) REFERENCES ALUNO(id_aluno)
        ON DELETE CASCADE ON UPDATE CASCADE,
        
    -- Regra de Domínio: Garante que o status seja 'P' ou 'F'.
    CHECK (status_presenca IN ('P', 'F'))
);
