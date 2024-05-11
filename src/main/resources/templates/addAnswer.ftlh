<!doctype html>
<html lang="ru" xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Добавление ответа</title>
</head>
<body>
<h3>Добавление</h3>
    <form action="/addAnswerForm/transition=${fromDiaId}to${dId}" method="post">
        <div style="display: flex; flex-direction: column; width: 50%">
            <label>Вы пришли в этот диалог из диалога <strong>(${fromDiaId})</strong> с помощью ответа <strong>(${transitionAnswer.title})</strong></label>
            <label>Добавление ответа к вопросу <strong>(${currDia.title})</strong></label><br>
            <label>ОТВЕТ:</label>
            <input name="titlea"/>
            <input name="currDiaId" value="${currDia.id}" hidden>
            <label>В какой диалог вы хотите прийти?</label>
            <select name="nextDiaId">
                <#list allDiaList as d>
                    <option value="${d.id}">${d.title} (${d.id})</option>
                    <#if d_has_next==false>
                        <option selected value="new">Новый диалог (new)</option>
                    </#if>
                </#list>
            </select>
            <label>Название нового диалога(если есть)</label>
            <input name="title"/>
            <label>Последний ли новый диалог?(если есть)</label>
            <input type="checkbox" name="isenddia" />
            <textarea rows="3" cols="25" name="helptext">Помощь?</textarea>
            <button type="submit">Добавить</button>
        </div>

    </form>
</body>
</html>