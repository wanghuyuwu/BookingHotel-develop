@extends('layout.owner')

@section('content')
    <div class="container-owner">
        <div class="sidebar-owner">
            <h2>ADMIN DASHBOARD</h2>
            <div class="sidebar-owner__item">
                <a href="{{ route('admin.dashboard') }}" class="sidebar-owner__link">Trang chủ</a>
            </div>
            <div class="sidebar-owner__item">
                <a href="{{ route('admin_owner.index') }}" class="sidebar-owner__link">Quản lý tài khoản chủ khách sạn</a>
            </div>
            <div class="sidebar-owner__item">
                <a href="{{ route('admin_owner.create') }}" class="sidebar-owner__link">Thêm tài khoản chủ khách sạn</a>
            </div>
            <div class="sidebar-owner__item">
                <a href="{{ route('admin_user.index') }}" class="sidebar-owner__link">Quản lý tài khoản người dùng</a>
            </div>
            <div class="sidebar-owner__item">
                <a href="{{ route('admin.approve_hotels') }}" class="sidebar-owner__link">Quản lý khách sạn</a>
            </div>
            <div class="owner-logout">
                <a href="{{ route('logout') }}" class="sidebar-owner__link">Đăng xuất</a>
            </div>
        </div>

        <div class="table-admin">
            <h3>Danh sách khách sạn chưa được duyệt</h3>
            @if (count($unapprovedHotels) > 0)
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Tên</th>
                            <th>Thành phố</th>
                            <th>Quốc gia</th>
                            <th>Thao tác</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($unapprovedHotels as $hotel)
                            <tr>
                                <td>{{ $hotel->id }}</td>
                                <td>{{ $hotel->name }}</td>
                                <td>{{ $hotel->city }}</td>
                                <td>{{ $hotel->country }}</td>
                                <td>
                                    <form action="{{ route('admin.approve_hotel', ['hotel' => $hotel->id]) }}"
                                        method="POST">
                                        @csrf
                                        @method('PUT')
                                        {{-- <input type="hidden" name="admin_accepted" value="true"> <!-- Thêm trường này --> --}}
                                        <button type="submit" class="btn btn-primary">Accept</button>
                                    </form>
                                    <form action="{{ route('admin.delete_hotel', ['hotel' => $hotel]) }}" method="POST">
                                        @csrf
                                        @method('DELETE')
                                        {{-- <input type="hidden" name="admin_accepted" value="true"> <!-- Thêm trường này --> --}}
                                        <button type="submit" class="btn btn-primary"
                                            style="background-color: red">Decline</button>
                                    </form>
                                </td>
                            </tr>
                        @endforeach
                    </tbody>
                </table>
            @else
                {{-- <p>Không có khách sạn nào chưa được duyệt.</p> --}}
            @endif
        </div>
    </div>
@endsection
