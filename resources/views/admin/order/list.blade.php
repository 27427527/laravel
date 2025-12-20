 @include('admin.public.header')

<style>


.item-details{
width:150px;
height:80px;
display:flex;
gap:10px;
}

.item-img{
width:80px;
height:80px;

}
.item-info{
flex:1;
}

.item-info p{

font-size:13px;
line-height:27px;

}

.item-attr{
border-bottom:1px solid #ccc;
margin-bottom:10px;
}

.layui-table td, .layui-table th {
min-width: 30px;
}
</style>
    <body>
        <div class="x-nav">
            <span class="layui-breadcrumb">
                <a href="">首页</a>

                <a>
                    <cite>订单列表</cite></a>
            </span>
            <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" onclick="location.reload()" title="刷新">
                <i class="layui-icon layui-icon-refresh" style="line-height:30px"></i>
            </a>
        </div>
        <div class="layui-fluid">
            <div class="layui-row layui-col-space15">

                <div class="layui-col-md12">

                    <div class="layui-card">




                        <div class="layui-card-header">


                        <div class="layui-card-body ">
                            <form class="layui-form layui-col-space5" action="{{ url('admin/order') }}" method="get">


                                <div class="layui-inline layui-show-xs-block">
                                    <input class="layui-input laydate-input"  value="{{ request('start', '') }}"  autocomplete="off"  placeholder="开始日" name="start" id="start">
                                </div>
                                <div class="layui-inline layui-show-xs-block">
                                    <input class="layui-input laydate-input"  value="{{ request('end', '') }}"  autocomplete="off"  placeholder="截止日" name="end" id="end">
                                </div>


                                <div class="layui-inline layui-show-xs-block" >


                                  <div class="layui-input-inline">
                                    <select name="status"  lay-search="">
                                      <option value="">订单状态</option>
                                            @foreach ($state_arr as $k=>$v)
                                            <option value="{{ $k }}">{{ $v }}</option>
                                        @endforeach

                                    </select>
                                  </div>
                                </div>

                                <div class="layui-inline layui-show-xs-block">
                                    <input type="text" name="keyword" value="{{ request('keyword', '') }}"  placeholder="请输入" autocomplete="off" class="layui-input">
                                </div>

                                <div class="layui-inline layui-show-xs-block">
                                    <button class="layui-btn"  lay-submit="" lay-filter="sreach"><i class="layui-icon">&#xe615;</i></button>
                                </div>

                                 </div>
                            </form>


                        </div>


                        <div class="layui-card-body ">
                            <table class="layui-table layui-form">
                                <thead>
                                    <tr>



                                        <th>商品信息</th>
                                              <th>订单编号</th>
                                        <th>收货人</th>
                                        <th>总金额</th>
                                        <th>应付金额</th>
                                        <th>订单状态</th>
                                        <th>支付状态</th>

                                        <th>支付方式</th>
                                        <th>配送方式</th>
                                        <th>快递单号</th>

                                        <th>客户备注</th>
                                        <th>后台备注</th>
                                          <th>下单时间</th>
                                        <th>操作</th></tr>
                                </thead>
                                <tbody>

                                  @foreach ($order_list as $order)
                                    <tr>
                                          <td>
                                    @foreach ( $order->items as $item )

                                          <div class="item-details">


                                            <img src="{{ env('IMAGE_URL').$item->image }}" class="item-img"/>
                                          <div class="item-info">

                                            <p>{{ $item->good_name }}</p>
                                            <p>{{ $item->good_price }}</p>
                                            <p>数量:{{ $item->quantity }}</p>

                                          </div>
                                      </div>
                                          <p class="item-attr">
                                          @php

                                                if($item->category){
                                                    foreach ( $item->category as $k =>$attr ){
                                                          echo $k.":". $attr." ";
                                                    }
                                                }

                                            @endphp
                                        </p>


                            @endforeach
                            </td>



                                        <td> {{ $order->order_no }}</td>
                                        <td> {{ $order->name.':'.$order->phone }}</td>
                                        <td>{{ $order->total_amount }}</td>
                                        <td>{{ $order->pay_amount }}</td>
                                        <td>{{  $state_arr[$order->status] }}</td>
                                        <td>{{ $order->pay_at?'已支付':'未支付' }}</td>

                                        <td>{{ $pay_arr[$order->payment_method] }}</td>
                                        <td>{{ $order->express_name }}</td>
                                        <td>{{ $order->express_no }}</td>
                                       <td>{{ $order->remake }}</td>
                                       <td>{{ $order->note }}</td>
                                        <td>{{ $order->created_at }}</td>

                                        <td class="">
                                            <a title="查看" onclick="xadmin.open('编辑','{{'/admin/order/'.$order->order_id.'/edit'}}')" href="javascript:;">
                                                <i class="layui-icon">&#xe63c;</i></a>

                                        </td>
                                    </tr>
                                            @endforeach

                                </tbody>
                            </table>
                        </div>
                        <div class="layui-card-body ">


                          <div class="pagination">
    {{ $order_list->links() }}




    </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
    <script>layui.use(['laydate', 'form'],
        function() {
            var laydate = layui.laydate;

            //执行一个laydate实例
            laydate.render({
                elem: '#start' //指定元素
            });

            //执行一个laydate实例
            laydate.render({
                elem: '#end' //指定元素
            });
        });

        /*用户-停用*/
        function member_stop(obj, id) {
            layer.confirm('确认要停用吗？',
            function(index) {

                if ($(obj).attr('title') == '启用') {

                    //发异步把用户状态进行更改
                    $(obj).attr('title', '停用');
                    $(obj).find('i').html('&#xe62f;');

                    $(obj).parents("tr").find(".td-status").find('span').addClass('layui-btn-disabled').html('已停用');
                    layer.msg('已停用!', {
                        icon: 5,
                        time: 1000
                    });

                } else {
                    $(obj).attr('title', '启用');
                    $(obj).find('i').html('&#xe601;');

                    $(obj).parents("tr").find(".td-status").find('span').removeClass('layui-btn-disabled').html('已启用');
                    layer.msg('已启用!', {
                        icon: 5,
                        time: 1000
                    });
                }

            });
        }

        /*用户-删除*/
        function member_del(obj, id) {
            layer.confirm('确认要删除吗？',
            function(index) {
                //发异步删除数据
                $(obj).parents("tr").remove();
                layer.msg('已删除!', {
                    icon: 1,
                    time: 1000
                });
            });
        }

        function delAll(argument) {

            var data = tableCheck.getData();

            layer.confirm('确认要删除吗？' + data,
            function(index) {
                //捉到所有被选中的，发异步进行删除
                layer.msg('删除成功', {
                    icon: 1
                });
                $(".layui-form-checked").not('.header').parents('tr').remove();
            });
        }</script>
