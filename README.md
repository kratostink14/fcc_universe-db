# База данных Вселенной

База данных небесных тел, созданная в рамках сертификации [freeCodeCamp Relational Database](https://www.freecodecamp.org/learn/relational-database/).

## Технологии

- **PostgreSQL** — хранение данных
- **SQL** — создание таблиц и запросы
- **Bash** — работа с базой через терминал

## Структура базы данных

| Таблица    | Описание                        |
|------------|---------------------------------|
| `galaxies` | Галактики                       |
| `stars`    | Звёзды                          |
| `planets`  | Планеты                         |
| `moons`    | Луны                            |

Все таблицы связаны через первичные и внешние ключи.

## Установка

**1. Восстановить базу данных**

```bash
psql --username=postgres -c "CREATE DATABASE universe;"
psql --username=postgres universe < universe.sql
```

**2. Подключиться**

```bash
psql --username=freecodecamp --dbname=universe
```

## Чему я научился

- Проектирование реляционных баз данных
- Работа с первичными и внешними ключами
- Написание SQL-запросов в psql

