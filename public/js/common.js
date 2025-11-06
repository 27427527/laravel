// 删除本地Storage public图片

function delete_img(url) {
    $.ajax({
        url: "/admin/delete_img",
        data: { image: url },
        type: "POST",
        headers: {
            "X-CSRF-TOKEN": $('meta[name="csrf-token"]').attr("content"),
        },
        success: function (data) {
            layer.msg("删除成功", { icon: 1, time: 1000 });
        },
    });
}

function init_Editor() {
    // 初始化 UEditor
    var ue = UE.getEditor("container", {
        // 工具栏配置

        serverHeaders: {
            "X-CSRF-TOKEN": $('meta[name="csrf-token"]').attr("content"),
        },
        toolbars: [
            [
                "fullscreen",
                "source",
                "|",
                "undo",
                "redo",
                "|",
                "bold",
                "italic",
                "underline",
                "fontborder",
                "strikethrough",
                "superscript",
                "subscript",
                "removeformat",
                "formatmatch",
                "autotypeset",
                "blockquote",
                "pasteplain",
                "|",
                "forecolor",
                "backcolor",
                "insertorderedlist",
                "insertunorderedlist",
                "selectall",
                "cleardoc",
                "|",
                "rowspacingtop",
                "rowspacingbottom",
                "lineheight",
                "|",
                "customstyle",
                "paragraph",
                "fontfamily",
                "fontsize",
                "|",
                "directionalityltr",
                "directionalityrtl",
                "indent",
                "|",
                "justifyleft",
                "justifycenter",
                "justifyright",
                "justifyjustify",
                "|",
                "touppercase",
                "tolowercase",
                "|",
                "link",
                "unlink",
                "anchor",
                "|",
                "imagenone",
                "imageleft",
                "imageright",
                "imagecenter",
                "|",
                "insertimage",
                "emotion",
                "insertvideo",
                "music",
                "attachment",
                "map",
                "gmap",
                "insertframe",
                "insertcode",
                "webapp",
                "pagebreak",
                "template",
                "background",
                "|",
                "horizontal",
                "date",
                "time",
                "spechars",
                "snapscreen",
                "wordimage",
                "|",
                "inserttable",
                "deletetable",
                "insertparagraphbeforetable",
                "insertrow",
                "deleterow",
                "insertcol",
                "deletecol",
                "mergecells",
                "mergeright",
                "mergedown",
                "splittocells",
                "splittorows",
                "splittocols",
                "charts",
                "|",
                "print",
                "preview",
                "searchreplace",
                "drafts",
                "help",
            ],
        ],

        // 启用自动高度
        autoHeightEnabled: true,
        autoFloatEnabled: true,

        // 初始编辑高度，默认 320
        initialFrameHeight: 500,

        // 初始框宽度，默认 100%
        initialFrameWidth: "100%",

        // 启用自动保存
        enableAutoSave: true,

        // 自动保存间隔时间，单位 ms
        saveInterval: 50000,

        // 语言
        lang: "zh-cn",

        // 主题
        theme: "default",

        // 字体
        fontfamily: [
            { name: "宋体", val: "simsun" },
            { name: "黑体", val: "simhei" },
            { name: "楷体", val: "kaiti" },
            { name: "仿宋", val: "fangsong" },
            { name: "微软雅黑", val: "microsoft yahei" },
            { name: "Arial", val: "arial, helvetica, sans-serif" },
        ],

        // 字体大小
        fontsize: [10, 11, 12, 14, 16, 18, 20, 24, 36],

        // 字数统计
        wordCount: true,
        maximumWords: 10000,

        // 图片上传配置
        imageFieldName: "upfile",
        imageMaxSize: 2048 * 1024, // 2MB
        imageAllowFiles: [".png", ".jpg", ".jpeg", ".gif", ".bmp", ".webp"],

        // 截图工具上传
        snapscreenHost: "",

        // 抓取远程图片
        catchRemoteImageEnable: false,
    });
}
