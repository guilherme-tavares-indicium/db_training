1 - Criar um profile do AWS cli no seu pc. Nomeie o profile. Por exemplo, o comando abaixo cria o profile chamado "training":
`aws configure --profile training`
passe as suas credenciais no prompt do terminal e o seu profile será criado

2 - Ajuste o arquivo project_config.json com o seu profile. O terraform está configurado para apontar para este profile.

3 - Entre no diretório "network" e rode os comandos do terraform (init/plan/apply)

4 - Entre no diretório "database" e rode os comandos do terraform (init/plan/apply)

4 - crie uma env do python e instale os pacotes do arquivo requirements.txt

5 - rode o script load_fake_data.py
