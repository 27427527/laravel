 @include('admin.public.header')
    <body>
        <div class="x-nav">
            <span class="layui-breadcrumb">
                <a><cite>首页</cite></a>
                <a><cite>分类管理</cite></a>
                <a>
                    {{ $cate['name']}}</a>


                   

               
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
                                    <input class="layui-input" placeholder="顶级分类名"  lay-verify="required"  name="name"></div>
                                <div class="layui-input-inline layui-show-xs-block">
                                    <button class="layui-btn"  lay-submit="" lay-filter="add"><i class="layui-icon"></i>增加</button>
                                </div>
                            </form>
                        </div>

                   

                        <div class="layui-card-body ">
                            <table class="layui-table layui-form">
                              <thead>
                                <tr>
                                 
                                  <th width="70">ID</th>
                                  <th>栏目名</th>
                                  <th width="50">排序</th>
                                  <th width="80">状态</th>
                                  <th width="250">操作</th>
                              </thead>



                              <tbody class="x-cate">


                                <tr cate-id='{{ $cate['cate_id'] }} ' fid='{{ $cate['parent_id'] }} ' >
                                

                                  <td> {{ $cate['cate_id']}}</td>
                                  <td>
                                    <i class="layui-icon x-show" status='false'>&#xe625;</i>
                                     {{ $cate['name']}}
                                  </td>

                                  <td><input type="text" class="layui-input x-sort" data-order="{{ $cate['order']}}" onchange="cate_order(this,{{ $cate['cate_id']}})" name="order" value="{{ $cate['order']}}"></td>
                                  <td>
                                    <input type="checkbox"  {{ $cate['is_active'] == "1" ? "checked ":''}} data-id="{{ $cate['cate_id']}}" lay-filter="status" name="switch"   lay-text="开启|停用"   lay-skin="switch">
                                  </td>
                                  <td class="td-manage">
                                    <button class="layui-btn layui-btn layui-btn-xs"  onclick="xadmin.open('编辑','{{'/admin/cate/'.$cate['cate_id'].'/edit'}}')" ><i class="layui-icon">&#xe642;</i>编辑</button>
                                    <button class="layui-btn layui-btn-warm layui-btn-xs"  onclick="xadmin.open('编辑','{{'/admin/cate/create?parent_id='.$cate['cate_id'] }}')" ><i class="layui-icon">&#xe642;</i>添加子栏目</button>
                                    <button class="layui-btn-danger layui-btn layui-btn-xs"  onclick="member_del(this,'{{ $cate['cate_id']}}')" href="javascript:;" ><i class="layui-icon">&#xe640;</i>删除</button>
                                  </td>
                                </tr>


                                @foreach($cate_list as $v)

                                <tr cate-id='{{ $v['cate_id']}}' fid='{{ $v['parent_id']}}' >
                               
                                  <td>{{ $v['cate_id']}}</td>
                                  <td>

                                
                                @php
                             
                                  $original = "&nbsp;&nbsp;&nbsp;&nbsp;";
                                $copy = str_repeat($original, $v['level']);
                                echo $copy;
                                @endphp

                                @if ($v->children_count>0)
                                      <i class="layui-icon x-show" status='false'>&#xe625;</i>
                                @else
                                  ├
                                @endif
                                {{ $v['name']}}
                                  </td>

                                <td><input type="text" class="layui-input x-sort" data-order="{{ $v['order']}}" onchange="cate_order(this,{{ $v['cate_id']}})" name="order" value="{{ $v['order']}}"></td>
                                  <td>
                                    <input type="checkbox"  {{ $v['is_active'] == "1" ? "checked ":''}} data-id="{{ $v['cate_id']}}" lay-filter="status" name="switch"   lay-text="开启|停用"   lay-skin="switch">
                                  </td>
                                  <td class="td-manage">
                                    <button class="layui-btn layui-btn layui-btn-xs"  onclick="xadmin.open('编辑','{{'/admin/cate/'.$v['cate_id'].'/edit'}}')" ><i class="layui-icon">&#xe642;</i>编辑</button>
                                    <button class="layui-btn layui-btn-warm layui-btn-xs"  onclick="xadmin.open('编辑','{{'/admin/cate/create?parent_id='.$v['cate_id'] }}')" ><i class="layui-icon">&#xe642;</i>添加子栏目</button>
                                    <button class="layui-btn-danger layui-btn layui-btn-xs"  onclick="member_del(this,'{{ $v['cate_id']}}')" href="javascript:;" ><i class="layui-icon">&#xe640;</i>删除</button>
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
        <script>
          layui.use(['form','layer'], function(){
            var form = layui.form;
             var layer = layui.layer;
        

            //修改分类
          form.on('submit(add)', function(data){
           
         
            //发异步，把数据提交给php
            
              $.ajax({
               url : "/admin/cate",  
               type : "POST", 
               data : $('#add_form').serialize(),  
               success : function(data) { 

              //  var rs=$.parseJSON(data); 
               var rs=data; 
                if(rs.success){
                layer.msg(rs.message,{icon:1,time:1000});
                        xadmin.father_reload();
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
                url : "/admin/cate/"+id,  
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

          // 分类展开收起的分类的逻辑
          // 
          $(function(){
            // $("tbody.x-cate tr[fid!='0']").hide();
            // 栏目多级显示效果
            $('.x-show').click(function () {
                if($(this).attr('status')=='true'){
                    $(this).html('&#xe625;'); 
                    $(this).attr('status','false');
                    cateId = $(this).parents('tr').attr('cate-id');
                    $("tbody tr[fid="+cateId+"]").show();
               }else{
                    cateIds = [];
                    $(this).html('&#xe623;');
                    $(this).attr('status','true');
                    cateId = $(this).parents('tr').attr('cate-id');
                    getCateId(cateId);
                    for (var i in cateIds) {
                        $("tbody tr[cate-id="+cateIds[i]+"]").hide().find('.x-show').html('&#xe623;').attr('status','true');
                    }
               }
            })
          })

          var cateIds = [];
          function getCateId(cateId) {
              $("tbody tr[fid="+cateId+"]").each(function(index, el) {
                  id = $(el).attr('cate-id');
                  cateIds.push(id);
                  getCateId(id);
              });
          }
   
        </script>
    </body>
</html>
