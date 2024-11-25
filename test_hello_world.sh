#!/bin/bash

URL="http://192.168.56.101:8080/hello"  # Путь к вашему endpoint
EXPECTED_STATUS=200                # Ожидаемый HTTP статус
EXPECTED_BODY="Hello World"        # Ожидаемое содержимое

# Отправляем запрос и сохраняем результат
response=$(curl -s -w "%{http_code}" -o response.txt $URL)

# Получаем HTTP статус и тело ответа
statusCode=${response: -3}        # Последние 3 символа — это HTTP статус
body=$(cat response.txt)          # Читаем тело ответа из файла

# Выводим результат для отладки
echo "Received status code: $statusCode"
echo "Received response body: $body"

# Проверяем, что полученный статус и тело совпадают с ожидаемыми
if [[ "$statusCode" -eq "$EXPECTED_STATUS" && "$body" == "$EXPECTED_BODY" ]]; then
  echo "Test passed: Received 200 OK and 'Hello World' response"
  exit 0  # Возвращаем успешный код
else
  echo "Test failed: Expected 200 OK and 'Hello World', but got status $statusCode with body '$body'"
  exit 1  # Возвращаем ошибку
fi

