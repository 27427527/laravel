@include('admin.public.header')
    
    <body>
        <div class="x-nav">
          <span class="layui-breadcrumb">
            <a href="">首页</a>
            <a href="">会员管理</a>
            <a>
              <cite>VIP列表</cite></a>
          </span>
          <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" onclick="location.reload()" title="刷新">
            <i class="layui-icon layui-icon-refresh" style="line-height:30px"></i></a>
        </div>
        <div class="layui-fluid">
            <div class="layui-row layui-col-space15">
                <div class="layui-col-md12">
                    <div class="layui-card">
                        <div class="layui-card-body ">
                            <form class="layui-form layui-col-space5" action="{{ url('admin/member') }}" method="get">

    
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

                     
                        <div class="layui-card-body ">
                            <table class="layui-table layui-form">
                              <thead>
                                <tr>
                                  {{-- <th>
                                    <input type="checkbox" name=""  lay-skin="primary">
                                  </th> --}}
                                  <th>ID</th>
                                  <th>昵称名</th>
                                  <th>手机</th>
                                    <th>邮箱</th>
                                    <th>VIP</th>
                                  
                                  <th>创建时间</th>
                                  <th>状态</th>
                                  <th>操作</th>
                              </thead>
                              <tbody>
                                @foreach ($member_list as $v)
                                    
                       
                                <tr>
                                  {{-- <td>
                                    <input type="checkbox" name=""  lay-skin="primary">
                                  </td> --}}
                                  <td>{{$v->id}}</td>
                                  <td>{{$v->name}}</td>
                                  <td>{{$v->phone}}</td>
                                 
                                  <td>{{$v->email}}</td>
                                    <td><input type="checkbox"  {{ $v['is_vip'] == "1" ? "checked ":''}} data-id="{{ $v['id']}}" lay-filter="is_vip" name="switch"   lay-text="启用|禁用"   lay-skin="switch">
                                  </td>
                                  <td>{{$v->created_at}}</td>

                                  

                                    <td><input type="checkbox"  {{ $v['status'] == "1" ? "checked ":''}} data-id="{{ $v['id']}}" lay-filter="active" name="switch"   lay-text="启用|禁用"   lay-skin="switch">
                                  </td>

                                  <td class="td-manage">

                                  
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
    {{ $member_list->links() }}
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


             /*is_vip*/
        //   修改状态
        form.on('switch(is_vip)', function(data){

            var id=$(this).attr('data-id');

            var obj=data;

                 $.ajax({
                    url : "/admin/member/is_vip/"+id,  
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
            
                        location.reload();
                    }else{

                        layer.msg(rs.message,{icon:5,time:1000});

                    }
                
               }
              });
        });



       /*用户-停用*/
        //   修改状态
        form.on('switch(active)', function(data){

            var id=$(this).attr('data-id');

            var obj=data;

                 $.ajax({
                    url : "/admin/member/status/"+id,  
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

      /*用户-删除*/
      function member_del(obj,id){
          layer.confirm('确认要删除吗？',function(index){
              //发异步删除数据

                $.ajax({
                url : "/admin/member/"+id,  
                type : "DELETE",  
                headers: {'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')},  
                success : function(data) {
                  // var rs=$.parseJSON(data); 
                    var rs=data; 
                    if(rs.success){
  
                        $(obj).parents("tr").remove();
                        layer.msg(rs.message,{icon:1,time:1000});
                        loaction.reload();
  
                    }else{
  
                        layer.msg(rs.message,{icon:5,time:1000});
  
                    }
                  }

                });
           
          });
      }



    
    </script>

</html>