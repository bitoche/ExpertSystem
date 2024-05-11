<!doctype html>
<html lang="ru" xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Добавление помощи</title>
</head>
<body>
<h3>Добавление</h3>
<form action="/addhelptext/${currdia.id}/${fromdiaid}" method="post">
    <div style="display: flex; flex-direction: column; width: 50%">
        Диалог <strong>${currdia.title}</strong>.
        <textarea name="helptext" placeholder="Введите сюда текст для помощи..."></textarea>
        <button type="submit">Добавить</button>
    </div>

</form>
</body>
</html>