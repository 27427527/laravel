// TinyMCE 初始化
tinymce.init({
    selector: ".editor",
    license_key: "gpl", // 或 'gpl'
    // 强制设置为开源模式
    promotion: false,
    branding: false,

    height: 500,
    menubar: "file edit view insert format tools table help",
    plugins: [
        "advlist",
        "autolink",
        "lists",
        "link",
        "image",
        "charmap",
        "preview",
        "anchor",
        "searchreplace",
        "visualblocks",
        "code",
        "fullscreen",
        "insertdatetime",
        "media",
        "table",
        "code",
        "help",
        "wordcount",
        "emoticons",
    ],
    toolbar:
        "undo redo | blocks | bold forecolor image   | " +
        "code link  media fullscreen | italic underline strikethrough emoticons  | " +
        "alignleft aligncenter alignright alignjustify | " +
        "bullist numlist outdent indent |  backcolor | " +
        "removeformat | help",
    content_style:
        "body { font-family: -apple-system, BlinkMacSystemFont, San Francisco, Segoe UI, Roboto, Helvetica Neue, sans-serif; font-size: 14px; }",

    // 图片上传配置
    images_upload_handler: function (blobInfo, progress) {
        return new Promise((resolve, reject) => {
            const formData = new FormData();
            formData.append("file", blobInfo.blob(), blobInfo.filename());
            formData.append("dir", "img");

            fetch("/admin/upfile", {
                method: "POST",
                body: formData,
                headers: {
                    "X-CSRF-TOKEN": $('meta[name="csrf-token"]').attr(
                        "content"
                    ),
                },
            })
                .then((response) => response.json())
                .then((data) => {
                    if (data.success == true) {
                        var url = "/storage/" + data.filedata.path;

                        resolve(url);
                    } else {
                        reject("上传失败: " + data.error);
                    }
                })
                .catch(() => reject("上传失败"));
        });
    },

    // 语言设置
    language: "zh_CN",

    // 自动保存（可选）
    autosave_ask_before_unload: true,
    autosave_interval: "30s",
    // autosave_prefix: 'tinymce-autosave-{path}{query}-{id}-',
    // autosave_restore_when_empty: false,
    // autosave_retention: '2m',
});
