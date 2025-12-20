 @include('admin.public.header')
 <body>
        <div class="layui-fluid">
            <div class="layui-row">
                <form class="layui-form" id="user_form">
                    @csrf

                <table width="100%"  cellspacing="0" cellpadding="0" class="layui-table">


                    <tbody>
                        
                    <tr class="row"><td>快递名称<span class="x-red">*</span></td>
                    <td><input type="text" id="express_name" name="express_name" required="" value="{{ $order['express_name'] }}"  lay-verify="required"
                        autocomplete="off" class="layui-input"></td>
                    </tr>  

                       <tr class="row"><td>快递单号</td>
                    <td><input type="text" id="express_no" name="express_no" value="{{ $order['express_no'] }}" 
                        autocomplete="off" class="layui-input"></td>
                    </tr>  

                       <tr class="row"><td>物流信息</td>
                    <td>
                        
                         <textarea class=""  style="width:100%;" id="express_info" name="express_info"  rows="5">{{  $order['express_info'] }}</textarea>
               
                    </td>
                    </tr>  


                       <tr class="row"><td>后台备注</td>
                    <td>
                        
                         <textarea class=""  style="width:100%;" id="note" name="note"  rows="5">{{  $order['note'] }}</textarea>
               
                    </td>
                    </tr>  


                       <tr class="row"><td>订单状态</td>
                    <td>
                        
                           <select name="status" >
                                              <option value="">请选择</option>

                                                @foreach ($state_arr as $k=>$v)
                                                    <option value="{{ $k }}">{{ $v }}</option>
                                                @endforeach

                                           
                                         
                                            </select>
               
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
               url : "/admin/order/"+{{ $order['order_id'] }},  
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