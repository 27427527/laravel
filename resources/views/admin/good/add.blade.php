@include('admin.public.header')
<body>


    <div class="layui-fluid">
        <div class="layui-row">
            <form action="" id="role_form" method="post" class="layui-form layui-form-pane" >
             
               <input type="hidden" name="cate_id" value="{{ $cate_id }}"  >
               <div class="layui-form-item">

                

                <table width="100%"  cellspacing="0" cellpadding="0" class="layui-table">


                    <tbody>
                        
                    <tr class="row">
                    <td>名称<span class="x-red">*</span></td>
                    <td>
                        <input type="text" id="name" name="name"    lay-verify="required"
                        autocomplete="off" class="layui-input">
                    </td>
                    </tr>  

                     <tr class="row">
                    <td> 描叙</td>
                    <td>
                        <input type="text" id="description" name="description" 
                        autocomplete="off" class="layui-input">
                    </td>
                    </tr> 


                    <tr class="row">
                    <td>价格</td>
                    <td>
                        <input type="text" id="price" name="price" 
                        autocomplete="off" class="layui-input">
                    </td>
                    </tr>  

                    <tr class="row">
                    <td>原价</td>
                    <td>
                        <input type="text" id="original_price" name="original_price" 
                        autocomplete="off" class="layui-input">
                    </td>
                    </tr>  

                    <tr class="row">
                    <td>库存</td>
                    <td>
                        <input type="text" id="stock" name="stock" 
                        autocomplete="off" class="layui-input">
                    </td>
                    </tr>  

                    <tr class="row">
                    <td>编号</td>
                    <td>
                        <input type="text" id="sku" name="sku" 
                        autocomplete="off" class="layui-input">
                    </td>
                    </tr>  

                   


                    <tr class="row">

                    <td>主图</td>

                    <td>
                    <button  type="button" class="layui-btn lay_up" data-id="{{ $cate_id }}">
		                <i class="layui-icon">&#xe67c;</i>上传
		                  </button>

    <blockquote class="layui-elem-quote layui-quote-nm" style="margin-top: 11px;">
    <div class="layui-upload-list" id="{{ $cate_id }}_upload-dan-preview"></div>
 </blockquote>
    
     
                    </td>



                    </tr>  


                     <tr class="row">

                    <td>轮播图</td>

                    <td>
                    <button id="image_list"  type="button" class="layui-btn " >
		                <i class="layui-icon">&#xe67c;</i>多图片上传
		                  </button>
                        <blockquote class="layui-elem-quote layui-quote-nm" style="margin-top: 11px;">
 
    <div class="layui-upload-list" id="upload-demo-preview"></div>
 </blockquote>
 
        </div>
                    </td>

                    

                    </tr> 

                    
                    <tr>
                      <td>分类(多选)</td>
                      <td>
                      <div class="layui-input-block">    
         
                    @foreach ($cate_list as $item )
                          <input type="checkbox" name="cate_id[]" lay-skin="primary" {{ $cate_id==$item['cate_id']?'checked':'' }} value="{{ $item['cate_id'] }}"  title="{{ $item['name'] }}" >
                    @endforeach
                      </div>
                      </td>
                    </tr>

                     <tr>
                      <td>品牌(单选)</td>
                      <td>
                      <div class="layui-input-block">    
         
                    @foreach ($brand_list as $item )
                          <input type="radio" name="brand_id" lay-skin="primary" value="{{ $item['brand_id'] }}"  title="{{ $item['name'] }}" >
                    @endforeach
                      </div>
                      </td>
                    </tr>

                   

                </tbody>
                </table>
             


       


        
                <div class="layui-form-item">
                <button class="layui-btn layui-btn-sub" lay-submit="" lay-filter="add">确认提交</button>
              </div>
            </form>
        </div>
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
               url : "/admin/good",  
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