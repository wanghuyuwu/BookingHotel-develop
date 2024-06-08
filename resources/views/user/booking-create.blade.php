@extends('layout.app')

@section('content')
    <div class="container grid">
        <x-alert-errors />
        <div id="booking-form">
            <form method="POST" action="{{ route('booking.store') }}">
                @csrf
                <input type="hidden" name="hotel_id" value="{{ $hotel->id }}">

                <label for="check_in_date">Ngày nhận phòng:</label>
                <input type="datetime-local" name="check_in_date" required>

                <label for="check_out_date">Ngày trả phòng:</label>
                <input type="datetime-local" name="check_out_date" required>

                <label for="num_guests">Số lượng người (giới hạn: {{ $hotel->num_guest }} khách)</label>
                <input type="number" name="num_guests" required max="{{ $hotel->num_guest }}">

                <label for="total_cost">Giá thuê phòng ($):</label>
                <input type="text" name="total_cost" readonly>

                <span id="error-message" class="error-message"></span>

                <button type="submit">Xác nhận đặt phòng</button>
            </form>
        </div>

        <script>
            var pricePerNight = {{ $hotel->price }};
            var numGuestsLimit = {{ $hotel->num_guest }};
        </script>
    </div>
@endsection
