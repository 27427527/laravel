@include('admin.public.header')
    <body>
        <div class="x-nav">
          <span class="layui-breadcrumb">
            <a href="">首页</a>
            <a href="">演示</a>
            <a>
              <cite>导航元素</cite></a>
          </span>
          <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" onclick="location.reload()" title="刷新">
            <i class="layui-icon layui-icon-refresh" style="line-height:30px"></i></a>
        </div>
        <div class="layui-fluid">
            <div class="layui-row layui-col-space15">
                <div class="layui-col-md12">
                    <div class="layui-card">
                        <div class="layui-card-body ">
                            <form class="layui-form layui-form-pane" id="add_form" action="" method="post" class="layui-form " >
                                @csrf
                                
                                <div class="layui-inline layui-show-xs-block">
                                    <input type="text" name="cate_name"  placeholder="分类名" lay-verify="required" autocomplete="off" class="layui-input">
                                </div>
                                <div class="layui-inline layui-show-xs-block">

                                    <button class="layui-btn "  lay-submit="" lay-filter="add"><i class="layui-icon"></i>增加</button>
                                </div>
                            </form>
                        </div>

                    

                        <div class="layui-card-body ">
                            <table class="layui-table ">
                                <thead>
                                  <tr>
                                 
                                    <th>ID</th>
                                    <th>分类名</th>
                                    <th>操作</th>
                                </thead>
                                <tbody>



                                  @foreach ($cate_list as $v )
                                    
                                
                                  <tr>
                                  
                                    <td>{{$v->permission_cate_id}}</td>
                                    <td>{{$v->cate_name}}</td>
                                    <td class="td-manage">
                                      <a title="编辑"  onclick="xadmin.open('编辑','{{'/admin/permissioncate/'.$v->permission_cate_id.'/edit'}}')" href="javascript:;">
                                        <i class="layui-icon">&#xe642;</i>
                                      </a>

                                         <a title="删除" onclick="member_del(this,'{{$v->permission_cate_id}}')" href="javascript:;">
                                        <i class="layui-icon">&#xe640;</i>
                                      </a>

                                    
                                    </td>
                                  </tr>

                                    @endforeach
                                </tbody>
                              </table>
                        </div>
                        <div class="layui-card-body ">
                            <div class="page">
                                <div>
                                  <a class="prev" href="">&lt;&lt;</a>
                                  <a class="num" href="">1</a>
                                  <span class="current">2</span>
                                  <a class="num" href="">3</a>
                                  <a class="num" href="">489</a>
                                  <a class="next" href="">&gt;&gt;</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div> 
    </body>

    
    <script>
      layui.use(['form','laydate','layer'], function(){

           $ = layui.jquery;
        var laydate = layui.laydate;
        var form = layui.form;

    
        var layer = layui.layer;

          form.render();
        
        //执行一个laydate实例
        laydate.render({
          elem: '#start' //指定元素
        });

        //执行一个laydate实例
        laydate.render({
          elem: '#end' //指定元素
        });
     

       //监听提交
          form.on('submit(add)', function(data){
           
         
            //发异步，把数据提交给php
            
              $.ajax({
               url : "/admin/permissioncate",  
               type : "POST", 
               data : $('#add_form').serialize(),  
               success : function(data) { 

              //  var rs=$.parseJSON(data); 
               var rs=data; 
                if(rs.success){

                     layer.msg(rs.message);
                

                  
                        location.reload();
                
                 
                }else{
                    layer.msg(rs.message);
                   
                }
               }
              });
      
            return false;
          });

 });

          // 分类-删除
          function member_del(obj,id){
            layer.confirm('确认要删除吗？',function(index){
              //发异步删除数据

                $.ajax({
                url : "/admin/permissioncate/"+id,  
                type : "DELETE",  
                headers: {'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')},  
                success : function(data) {
                    var rs=data; 
                    if(rs.success){
  
                        $(obj).parents("tr").remove();
                        layer.msg(rs.message,{icon:1,time:1000});
  
                    }else{
  
                        layer.msg(rs.message,{icon:5,time:1000});
  
                    }
                  }

                });
            });
         }

    </script>
   
</html>