<?php

namespace App\Http\Controllers;

use App\Models\Hotel;
use App\Models\HotelFavorite;
use App\Models\User;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class HotelFavoriteController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $userId = Auth::user()->id;
        $favoriteHotelList = User::with(['favoritesHotels', 'userInfo', 'avatar'])->where('id', $userId)->firstOrFail();
        return view('user.favorite-hotels', compact('favoriteHotelList'));
        // return $favoriteHotelList;
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request, $hotel_id)
    {
        $userId = Auth::user()->id;
        try {
            HotelFavorite::create([
                'user_id' => $userId,
                'hotel_id' => $hotel_id
            ]);
            return redirect()->back()->with('success', 'Đã thêm vào danh sách yêu thích');
        } catch (Exception $e) {
            return redirect()->back()->with('error', 'Đã có lỗi xảy ra');
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\HotelFavorite  $hotelFavorite
     * @return \Illuminate\Http\Response
     */
    public function show(HotelFavorite $hotelFavorite)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\HotelFavorite  $hotelFavorite
     * @return \Illuminate\Http\Response
     */
    public function edit(HotelFavorite $hotelFavorite)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\HotelFavorite  $hotelFavorite
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, HotelFavorite $hotelFavorite)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\HotelFavorite  $hotelFavorite
     * @return \Illuminate\Http\Response
     */
    public function destroy($hotel_id)
    {
        //
        try {
            HotelFavorite::find($hotel_id)->delete();
            return redirect()->back()->with('success', 'Xoá thành công');
        } catch (Exception $e) {
            return redirect()->back()->with('error', 'Đã có lỗi xảy ra');
        }
    }
}
