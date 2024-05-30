<!doctype html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>ЭС ПОДБОР АВТОМОБИЛЯ</title>
    <style>
        .ansbutton{
            border-style: solid;
            border-width: 1px;
            border-radius: 5px;
            padding: 7px;
            text-decoration: none;
            font-size: large;
            text-align: center;
            min-width: 30px;
        }
        .ansbutton:hover{
            background: rgba(0,0,0,0.1);
        }
        .button-container{
            display: flex;
            flex-direction: row;
            align-items: center;
            justify-content: space-evenly;
            width: 66%;
            grid-column-start: 1;
            grid-column-end: 4;
            grid-row: 3;
            margin: 0 auto;
        }
        .addansbutton{
            text-decoration: none;
            color: #a6a6a6;
            display: flex;
            align-items: center;
            justify-content: center;
            grid-column: 2;
            grid-row: 5
        }
        .adddiabutton{
            text-decoration: none;
            color: #a6a6a6;
            display: flex;
            align-items: center;
            justify-content: center;
            grid-column: 3;
            grid-row: 1
        }
        .returntomain{
            text-decoration: none;
            color: #a6a6a6;
            display: flex;
            align-items: center;
            justify-content: center;
            grid-column: 1;
            grid-row: 1
        }
        .returntomain{
            text-decoration: none;
            color: #a6a6a6;
            display: flex;
            align-items: center;
            justify-content: center;
            grid-column: 2;
            grid-row: 4
        }
    </style>
</head>
<body style="height: 100%; display: grid;grid-template-rows: repeat(7, 1fr);grid-template-columns: repeat(3, 1fr)">
<div style="grid-row: 2; grid-column: 2; text-align: center">
    <#if currDialog.isEnd()==true>
        <label><strong><h3 class="notisend" style="background: gold">${currDialog.title}</h3></strong></label>
    <#else >
        <h3 class="notisend">${currDialog.title}</h3>
    </#if>
</div>

    <#if currDialog.isEnd()==false>
        <#if currDialogAnswers??>
            <div class="button-container" >
                <#assign ctr=0>
                <#list currDialogAnswers?sort_by("id")?reverse as cda>
                    <#assign ctr=ctr+1>
                    <label style="display: flex; flex-direction: column; align-items: center">
                        ${ctr}
                        <a class="ansbutton" href="/ans/${cda.currDialog.id}/${cda.nextDialog.id}">${cda.title}</a>
                    </label>
                </#list>
            </div>
        </#if>
    </#if>
    <#if currDialog.isEnd()==false>
        <#if !isStart>
            <#if fromDiaId != currDialog.id>
                <a class="addansbutton" style="" href="/addans/${fromDiaId}/${currDialog.id}/">Добавить ответ</a>
            <#else>
                <a class="addansbutton" style="display: none" href="/addans/${fromDiaId}/${currDialog.id}/">Добавить ответ</a>
            </#if>
            <#else>
                <a class="addansbutton" style="display: none" href="/addans/${fromDiaId}/${currDialog.id}/">Добавить ответ</a>
        </#if>
        <#else >
        <label style="color:#a6a6a6; text-align: center; grid-row: 3; grid-column: 2">Вы не можете добавить новый ответ, так как этот диалог конечный.</label>
    </#if>
    <a class="adddiabutton" href="/adddia/">Добавить диалог</a>
    <a style="grid-row: 1; grid-column: 1" class="returntomain" href="/start">Вернуться к началу</a>
<#if prevDias??>
    <#if prevDias? has_content>
        <div style="color:#a6a6a6; text-align: center; grid-row: 4; grid-column: 2">
        <#list prevDias as pd>
                <label>Вернуться к диалогу</label>
                <a style="text-decoration: none" href="/ans/${pd.id}/${pd.id}">${pd.title}</a>
        </#list>
            <br/>
            <label>(После этого нельзя добавить ответ)</label>
        </div>
    </#if>
</#if>
<#if currDialog.helptext?has_content>
    <button style="grid-column: 2; grid-row: 6" onclick="alert('${currDialog.helptext}')" class="helptextbutton">Помощь</button>
    <#else>
    <a style="grid-row: 6; grid-column: 2; text-align: center" href="/addhelp/${currDialog.id}/${fromDiaId}">Добавить помощь</a>
</#if>
<div style="color: #a6a6a6; grid-column: 2; grid-row: 7; display: flex; flex-direction: column; justify-content: center; align-content: center">
    <form style="" method="post" action="/ans/fromInput/${fromDiaId}/${currDialog.id}">
        <label>Перейти к конкретному диалогу: </label>
        <input name="diaId" placeholder="ID Диалога"/>
        <button type="submit">Перейти</button>
    </form>
    <#if isError??>
        <#if isError>
            <label style="grid-row: 8; grid-column: 2; text-align: center; color: red">Несуществующий номер диалога!</label>
        </#if>
    </#if>
</div>
</body>
</html>