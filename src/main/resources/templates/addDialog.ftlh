<!doctype html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Добавление вопроса</title>
</head>
<body>
    <form action="/addDialogForm" method="post">
        <div style="display: flex; flex-direction: column; width: 50%">
            <label>Диалог</label>
            <input name="title"/>
            <label>Последний?</label>
            <input type="checkbox" name="isend" />
            <textarea rows="3" cols="25" name="helptext">Помощь?</textarea>
            <button type="submit">Добавить</button>
        </div>
    </form>
</body>
</html>