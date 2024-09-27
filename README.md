1. Клонируйте репозиторий себе на пк (Обязательно клонировать, а не скачивать ZIP)
2. Создайте бд в pgadmin
3. Подключите бд в файле application.properties
4. Запустите проект для автоматического создания таблиц бд
5. Остановите работу проекта
6. В pgadmin заполните первые два уровня диалогов по дереву (одноименная таблица __dialog)
7. Так же заполните связи между диалогами в таблице __answer (curr_dialog_id - id текущего диалога(в котором планируется добавить ответ, next_dialog_id - id диалога в который планируется попасть с помощью этого ответа))
8. Запустите проект
9. Перейдите по адресу localhost:8080/start
10. Пройдите до конечного диалога
    На этом этапе на сайте должны быть видны кнопки добавления диалогов (не особо нужная штука), ответов, и помощи к диалогам
    Для того, чтобы добавить новые диалоги можно воспользоваться кнопкой "Добавить ответ". Внутри добавления необходимо выбрать Новый диалог, и заполнить поля.

P.S. Если у вас не запускается проект после клонирования:
1. Проверьте, корректно ли у вас установился нужный SDK
2. Если у вас неправильно отображаются файлы классов, значит у вас не проиндексировался проект после установки SDK. Перезапустите IDE.

