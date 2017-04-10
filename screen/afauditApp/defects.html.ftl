<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
    <title>Defects</title>
    <link rel="stylesheet" href="./css/weui.min.css"/>
    <link rel="stylesheet" href="./css/main.css"/>
    <script src="./js/weui.min.js"></script>
    <script src="./js/jquery-3.1.1.min.js"></script>
</head>
<body ontouchstart>
<div class="page">
    <div class="page__hd">
    </div>
    <div class="page__bd">
        <div class="weui-cells__tips"></div>
        <div class="weui-btn-area">
            <a href="
            <#if fromScreen == 'summary-next'>
                summary?serveLineStoreId=${serveLineStoreId}
            <#elseif fromScreen == 'checkpoints-list'>
                checkpoints?serveLineStoreId=${serveLineStoreId}&checkGroupRefId=${referenceCheckGroup.referenceId}&checkTypeRefId=${referenceCheckType.referenceId}
            </#if>" class="weui-btn weui-btn_primary">${ec.l10n.localize('Back')}</a>
        </div>
        <div class="weui-cells__title">${ec.l10n.localize('Checkpoint attributes')}</div>
        <div class="weui-cells">
            <div class="weui-cell">
                <div class="weui-cell__bd">
                    <p>${ec.l10n.localize('Department')}</p>
                </div>
                <div class="weui-cell__ft">${referenceCheckGroup.attributeValue}</div>
            </div>
            <div class="weui-cell">
                <div class="weui-cell__bd">
                    <p>${ec.l10n.localize('Category')}</p>
                </div>
                <div class="weui-cell__ft">${referenceCheckType.attributeValue}</div>
            </div>
            <div class="weui-cell">
                <div class="weui-cell__bd">
                    <p>${ec.l10n.localize('Checkpoint No.')}</p>
                </div>
                <div class="weui-cell__ft">${checkItem.itemNo}</div>
            </div>
            <div class="weui-cell">
                <div class="weui-cell__bd">
                    <p>${ec.l10n.localize('Total defect')}</p>
                </div>
                <div class="weui-cell__ft">${totalDefect!}</div>
            </div>
        </div>

        <div class="weui-cells__title">${ec.l10n.localize('Defect list')}</div>
        <#list checkItemList?if_exists as checkItem>
            <div class="weui-cells">
                <div class="weui-cell">
                    <div class="weui-cell__bd"><p>ID: ${checkItem.serveLineStoreCheckItemId}</p></div>
                    <div class="weui-cell__ft"><a href="checkpoint?serveLineStoreId=${serveLineStoreId}&checkItemId=${checkItemId}&serveLineStoreCheckItemId=${checkItem.serveLineStoreCheckItemId}&fromScreen=${fromScreen}" class="weui-btn weui-btn_primary weui-btn_small" style="margin-right: 6px;">${ec.l10n.localize('Edit')}</a></div>
                    <div class="weui-cell__ft"><a href="defects/delete?serveLineStoreId=${serveLineStoreId}&checkItemId=${checkItemId}&serveLineStoreCheckItemId=${checkItem.serveLineStoreCheckItemId}&fromScreen=${fromScreen}" class="weui-btn weui-btn_primary weui-btn_small" onclick="return confirm('${ec.l10n.localize('Really Delete?')}')">${ec.l10n.localize('Delete')}</a></div>
                </div>
                <div class="weui-cell">
                    <div class="weui-cell__bd"><p>${ec.l10n.localize('Defect')}:</p></div>
                    <div class="weui-cell__ft">${checkItem.defect}</div>
                </div>
                <div class="weui-cell">
                    <div class="weui-cell__bd"><p>${ec.l10n.localize('Comment')}:</p></div>
                    <div class="weui-cell__ft">${checkItem.defectRemark!}</div>
                </div>
                <div class="weui-cell">
                    <div class="weui-cell__bd"><p>${ec.l10n.localize('Remark')}:</p></div>
                    <div class="weui-cell__ft">${checkItem.actionRemark!}</div>
                </div>
                <div class="weui-cell">
                    <div class="weui-cell__bd"><p>${ec.l10n.localize('Operation')}:</p></div>
                    <div class="weui-cell__ft">${ec.l10n.localize('${checkItem.field01!}')}</div>
                </div>
                <div class="weui-cell">
                    <div class="weui-cell__bd"><p>${ec.l10n.localize('Provider')}:</p></div>
                    <div class="weui-cell__ft">${checkItem.field02!}</div>
                </div>
                <div class="weui-cell">
                    <div class="weui-cell__bd"><p>${ec.l10n.localize('Day Audit')}:</p></div>
                    <div class="weui-cell__ft">${checkItem.field05!}</div>
                </div>
                <div class="weui-cell">
                    <div class="weui-cell__bd"><p>${ec.l10n.localize('Day Defect')}:</p></div>
                    <div class="weui-cell__ft">${checkItem.field06!}</div>
                </div>
                <div class="weui-cell">
                    <div class="weui-cell__bd"><p>${ec.l10n.localize('Product Name')}:</p></div>
                    <div class="weui-cell__ft">${checkItem.field03!}</div>
                </div>
                <div class="weui-cell">
                    <div class="weui-cell__bd"><p>${ec.l10n.localize('Product No.')}:</p></div>
                    <div class="weui-cell__ft">${checkItem.field04!}</div>
                </div>
                <div class="weui-cell">
                    <div class="weui-cell__bd"><p>${ec.l10n.localize('sub-location')}:</p></div>
                    <div class="weui-cell__ft">${checkItem.field07!}</div>
                </div>
                <div class="weui-cell">
                    <div class="weui-cell__bd"><p>${ec.l10n.localize('In/Out/N/A')}:</p></div>
                    <div class="weui-cell__ft">${checkItem.field08!}</div>
                </div>
                <div class="weui-cell">
                    <div class="weui-cell__bd"><p>${ec.l10n.localize('COS')}:</p></div>
                    <div class="weui-cell__ft">${checkItem.field09!}</div>
                </div>
                <div class="weui-cell">
                    <div class="weui-cell__bd"><p>${ec.l10n.localize('R')}:</p></div>
                    <div class="weui-cell__ft">${checkItem.field10!}</div>
                </div>
            </div>
            <div class="weui-cell">
                <div class="weui-cell__bd">
                    <div class="weui-uploader">
                        <div class="weui-uploader__hd">
                            <p class="weui-uploader__title">${ec.l10n.localize('Photos')}</p>
                        </div>
                        <div class="weui-uploader__bd">
                            <ul class="weui-uploader__files" id="uploaderFiles_${checkItem.serveLineStoreCheckItemId}">
                                <#list attachmentList?if_exists as attachment>
                                    <#if attachment.dataId == checkItem.serveLineStoreCheckItemId>
                                        <li class="weui-uploader__file" style="background-image:url(${attachment.attachmentUrl})" value="${attachment.attachmentId}"></li>
                                    </#if>
                                </#list>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>

            <script type="text/javascript">
                $(function(){
                    var tmpl = '<li class="weui-uploader__file" style="background-image:url(#url#)"></li>',
                            $gallery = $("#gallery"), $galleryImg = $("#galleryImg"),
                            $uploaderFiles = $("#uploaderFiles_${checkItem.serveLineStoreCheckItemId}")
                            ;
                    $uploaderFiles.on("click", "li", function(){
                        $galleryImg.attr("style", this.getAttribute("style"));
                        $gallery.fadeIn(100);
                    });
                    $gallery.on("click", function(){
                        $gallery.fadeOut(100);
                    });
                });
            </script>
        </#list>
        <div class="weui-gallery" id="gallery">
            <span class="weui-gallery__img" id="galleryImg"></span>
        </div>
    </div>
</div>
</body>
</html>