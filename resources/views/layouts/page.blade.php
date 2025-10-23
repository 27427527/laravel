@if ($paginator->hasPages())
   <div style="text-align: center;">


<div class="layui-box layui-laypage layui-laypage-default" id="layui-laypage-2">
            {{-- 上一页 --}}
            @if ($paginator->onFirstPage())
              <a href="javascript:;" class="layui-laypage-prev layui-disabled" data-page="0">上一页</a>
            @else

              <a href="{{ $paginator->previousPageUrl() }}" class="layui-laypage-prev " data-page="0">上一页</a>
         
            @endif

            {{-- 页码 --}}
            @foreach ($elements as $element)
                @if (is_string($element))
                  
                  
                   <span class="layui-laypage-curr"><em class="layui-laypage-em"></em><em>{{ $element }}</em></span>
                @endif

                @if (is_array($element))
                    @foreach ($element as $page => $url)
                        @if ($page == $paginator->currentPage())
                       

                              <span class="layui-laypage-curr"><em class="layui-laypage-em"></em><em>{{ $page }}</em></span>
                        @else
                         

                                   <a href="{{ $url }}" data-page="{{ $page }}">{{ $page }}</a>
                           
                        @endif
                    @endforeach
                @endif
            @endforeach

            {{-- 下一页 --}}
            @if ($paginator->hasMorePages())
              
                  <a href="{{ $paginator->nextPageUrl() }}" class="layui-laypage-next" data-page="2">下一页</a>
            @else
          <a href="javascript::" class="layui-laypage-next layui-disabled" data-page="2">下一页</a>
            @endif
        </ul>
    </nav>
@endif