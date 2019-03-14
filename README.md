# Зачетная работа по дисциплине "Языки интернет программирования"
## Описание
Сайт представляет собой форум, тематикой которого является спорт
## Особенности
* Для доступа к сайту пользователь должен пройти регистрацию
* Сайт переведен на русский и английские языки
* Пользователи могут создавать и комментировать посты
* У пользователей есть возможность оценивать посты, поднимая или поуская рейтинг публикации на 1
* Пользователь может сохранить понравившийся пост и посмотреть все свои сохрвнения
## Как реализованно
* Сайт написан с использование Ruby on Rails 5.2
* Аутентификация реализована с помощью гема devise
* Посты к клиенту приходят в виде xml и рендерятся с помощью xslt. Планировалось, что посты будут динамически подгружаться при прокрутке страницы, но до концаа реализовать фичу не хватило времени.
* Изменение отображения рейтинга поста у клинета происходит с помощью ajax. После оценки поста с сервера приходит новое значение рейтинга, которые заменяет предыдущее.
