<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
    <title>Summary</title>
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
        <div class="weui-cells__title">${ec.l10n.localize('Checkpoint list')}</div>
        <div class="weui-cells">
            <#list viewCheckItemList?if_exists as viewCheckItem>
                <#if viewCheckItem.totalDefect?has_content>
                    <div class="weui-flex">
                        <div class="weui-flex__item">
                            <a class="weui-cell weui-cell_access" href="defects?serveLineStoreId=${serveLineStoreId}&checkItemId=${viewCheckItem.checkItemId}&fromScreen=summary-next&totalDefect=${viewCheckItem.totalDefect}">
                                <div class="weui-cell__bd">
                                    <span style="vertical-align: left">${viewCheckItem.checkGroup} - ${viewCheckItem.checkType} - ${viewCheckItem.itemNo}: ${viewCheckItem.checkPoint}</span>
                                    <#if viewCheckItem.totalDefect?has_content>
                                        <span class="weui-badge" style="margin-left: 5px;">${viewCheckItem.totalDefect}</span>
                                    </#if>
                                </div>
                                <div class="weui-cell__ft">
                                </div>
                            </a>
                        </div>
                    </div>
                </#if>
            </#list>
        </div>
        <form action="summary/save" name="formSave" method="post">
            <input type="hidden" name="moquiSessionToken" value="${ec.web.sessionToken}"/>
            <input type="hidden" name="serveLineStoreId" value="${serveLineStoreId!}">
            <div class="weui-cells__title">${ec.l10n.localize('Summary')}</div>
            <div class="weui-cells weui-cells_form">
                <div class="weui-cell">
                    <div class="weui-cell__hd"><label class="weui-label">${ec.l10n.localize('Comment')}:</label></div>
                    <div class="weui-cell__bd">
                        <textarea class="weui-textarea" placeholder="${ec.l10n.localize('Input comment')}" rows="2" name="comment">${serveLineStore.comment!}</textarea>
                        <div class="weui-textarea-counter"></div>
                    </div>
                </div>
                <div class="weui-cell">
                    <div class="weui-cell__hd"><label class="weui-label">${ec.l10n.localize('Store Manager')}:</label></div>
                    <div class="weui-cell__bd">
                        <input class="weui-input" type="text" placeholder="${ec.l10n.localize('Input store manager')}" name="storeManager" value="${serveLineStore.storeManager!}"/>
                    </div>
                </div>
            </div>
            <div class="weui-btn-area">
                <a href="javascript:formSave.submit();" class="weui-btn weui-btn_primary">${ec.l10n.localize('Save')}</a>
            </div>
        </form>
        <#if viewCheckItemList?has_content>
            <div class="weui-gallery" id="gallery">
                <span class="weui-gallery__img" id="galleryImg"></span>
                <div class="weui-gallery__opr">
                    <form action="summary/deletePhoto" name="formDelete" method="post">
                        <input type="hidden" name="moquiSessionToken" value="${ec.web.sessionToken}"/>
                        <input type="hidden" name="serveLineStoreId" value="${serveLineStoreId}">
                        <input type="hidden" name="attachmentId" id="attachmentId" value="">
                        <a href="javascript:formDelete.submit();" class="weui-gallery__del">
                            <i class="weui-icon-delete weui-icon_gallery-delete"></i>
                        </a>
                    </form>
                </div>
            </div>
            <form action="summary/uploadPhoto" name="formUpload" method="post" enctype="multipart/form-data">
                <input type="hidden" name="moquiSessionToken" value="${ec.web.sessionToken}"/>
                <input type="hidden" name="serveLineStoreId" value="${serveLineStoreId}">
                <div class="weui-cells weui-cells_form">
                    <div class="weui-cell">
                        <div class="weui-cell__bd">
                            <div class="weui-uploader">
                                <div class="weui-uploader__hd">
                                    <p class="weui-uploader__title" id="id_message">${ec.l10n.localize('Upload audit confirmation')}</p>
                                    <div class="weui-uploader__info">${attachmentList.size()}/${attachmentList.size()}</div>
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
            <div class="weui-btn-area">
                <a href="summary/audited?serveLineStoreId=${serveLineStoreId}" class="weui-btn weui-btn_primary" onclick="return confirm('${ec.l10n.localize('Really Audited?')}')">${ec.l10n.localize('Audited')}</a>
            </div>
        </#if>
    </div>
</div>

<script src="./js/weui.min.js"></script>
<script src="./js/jquery-3.1.1.min.js"></script>
<script src="./js/lrz/lrz.all.bundle.js"></script>

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

//            if (document.getElementById("uploaderInput").files[0].size > 512*1024){
//                document.getElementById("id_message").innerHTML = "More than 512K !!!";
//                return;
//            }

//            formUpload.submit();

            lrz(this.files[0], {width: 300, quality: 1})
                    .then(function (rst) {
                        console.log(rst);
                        $.ajax({
                            url: 'summary/uploadPhoto?moquiSessionToken=${ec.web.sessionToken}&serveLineStoreId=${serveLineStoreId}',
                            data: rst.formData,
                            processData: false,
                            contentType: false,
                            type: 'POST',
                            success: function (data) {
                                formSave.submit();
                            }
                        });
                    })

                    .catch(function (err) {
                        console.log(err);
                    })

                    .always(function () {
                    });
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