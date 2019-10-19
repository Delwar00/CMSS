<?php

Route::group(['namespace' => 'Teacher'], function() {
    Route::get('/', 'HomeController@index')->name('teacher.dashboard');

    // Login
    Route::get('login', 'Auth\LoginController@showLoginForm')->name('teacher.login');
    Route::post('login', 'Auth\LoginController@login');
    Route::post('logout', 'Auth\LoginController@logout')->name('teacher.logout');

    // Register
    Route::get('register', 'Auth\RegisterController@showRegistrationForm')->name('teacher.register');
    Route::post('register', 'Auth\RegisterController@register');

    // Passwords
    Route::post('password/email', 'Auth\ForgotPasswordController@sendResetLinkEmail')->name('teacher.password.email');
    Route::post('password/reset', 'Auth\ResetPasswordController@reset');
    Route::get('password/reset', 'Auth\ForgotPasswordController@showLinkRequestForm')->name('teacher.password.request');
    Route::get('password/reset/{token}', 'Auth\ResetPasswordController@showResetForm')->name('teacher.password.reset');

});