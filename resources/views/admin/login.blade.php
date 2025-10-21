<!doctype html>
<html  class="x-admin-sm">
<head>
	<meta charset="UTF-8">
	<title>后台登录</title>
	<meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="stylesheet" href="{{asset('css/font.css')}}">
    <link rel="stylesheet" href="{{asset('css/login.css')}}">
	  <link rel="stylesheet" href="{{asset('css/xadmin.css')}}">
    <script type="text/javascript" src="{{asset('js/jquery.min.js')}}"></script>
    <script src="{{asset('lib/layui/layui.js')}}" charset="utf-8"></script>
    <!--[if lt IE 9]>
      <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
      <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

    <style>
     #captcha{
      position:absolute;top: 265px;
      left: 218px;margin-top: 0px;
      margin-left: 5px;height: 50px;
      border-radius: 3px;
      width:157px;
    }
    </style>
</head>

<body class="login-bg">
    
    <div class="login layui-anim layui-anim-up">
        <div class="message">管理登录  </div>
        <div id="darkbannerwrap"></div>
        
        <form method="post" class="layui-form" id="login_form" >
           @csrf
            <input name="username" maxlength="15" placeholder="用户名"  type="text" lay-verify="required" class="layui-input" >
            <hr class="hr15">
            <input name="password" maxlength="20" lay-verify="required" placeholder="密码"  type="password" class="layui-input">
            <hr class="hr15">
            <input name="captcha" maxlength="4" style="width: 175px;" lay-verify="required" placeholder="验证码"  type="text" class="layui-input">

	          <img id="captcha" style="" title="点击可更换验证码" src="{{ captcha_src('default') }}" alt="" onclick="this.src='{{ captcha_src('default') }}&code='+Math.random()">
              <hr class="hr20" >
            <input value="登录" lay-submit lay-filter="login" style="width:100%;" type="submit">

            <hr class="hr20" >
        </form>
    </div>

    <script>
          $(function  () {

            layui.use(['form','layer'], function(){
              var form = layui.form;
              var layer = layui.layer;
           
              form.on('submit(login)', function(data){
           
              $.ajax({
               url : "{{ url('/admin/login') }}",  
               type : "POST",  
               data : $('#login_form').serialize(),  
               success : function(data) { 

              //  var rs=$.parseJSON(data); 
               var rs=data; 
                if(rs.success){
                
                    location.href="{{ url('/admin/index') }}";
                }else{
                    layer.msg(rs.message);
                    $('#captcha').click();
                }
               }
              });
                return false;
              });

            });




        });
    </script>
    <!-- 底部结束 -->

</body>
</html>