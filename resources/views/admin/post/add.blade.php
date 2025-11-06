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
                    <td> 标题</td>
                    <td>
                        <input type="text" id="title" name="title" 
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
                    <td> 内容</td>
                    <td>
                     <textarea class="editor" id="container" name="content"  rows="5"></textarea>
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

      init_Editor();
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
               url : "/admin/post",  
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

        // 删除图片
        function delete_img(id){

        console.log(id);
        $('#'+id+"_input").attr('value','');
          $('#'+id+'_pic').attr('src','/images/point.png');
          $('#'+id+'_a').attr('href','');
        }
    </script>
   
  </body>

</html>