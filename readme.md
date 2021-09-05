## Набор сервисов для разработки

Включает в себя, следующие сервисы:

- Поисковой движок [elasticsearch](https://www.elastic.co/elasticsearch/)

- РСУБД [postgresql](https://www.postgresql.org/download/)

- [Current Stable PHP 8.0.10](https://www.php.net/downloads)

- Кэш сервер - [redis](https://redis.io/)

- Веб-сервер [nginx](https://nginx.org/ru/)

## Настройка и запуск

- Клонировать проект: ``git clone git@github.com:artemrogov/services.git``

- В каталоге с проектом скопировать файл с ``cp .env_example .env``

- Настроить файл с конфигурацией ``.env`` на свое усмотрение

- Выполнить ``chmod +x setting_vm.sh``

- Для сервиса elasticsearch выполнить команду: ``./setting_vm.sh`` или `` bash setting_vm.sh``

- Настроить файл hosts ``sudo nano /etc/hosts``

- В файле hosts вставить строку ``127.0.1.1   gstd2.test`` или изменить на свое имя 

- Запустить сервисы: ``docker-compose up -d``

- Остановить сервисы командой: ``docker-compose down``

## Для настройки конфигурации nginx: 

- /server_backend - настройки nginx для бэк-сервиса /api_backend

- /frontend_server - настройки nginx для фронтенд окружения /frontend

- /nginx - настройки прокси-сервера nginx

- После реадктирования настроеек nginx, следует выполнить команду: ``docker-compose restart <имя_контейнера_прокси_сервера``

 
