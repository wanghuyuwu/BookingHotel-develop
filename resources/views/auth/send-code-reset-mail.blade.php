@extends('layout.app')

@section('content')
    <div class="wrapper container">
        <section id="form-update">
            <x-alert-errors />
            <form action="{{ route('forgot.store') }}" method="POST" id="form">
                @csrf
                <h3 class="form-title">Forgot password?</h3>
                <x-alert-errors />
                <div class="form-text">
                    <p>Enter the mail address associated with your account and we'll send you a code to
                        reset your password</p>
                </div>
                <div class="form-input">
                    <label for="email" class="d-block">Your email</label>
                    <input type="email" class="form-control w-100" name="email" id="email" placeholder="Your email">
                </div>
                <div class="form-btn">
                    <button class="button-submit">Send code</button>
                </div>
                <div class="redirect-to-signup">
                    <p class="form-text">Don't have an account? <a href="#">Sign up</a></p>
                </div>
            </form>
        </section>
    </div>
@endsection
