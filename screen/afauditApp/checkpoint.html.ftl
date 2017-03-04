<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
    <title>Checkpoint</title>
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
            <a href="
                <#if fromScreen == "checkpoints-next">
                    checkpoints?serveLineStoreId=${viewCheckItem.serveLineStoreId}&checkGroupRefId=${viewCheckItem.checkGroupRefId}&checkTypeRefId=${viewCheckItem.checkTypeRefId}
                <#elseif fromScreen == "defects-edit" || fromScreen == "summary-next" || fromScreen == "checkpoints-list">
                    defects?serveLineStoreId=${viewCheckItem.serveLineStoreId}&checkItemId=${viewCheckItem.checkItemId}&fromScreen=${fromScreen}&totalDefect=${viewCheckItem.totalDefect!}
                </#if>" class="weui-btn weui-btn_primary">${ec.l10n.localize('Back')}</a>
        </div>
        <div class="weui-cells__title">${ec.l10n.localize('Checkpoint attributes')}</div>
        <div class="weui-cells">
            <div class="weui-cell">
                <div class="weui-cell__bd">
                    <p>${ec.l10n.localize('Department')}</p>
                </div>
                <div class="weui-cell__ft">${viewCheckItem.checkGroup}</div>
            </div>
            <div class="weui-cell">
                <div class="weui-cell__bd">
                    <p>${ec.l10n.localize('Category')}</p>
                </div>
                <div class="weui-cell__ft">${viewCheckItem.checkType}</div>
            </div>
            <div class="weui-cell">
                <div class="weui-cell__bd">
                    <p>${ec.l10n.localize('Checkpoint No.')}</p>
                </div>
                <div class="weui-cell__ft">${viewCheckItem.itemNo}</div>
            </div>
            <div class="weui-cell">
                <div class="weui-cell__bd">
                    <p>${ec.l10n.localize('Total defect')}</p>
                </div>
                <div class="weui-cell__ft">${viewCheckItem.totalDefect!}</div>
            </div>
        </div>
        <form action="checkpoint/save" name="formSave" method="post">
            <input type="hidden" name="moquiSessionToken" value="${ec.web.sessionToken}"/>
            <input type="hidden" name="serveLineStoreCheckItemId" value="${serveLineStoreCheckItemId!}">
            <input type="hidden" name="serveLineStoreId" value="${viewCheckItem.serveLineStoreId}">
            <input type="hidden" name="checkGroupRefId" value="${viewCheckItem.checkGroupRefId}">
            <input type="hidden" name="checkTypeRefId" value="${viewCheckItem.checkTypeRefId}">
            <input type="hidden" name="checkItemId" value="${viewCheckItem.checkItemId}">
            <input type="hidden" name="fromScreen" value="${fromScreen}">
            <div class="weui-cells__title">${ec.l10n.localize('Defect attributes')}</div>
            <div class="weui-cells weui-cells_form">
                <#if referenceDisplayFields.attributeValue.indexOf(",defect,")!=-1>
                    <div class="weui-cell">
                        <div class="weui-cell__hd"><label class="weui-label">${ec.l10n.localize('Defect')}:</label></div>
                        <div class="weui-cell__bd">
                            <input class="weui-input" type="number" pattern="[0-9]*" placeholder="${ec.l10n.localize('Input quantity')}" value="<#if checkItem?has_content>${checkItem.defect!}</#if>" name="defect"/>
                        </div>
                    </div>
                </#if>
                <#if referenceDisplayFields.attributeValue.indexOf(",defectRemark,")!=-1>
                    <div class="weui-cell">
                        <div class="weui-cell__hd"><label class="weui-label">${ec.l10n.localize('Description')}:</label></div>
                        <div class="weui-cell__bd">
                            <textarea class="weui-textarea" placeholder="${ec.l10n.localize('Input description')}" rows="2" name="defectRemark"><#if checkItem?has_content>${checkItem.defectRemark!}</#if></textarea>
                            <div class="weui-textarea-counter"></div>
                        </div>
                    </div>
                </#if>
                <#if referenceDisplayFields.attributeValue.indexOf(",actionRemark,")!=-1>
                    <div class="weui-cell">
                        <div class="weui-cell__hd"><label class="weui-label">${ec.l10n.localize('Action')}:</label></div>
                        <div class="weui-cell__bd">
                            <textarea class="weui-textarea" placeholder="${ec.l10n.localize('Input action')}" rows="2" name="actionRemark"><#if checkItem?has_content>${checkItem.actionRemark!}</#if></textarea>
                            <div class="weui-textarea-counter"></div>
                        </div>
                    </div>
                </#if>
                <#if referenceDisplayFields.attributeValue.indexOf(",remark,")!=-1>
                    <div class="weui-cell">
                        <div class="weui-cell__hd"><label class="weui-label">${ec.l10n.localize('Remark')}:</label></div>
                        <div class="weui-cell__bd">
                            <textarea class="weui-textarea" placeholder="${ec.l10n.localize('Input remark')}" rows="2" name="remark"><#if checkItem?has_content>${checkItem.remark!}</#if></textarea>
                            <div class="weui-textarea-counter"></div>
                        </div>
                    </div>
                </#if>
                <#if referenceDisplayFields.attributeValue.indexOf(",field01,")!=-1>
                    <div class="weui-cell">
                        <div class="weui-cell__hd"><label class="weui-label">${ec.l10n.localize('Operation')}:</label></div>
                        <div class="weui-cell__bd">
                            <select class="weui-select" name="field01">
                                <#if checkItem?has_content>
                                    <option value="Self-Operation" <#if checkItem.field01 == "Self-Operation">selected</#if>>${ec.l10n.localize('Self-Operation')}</option>
                                    <option value="Joint-Operation" <#if checkItem.field01 == "Joint-Operation">selected</#if>>${ec.l10n.localize('Joint-Operation')}</option>
                                <#else>
                                    <option value="Self-Operation" selected>${ec.l10n.localize('Self-Operation')}</option>
                                    <option value="Joint-Operation">${ec.l10n.localize('Joint-Operation')}</option>
                                </#if>
                            </select>
                        </div>
                    </div>
                </#if>
                <#if referenceDisplayFields.attributeValue.indexOf(",field02,")!=-1>
                    <div class="weui-cell">
                        <div class="weui-cell__hd"><label class="weui-label">${ec.l10n.localize('Provider')}:</label></div>
                        <div class="weui-cell__bd">
                            <input class="weui-input" type="text" placeholder="${ec.l10n.localize('Input provider')}" name="field02" value="<#if checkItem?has_content>${checkItem.field02!}</#if>"/>
                        </div>
                    </div>
                </#if>
                <#if referenceDisplayFields.attributeValue.indexOf(",field05,")!=-1>
                    <div class="weui-cell">
                        <div class="weui-cell__hd"><label class="weui-label">${ec.l10n.localize('Day audit')}:</label></div>
                        <div class="weui-cell__bd">
                            <select class="weui-select" name="field05">
                                <#if checkItem?has_content>
                                    <option value="N" <#if checkItem.field05 == "N">selected</#if>>N</option>
                                    <option value="Y" <#if checkItem.field05 == "Y">selected</#if>>Y</option>
                                <#else>
                                    <option value="N" selected>N</option>
                                    <option value="Y">Y</option>
                                </#if>
                            </select>
                        </div>
                    </div>
                </#if>
                <#if referenceDisplayFields.attributeValue.indexOf(",field06,")!=-1>
                    <div class="weui-cell">
                        <div class="weui-cell__hd"><label class="weui-label">${ec.l10n.localize('Day defect')}:</label></div>
                        <div class="weui-cell__bd">
                            <input class="weui-input" type="number" pattern="[0-9]*" placeholder="${ec.l10n.localize('Input day defect')}" name="field06" value="<#if checkItem?has_content>${checkItem.field06!}</#if>"/>
                        </div>
                    </div>
                </#if>
                <#if referenceDisplayFields.attributeValue.indexOf(",field03,")!=-1>
                    <div class="weui-cell">
                        <div class="weui-cell__hd"><label class="weui-label">${ec.l10n.localize('Product name')}:</label></div>
                        <div class="weui-cell__bd">
                            <input class="weui-input" type="text" placeholder="${ec.l10n.localize('Input product name')}" name="field03" value="<#if checkItem?has_content>${checkItem.field03!}</#if>"/>
                        </div>
                    </div>
                </#if>
                <#if referenceDisplayFields.attributeValue.indexOf(",field04,")!=-1>
                    <div class="weui-cell">
                        <div class="weui-cell__hd"><label class="weui-label">${ec.l10n.localize('Product No.')}:</label></div>
                        <div class="weui-cell__bd">
                            <input class="weui-input" type="text" placeholder="${ec.l10n.localize('Input product No.')}" name="field04" value="<#if checkItem?has_content>${checkItem.field04!}</#if>"/>
                        </div>
                    </div>
                </#if>
            </div>
            <div class="weui-btn-area">
                <a href="javascript:formSave.submit();" class="weui-btn weui-btn_primary">${ec.l10n.localize('Save')}</a>
            </div>
        </form>
        <div class="weui-gallery" id="gallery">
            <span class="weui-gallery__img" id="galleryImg"></span>
            <div class="weui-gallery__opr">
                <form action="checkpoint/deletePhoto" name="formDelete" method="post">
                    <input type="hidden" name="moquiSessionToken" value="${ec.web.sessionToken}"/>
                    <input type="hidden" name="serveLineStoreId" value="${viewCheckItem.serveLineStoreId}">
                    <input type="hidden" name="checkItemId" value="${viewCheckItem.checkItemId}">
                    <input type="hidden" name="serveLineStoreCheckItemId" value="${serveLineStoreCheckItemId!}">
                    <input type="hidden" name="attachmentId" id="attachmentId" value="">
                    <input type="hidden" name="fromScreen" value="${fromScreen}">
                    <a href="javascript:formDelete.submit();" class="weui-gallery__del">
                        <i class="weui-icon-delete weui-icon_gallery-delete"></i>
                    </a>
                </form>
            </div>
        </div>
        <#if serveLineStoreCheckItemId?has_content>
            <form action="checkpoint/uploadPhoto" name="formUpload" method="post" enctype="multipart/form-data">
                <input type="hidden" name="moquiSessionToken" value="${ec.web.sessionToken}"/>
                <input type="hidden" name="serveLineStoreId" value="${viewCheckItem.serveLineStoreId}">
                <input type="hidden" name="checkItemId" value="${viewCheckItem.checkItemId}">
                <input type="hidden" name="serveLineStoreCheckItemId" value="${serveLineStoreCheckItemId!}">
                <input type="hidden" name="fromScreen" value="${fromScreen}">
                <div class="weui-cells weui-cells_form">
                    <div class="weui-cell">
                        <div class="weui-cell__bd">
                            <div class="weui-uploader">
                                <div class="weui-uploader__hd">
                                    <p class="weui-uploader__title" id="id_message">${ec.l10n.localize('Upload photos')}</p>
                                    <div class="weui-uploader__info"><#if attachmentList?has_content>${attachmentList.size()}/${attachmentList.size()}</#if></div>
                                </div>
                                <div class="weui-uploader__bd">
                                    <ul class="weui-uploader__files" id="uploaderFiles">
                                        <#list attachmentList?if_exists as attachment>
                                            <li class="weui-uploader__file" style="background-image:url(${attachment.attachmentUrl})" value="${attachment.attachmentId}"></li>
                                        </#list>
                                    </ul>
                                    <div class="weui-uploader__input-box">
                                        <input id="uploaderInput" class="weui-uploader__input" type="file" accept="image/*" name="uploaderInput"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </#if>
    </div>
</div>

<script src="./js/weui.min.js"></script>
<script src="./js/jquery-3.1.1.min.js"></script>

<script type="text/javascript">
    $(function(){
        var tmpl = '<li class="weui-uploader__file" style="background-image:url(#url#)"></li>',
                $gallery = $("#gallery"), $galleryImg = $("#galleryImg"),
                $attachmentId = $("#attachmentId"),
                $uploaderInput = $("#uploaderInput"),
                $uploaderFiles = $("#uploaderFiles")
                ;

        $uploaderInput.on("change", function(e){
//            var src, url = window.URL || window.webkitURL || window.mozURL, files = e.target.files;
//            for (var i = 0, len = files.length; i < len; ++i) {
//                var file = files[i];
//
//                if (url) {
//                    src = url.createObjectURL(file);
//                } else {
//                    src = e.target.result;
//                }
//
//                $uploaderFiles.append($(tmpl.replace('#url#', src)));
//            }

            if (document.getElementById("uploaderInput").files[0].size > 256*1024){
                document.getElementById("id_message").innerHTML = "More than 256K !!!";
                return;
            }

            formUpload.submit();
        });
        $uploaderFiles.on("click", "li", function(){
            $galleryImg.attr("style", this.getAttribute("style"));
            $attachmentId.attr("value", this.getAttribute("value"));
            $gallery.fadeIn(100);
        });
        $gallery.on("click", function(){
            $gallery.fadeOut(100);
        });
    });
</script>
</body>
</html>