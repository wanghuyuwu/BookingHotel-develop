<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Hotel;

class SearchController extends Controller
{
    public function index(Request $request)
    {
        $country = $request->input('country');
        $city = $request->input('city');
        $price = $request->input('price');
        $keyword = $request->input('keyword');

        $query = Hotel::query();

        if ($keyword) {
            $query->where(function ($query) use ($keyword) {
                $query->orWhere('name', 'like', '%' . $keyword . '%')
                ->orWhere('city', 'like', '%' . $keyword . '%')
                ->orWhere('country', 'like', '%' . $keyword . '%');
            });
        }

        if ($country) {
            $query->where('country', $country);
        }

        $priceString = '';
        if ($price) {
            if ($price === 'under100') {
                $query->where('price', '<', 100);
                $priceString = '$0 - $100';
            } elseif ($price === '100to200') {
                $query->whereBetween('price', [100, 200]);
                $priceString = '$100 - $200';
            } elseif ($price === '200to300') {
                $query->whereBetween('price', [200, 300]);
                $priceString = '$200 - $300';
            } elseif ($price === 'over300') {
                $query->where('price', '>', 300);
                $priceString = 'Trên $300';
            }
        }

        $hotels = $query->get();

        if ($hotels->isEmpty()) {
            return view('no_results', compact('keyword', 'country', 'price', 'priceString'));
        }

        return view('search_results', compact('hotels', 'keyword', 'country', 'price', 'priceString'));
    }

}