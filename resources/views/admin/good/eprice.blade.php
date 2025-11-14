@include('admin.public.header')
<body>

@php
  function arraysEqualIgnoreOrder2($arr1, $arr2) {
    if (count($arr1) !== count($arr2)) {
        return false;
    }
    
    return empty(array_diff($arr1, $arr2)) && empty(array_diff($arr2, $arr1));
}

@endphp

  <div class="layui-fluid">
   
<form action="" id="role_form" method="post" class="layui-form layui-form-pane" > 
  <input type="hidden"  value="{{ $good->good_id }}" name='good_id'>
            
 <div class="layui-form-item" id="layui-form-item">


<table class="layui-table layui-form" id="attr_name_table">
<tbody id="attr_body">

<tr>
  @foreach ($good->attr_names as $item)

      <th>{{ $item->name }}</th>
  @endforeach

  <th>库存</th><th>价格</th><th>原价</th></tr>

<tr>

@foreach ($attr_list as $item)

<tr>
@foreach ($item as $v)


<td>
 {{  $v }}


</td>


@endforeach


@php


$new_arr=[];
foreach ($price_list as $price) {

  

 $price_arr=$price->attr;
 

 $rs=arraysEqualIgnoreOrder2($item,$price_arr);

 

 if($rs===true){
    $new_arr=$price;
 }
 
}
  
@endphp

@if (!empty($new_arr))

  <td><input class='layui-input'  value="{{ $new_arr['stock'] }}" name='data[{{ $count }}][stock]'></td>
  <td><input class='layui-input'  value="{{ $new_arr['price'] }}" name='data[{{ $count }}][price]'></td>
  <td><input class='layui-input'  value="{{ $new_arr['org_price'] }}" name='data[{{ $count }}][org_price]'>

    <input type="hidden" data-attr="{{ json_encode($price_arr, JSON_UNESCAPED_UNICODE)}}"  value="{{ json_encode($item, JSON_UNESCAPED_UNICODE) }}" name='data[{{ $count }}][attr]'>
    <input type="hidden"  value="{{ $good->good_id}}" name='data[{{ $count }}][good_id]'>

 @else
  <td><input class='layui-input'  value="0" name='data[{{ $count }}][stock]'></td>
  <td><input class='layui-input'  value="{{ $good->price }}" name='data[{{ $count }}][price]'></td>
  <td><input class='layui-input'  value="{{ $good->original_price }}" name='data[{{ $count }}][org_price]'>

    <input type="hidden"   value="{{ json_encode($item, JSON_UNESCAPED_UNICODE) }}" name='data[{{ $count }}][attr]'>
    <input type="hidden"  value="{{ $good->good_id}}" name='data[{{ $count }}][good_id]'>
 
  
@endif  
  
  </td>
 </tr>

@php
  $count++;
@endphp
@endforeach


</tbody>
</table>
   
 </div>

  <div class="layui-form-item">
                <button class="layui-btn layui-btn-sub" lay-submit="" lay-filter="add">确认提交</button>
  </div>

</form>
</div>  

<script>







        layui.use(['form','layer','upload'], function(){
            $ = layui.jquery;
          var form = layui.form
          ,layer = layui.layer;

          var upload=layui.upload;

          form.render();
        
          //自定义验证规则
          form.verify({
            nikename: function(value){
              if(value.length < 5){
                return '角色名至少得2个字符啊';
              }
            }
            ,pass: [/(.+){6,12}$/, '密码必须6到12位']
            ,repass: function(value){
                if($('#L_pass').val()!=$('#L_repass').val()){
                    return '两次密码不一致';
                }
            }
          });

       
  // 多图片上传
  upload.render({
    elem: '#image_list',
    multiple: true,
    url: '/admin/upfile', //上传接口
    data: {'dir': 'img'},
    auto: true,
    bindAction: '#images_action',
    headers: {'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')},
    done: function(res){

     
      // 上传完毕返回的图片链接保存到隐藏域
       if(res.success == true){
        var url="/storage/"+res.filedata.path;
        $('#upload-demo-preview').append('<li class="pre-li" data-image="'+res.filedata.path+'" ><input type="hidden" name="images[]" value="'+res.filedata.path+'" ><i class="icon iconfont">&#xe6b7;</i><img class="pre-img" src="'+url+'"  ></li>');
      }
    },
    allDone: function(obj){
    //  console.log(obj.total); // 上传的文件总数
    //  console.log(obj.successful); // 上传成功的文件数
    //  console.log(obj.failed); // 上传失败的文件数

     
    // layer.msg(obj.total+'个文件上传成功',{icon: 1,time:1500});
    
    },
  });

      





// 单图片上传
         var uploadInst = upload.render({
        accept: 'images', //图片上传
        elem: '.lay_up', //绑定元素
        field:'file',
        url: '/admin/upfile', //上传接口
        data: {'dir': 'img'},
          headers: {'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')},
        before:function(obj){
          var item = this.item;
          var id=$(item).attr('data-id');
           $('#'+id+'_upload-dan-preview').html('');
          layer.load("数据提交中，请稍等！",false);
          },
        done: function(res){
      if(res.success == true){
          layer.closeAll();
         var item = this.item;
          var id=$(item).attr('data-id');
        var url="/storage/"+res.filedata.path;
        $('#'+id+'_upload-dan-preview').append('<li class="pre-li" data-image="'+res.filedata.path+'" ><input type="hidden" name="image" value="'+res.filedata.path+'" ><i class="icon iconfont">&#xe6b7;</i><img class="pre-img" src="'+url+'" ></li>');
      }
          // storage\img
        },
        error: function(){
          //请求异常回调
        }
      });

//监听提交
          form.on('submit(add)', function(data){
            // console.log(data);
            //发异步，把数据提交给php
            
              $.ajax({
               url : "/admin/attrprice",  
               type : "POST", 
               headers: {'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')},   
               data : $('#role_form').serialize(),  
               success : function(data) { 

              //  var rs=$.parseJSON(data); 
               var rs=data; 
                if(rs.success){

                     layer.msg(rs.message);
                     //关闭当前frame
                        xadmin.close();

                        // 可以对父窗口进行刷新 
                        xadmin.father_reload();
                
                 
                }else{
                 
                     layer.msg(rs.message);
                   return false;
                }
               }
              });
      
            return false;
          });


        form.on('checkbox(father)', function(data){

            if(data.elem.checked){
                $(data.elem).parent().siblings('td').find('input').prop("checked", true);
                form.render(); 
            }else{
               $(data.elem).parent().siblings('td').find('input').prop("checked", false);
                form.render();  
            }
        });
          
          
        });


        //  图片上传 删除图片
$(".layui-upload-list").on("click", ".pre-li", function () {
    var image = $(this).attr("data-image");

    delete_img(image);

    $(this).remove();
});

$(".layui-upload-list").on("mouseover", ".pre-li", function () {
    $(this).find(".iconfont").show();
});

$(".layui-upload-list").on("mouseleave", ".pre-li", function () {
    $(this).find(".iconfont").hide();
});

    </script>
   
  </body>

</html>