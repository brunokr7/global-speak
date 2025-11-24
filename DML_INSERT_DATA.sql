-- DML_INSERT_DATA.sql

-- 1. Inserir Cursos
INSERT INTO CURSO (id_curso, nome_curso, carga_horaria_total) VALUES
(1, 'Inglês', 240),
(2, 'Espanhol', 240),
(3, 'Francês', 180);

-- 2. Inserir Professores
INSERT INTO PROFESSOR (id_professor, nome, cpf, email, data_contratacao) VALUES
(10, 'Ana Souza', '111.111.111-11', 'ana.souza@globalspeak.com', '2023-01-15'),
(20, 'Carlos Lima', '222.222.222-22', 'carlos.lima@globalspeak.com', '2023-08-20');

-- 3. Inserir Turmas (FKs: id_professor, id_curso)
INSERT INTO TURMA (id_turma, id_professor, id_curso, nivel, dia_semana, horario_inicio, horario_fim, ano_semestre) VALUES
(101, 10, 1, 'Básico I', 'Segunda/Quarta', '19:00:00', '21:00:00', '2024.1'), -- Inglês/Ana
(201, 20, 2, 'Intermediário II', 'Terça/Quinta', '18:00:00', '20:00:00', '2024.1'), -- Espanhol/Carlos
(301, 10, 3, 'Avançado I', 'Sexta', '14:00:00', '16:00:00', '2024.1'); -- Francês/Ana

-- 4. Inserir Alunos
INSERT INTO ALUNO (id_aluno, nome, cpf, telefone, email, data_nascimento) VALUES
(1001, 'João Silva', '333.333.333-33', '99988-7777', 'joao.silva@email.com', '1995-05-10'),
(1002, 'Maria Oliveira', '444.444.444-44', 'maria.o@email.com', '2000-02-28'),
(1003, 'Pedro Santos', '555.555.555-55', 'pedro.s@email.com', '1998-11-05');

-- 5. Inserir Matrículas (Chave Composta: id_aluno, id_turma)
INSERT INTO MATRICULA (id_aluno, id_turma, data_matricula, status_matricula) VALUES
(1001, 101, '2024-02-01', 'Ativa'), -- João em Inglês
(1002, 201, '2024-02-05', 'Ativa'), -- Maria em Espanhol
(1003, 101, '2024-02-10', 'Ativa'); -- Pedro em Inglês

-- 6. Inserir Aulas (FK: id_turma)
INSERT INTO AULA (id_aula, id_turma, data_aula, conteudo_lecionado) VALUES
(1, 101, '2024-03-04', 'Inglês: Unit 1'),
(2, 101, '2024-03-06', 'Inglês: Unit 2'),
(3, 201, '2024-03-05', 'Espanhol: Introducción');

-- 7. Inserir Frequência (Chave Composta: id_aula, id_aluno)
INSERT INTO FREQUENCIA (id_aula, id_aluno, status_presenca) VALUES
(1, 1001, 'P'), (1, 1003, 'P'), -- Aula 1 (Inglês): João e Pedro Presentes
(2, 1001, 'F'), (2, 1003, 'P'), -- Aula 2 (Inglês): João Falta, Pedro Presente
(3, 1002, 'P'); -- Aula 3 (Espanhol): Maria Presente
