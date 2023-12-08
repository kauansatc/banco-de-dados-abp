# Gerenciamento Cafeteria

# Modelo Físico
Utilizamos a ferramenta de modelagem de dados [draw.io](https://app.diagrams.net) para criação do modelo físico do banco de dados, para posterior exportação dos scripts DDL das tabelas e relacionamentos.
Arquivo fonte: [Modelo Fisico](https://private-user-images.githubusercontent.com/73001629/287491506-09b392f3-a977-41a3-819e-86bc07eeca35.png?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTEiLCJleHAiOjE3MDIwMDUyOTksIm5iZiI6MTcwMjAwNDk5OSwicGF0aCI6Ii83MzAwMTYyOS8yODc0OTE1MDYtMDliMzkyZjMtYTk3Ny00MWEzLTgxOWUtODZiYzA3ZWVjYTM1LnBuZz9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFJV05KWUFYNENTVkVINTNBJTJGMjAyMzEyMDglMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjMxMjA4VDAzMDk1OVomWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPTBjYTI0NzdiNGE3Y2FkMzY0MmIxNjZjNjZjNDUxOTZlNGFjOGU0YzM4ZTRiMjc3MmJjOTMxZTk5YWU5ZTVmNzEmWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0JmFjdG9yX2lkPTAma2V5X2lkPTAmcmVwb19pZD0wIn0.-bJ2tWD7vRVTHy_COwpebDgyCpvkd8Ero-awANxK0iY).
![image](https://github.com/kauanfontanela/gerenciamento-cafeteria-abp2023/assets/141785530/11817d86-d1b4-4cd8-83d6-a5e757b403b1)

# Dicionário de Dados
As informações sobre as tabelas e índices foram documentados na [planilha online](https://1drv.ms/x/s!Atb5Pj9kgzdLpwigyey_WS-U1ilN?e=oGKL1p)

# Scripts SQL
Para este projeto foi utilizado o banco de dados Azure SQL
Este é o procedimento para criação do banco de dados Azure SQL Criando SQL Azure serverless no Azure gratuito - Sem cartão de crédito.

Abaixo, segue os scripts SQL separados por tipo:

DDL [ddl.sql](https://github.com/kauanfontanela/gerenciamento-cafeteria-abp2023/blob/main/DDL.sql)

Índices indices.sql

DML [População](https://github.com/kauanfontanela/gerenciamento-cafeteria-abp2023/issues/7)

Triggers [Trigger.sql](https://github.com/kauanfontanela/gerenciamento-cafeteria-abp2023/blob/main/Trigger.sql)

Stored Procedures [Procedures.sql](https://github.com/kauanfontanela/gerenciamento-cafeteria-abp2023/blob/main/Procedures.sql)

Functions [Funcoes.sql](https://github.com/kauanfontanela/gerenciamento-cafeteria-abp2023/blob/main/Funcoes.sql)

Perguntas [Questions.sql](https://github.com/kauanfontanela/gerenciamento-cafeteria-abp2023/blob/main/Questions.sql)

# Rodar CRUD

- Requisitos: 
-   Python: `pyodbc`, `flask`

```bash
python CRUD/
```