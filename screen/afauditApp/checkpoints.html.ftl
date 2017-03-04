<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
    <title>Checkpoints</title>
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
            <a href="task?serveLineStoreId=${serveLineStoreId}" class="weui-btn weui-btn_primary">${ec.l10n.localize('Back')}</a>
        </div>
        <div class="weui-cells__title">${ec.l10n.localize('Query conditions')}</div>
        <form action="checkpoints" name="formQuery" method="post">
            <input type="hidden" name="serveLineStoreId" value="${serveLineStoreId}"/>
            <div class="weui-cells">
                <div class="weui-cell weui-cell_select weui-cell_select-after">
                    <div class="weui-cell__hd">
                        <label for="" class="weui-label">${ec.l10n.localize('Department')}</label>
                    </div>
                    <div class="weui-cell__bd">
                        <select class="weui-select" name="checkGroupRefId">
                        <#list referenceCheckGroupList?if_exists as reference>
                            <option value="${reference.referenceId}" <#if reference.referenceId==checkGroupRefId>selected</#if>>${reference.attributeValue}</option>
                        </#list>
                        </select>
                    </div>
                </div>
                <div class="weui-cell weui-cell_select weui-cell_select-after">
                    <div class="weui-cell__hd">
                        <label for="" class="weui-label">${ec.l10n.localize('Category')}</label>
                    </div>
                    <div class="weui-cell__bd">
                        <select class="weui-select" name="checkTypeRefId">
                        <#list referenceCheckTypeList?if_exists as reference>
                            <option value="${reference.referenceId}" <#if reference.referenceId==checkTypeRefId>selected</#if>>${reference.attributeValue}</option>
                        </#list>
                        </select>
                    </div>
                </div>
            </div>
            <div class="weui-btn-area">
                <a href="javascript:formQuery.submit();" class="weui-btn weui-btn_primary">${ec.l10n.localize('Query')}</a>
            </div>
        </form>
        <div class="weui-cells__title">${ec.l10n.localize('Checkpoint list')}</div>
        <div class="weui-cells">
            <#list viewCheckItemList?if_exists as viewCheckItem>
                <div class="weui-flex">
                    <div class="weui-btn-area weui-btn_list">
                        <a href="defects?serveLineStoreId=${serveLineStoreId}&checkItemId=${viewCheckItem.checkItemId}&fromScreen=checkpoints-list&totalDefect=${viewCheckItem.totalDefect!}" class="weui-btn weui-btn_primary weui-btn_small"
                           <#if !viewCheckItem.totalDefect?has_content>style="display: none"</#if>>${ec.l10n.localize('List')}</a>
                    </div>
                    <div class="weui-flex__item">
                        <a class="weui-cell weui-cell_access" href="checkpoint?serveLineStoreId=${serveLineStoreId}&checkItemId=${viewCheckItem.checkItemId}&fromScreen=checkpoints-next">
                            <div class="weui-cell__bd">
                                <span style="vertical-align: left">${viewCheckItem.itemNo}: ${viewCheckItem.checkPoint}</span>
                                <#if viewCheckItem.totalDefect?has_content>
                                    <span class="weui-badge" style="margin-left: 6px;">${viewCheckItem.totalDefect}</span>
                                </#if>
                            </div>
                            <div class="weui-cell__ft">
                            </div>
                        </a>
                    </div>
                </div>
            </#list>
        </div>
    </div>
</div>
</body>
</html>