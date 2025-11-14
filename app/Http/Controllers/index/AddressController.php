<?php

namespace App\Http\Controllers\index;

use App\Http\Controllers\Controller;
use App\Models\admin\Cate;
use App\Models\index\Address;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class AddressController extends Controller
{
    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function show(Request $request)
    {
        $cate_id = $request->cate_id;
        $cate = Cate::find($cate_id);
        $banner_list = $cate->banners;

        return response()->json([
            'message' => 'success',
            'banner_list' => $banner_list,
            'state' => 200,
        ]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        try {
            $validator = Validator::make($request->all(), [
                'name' => 'required|string|max:100',
                'phone' => 'required|string|max:12',
                'detail' => 'required|string|max:100',
                'city' => 'required|array',

            ]);

            if ($validator->fails()) {
                return response()->json([
                    'success' => false,
                    'message' => $validator->errors()->first(),
                ], 500);
            }

            $data['name'] = $request->name;
            $data['phone'] = $request->phone;
            $data['detail'] = $request->detail;
            $data['province'] = $request->city[0];
            $data['city'] = $request->city[1];
            $data['district'] = $request->city[2];
            $data['id'] = auth()->id();

            $address = Address::create($data);
            $user = $address->user;
            $user->default_address_id = $address->address_id;
            $user->save();

            $address_list = $user->address;

            return response()->json([
                'message' => 'success',
                'address_list' => $address_list,
                'user' => $user,
                'success' => true,
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => $e->getMessage(),
            ], 500);
        }
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        try {
            $validator = Validator::make($request->all(), [
                'name' => 'required|string|max:100',
                'phone' => 'required|string|max:12',
                'detail' => 'required|string|max:100',
                'allcity' => 'required|array',
                'address_id' => 'required',

            ]);

            if ($validator->fails()) {
                return response()->json([
                    'success' => false,
                    'message' => $validator->errors()->first(),
                ], 500);
            }

            $user = auth()->user();

            $address = Address::where('address_id', $id)->where('id', $user->id)->first();

            if (empty($address)) {
                throw new \Exception('无权操作');
            } else {
                $data['name'] = $request->name;
                $data['phone'] = $request->phone;
                $data['detail'] = $request->detail;
                $data['province'] = $request->allcity[0];
                $data['city'] = $request->allcity[1];
                $data['district'] = $request->allcity[2];
                $address->update($data);

                $address_list = $user->address;

                return response()->json([
                    'message' => 'success',
                    'address_list' => $address_list,
                    'success' => true,
                ]);
            }
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => $e->getMessage(),
            ], 500);
        }
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function default(Request $request, $id)
    {
        try {
            $user = auth()->user();

            $address = Address::where('address_id', $id)->where('id', $user->id)->first();

            if (empty($address)) {
                throw new \Exception('无权操作');
            } else {
                $user->default_address_id = $id;
                $user->save();

                return response()->json([
                    'message' => 'success',
                    'user' => $user,
                    'success' => true,
                ]);

                return response()->json([
                    'message' => 'success',
                    'address_list' => $user,
                    'success' => true,
                ]);
            }
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => $e->getMessage(),
            ], 500);
        }
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function destory(Request $request, $id)
    {
        try {
            $user = auth()->user();

            $address = Address::where('address_id', $id)->where('id', $user->id)->first();

            if (empty($address)) {
                throw new \Exception('无权操作');
            } else {
                $address->delete();

                $address_list = $user->address;

                return response()->json([
                    'message' => 'success',
                    'address_list' => $address_list,
                    'success' => true,
                ]);
            }
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => $e->getMessage(),
            ], 500);
        }
    }
}
