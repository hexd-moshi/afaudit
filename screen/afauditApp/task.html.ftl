<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
    <title>Task</title>
    <link rel="stylesheet" href="./css/weui.min.css"/>
    <link rel="stylesheet" href="./css/main.css"/>
</head>
<body ontouchstart>
<div class="page">
    <div class="page__hd">
    </div>
    <div class="page__bd">
        <div class="weui-cells__tips"></div>
        <div class="weui-btn-area">
            <a href="tasks" class="weui-btn weui-btn_primary">${ec.l10n.localize('Back')}</a>
        </div>
        <div class="weui-cells__title">${ec.l10n.localize('Task attributes')}</div>
        <div class="weui-cells">
            <div class="weui-cell">
                <div class="weui-cell__bd">
                    <p>${ec.l10n.localize('Task No.')}</p>
                </div>
                <div class="weui-cell__ft">${viewServeLineStore.serveLineNo}</div>
            </div>
            <div class="weui-cell">
                <div class="weui-cell__bd">
                    <p>${ec.l10n.localize('Date')}</p>
                </div>
                <div class="weui-cell__ft">${viewServeLineStore.auditDate}</div>
            </div>
            <div class="weui-cell">
                <div class="weui-cell__bd">
                    <p>${ec.l10n.localize('Store')}</p>
                </div>
                <div class="weui-cell__ft">${viewServeLineStore.storeName}</div>
            </div>
            <div class="weui-cell">
                <div class="weui-cell__bd">
                    <p>${ec.l10n.localize('Auditor')}</p>
                </div>
                <div class="weui-cell__ft">${viewServeLineStore.auditor}</div>
            </div>
        </div>
        <div class="weui-btn-area">
            <a href="task/begin?serveLineStoreId=${viewServeLineStore.serveLineStoreId}" class="weui-btn weui-btn_primary">${ec.l10n.localize('Begin')}</a>
            <a href="summary?serveLineStoreId=${viewServeLineStore.serveLineStoreId}" class="weui-btn weui-btn_primary">${ec.l10n.localize('Summary')}</a>
        </div>
        <#if viewServeLineStore.checklistStatus == 35>
            <div class="weui-cells__title">${ec.l10n.localize('Reject remark')}</div>
            <div class="weui-cells">
                <div class="weui-cell">
                    <div class="weui-cell__bd">
                        <textarea class="weui-textarea" rows="2" readonly="readonly">${viewServeLineStore.rejectRemark!}</textarea>
                    </div>
                </div>
            </div>
        </#if>
    </div>
</div>
</body>
</html>