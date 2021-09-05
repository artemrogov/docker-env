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

- Запустить сервисы: ``docker-compose up -d``

- Остановить сервисы командой: ``docker-compose down``

- Выполнить ``chmod +x setting_vm.sh``

- Для сервиса elasticsearch выполнить команду: ``./setting_vm.sh`` или `` bash setting_vm.sh``



