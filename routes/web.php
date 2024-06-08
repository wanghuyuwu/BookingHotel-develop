<?php

use App\Http\Controllers\AdminController;
use App\Http\Controllers\Auth\NewPasswordController;
use App\Http\Controllers\Auth\ForgotPasswordController;
use App\Http\Controllers\Auth\LoginController;
use App\Http\Controllers\Auth\PasswordController;
use App\Http\Controllers\Auth\RegisterController;
use App\Http\Controllers\User\ProfileUserController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\SearchController;
use App\Http\Controllers\User\UserBookingController;
use App\Http\Controllers\User\UserController;
use App\Http\Controllers\HotelController;
use App\Http\Controllers\BookingController;
use App\Http\Controllers\BookingListController;
use App\Http\Controllers\OwnerController;
use App\Http\Controllers\OwnerManageBookingController;
use App\Http\Controllers\OwnerPasswordController;
use App\Http\Controllers\ApproveHotelController;
use App\Http\Controllers\HotelFavoriteController;
use Illuminate\Support\Facades\Auth;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

// đăng nhập
Route::prefix('login')->group(function () {
    // trang đăng nhập
    Route::get('/', [LoginController::class, 'create'])->name('login.create');
    Route::post('/', [LoginController::class, 'login'])->name('login.login');
    // đăng nhập bằng google
    Route::get('/google', [LoginController::class, 'google'])->name('login.google');
    Route::get('/google/callback', [LoginController::class, 'callbackGoogle'])->name('login.google.callback');
});
// đăng xuất
Route::get('/logout', [LoginController::class, 'logout'])->middleware('auth')->name('logout');
// đăng ký
Route::prefix('register')->group(function () {
    Route::get('/', [RegisterController::class, 'create'])->name('register.create');
    Route::post('/', [RegisterController::class, 'store'])->name('register.store');
});
// quên mật khẩu
Route::prefix('forgot-password')->group(function () {
    Route::get('/', [ForgotPasswordController::class, 'create'])->name('forgot.create');
    Route::post('/', [ForgotPasswordController::class, 'store'])->name('forgot.store');
});
// thay đổi mật khẩu
Route::prefix('reset-password')->group(function () {
    Route::get('/{email}', [NewPasswordController::class, 'edit'])->name('reset_pass.edit');
    Route::post('/{token}', [NewPasswordController::class, 'update'])->name('reset_pass.update');
});

// tài khoản người dùng
Route::prefix('account')->middleware(['auth'])->group(function () {
    // trang cá nhân
    Route::get('/', [ProfileUserController::class, 'index'])->name('profile.index');
    // trang chỉnh sửa thông tin cá nhân
    Route::get('/personal/{user}', [ProfileUserController::class, 'edit'])->name('profile.edit');
    Route::put('personal/{user}', [UserController::class, 'update'])->name('profile.update');
    // trang đổi mật khẩu
    Route::get('{user}/password', [PasswordController::class, 'edit'])->name('password.edit');
    Route::put('{user}/password', [PasswordController::class, 'update'])->name('password.update');
    // trang đặt phòng của người dùng
    Route::get('/your-booking', [UserBookingController::class, 'index'])->withTrashed()->middleware(['role:user'])->name('booking.index');
    Route::delete('your-booking/{booking_id}', [UserBookingController::class, 'destroy'])->middleware(['role:user'])->name('booking.destroy');
});

// đánh giá khách sạn
Route::post('hotel-review/{hotel_id}', [UserBookingController::class, 'update'])->name('hotel.eval');

// trang chủ
Route::get('/', [HomeController::class, 'index'])->name('home');
//trang tìm kiếm
Route::get('/search', [SearchController::class, 'index'])->name('search');
//trang chi tiết thông tin phòng
Route::get('/hotel/{id}', [HotelController::class, 'show'])->withTrashed()->name('hotel.show');
//trang đặt phòng
Route::get('/booking/create/{hotel_id}', [UserBookingController::class, 'create'])->name('booking.create');
Route::post('/booking/store', [UserBookingController::class, 'store'])->middleware(['auth', 'role:user'])->name('booking.store');

Route::get('/favorites', [HotelFavoriteController::class, 'index'])->middleware(['auth', 'role:user'])->name('user.favorite_hotel');
Route::post('/favorite/{hotel_id}', [HotelFavoriteController::class, 'store'])->name('favorite_hotel.store');
Route::delete('/favorites/{hotel_id}', [HotelFavoriteController::class, 'destroy'])->middleware(['auth', 'role:user'])->name('favorite_hotel.destroy');

// Owner hotel - chu khach san
Route::prefix('owner')->middleware(['role:owner'])->group(function () {
    // trang chủ chủ khách sạn
    Route::get('/', function () {
        return view('owner.dashboard', ['user' => Auth::user()]);
    })->name('owner.dashboard');
    // trang đổi mật khẩu chủ khách sạn
    Route::get('{user}/change-password', [OwnerPasswordController::class, 'edit'])->name('owner.edit');
    // trang cập nhật thông tin khách sạn
    Route::get('/hotels/{hotel}/edit', [HotelController::class, 'edit'])->name('hotel.edit');
    // cập nhật thông tin khách sạn
    Route::put('/hotels/{hotel}', [HotelController::class, 'update'])->name('hotel.update');
    // xóa khách sạn
    Route::delete('/hotels/{hotel}', [HotelController::class, 'destroy'])->name('hotel.destroy');
    // thêm khách sạn
    Route::get('/add-hotel', [OwnerManageBookingController::class, 'create'])->name('add-hotel');
    Route::post('/add-hotel', [HotelController::class, 'store'])->name('hotel.store');
    // danh sách khách sạn của chủ khách sạn
    Route::get('/hotels', [OwnerManageBookingController::class, 'index'])->withTrashed()->name('owner_manage.index');
    // trang danh sách đặt phòng của khách sạn
    Route::get('/manage-booking', [BookingListController::class, 'index'])->withTrashed()->name('booking-list.index');
    //accept cho ng dùng thuê phòng
    Route::put('/manage-booking/{hotel_id}/accept/{booking_id}', [OwnerManageBookingController::class, 'update'])->name('owner_manage.update');
    // trả phòng
    Route::delete('/manage-booking/{hotel_id}/checkout/{booking_id}', [OwnerManageBookingController::class, 'destroy'])->name('owner_manage.destroy');
});

// Admin
Route::prefix('admin')->middleware(['auth', 'role:admin'])->group(function () {
    // trang chủ admin
    Route::get('/', function () {
        return view('admin.dashboard');
    })->name('admin.dashboard');
    // quản lý chủ khách sạn
    Route::prefix('owner')->group(function () {
        // Lấy danh sách của tất cả chủ khách sạn
        Route::get('/accounts', [OwnerController::class, 'index'])->withTrashed()->name('admin_owner.index');
        // Hiển thị trang tạo tài khoản
        Route::get('/account/new', [OwnerController::class, 'create'])->name('admin_owner.create');
        // Tạo tài khoản chủ khách sạn
        Route::post('/account/new', [OwnerController::class, 'store'])->name('admin_owner.store');
        // Hiển thị trang chi tiết 1 tài khoản để sửa
        Route::get('/account/{user}', [OwnerController::class, 'edit'])->name('admin_owner.edit');
        // Sua thong tin
        Route::put('/account/{user}', [OwnerController::class, 'update'])->name('admin_owner.update');
        // Xoa tai khoan
        Route::delete('/account/{user}', [OwnerController::class, 'destroy'])->name('admin_owner.delete');
        //trang duỵệt khách sạn
        Route::get('/approve-hotels', [ApproveHotelController::class, 'index'])->name('admin.approve_hotels');
        //duyệt khách sạn
        Route::put('/approve-hotel/{hotel}', [ApproveHotelController::class, 'approve'])->name('admin.approve_hotel');
        Route::delete('/{hotel}', [ApproveHotelController::class, 'destroy'])->name('admin.delete_hotel');
    });
    // quản lý người dùng
    Route::prefix('user')->group(function () {
        // Lấy danh sách của tất cả user
        Route::get('/', [UserController::class, 'index'])->withTrashed()->name('admin_user.index');
        // Xoa tai khoan
        Route::delete('/{user}', [UserController::class, 'destroy'])->name('admin_user.delete');
    });
});
