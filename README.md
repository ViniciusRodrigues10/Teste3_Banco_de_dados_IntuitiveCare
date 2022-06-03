<p align="center">
  <img src="https://user-images.githubusercontent.com/76957963/171772753-2ec5e2b4-16a6-46ba-9d15-e2988bd5efc2.png">
</p>

<h1 align="center"> Teste 1 WebScraping IntuitiveCare - Backend </h1>

## Descrição do projeto 

Teste 3

Banco de dados

Neste teste o candidato deverá criar scripts .sql (MySQL 8. ou Postgres >10.0) que execute as tarefas de código abaixo.*

Tarefas de Preparação (podem ser feitas manualmente):

Baixar os arquivos dos últimos 2 anos no repositório público: http://ftp.dadosabertos.ans.gov.br/FTP/PDA/demonstracoes_contabeis/

Baixar csv anexo:

Relatorio_cadop(1) (esta em anexo no e-mail)

As tarefas abaixo devem ser executadas em código na linguagem SQL em um banco PostgreSQL ou MySQL

Criar queries para criar tabelas com as colunas necessárias para o arquivo csv.

Queries de load: criar as queries para carregar o conteúdo dos arquivos obtidos nas tarefas de preparação
Atenção ao encoding dos arquivos no momento da importação!

Montar uma query analítica que traga a resposta para as seguintes perguntas:

Quais as 10 operadoras que mais tiveram despesas com "EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS  DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR" no último trimestre?

Quais as 10 operadoras que mais tiveram despesas com "EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS  DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR" no último ano?

## :computer: Tecnologias e Ferramentas 

- `Python 3`

- `Jupyter notebook`

- `MySQL workbench 8.0

- `Git & Github`

## :hammer: Funcionalidades do projeto

- `Funcionalidade 1`: Download de arquivos do site gov.br

- `Funcionalidade 2`: Criar query gerando banco de dados e tabelas 

- `Funcionalidade 3`: Realizar pesquisa no banco de dados 

## 📚: Bibliotecas utilizadas

- `pandas`

### Toda a preparação dos dados foi realizado no Jupyter notebook

### Criando banco de dados e selecionando o banco que desejamos utilizar  

    CREATE DATABASE teste3_IntutiveCare;
    
    USE teste3_IntutiveCare;
    
### Criando query para gerar tabela com as colunas necessárias para o arquivo csv

    CREATE TABLE IF NOT EXISTS tbl_dados(
      id INT NULL,
        data_inicio DATE NULL, 
        reg_ans VARCHAR(500),
        cd_conta_contabil VARCHAR(500),
        descricao VARCHAR(500),
        vl_saldo_inicial VARCHAR(500),
        vl_saldo_final VARCHAR(500)
    );
    
### Populando banco de dados com arquivo csv

    LOAD DATA
    INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Teste3\\combined.csv'
    INTO TABLE tbl_dados
    CHARACTER SET latin1
    FIELDS TERMINATED BY ';'
    IGNORE 1 ROWS;
    
### Realizando pesquisa no Banco de dados 

10 operadoras que mais tiveram despesas com "Planos Individuais/Familiares antes da Lei" no último trimestre
   
    SELECT SUM(vl_saldo_final) as total,  
    reg_ans FROM tbl_dados 
    WHERE data_inicio = '2021-10-01' 
    and descricao = 'Planos Individuais/Familiares antes da Lei' 
    GROUP BY reg_ans 
    ORDER BY total 
    LIMIT 10; 
  
 10 operadoras que mais tiveram despesas com "Planos Individuais/Familiares antes da Lei" no último ano

    SELECT SUM(vl_saldo_final) as total,  
    reg_ans FROM tbl_dados 
    WHERE YEAR(data_inicio) = '2021' 
    and descricao = 'Planos Individuais/Familiares antes da Lei' 
    GROUP BY reg_ans 
    ORDER BY total
    LIMIT 10; 

### Principais dificuldades 

A maior dificuldade que encontrei está na codificação do cvs, não consegui encontrar a codificação adequada para ler o arquivo, devido a isso não foi possível realizar a pesquisa por "EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR" 

## Autor

[<img src="https://user-images.githubusercontent.com/76957963/171774831-f51b4f04-1beb-498a-b7ab-a47a7af1d382.jpeg" width=115><br><sub>Vinícius Rodrigues</sub>](https://github.com/ViniciusRodrigues10)
