<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
    <title>Tasks</title>
    <link rel="stylesheet" href="${sri.buildUrl('../css/weui.min.css').url}"/>
    <link rel="stylesheet" href="${sri.buildUrl('../css/main.css').url}"/>
</head>
<body ontouchstart>
    <div class="page">
        <div class="page__hd">
        </div>
        <div class="page__bd">
            <div class="weui-cells__tips"></div>
            <div class="weui-btn-area">
                <a href="../" class="weui-btn weui-btn_primary">${ec.l10n.localize('Exit')}</a>
            </div>
            <div class="weui-cells__title">${ec.l10n.localize('Task list')}</div>
            <div class="weui-cells">
                <#list viewServeLineStoreList?if_exists as viewServeLineStore>
                    <a class="weui-cell weui-cell_access" href="${sri.buildUrl('../task').url}?serveLineStoreId=${viewServeLineStore.serveLineStoreId}">
                        <div class="weui-cell__bd">
                            <p>${viewServeLineStore.serveLineNo} ${viewServeLineStore.storeName} ${viewServeLineStore.auditDate}
                                <#if viewServeLineStore.checklistStatus==30><span class="weui-badge" style="margin-left: 6px;">Auditing</span></#if>
                                <#if viewServeLineStore.checklistStatus==35><span class="weui-badge" style="margin-left: 6px;">Reject</span></#if></p>
                        </div>
                        <div class="weui-cell__ft">
                        </div>
                    </a>
                </#list>
            </div>
        </div>
    </div>
</body>
</html>