 @include('admin.public.header')
    <body>
        <div class="x-nav">
            <span class="layui-breadcrumb">
                <a><cite>首页</cite></a>
                @foreach ($nav_list as $v)
                
                <a><cite>{{ $v->name }}</cite></a>

                @endforeach
               


                   

               
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
                          
                       
                                <div class="layui-input-inline layui-show-xs-block">
                                  
                                    <button class="layui-btn"  onclick="xadmin.open('添加','{{'/admin/post/create?cate_id='.$cate['cate_id']}}')"   ><i class="layui-icon"></i>添加</button>
                                </div>
                         

                            
                        </div>

                   

                        <div class="layui-card-body ">
                            <table class="layui-table layui-form">
                              <thead>
                                <tr>
                                 
                                  <th width="70">ID</th>
                                  <th>标题</th>
                                  <th >摘要</th>
                                  <th>图片</th>
                              
                                  <th width="150">发布时间</th>
                                 <th>发布</th>
                                  <th width="200">操作</th>
                              </thead>



                              <tbody class="x-cate">

@foreach ($post_list as $v)
  


                                <tr  >
                                

                                  <td> {{ $v['post_id']}}</td>
                       
                                  <td>{{ $v['title']}}</td>
                                  <td>{{ $v['excerpt']}}</td>
                                  <td> 
                                    <img  src="/storage/{{ $v['image']}}"  height="50"/>
                                    </td>

                                     <td>{{ $v->published_at}}</td>

                              
                                    
                                  <td><input type="checkbox"  {{ $v['is_published'] == "1" ? "checked ":''}} data-id="{{ $v['post_id']}}" lay-filter="active" name="switch"   lay-text="发布|取消"   lay-skin="switch">
                                  </td>
                                  
                                  <td class="td-manage">
                                    <button class="layui-btn layui-btn layui-btn-xs"  onclick="xadmin.open('编辑','{{'/admin/post/'.$v['post_id'].'/edit'}}')" ><i class="layui-icon">&#xe642;</i>编辑</button>
                                    <button class="layui-btn-danger layui-btn layui-btn-xs"  onclick="member_del(this,'{{ $v['post_id']}}')" href="javascript:;" ><i class="layui-icon">&#xe640;</i>删除</button>
                                  </td>
                                </tr>

@endforeach
                          


                              


                       
                              </tbody>
                            </table>
                        </div>


                     


                    </div>
                </div>
            </div>
        </div>

   </div>


<script>






</script>


        <script>





          layui.use(['form','layer'], function(){
            var form = layui.form;
             var layer = layui.layer;
        

     


        //   修改状态
        form.on('switch(active)', function(data){

            var id=$(this).attr('data-id');

            var obj=data;

                 $.ajax({
                    url : "/admin/post/status/"+id,  
                    type : "PUT",  
                    headers: {'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')},  
                    success : function(data) { 
                    
                    var rs=data; 
                    if(rs.success){
                
                        if(obj.elem.checked){

                  
                        layer.msg('已发布!',{icon: 1,time:1000});

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
                url : "/admin/post/"+id,  
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
