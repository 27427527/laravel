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
