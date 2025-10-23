@include('admin.public.header')
<body>
    <div class="layui-fluid">
        <div class="layui-row">
            <form action="" id="role_form" method="post" class="layui-form layui-form-pane">
             
     <div class="layui-form-item">

                

                <table width="100%"  cellspacing="0" cellpadding="0" class="layui-table">


                    <tbody>
                        
                    <tr class="row">

                    <td>角色名<span class="x-red">*</span>
                    </td>


                    <td>
                       
                        <input type="text" id="name" name="name" value="{{ $role['name'] }}"  lay-verify="required"
                        autocomplete="off" class="layui-input">
                    </td>
                        
                        
                    </tr>  
  <tr class="row">

<td>标记<span class="x-red">*</span>
                    </td>

                       <td>
                       
                        <input type="text" id="slug" name="slug" value="{{ $role['slug'] }}" required=""  lay-verify="required"
                        autocomplete="off" class="layui-input">
                    </td>
  </tr>  
                    <tr class="row">

                    <td>描叙</td>

                    <td>
                        
                        <input type="text" id="description" name="description" value="{{ $role['description'] }}"  autocomplete="off" class="layui-input"  >
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
        layui.use(['form','layer'], function(){
            $ = layui.jquery;
          var form = layui.form
          ,layer = layui.layer;

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

          //监听提交
          form.on('submit(add)', function(data){
            // console.log(data);
            //发异步，把数据提交给php
            
              $.ajax({
               url : "/admin/role/"+{{ $role['role_id'] }},  
               type : "PUT", 
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
    </script>
   
  </body>

</html>