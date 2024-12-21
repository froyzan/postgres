# Развертывание PostgreSQL и pgAdmin в Kubernetes

Этот проект содержит манифесты Kubernetes для развертывания PostgreSQL и веб-интерфейса pgAdmin с использованием типа сервиса `LoadBalancer`.

## Содержание

- [Описание](#описание)
- [Установка](#установка)
- [Доступ к pgAdmin](#доступ-к-pgadmin)

## Описание

- postgres14.yml  **PostgreSQL**: реляционная база данных.
- pgadmin.yml     **pgAdmin**: веб-интерфейс для управления PostgreSQL.

### Архитектура

<p align="center">
  <img src="image.jpg" alt="Architecture Diagram" />
</p>

## Установка

1. Примените манифест с помощью следующей команды:
```bash
  kubectl apply -f postgres14.yml
  kubectl apply -f pgadmin.yml
```

2. Доступ к pgAdmin
```bash
  kubectl get services
```

Найдите IP-адрес, связанный с сервисом `pgadmin-service`, и откройте его в браузере.

`pgadmin` : <http://localhost:5050/>
- **Email**: `admin@admin.com`
- **Пароль**: `admin`

<p align="center">
  <img src="pgadmin.jpg" alt="pgAdmin4" />
</p>

3. Подключение к PostgreSQL
Для подключения к базе данных PostgreSQL в pgAdmin используйте следующие параметры:

- **Host**: `postgres-service` Cluster-IP в K8s
- **Port**: `5432`
- **Username**: `postgres`
- **Password**: `password`


4. Создание тестовой базы данных
```bash
  kubectl exec -it <имя_пода> -- bash
  psql -U postgres -d postgres
```
Вставьте и выполните SQL-скрипт из `create_test.sql`.
