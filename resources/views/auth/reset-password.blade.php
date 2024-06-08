@extends('layout.app')

@section('title', "Reset password")

@section('content')
    <section id="form-update">
        <x-alert-errors />
        <form method="POST" id="form"
              action="{{ route('reset_pass.update', ['token' => $token]) }}">
            @csrf

            <h3 class="form-title text-center">Reset new password</h3>
            <div class="form-text">
                <span class="fs-5">Enter the new password</span>
            </div>
            <div class="form-input">
                <label for="token" class="d-block">Token</label>
                <input type="text" class="form-control w-100" name="token_reset" id="token" placeholder="Your token">
            </div>
            <div class="form-input">
                <label for="new_password" class="d-block">Your new password</label>
                <input type="password" class="form-control w-100" name="new_password" id="new_password"
                       placeholder="New password">
            </div>
            <div class="form-input">
                <label for="new_password_confirm" class="d-block">Confirm new password</label>
                <input type="password" class="form-control w-100" name="new_password_confirmation" id="new_password_confirm"
                       placeholder="Confirm new password">
            </div>
            <div class="form-btn">
                <button class="button-submit">Reset password</button>
            </div>
            <div class="redirect-to-signup">
                <p class="form-text">Don't have an account? <a href="#">Sign up</a></p>
            </div>
        </form>
    </section>
@endsection

