 @include('admin.public.header')
 <body>
        <div class="layui-fluid">
            <div class="layui-row">
                <form class="layui-form" id="user_form">
                    @csrf

                <table width="100%"  cellspacing="0" cellpadding="0" class="layui-table">


                    <tbody>
                        
                    <tr class="row"><td>登录名<span class="x-red">*</span></td>
                    <td><input type="text" id="username" name="username" required="" value="{{ $user['username'] }}"  lay-verify="required"
                        autocomplete="off" class="layui-input"></td>
                    </tr>  

                    <tr class="row"><td>姓名<span class="x-red">*</span></td>
                    <td><input type="text" id="real_name" name="real_name" required=""  value="{{ $user['real_name'] }}" lay-verify="required"
                        autocomplete="off" class="layui-input"></td>
                    </tr> 

                     <tr class="row"><td>手机<span class="x-red">*</span></td>
                    <td><input type="text" id="phone" name="phone" required="" value="{{ $user['phone'] }}"  lay-verify="phone"
                        autocomplete="off" class="layui-input"></td>
                    </tr> 


   <tr>
                                <td>
                                  权限角色
                                </td>
                          
                                <td>
                                    <div class="layui-input-block">    
         
                    @foreach ($role_list as $item )

 
                         

 <input type="checkbox" name="id[]" lay-skin="primary" {{ in_array($item['role_id'],$user_roles)?'checked':'' }} value="{{ $item['role_id'] }}"  title="{{ $item['name'] }}" >
                 @endforeach
                                    </div>
                                </td>

                               
                            </tr>
 

               <tr class="row"><td>密码( 6到16个字符)</td>
                    <td><input type="password" id="password" name="password" required=""  
                        autocomplete="off" class="layui-input"></td>
                    </tr> 

                 


           
       

                     </tbody>
                </table>

  <div class="layui-form-item">
                <button class="layui-btn layui-btn-sub" lay-submit="" lay-filter="add">确认提交</button>
              </div>
              </form>
            </div>
        </div>
        <script>layui.use(['form', 'layer'],
            function() {
                $ = layui.jquery;
                var form = layui.form,
                layer = layui.layer;

                //自定义验证规则
                form.verify({
                    nikename: function(value) {
                        if (value.length < 5) {
                            return '昵称至少得5个字符啊';
                        }
                    },
                    pass: [/(.+){6,12}$/, '密码必须6到12位'],
                    repass: function(value) {
                        if ($('#L_pass').val() != $('#L_repass').val()) {
                            return '两次密码不一致';
                        }
                    }
                });

                //监听提交
                form.on('submit(add)',
                function(data) {

              $.ajax({
               url : "/admin/user/"+{{ $user['id'] }},  
               type : "PUT",  
               data : $('#user_form').serialize(),  
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

            });</script>
     
    </body>

</html>