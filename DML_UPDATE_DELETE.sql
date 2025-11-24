-- DML_UPDATE_DELETE.sql

-- -----------------
-- 3 Comandos de UPDATE
-- -----------------

-- UPDATE 1: Atualizar o Status da Matrícula
-- Objetivo: Trancar a matrícula de Maria na turma de Espanhol.
UPDATE MATRICULA
SET status_matricula = 'Trancada', data_matricula = CURRENT_DATE()
WHERE id_aluno = 1002 AND id_turma = 201;

-- UPDATE 2: Alterar o Horário de uma Turma
-- Objetivo: Mudar a turma de Inglês Básico I para começar 30 minutos mais tarde.
UPDATE TURMA
SET horario_inicio = '19:30:00', horario_fim = '21:30:00'
WHERE id_turma = 101;

-- UPDATE 3: Corrigir o E-mail de um Professor
-- Objetivo: Corrigir um dado simples de um atributo não-chave.
UPDATE PROFESSOR
SET email = 'carlos.lima.novo@globalspeak.com'
WHERE id_professor = 20;

-- -----------------
-- 3 Comandos de DELETE
-- -----------------

-- DELETE 1: Excluir um Registro de Frequência Errado
-- Objetivo: Remover o registro de falta de João na Aula 2 (o professor registrou errado).
DELETE FROM FREQUENCIA
WHERE id_aluno = 1001 AND id_aula = 2 AND status_presenca = 'F';

-- DELETE 2: Excluir uma Aula Antiga/Cancelada
-- Objetivo: Excluir a Aula 1 da Turma 101 (id_aula=1).
-- Nota: Isso só será possível se a tabela FREQUENCIA tiver o DELETE CASCADE para a FK id_aula, o que foi definido.
DELETE FROM AULA
WHERE id_aula = 1;

-- DELETE 3: Excluir um Aluno (com restrição ON DELETE CASCADE)
-- Objetivo: Excluir Pedro (id_aluno=1003). Suas matrículas e frequências serão excluídas automaticamente.
DELETE FROM ALUNO
WHERE id_aluno = 1003;
