     <div class="left-nav">
            <div id="side-nav">
                <ul id="nav">
                    <li>
                        <a href="javascript:;">
                            <i class="iconfont left-nav-li" lay-tips="会员管理">&#xe6b8;</i>
                            <cite>会员管理</cite>
                            <i class="iconfont nav_right">&#xe697;</i></a>
                        <ul class="sub-menu">

                            <li>
                                <a onclick="xadmin.add_tab('会员列表','{{ url('admin/member') }}',true)">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>会员列表</cite></a>
                            </li>
                            <li>
                                <a onclick="xadmin.add_tab('VIP列表','{{ url('admin/member/vip/list') }}')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>VIP列表</cite></a>
                            </li>


                        </ul>
                    </li>

                          <li>
                        <a href="javascript:;">
                            <i class="iconfont left-nav-li" lay-tips="频道管理">&#xe723;</i>
                            <cite>频道管理</cite>
                            <i class="iconfont nav_right">&#xe697;</i></a>
                        <ul class="sub-menu">
                            <li>
                                <a onclick="xadmin.add_tab('公共频道','{{ url('admin/channel/public') }}')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>公共频道</cite></a>
                            </li>

                        </ul>
                    </li>
                    <li>
                        <a href="javascript:;">
                            <i class="iconfont left-nav-li" lay-tips="订单管理">&#xe723;</i>
                            <cite>订单管理</cite>
                            <i class="iconfont nav_right">&#xe697;</i></a>
                        <ul class="sub-menu">
                            <li>
                                <a onclick="xadmin.add_tab('订单列表','{{ url('admin/order') }}')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>订单列表</cite></a>
                            </li>

                        </ul>
                    </li>

     @foreach ( $cate_list as $v )
                <li>
                        <a href="javascript:;">
                            <i class="iconfont left-nav-li" lay-tips="{{$v['name']}}">&#xe723;</i>
                            <cite>{{$v['name']}}</cite>
                            <i class="iconfont nav_right">&#xe697;</i></a>


                            @php

                            $cur_cate = App\Models\admin\Cate::find($v['cate_id']);
                            $list2 = $cur_cate->getAllDescendants();
                            $original = "&nbsp;&nbsp;";


                            @endphp
                        <ul class="sub-menu">

                                @foreach ( $list2 as $v2 )

   <li>





                                <a onclick="xadmin.add_tab('{{ $v2->name }}','{{ url('admin/'.$v->relation.'?cate_id='. $v2->cate_id) }}')">


 @php
  $copy = str_repeat($original, $v2['level']-1);
                                echo $copy;
 @endphp

                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>{{ $v2->name }}</cite></a>
                                      </li>
                                @endforeach


                        </ul>
                    </li>


        @endforeach

                    <li>
                        <a href="javascript:;">
                            <i class="iconfont left-nav-li" lay-tips="分类管理">&#xe723;</i>
                            <cite>分类管理</cite>
                            <i class="iconfont nav_right">&#xe697;</i></a>
                        <ul class="sub-menu">

                                @foreach ( $cate_list as $v )
     <li>


                                <a onclick="xadmin.add_tab('{{$v['name']}}','{{ url('admin/cate/'.$v['cate_id']) }}')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>{{$v['name']}}</cite></a>
                                      </li>
                                @endforeach


                        </ul>
                    </li>




                    <li>
                        <a href="javascript:;">
                            <i class="iconfont left-nav-li" lay-tips="管理员管理">&#xe726;</i>
                            <cite>管理员管理</cite>
                            <i class="iconfont nav_right">&#xe697;</i></a>
                        <ul class="sub-menu">
                            <li>
                                <a onclick="xadmin.add_tab('管理员列表','{{ url('admin/user') }}')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>管理员列表</cite></a>
                            </li>
                            <li>
                                <a onclick="xadmin.add_tab('角色管理','{{ url('admin/role') }}')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>角色管理</cite></a>
                            </li>
                            <li>
                                <a onclick="xadmin.add_tab('权限分类','{{ url('admin/permissioncate') }}')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>权限分类</cite></a>
                            </li>
                            <li>
                                <a onclick="xadmin.add_tab('权限管理','{{ url('admin/permission') }}')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>权限管理</cite></a>
                            </li>
                        </ul>
                    </li>

                    <li>
                        <a href="javascript:;">
                            <i class="iconfont left-nav-li" lay-tips="图标字体">&#xe6b4;</i>
                            <cite>图标字体</cite>
                            <i class="iconfont nav_right">&#xe697;</i></a>
                        <ul class="sub-menu">
                            <li>
                                <a onclick="xadmin.add_tab('图标对应字体','/js/unicode.html')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>图标对应字体</cite></a>
                            </li>
                        </ul>
                    </li>


                </ul>
            </div>
        </div>
        <!-- <div class="x-slide_left"></div> -->
