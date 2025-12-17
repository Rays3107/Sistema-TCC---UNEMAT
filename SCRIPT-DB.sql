-- BANCO DE DADOS TCC - UNEMAT
-- Script completo para MySQL
-- 100% compatível com app.py Flask

CREATE DATABASE IF NOT EXISTS tcc_db;
USE tcc_db;

-- TABELA: DEPARTAMENTOS
CREATE TABLE departamentos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

-- TABELA: CURSOS
CREATE TABLE cursos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    id_departamento INT,
    FOREIGN KEY (id_departamento) REFERENCES departamentos(id)
);

-- TABELA: USUARIOS
CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    cpf VARCHAR(20) UNIQUE,
    nascimento VARCHAR(20),
    senha_hash VARCHAR(200),
    id_curso INT,
    FOREIGN KEY (id_curso) REFERENCES cursos(id)
);

-- TABELA: ORIENTADOR (nova - compatível com app.py)
CREATE TABLE orientador (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL
);

-- TABELA: TCCS (atualizada com foreign key para orientador)
CREATE TABLE tccs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(200),
    filename VARCHAR(250),
    id_autor INT,
    id_orientador INT,
    id_co_orientador INT,
    id_curso INT,
    FOREIGN KEY (id_autor) REFERENCES usuarios(id),
    FOREIGN KEY (id_orientador) REFERENCES orientador(id),  -- ← Agora aponta para tabela orientador
    FOREIGN KEY (id_co_orientador) REFERENCES orientador(id),
    FOREIGN KEY (id_curso) REFERENCES cursos(id)
);

-- TABELA: DOWNLOAD (compatível com app.py)
CREATE TABLE download (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    tcc_id INT NOT NULL,
    data_download DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES usuarios(id),
    FOREIGN KEY (tcc_id) REFERENCES tccs(id)
);

-- TABELA: PALAVRAS CHAVES
CREATE TABLE palavras_chaves (
    id INT AUTO_INCREMENT PRIMARY KEY,
    palavra VARCHAR(50)
);

-- TABELA: TCC_PALAVRAS_CHAVES (N:N)
CREATE TABLE tcc_palavras_chaves (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_tcc INT,
    id_palavra INT,
    FOREIGN KEY (id_tcc) REFERENCES tccs(id),
    FOREIGN KEY (id_palavra) REFERENCES palavras_chaves(id)
);

-- TABELA: VERSOES TCC
CREATE TABLE versoes_tcc (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_tcc INT,
    data_upload DATE,
    uploaded_by INT,
    FOREIGN KEY (id_tcc) REFERENCES tccs(id),
    FOREIGN KEY (uploaded_by) REFERENCES usuarios(id)
);

-- TABELA: COMENTARIOS TCC
CREATE TABLE comentarios_tcc (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_tcc INT,
    id_versao INT,
    id_autor INT,
    comentario TEXT,
    FOREIGN KEY (id_tcc) REFERENCES tccs(id),
    FOREIGN KEY (id_versao) REFERENCES versoes_tcc(id),
    FOREIGN KEY (id_autor) REFERENCES usuarios(id)
);

-- TABELA: BANCAS EXAMINADORAS
CREATE TABLE bancas_examinadoras (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_tcc INT,
    id_professor INT,
    nota DECIMAL(4,2),
    FOREIGN KEY (id_tcc) REFERENCES tccs(id),
    FOREIGN KEY (id_professor) REFERENCES usuarios(id)
);


-- ========================================
-- DADOS DE EXEMPLO
-- ========================================

-- Departamentos
INSERT INTO departamentos (nome) VALUES 
('Departamento de Computação'),
('Departamento de Engenharias');

-- Cursos
INSERT INTO cursos (nome, id_departamento) VALUES 
('Ciência da Computação', 1),
('Engenharia de Software', 1),
('Sistemas de Informação', 1),
('Análise e Desenvolvimento de Sistemas', 1);

-- Orientadores de exemplo
INSERT INTO orientador (nome, email) VALUES 
('Prof. Dr. João Silva', 'joao.silva@unemat.br'),
('Profa. Dra. Maria Santos', 'maria.santos@unemat.br'),
('Prof. Me. Carlos Oliveira', 'carlos.oliveira@unemat.br');