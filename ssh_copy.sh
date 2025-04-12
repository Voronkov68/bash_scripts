#!/bin/bash

# Файл со списком IP-адресов
IP_FILE="servers.txt"

# Пользователь и пароль для входа
USER="your_user"
PASSWORD="your_password"

# Путь к публичному ключу
PUB_KEY="$HOME/.ssh/id_rsa.pub"

# Проверка, существует ли ключ
if [ ! -f "$PUB_KEY" ]; then
  echo "❌ Публичный ключ не найден: $PUB_KEY"
  exit 1
fi

# Цикл по IP-адресам
while IFS= read -r ip; do
  echo "🔗 Подключение к $ip"

  sshpass -p "$PASSWORD" ssh -o StrictHostKeyChecking=no "$USER@$ip" "mkdir -p ~/.ssh && chmod 700 ~/.ssh"
  sshpass -p "$PASSWORD" ssh-copy-id -o StrictHostKeyChecking=no -i "$PUB_KEY" "$USER@$ip"

  if [ $? -eq 0 ]; then
    echo "✅ Ключ успешно добавлен на $ip"
  else
    echo "❌ Ошибка при добавлении ключа на $ip"
  fi
done < "$IP_FILE"
