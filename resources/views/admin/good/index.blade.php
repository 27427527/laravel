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
                                  
                                    <button class="layui-btn"  onclick="xadmin.open('添加','{{'/admin/good/create?cate_id='.$cate['cate_id']}}')"   ><i class="layui-icon"></i>添加</button>
                                </div>
                         

                            
                        </div>

                   

                        <div class="layui-card-body ">
                            <table class="layui-table layui-form">
                              <thead>
                                <tr>
                                 
                                  <th width="70">ID</th>
                                  <th>名称</th>
                              
                                  <th>价格</th>
                                  <th>原价</th>
                                  <th>库存</th>
                                  <th>编号</th>
                                
                                  <th>品牌</th>
                                  <th>分类</th>
                                  <th>更新时间</th>
                                  <th>推荐</th>
                                  <th>上架</th>
                                  <th width="40">排序</th>
                                  
                             
                                  <th width="">操作</th>
                              </thead>



                              <tbody class="x-cate">

@foreach ($good_list as $v)
  


                                <tr  >
                                

                                  <td style="text-align:center;">
                                       <img  src="/storage/{{ $v['image']}}"  height="50"/>
                                   <p> 
                                      ID: {{ $v['good_id']}}</p>
                                </td>
                                  <td>{{ $v['name']}}</td>
                               
                                  <td>{{ $v['price']}}</td>
                                  <td> {{ $v['original_price']}}</td>
                                  <td>{{ $v['stock']}}</td>
                                  <td>{{ $v['sku']}}</td>
                                 
                                  <td>{{ $v->brands->name}}</td>
                                  <td>
                                    @php
$cates_name = $v->cates->pluck('name')->toArray();
echo implode('，',$cates_name);



@endphp</td>
                                  <td>{{ $v->updated_at}}</td>
                                  
                                 
                                  <td><input type="checkbox"  {{ $v['is_featured'] == "1" ? "checked ":''}} data-id="{{ $v['good_id']}}" lay-filter="featured" name="switch"   lay-text="推荐|移除"   lay-skin="switch">
                                  </td>

                                  <td><input type="checkbox"  {{ $v['is_active'] == "1" ? "checked ":''}} data-id="{{ $v['good_id']}}" lay-filter="active" name="switch"   lay-text="上架|下架"   lay-skin="switch">
                                  </td>

                                <td><input type="number" class="layui-input x-sort" data-order="{{ $v['sort_order']}}" onchange="cate_order(this,{{ $v['good_id']}})" name="sort_order" value="{{ $v['sort_order']}}"></td>
                                  

                                  <td class="td-manage">
                                    <button class="layui-btn layui-btn layui-btn-xs"  onclick="xadmin.open('编辑','{{'/admin/good/'.$v['good_id'].'/edit'}}')" >商品编辑</button>
                                    <button class="layui-btn layui-btn-normal layui-btn-xs"  onclick="xadmin.open('属性编辑','{{'/admin/good/attr/'.$v['good_id'].'/edit'}}')" >属性编辑</button>
                                    <button class="layui-btn layui-btn-normal layui-btn-xs"  onclick="xadmin.open('价格编辑','{{'/admin/good/eprice/'.$v['good_id'].'/edit'}}')" >价格编辑</button>
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
          layui.use(['form','layer','upload'], function(){
            var form = layui.form;
            var upload = layui.upload;
             var layer = layui.layer;

 

        //   修改上架
        form.on('switch(active)', function(data){

            var id=$(this).attr('data-id');

            var obj=data;

                 $.ajax({
                    url : "/admin/good/active/"+id,  
                    type : "PUT",  
                    headers: {'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')},  
                    success : function(data) { 
                    
                    var rs=data; 
                    if(rs.success){
                
                        if(obj.elem.checked){
                  
                        layer.msg('已上架!',{icon: 1,time:1000});

                        }else{
                      
                            layer.msg('已下架!',{icon: 4,time:1000});
                        }

                    }else{

                        layer.msg(rs.message,{icon:5,time:1000});

                    }
               }
              });
        });
        
        //   修改推荐
        form.on('switch(featured)', function(data){

            var id=$(this).attr('data-id');

            var obj=data;

                 $.ajax({
                    url : "/admin/good/featured/"+id,  
                    type : "PUT",  
                    headers: {'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')},  
                    success : function(data) { 
                    
                    var rs=data; 
                    if(rs.success){
                
                        if(obj.elem.checked){
                  
                        layer.msg('已推荐!',{icon: 1,time:1000});

                        }else{
                      
                            layer.msg('已取消!',{icon: 4,time:1000});
                        }

                    }else{

                        layer.msg(rs.message,{icon:5,time:1000});

                    }
               }
              });
        });
        
        
        });

     



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
                url : "/admin/good/order/"+id,  
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
