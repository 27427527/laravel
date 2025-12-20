 @include('admin.public.header')
    <body>
        <div class="x-nav">
            <span class="layui-breadcrumb">
                <a><cite>首页</cite></a>
                <a><cite>频道管理</cite></a>
            <a> 公共频道</a>

             
               


                   

               
            </span>

            
            <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" onclick="location.reload()" title="刷新">
                <i class="layui-icon layui-icon-refresh" style="line-height:30px"></i>
            </a>
        </div>
        <div class="layui-fluid">
            <div class="layui-row layui-col-space15">
                <div class="layui-col-md12">
                    <div class="layui-card">
                        <div class="layui-card-body ">
                          
                       
                            <form class="layui-form layui-col-space5" id="add_form">

                                 @csrf
                                <div class="layui-input-inline layui-show-xs-block">

 <input type="hidden"  name="channel" value="public" >

                                    <input class="layui-input" placeholder="消息内容" maxlength="20" lay-verify="required"  name="message"></div>
                                <div class="layui-input-inline layui-show-xs-block">
                                    <button class="layui-btn"  lay-submit="" lay-filter="add">发送</button>
                                  
                                </div>
                                <div class="layui-input-inline layui-show-xs-block">
                                    <p>(前台页面右下角会弹窗出来)</p>
                                </div>
                            </form>

                            
                        </div>

                   

                        <div class="layui-card-body ">
                            <table class="layui-table layui-form">
                              <thead>
                                {{-- <tr>
                                 
                                  <th width="70">ID</th>
                                  <th>名称</th>
                                  <th>标题</th>
                                  <th>描叙</th>
                                  <th>图片</th>
                             
                                  <th width="250">操作</th>
                                    </tr> --}}
                              </thead>



                              <tbody class="x-cate">
       


                              


                       
                              </tbody>
                            </table>
                        </div>


                     


                    </div>
                </div>
            </div>
        </div>
        <script>
          layui.use(['form','layer'], function(){
            var form = layui.form;
             var layer = layui.layer;
        

            //发送消息
          form.on('submit(add)', function(data){
           
         
            //发异步，把数据提交给php
            
              $.ajax({
               url : "/admin/channel/public",  
               type : "POST", 
               data : $('#add_form').serialize(),  
               success : function(data) { 

              //  var rs=$.parseJSON(data); 
               var rs=data; 
                if(rs.success){
                layer.msg(rs.message,{icon:1,time:1000});
                        // xadmin.father_reload();
                }else{
                   layer.msg(rs.message,{icon:5,time:1000});
                   
                }
               }
              });
      
            return false;
          });

     


        //   修改状态
        form.on('switch(status)', function(data){

            var id=$(this).attr('data-id');

            var obj=data;

                 $.ajax({
                    url : "/admin/cate/status/"+id,  
                    type : "PUT",  
                    headers: {'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')},  
                    success : function(data) { 
                    
                    var rs=data; 
                    if(rs.success){
                
                        if(obj.elem.checked){

                  
                        layer.msg('已启用!',{icon: 1,time:1000});

                        }else{
                      
                            layer.msg('已禁用!',{icon: 4,time:1000});
                        }
            

                    }else{

                        layer.msg(rs.message,{icon:5,time:1000});

                    }
                
               }
              });
         

       

        });
        
        
        
        });

     


              /*分类-删除*/
      function member_del(obj,id){
          layer.confirm('确认要删除吗？',function(index){
              //发异步删除数据

                $.ajax({
                url : "/admin/brand/"+id,  
                type : "DELETE",  
                headers: {'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')},  
                success : function(data) {
                  // var rs=$.parseJSON(data); 
                    var rs=data; 
                    if(rs.success){
  
                        $(obj).parents("tr").remove();
                        layer.msg(rs.message,{icon:1,time:1000});
  
                    }else{
  
                        layer.msg(rs.message,{icon:4,time:1000});
  
                    }
                  }

                });
           
          });
      }

      /*修改排序*/
      function cate_order(obj,id){

        var order= Number($(obj).val());
        var oldorder=$(obj).attr('data-order');

        if(!Number.isInteger(order)){
            layer.msg('排序必须为整数',{icon:5,time:1000});
             $(obj).val(oldorder);
            return false;
           
        }
        
              //发异步排序数据

                $.ajax({
                url : "/admin/cate/order/"+id,  
                type : "PUT",
                data:{'order':order} ,
                headers: {'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')},  
                success : function(data) {
                    var rs=data; 
                    if(rs.success){
                
                        layer.msg(rs.message,{icon:1,time:1000});
                        location.reload();
  
                    }else{
  
                        layer.msg(rs.message,{icon:5,time:1000});
  
                    }
                  }

                });
           
        
      }

        
   
        </script>
    </body>
</html>
