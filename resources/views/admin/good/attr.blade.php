@include('admin.public.header')
<body>


  <style>
 .attr-div{
        border:1px solid #ececec;
    
        width:150px;
    }
    .attr-div input{
        width: 100px;
        display: inline;

    }
</style>
  <div class="layui-fluid">
        <div class="layui-row">
           
       
               <div class="layui-form-item" id="layui-form-item">


                                <div class="layui-input-inline layui-show-xs-block" style="width: 130px;">
                                    <input class="layui-input" placeholder="请输入属性名"  id="attr_name" name="name">
                                    </div>

                                <div class="layui-input-inline layui-show-xs-block" style="width: 100px;margin-bottom:20px;">
                                    <a id="add_name" class="layui-btn"><i class="layui-icon"></i>增加属性</a>
                                </div>

                           


{{-- 存放属性表 --}}
<table class='layui-table layui-form'><tbody id='attr_name_table'>
  <tr><th>属性名</th><th>操作</th></tr>

  @foreach ($good->attr_names as $v)
    <tr id='attr_tr{{ $v->attr_name_id }}'><td>{{$v->name}}</td><td><a data-id="{{$v->attr_name_id}}" class='layui-btn layui-btn-danger layui-btn-sm del_all'>删除</a><a data-id="{{$v->attr_name_id}}" data-name="{{$v->name}}"  class='layui-btn layui-btn-sm add_val'>添加值</a></td></tr>
  @endforeach
 
</tbody></table>
  <form action="" id="role_form"  class="layui-form layui-form-pane" >  
{{-- 存放属性值表 --}}
<div id="attr-table-list">
   @foreach ($good->attr_names as $v)
   <table class='layui-table layui-form'><tbody id='attr_table{{$v->attr_name_id}}'><tr><th>属性名</th><th>属性值</th><th>操作</th></tr>
   @foreach ($v->attr_vals as $v2)
  <tr><td>{{ $v->name }}</td><td><input class='layui-input' value="{{ $v2->name }}" placeholder='属性值' name='attr_name[{{ $v->attr_name_id }}][]'></td><td><a  class='del_val layui-btn layui-btn-danger layui-btn-sm'>删除</a></td></tr>
    @endforeach
  </tbody></table>
  @endforeach
</div>

                                    



 </div></div>
  <div class="layui-form-item">
                <button class="layui-btn layui-btn-sub" lay-submit="" lay-filter="add">确认提交</button>
              </div>

</form>
</div>  

<script>

$(function() {

const good_id={{ $good->good_id }};



// 添加新属性
$('#add_name').click(function(){
  var attr_name=$('#attr_name').val();

  if(!attr_name){

    layer.msg('请输入属性名称')
    return false;
  }else{


      $.ajax({
        url : "/admin/attrname",  
        type : "POST", 
        headers: {'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')},   
        data :{'good_id':good_id,'name':attr_name},  
        success : function(data) { 

          var rs=data; 
          if(rs.success){
            layer.msg(rs.message);
            
            $('#attr_name').val('');
              
            attr_name_id=rs.attr_name_id;
           
              // 属性表添加一行
              var tr="<tr id='attr_tr"+attr_name_id+"'><td>"+attr_name+"</td><td><a data-id="+attr_name_id+" class='layui-btn layui-btn-danger layui-btn-sm del_all'>删除</a><a data-id="+attr_name_id+" data-name="+attr_name+"  class='layui-btn layui-btn-sm add_val'>添加值</a></td></tr>"
              $("#attr_name_table").append(tr);

              //  新建属性值表

              var table="<table class='layui-table layui-form'><tbody id='attr_table"+attr_name_id+"'><tr><th>属性名</th><th>属性值</th><th>操作</th></tr></tbody></table>"
              $("#attr-table-list").append(table);

            }else{
                layer.msg(rs.message);
                
            }
        }
      });
   }
});

       // 删除当前属性所有
$('#attr_name_table').on('click','.del_all',function(){

   var name_id=$(this).attr('data-id');
   


      $.ajax({
        url : "/admin/attrname/"+name_id,  
        type : "DELETE", 
        headers: {'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')},   
        success : function(data) { 

          var rs=data; 
          if(rs.success){
            layer.msg(rs.message);

          //  删除所在行
           

            $('#attr_tr'+name_id).remove();

              //  删除关联table
            $('#attr_table'+name_id).remove();


          }else{
                layer.msg(rs.message);
                
          }
        }
      });
});


       // 添加新属性值
$('#attr_name_table').on('click','.add_val',function(){

  var name_id=$(this).attr('data-id');
  var attr_name=$(this).attr('data-name');

  var tr="<tr><td>"+attr_name+"</td><td><input class='layui-input' placeholder='属性值' name='attr_name["+name_id+"][]'></td><td><a  class='del_val layui-btn layui-btn-danger layui-btn-sm'>删除</a></td></tr>";
 
  // 归属 属性值表添加一行
    $('#attr_table'+name_id).append(tr);
});

       // 删除当前属性值
$('#attr-table-list').on('click','.del_val',function(){
   
    $(this).parents('tr').remove();
});
   



});

</script>
 


                         

    <script>
        layui.use(['form','layer','upload'], function(){
            $ = layui.jquery;
          var form = layui.form
          ,layer = layui.layer;

          var upload=layui.upload;

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

       
  // 多图片上传
  upload.render({
    elem: '#image_list',
    multiple: true,
    url: '/admin/upfile', //上传接口
    data: {'dir': 'img'},
    auto: true,
    bindAction: '#images_action',
    headers: {'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')},
    done: function(res){

     
      // 上传完毕返回的图片链接保存到隐藏域
       if(res.success == true){
        var url="/storage/"+res.filedata.path;
        $('#upload-demo-preview').append('<li class="pre-li" data-image="'+res.filedata.path+'" ><input type="hidden" name="images[]" value="'+res.filedata.path+'" ><i class="icon iconfont">&#xe6b7;</i><img class="pre-img" src="'+url+'"  ></li>');
      }
    },
    allDone: function(obj){
    //  console.log(obj.total); // 上传的文件总数
    //  console.log(obj.successful); // 上传成功的文件数
    //  console.log(obj.failed); // 上传失败的文件数

     
    // layer.msg(obj.total+'个文件上传成功',{icon: 1,time:1500});
    
    },
  });

      





// 单图片上传
         var uploadInst = upload.render({
        accept: 'images', //图片上传
        elem: '.lay_up', //绑定元素
        field:'file',
        url: '/admin/upfile', //上传接口
        data: {'dir': 'img'},
          headers: {'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')},
        before:function(obj){
          var item = this.item;
          var id=$(item).attr('data-id');
           $('#'+id+'_upload-dan-preview').html('');
          layer.load("数据提交中，请稍等！",false);
          },
        done: function(res){
      if(res.success == true){
          layer.closeAll();
         var item = this.item;
          var id=$(item).attr('data-id');
        var url="/storage/"+res.filedata.path;
        $('#'+id+'_upload-dan-preview').append('<li class="pre-li" data-image="'+res.filedata.path+'" ><input type="hidden" name="image" value="'+res.filedata.path+'" ><i class="icon iconfont">&#xe6b7;</i><img class="pre-img" src="'+url+'" ></li>');
      }
          // storage\img
        },
        error: function(){
          //请求异常回调
        }
      });

          //监听提交
          form.on('submit(add)', function(data){
            // console.log(data);
            //发异步，把数据提交给php
            
              $.ajax({
               url : "/admin/attrval",  
               type : "POST", 
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


        //  图片上传 删除图片
$(".layui-upload-list").on("click", ".pre-li", function () {
    var image = $(this).attr("data-image");

    delete_img(image);

    $(this).remove();
});

$(".layui-upload-list").on("mouseover", ".pre-li", function () {
    $(this).find(".iconfont").show();
});

$(".layui-upload-list").on("mouseleave", ".pre-li", function () {
    $(this).find(".iconfont").hide();
});

    </script>
   
  </body>

</html>