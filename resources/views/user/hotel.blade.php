@extends('layout.app')

@section('content')
    <div class="container grid ">
        <div class="info_hotel-name">
            <h2>{{ $hotel->name }}</h2>
            <div class="info_hotel-tasks">
                <p>{{ $hotel->city }}, {{ $hotel->country }}</p>
                <div>
                    @auth
                        @if (count($hotel->favoriteUsers) > 0 && $hotel->favoriteUsers[0]->id === auth()->user()->id)
                            <a href="#">Đã yêu thích</a>
                        @else
                            <form action="{{ route('favorite_hotel.store', ['hotel_id' => $hotel->id]) }}" method="post">
                                @csrf
                                <button>
                                    <a>Thêm yêu thích <i class="far fa-heart"></i></a>
                                </button>
                            </form>
                        @endif
                    @endauth
                    @guest
                        <form action="{{ route('favorite_hotel.store', ['hotel_id' => $hotel->id]) }}" method="post">
                            @csrf
                            <button>
                                <a>Thêm yêu thích <i class="far fa-heart"></i></a>
                            </button>
                        </form>
                    @endguest
                    <span>Chia sẻ <i class="far fa-share-square"></i></span>
                    @if ($hotel->deleted_at == null)
                        <a href="{{ route('booking.create', ['hotel_id' => $hotel->id]) }}">Đặt thuê</a>
                    @else
                        <a href="#">Đã cho thuê</a>
                    @endif
                </div>
            </div>
        </div>

        <div class="info_hotel-img-list">
            <div class="info_hotel-img half-left">
                <img src="/{{ $hotel->image1 }}" alt="">
            </div>
            <div class="info_hotel-img half-right">
                <img src="/{{ $hotel->image2 }}" alt="">
                <img src="/{{ $hotel->image3 }}" alt="">
            </div>
        </div>

        <div class="info_hotel-relate">
            <div class="info_hotel-service">
                <h3>Nơi này có những gì cho bạn</h3>
                <ul class="hotel-service-list">
                    <li class="hotel-service-item"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32"
                            aria-hidden="true" role="presentation" focusable="false"
                            style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                            <path
                                d="M26 1a5 5 0 0 1 5 5c0 6.39-1.6 13.19-4 14.7V31h-2V20.7c-2.36-1.48-3.94-8.07-4-14.36v-.56A5 5 0 0 1 26 1zm-9 0v18.12c2.32.55 4 3 4 5.88 0 3.27-2.18 6-5 6s-5-2.73-5-6c0-2.87 1.68-5.33 4-5.88V1zM2 1h1c4.47 0 6.93 6.37 7 18.5V21H4v10H2zm14 20c-1.6 0-3 1.75-3 4s1.4 4 3 4 3-1.75 3-4-1.4-4-3-4zM4 3.24V19h4l-.02-.96-.03-.95C7.67 9.16 6.24 4.62 4.22 3.36L4.1 3.3zm19 2.58v.49c.05 4.32 1.03 9.13 2 11.39V3.17a3 3 0 0 0-2 2.65zm4-2.65V17.7c.99-2.31 2-7.3 2-11.7a3 3 0 0 0-2-2.83z">
                            </path>
                        </svg>
                        Bếp</li>
                    <li class="hotel-service-item"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32"
                            aria-hidden="true" role="presentation" focusable="false"
                            style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                            <path
                                d="M26 2a1 1 0 0 1 .92.61l.04.12 2 7a1 1 0 0 1-.85 1.26L28 11h-3v5h6v2h-2v13h-2v-2.54a3.98 3.98 0 0 1-1.73.53L25 29H7a3.98 3.98 0 0 1-2-.54V31H3V18H1v-2h5v-4a1 1 0 0 1 .88-1h.36L6.09 8.4l1.82-.8L9.43 11H12a1 1 0 0 1 1 .88V16h10v-5h-3a1 1 0 0 1-.99-1.16l.03-.11 2-7a1 1 0 0 1 .84-.72L22 2h4zm1 16H5v7a2 2 0 0 0 1.7 1.98l.15.01L7 27h18a2 2 0 0 0 2-1.85V18zm-16-5H8v3h3v-3zm14.24-9h-2.49l-1.43 5h5.35l-1.43-5z">
                            </path>
                        </svg>
                        Không gian riêng để làm việc</li>
                    <li class="hotel-service-item"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32"
                            aria-hidden="true" role="presentation" focusable="false"
                            style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                            <path
                                d="M13.7 13.93a4 4 0 0 1 5.28.6l.29.37 4.77 6.75a4 4 0 0 1 .6 3.34 4 4 0 0 1-4.5 2.91l-.4-.08-3.48-.93a1 1 0 0 0-.52 0l-3.47.93a4 4 0 0 1-2.94-.35l-.4-.25a4 4 0 0 1-1.2-5.2l.23-.37 4.77-6.75a4 4 0 0 1 .96-.97zm3.75 1.9a2 2 0 0 0-2.98.08l-.1.14-4.84 6.86a2 2 0 0 0 2.05 3.02l.17-.04 4-1.07a1 1 0 0 1 .5 0l3.97 1.06.15.04a2 2 0 0 0 2.13-2.97l-4.95-7.01zM27 12a4 4 0 1 1 0 8 4 4 0 0 1 0-8zM5 12a4 4 0 1 1 0 8 4 4 0 0 1 0-8zm22 2a2 2 0 1 0 0 4 2 2 0 0 0 0-4zM5 14a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm6-10a4 4 0 1 1 0 8 4 4 0 0 1 0-8zm10 0a4 4 0 1 1 0 8 4 4 0 0 1 0-8zM11 6a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm10 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4z">
                            </path>
                        </svg>
                        Cho phép thú cưng</li>
                    <li class="hotel-service-item"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32"
                            aria-hidden="true" role="presentation" focusable="false"
                            style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                            <path
                                d="M26.29 2a3 3 0 0 1 2.96 2.58c.5 3.56.75 7.37.75 11.42s-.25 7.86-.75 11.42a3 3 0 0 1-2.79 2.57l-.17.01H5.7a3 3 0 0 1-2.96-2.58C2.25 23.86 2 20.05 2 16s.25-7.86.75-11.42a3 3 0 0 1 2.79-2.57L5.7 2zm0 2H5.72a1 1 0 0 0-1 .86A80.6 80.6 0 0 0 4 16c0 3.96.24 7.67.73 11.14a1 1 0 0 0 .87.85l.11.01h20.57a1 1 0 0 0 1-.86c.48-3.47.72-7.18.72-11.14 0-3.96-.24-7.67-.73-11.14A1 1 0 0 0 26.3 4zM16 7a9 9 0 1 1 0 18 9 9 0 0 1 0-18zm-5.84 7.5c-.34 0-.68.02-1.02.07a7 7 0 0 0 13.1 4.58 9.09 9.09 0 0 1-6.9-2.37l-.23-.23a6.97 6.97 0 0 0-4.95-2.05zM16 9a7 7 0 0 0-6.07 3.5h.23c2.26 0 4.44.84 6.12 2.4l.24.24a6.98 6.98 0 0 0 6.4 1.9A7 7 0 0 0 16 9zM7 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z">
                            </path>
                        </svg>
                        Máy giặt</li>
                    <li class="hotel-service-item"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32"
                            aria-hidden="true" role="presentation" focusable="false"
                            style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                            <path
                                d="M2.05 6.3 4 8.23V25a3 3 0 0 0 2.82 3h16.94l1.95 1.95c-.16.02-.33.04-.5.04L25 30H7a5 5 0 0 1-5-4.78V7c0-.24.02-.48.05-.7zm1.66-4 26 26-1.42 1.4-26-26 1.42-1.4zM25 2a5 5 0 0 1 5 4.78V25a5 5 0 0 1-.05.7L28 23.77V7a3 3 0 0 0-2.82-3H8.24L6.3 2.05c.16-.02.33-.04.5-.04L7 2h18zM11.1 17a5 5 0 0 0 3.9 3.9v2.03A7 7 0 0 1 9.07 17h2.03zm5.9 4.24 1.35 1.36a6.95 6.95 0 0 1-1.35.33v-1.69zM21.24 17h1.69c-.07.47-.18.92-.34 1.35L21.24 17zM17 9.07A7 7 0 0 1 22.93 15H20.9a5 5 0 0 0-3.9-3.9V9.07zm-7.6 4.58L10.76 15H9.07c.07-.47.18-.92.33-1.35zM15 9.07v1.69L13.65 9.4A6.95 6.95 0 0 1 15 9.07zM23 8a1 1 0 1 1 0 2 1 1 0 0 1 0-2z">
                            </path>
                        </svg>
                        Máy phát hiện khí CO</li>
                    <li class="hotel-service-item"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32"
                            aria-hidden="true" role="presentation" focusable="false"
                            style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                            <path
                                d="M16 20.33a3.67 3.67 0 1 1 0 7.34 3.67 3.67 0 0 1 0-7.34zm0 2a1.67 1.67 0 1 0 0 3.34 1.67 1.67 0 0 0 0-3.34zM16 15a9 9 0 0 1 8.04 4.96l-1.51 1.51a7 7 0 0 0-13.06 0l-1.51-1.51A9 9 0 0 1 16 15zm0-5.33c4.98 0 9.37 2.54 11.94 6.4l-1.45 1.44a12.33 12.33 0 0 0-20.98 0l-1.45-1.45A14.32 14.32 0 0 1 16 9.66zm0-5.34c6.45 0 12.18 3.1 15.76 7.9l-1.43 1.44a17.64 17.64 0 0 0-28.66 0L.24 12.24c3.58-4.8 9.3-7.9 15.76-7.9z">
                            </path>
                        </svg>
                        Wi-fi</li>
                    <li class="hotel-service-item"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32"
                            aria-hidden="true" role="presentation" focusable="false"
                            style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                            <path
                                d="M26 19a1 1 0 1 1-2 0 1 1 0 0 1 2 0zM7 18a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm20.7-5 .41 1.12A4.97 4.97 0 0 1 30 18v9a2 2 0 0 1-2 2h-2a2 2 0 0 1-2-2v-2H8v2a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2v-9c0-1.57.75-2.96 1.89-3.88L4.3 13H2v-2h3v.15L6.82 6.3A2 2 0 0 1 8.69 5h14.62c.83 0 1.58.52 1.87 1.3L27 11.15V11h3v2h-2.3zM6 25H4v2h2v-2zm22 0h-2v2h2v-2zm0-2v-5a3 3 0 0 0-3-3H7a3 3 0 0 0-3 3v5h24zm-3-10h.56L23.3 7H8.69l-2.25 6H25zm-15 7h12v-2H10v2z">
                            </path>
                        </svg>
                        Chỗ đỗ xe miễn phí tại nơi ở</li>
                    <li class="hotel-service-item"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32"
                            aria-hidden="true" role="presentation" focusable="false"
                            style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                            <path
                                d="M9 29v-2h2v-2H6a5 5 0 0 1-5-4.78V8a5 5 0 0 1 4.78-5H26a5 5 0 0 1 5 4.78V20a5 5 0 0 1-4.78 5H21v2h2v2zm10-4h-6v2h6zm7-20H6a3 3 0 0 0-3 2.82V20a3 3 0 0 0 2.82 3H26a3 3 0 0 0 3-2.82V8a3 3 0 0 0-2.82-3z">
                            </path>
                        </svg>
                        TV</li>
                    <li class="hotel-service-item"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32"
                            aria-hidden="true" role="presentation" focusable="false"
                            style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                            <path
                                d="M23 3a2 2 0 0 1 2 1.85v1.67l5-2v11.96l-5-2V16a2 2 0 0 1-1.85 2H16.9a5 5 0 0 1-3.98 3.92A5 5 0 0 1 8.22 26H4v4H2V20h2v4h4a3 3 0 0 0 2.87-2.13A5 5 0 0 1 7.1 18H4a2 2 0 0 1-2-1.85V5a2 2 0 0 1 1.85-2H4zM12 14a3 3 0 1 0 0 6 3 3 0 0 0 0-6zm11-9H4v11h3.1a5 5 0 0 1 9.8 0H23zm5 2.48-3 1.2v3.64l3 1.2zM7 7a1 1 0 1 1 0 2 1 1 0 0 1 0-2z">
                            </path>
                        </svg>
                        Camera an ninh trong nhà</li>
                    <li class="hotel-service-item"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32"
                            aria-hidden="true" role="presentation" focusable="false"
                            style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                            <path
                                d="m3.49 7.73 1.44 1.44A12.94 12.94 0 0 0 3 16a13 13 0 0 0 19.82 11.07l1.45 1.44A14.93 14.93 0 0 1 16 31 15 15 0 0 1 3.49 7.73zm.22-5.44 26 26-1.42 1.42-26-26 1.42-1.42zM16 1a15 15 0 0 1 12.52 23.27l-1.45-1.45A12.94 12.94 0 0 0 29 16 13 13 0 0 0 16 3a12.94 12.94 0 0 0-6.83 1.93L7.74 3.5A14.93 14.93 0 0 1 16 1zm-4.9 16a5 5 0 0 0 3.9 3.9v2.03A7 7 0 0 1 9.07 17h2.03zm5.9 4.24 1.35 1.36a6.95 6.95 0 0 1-1.35.33v-1.69zM21.24 17h1.69c-.07.47-.18.92-.34 1.35L21.24 17zM17 9.07A7 7 0 0 1 22.93 15H20.9a5 5 0 0 0-3.9-3.9V9.07zm-7.6 4.58L10.76 15H9.07c.07-.47.18-.92.33-1.35zM15 9.07v1.69L13.65 9.4A6.95 6.95 0 0 1 15 9.07zM23 8a1 1 0 1 1 0 2 1 1 0 0 1 0-2z">
                            </path>
                        </svg>
                        Máy báo khói</li>
                </ul>
            </div>

            <div class="info_hotel-description">
                <h3>Thông tin chỗ ở</h3>
                <p>Tối đa cho {{ $hotel->num_guest }} khách</p>
                <pre>{{ $hotel->description }}</pre>
            </div>
        </div>

        <div class="info_hotel-more">
            <h3>Những điều cần biết</h3>
            <div class="hotel-description-rules">
                <h4>Nội quy nhà</h4>
                <p>Nhận phòng sau 14:00</p>
                <p>Trả phòng trước 12:00</p>
                <p>Tối đa 4 khách</p>
                <span href="#">Hiển thị thêm <i class="fas fa-angle-right"></i></span>
            </div>
            <div class="hotel-description-security">
                <h4>An toàn và chỗ ở</h4>
                <p>Chưa có thông tin về việc có máy phát hiện khí CO</p>
                <p>Chưa có thông tin về việc có máy báo khói</p>
                <p>Camera an ninh/thiết bị ghi</p>
                <span href="#">Hiển thị thêm <i class="fas fa-angle-right"></i></span>
            </div>
            <div class="hotel-description-policy">
                <h4>Chính sách</h4>
                <p>Hoàn tiền một phần: Nhận tiền hoàn lại cho tất cả các đêm cách thời điểm bạn hủy 24 giờ trở lên. Không
                    được hoàn tiền phí dịch vụ hoặc chi phí cho các đêm bạn đã ở.</p>
                <p>Hãy đọc toàn bộ chính sách hủy của Chủ nhà/Người tổ chức được áp dụng ngay cả khi bạn hủy vì ốm bệnh hoặc
                    gián đoạn do dịch COVID-19.</p>
                <span href="#">Hiển thị thêm <i class="fas fa-angle-right"></i></span>
            </div>

        </div>

    </div>
@endsection
