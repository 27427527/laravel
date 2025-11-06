<?php

namespace App\Http\Controllers\index;

use App\Http\Requests\StorePostRequest;
use App\Http\Requests\UpdatePostRequest;
use App\Models\index\Post;
use Illuminate\Support\Facades\Storage;

class PostController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth')->except(['index', 'show']);
    }

    public function index()
    {
        $posts = Post::published()
                    ->latest('published_at')
                    ->paginate(10);

        return view('posts.index', compact('posts'));
    }

    public function create()
    {
        return view('posts.create');
    }

    public function store(StorePostRequest $request)
    {
        $data = $request->validated();
        $data['user_id'] = auth()->id();

        if ($request->hasFile('featured_image')) {
            $data['featured_image'] = $request->file('featured_image')->store('posts', 'public');
        }

        $post = Post::create($data);

        return redirect()->route('posts.show', $post)
                        ->with('success', '文章创建成功！');
    }

    public function show(Post $post)
    {
        if (! $post->is_published && ! auth()->check()) {
            abort(404);
        }

        return view('posts.show', compact('post'));
    }

    public function edit(Post $post)
    {
        $this->authorize('update', $post);

        return view('posts.edit', compact('post'));
    }

    public function update(UpdatePostRequest $request, Post $post)
    {
        $this->authorize('update', $post);

        $data = $request->validated();

        if ($request->hasFile('featured_image')) {
            // 删除旧图片
            if ($post->featured_image) {
                Storage::disk('public')->delete($post->featured_image);
            }
            $data['featured_image'] = $request->file('featured_image')->store('posts', 'public');
        }

        $post->update($data);

        return redirect()->route('posts.show', $post)
                        ->with('success', '文章更新成功！');
    }

    public function destroy(Post $post)
    {
        $this->authorize('delete', $post);

        // 删除图片
        if ($post->featured_image) {
            Storage::disk('public')->delete($post->featured_image);
        }

        $post->delete();

        return redirect()->route('posts.index')
                        ->with('success', '文章删除成功！');
    }
}
