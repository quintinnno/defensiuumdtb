#!/bin/bash

# Remover qualquer container existente com o mesmo nome
docker stop defensiuum-mysql-5.7 || true
docker rm defensiuum-mysql-5.7 || true

# Verificar se as variáveis de ambiente necessárias estão definidas
missing_vars=()
required_vars=("MYSQL_DEFENSIUUM_HOST" "MYSQL_DEFENSIUUM_PORT" "MYSQL_DEFENSIUUM_DATABASE" "MYSQL_DEFENSIUUM_USER" "MYSQL_DEFENSIUUM_PASSWORD" "MYSQL_ROOT_PASSWORD")
for var in "${required_vars[@]}"; do
  if [ -z "${!var}" ]; then
    missing_vars+=("$var")
  fi
done

if [ ${#missing_vars[@]} -gt 0 ]; then
  echo "As seguintes variáveis de ambiente estão faltando: ${missing_vars[@]}"
  echo "Defina as variáveis necessárias."
  exit 1
fi

# Puxar a imagem do MySQL
docker pull mysql:5.7

# Rodar o container MySQL com as variáveis de ambiente
docker run --name defensiuum-mysql-5.7 -e MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD} -d -p ${MYSQL_defensiuum_PORT}:3306 mysql:5.7

# Aguardar o MySQL estar pronto para aceitar conexões
until docker logs defensiuum-mysql-5.7 2>&1 | grep -m 1 "ready for connections"; do
    sleep 2
done

# Reiniciar o container
docker restart defensiuum-mysql-5.7

echo "MySQL está rodando na porta ${MYSQL_defensiuum_PORT}, e o IP do container é: $(docker inspect --format '{{ .NetworkSettings.Networks.bridge.IPAddress }}' defensiuum-mysql-5.7)"
