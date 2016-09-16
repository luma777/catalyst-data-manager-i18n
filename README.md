# Install Deps
`make deps_perl`

# Create DDL Database
Executado para criar scripts SQL para o Banco de Dados.
`make db_create_ddl`

# Deploy Database
Executado após gerar DDLs (passo anterior)
`make db_deploy`

# Starman
Executa a APP com Starman server
`make starman`

# Configuration
As configurações se encontram em **My-Web-App/conf/**
Copiar **My-Web-App/conf/my_web_app_local_example.conf** para **My-Web-App/conf/my_web_app_local.conf**
e alterar a configuração local como desejar