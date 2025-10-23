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
                            <form class="layui-form layui-col-space5" action="{{ url('admin/user') }}" method="get">

    
                                <div class="layui-inline layui-show-xs-block">
                                    <input class="layui-input laydate-input"  value="{{ request('start', '') }}"  autocomplete="off"  placeholder="开始日" name="start" id="start">
                                </div>
                                <div class="layui-inline layui-show-xs-block">
                                    <input class="layui-input laydate-input"  value="{{ request('end', '') }}"  autocomplete="off"  placeholder="截止日" name="end" id="end">
                                </div>
                                <div class="layui-inline layui-show-xs-block">
                                    <input type="text" name="keyword" value="{{ request('keyword', '') }}"  placeholder="请输入" autocomplete="off" class="layui-input">
                                </div>
                                <div class="layui-inline layui-show-xs-block">
                                    <button class="layui-btn"  lay-submit="" lay-filter="sreach"><i class="layui-icon">&#xe615;</i></button>
                                </div>
                            </form>
                        </div>
                        <div class="layui-card-header">
                            {{-- <button class="layui-btn layui-btn-danger" onclick="delAll()"><i class="layui-icon"></i>批量删除</button> --}}
                            <button class="layui-btn" onclick="xadmin.open('添加用户','{{ url('admin/user/create') }}',800,600)"><i class="layui-icon"></i>添加</button>
                        </div>
                        <div class="layui-card-body ">
                            <table class="layui-table layui-form">
                              <thead>
                                <tr>
                                  {{-- <th>
                                    <input type="checkbox" name=""  lay-skin="primary">
                                  </th> --}}
                                  <th>ID</th>
                                  <th>登录名</th>
                                  <th>手机</th>
                                    <th>姓名</th>
                                  
                                  <th>加入时间</th>
                                  <th>状态</th>
                                  <th>操作</th>
                              </thead>
                              <tbody>
                                @foreach ($users as $v)
                                    
                       
                                <tr>
                                  {{-- <td>
                                    <input type="checkbox" name=""  lay-skin="primary">
                                  </td> --}}
                                  <td>{{$v->id}}</td>
                                  <td>{{$v->username}}</td>
                                  <td>{{$v->phone}}</td>
                                 
                                  <td>{{$v->real_name}}</td>
                                  <td>{{$v->created_at}}</td>
                                  <td class="td-status">
                                    @if($v->status=='0')
                                    <span class="layui-btn layui-btn-normal layui-btn-disabled layui-btn-mini">已停用</span>

                                     @else

                                    <span class="layui-btn layui-btn-normal layui-btn-mini">已启用</span></td>
                                    @endif

                                  <td class="td-manage">
                                    @if($v->status=='1')


                                    <a onclick="member_stop(this,'{{$v->id}}')" href="javascript:;"  title="启用">
                                      <i class="layui-icon">&#xe601;</i>
                                    </a>

                                    @else
                                    <a onclick="member_stop(this,'{{$v->id}}')" href="javascript:;"  title="停用">
                                      <i class="layui-icon">&#xe62f;</i>
                                    </a>

                                    @endif

                                    <a title="编辑"  onclick="xadmin.open('编辑','{{'/admin/user/'.$v->id.'/edit'}}')" href="javascript:;">
                                      <i class="layui-icon">&#xe642;</i>
                                    </a>
                                    <a title="删除" onclick="member_del(this,'{{$v->id}}')" href="javascript:;">
                                      <i class="layui-icon">&#xe640;</i>
                                    </a>
                                  </td>
                                </tr>
                                  @endforeach
                              </tbody>
                            </table>
                        </div>
                        <div class="layui-card-body ">

                          <div class="pagination">
    {{ $users->links() }}
</div>



    </div>
</div>
                        
                        </div>
                    </div>
                </div>
            </div>
        </div> 
    </body>
    <script>
      layui.use(['laydate','form'], function(){
        var laydate = layui.laydate;
        var form = layui.form;
        
 

           $('.laydate-input').each(function(){
              laydate.render({
              elem: this
              ,position: 'fixed'
              ,type: 'datetime'
              });
            });

   });

       /*用户-停用*/

          function member_stop(obj,id){
          layer.confirm('确认要修改吗？',function(index){

            console.log(id);

                     $.ajax({
               url : "/admin/user/status/"+id,  
               type : "PUT",  
               headers: {'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')},  
               success : function(data) { 

              //  var rs=$.parseJSON(data); 
               var rs=data; 
                if(rs.success){
              
                    if($(obj).attr('title')=='启用'){

                    //发异步把用户状态进行更改
                    $(obj).attr('title','停用')
                    $(obj).find('i').html('&#xe62f;');

                    $(obj).parents("tr").find(".td-status").find('span').addClass('layui-btn-disabled').html('已停用');
                    layer.msg('已停用!',{icon: 4,time:1000});

                  }else{
                    $(obj).attr('title','启用')
                    $(obj).find('i').html('&#xe601;');

                    $(obj).parents("tr").find(".td-status").find('span').removeClass('layui-btn-disabled').html('已启用');
                    layer.msg('已启用!',{icon: 1,time:1000});
                  }
         

                }else{

                    layer.msg(rs.message,{icon:5,time:1000});

                }
                
               }
              });

             
              
          });
      }


      /*用户-删除*/
      function member_del(obj,id){
          layer.confirm('确认要删除吗？',function(index){
              //发异步删除数据

                $.ajax({
                url : "/admin/user/"+id,  
                type : "DELETE",  
                headers: {'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')},  
                success : function(data) {
                  // var rs=$.parseJSON(data); 
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



      function delAll (argument) {

        var data = tableCheck.getData();
  
        layer.confirm('确认要删除吗？'+data,function(index){
            //捉到所有被选中的，发异步进行删除
            layer.msg('删除成功', {icon: 1});
            $(".layui-form-checked").not('.header').parents('tr').remove();
        });
      }
    </script>

</html>