<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\admin\Cate;
use App\Models\index\Post;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;

class PostController extends Controller
{
    public function index(Request $request)
    {
        // $posts = Post::published()
        //             ->latest('published_at')
        //             ->paginate(10);

        $cate_id = $request->cate_id;
        $cate = Cate::find($cate_id);
        $post_list = $cate->posts;
        $nav_list = $cate->getAncestors();

        return view('admin.post.index', ['cate' => $cate, 'post_list' => $post_list, 'nav_list' => $nav_list]);
    }

    public function create(Request $request)
    {
        $cate_id = $request->cate_id;

        return view('admin.post.add', ['cate_id' => $cate_id]);
    }

    public function store(Request $request)
    {
        $input = $request->all();

        // dd($input);
        $validator = Validator::make($input, [
            'title' => 'required|string',
            'image' => 'required|string',
            'content' => 'required|string',
            'cate_id' => 'required|exists:cates,cate_id',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'success' => false,
                'message' => $validator->errors()->first(),
            ], 200);
        }
        $input['id'] = $request->user('admin')->id;

        $post = Post::create($input);
        $post->excerpt = $post->getExcerptAttribute('');
        $rs = $post->save();

        if ($rs) {
            return response()->json([
                'success' => true,
                'message' => '添加成功',
            ], 200);
        } else {
            return response()->json([
                'success' => false,
                'message' => '添加失败',
            ], 200);
        }
    }

    public function show(Post $post)
    {
        if (! $post->is_published && ! auth()->check()) {
            abort(404);
        }

        return view('posts.show', compact('post'));
    }

    public function edit($id)
    {
        $post = Post::find($id);

        return view('admin.post.edit', compact('post'));
    }

    public function update(Request $request, $id)
    {
        $input = $request->all();

        // dd($input);
        $validator = Validator::make($input, [
            'title' => 'required|string',
            'image' => 'required|string',
            'content' => 'required|string',

        ]);

        if ($validator->fails()) {
            return response()->json([
                'success' => false,
                'message' => $validator->errors()->first(),
            ], 200);
        }
        $post = Post::find($id);

        $rs = $post->update($input);

        if ($rs) {
            return response()->json([
                'success' => true,
                'message' => '添加成功',
            ], 200);
        } else {
            return response()->json([
                'success' => false,
                'message' => '添加失败',
            ], 200);
        }
    }

    public function destroy($id)
    {
        $post = Post::find($id);

        // 删除图片
        if ($post->image) {
            Storage::disk('public')->delete($post->image);
        }

        $rs = $post->delete();
        if ($rs) {
            return response()->json([
                'success' => true,
                'message' => '删除成功',
            ], 200);
        } else {
            return response()->json([
                'success' => false,
                'message' => '删除失败',
            ], 200);
        }
    }

     public function status(Request $request, $id)
     {
         $post = Post::find($id);

         $post->is_published = $post->is_published == '1' ? '0' : '1';
         if ($post->is_published == 1) {
             $post->published_at = now();
         }
         $res = $post->save();

         if ($res) {
             return response()->json([
                 'success' => true,
                 'message' => '修改成功',
             ], 200);
         } else {
             return response()->json([
                 'success' => false,
                 'message' => '修改失败',
             ], 200);
         }
     }
}
