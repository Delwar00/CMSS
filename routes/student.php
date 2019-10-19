<?php

Route::group(['namespace' => 'Student'], function() {
    Route::get('/', 'HomeController@index')->name('student.dashboard');

    // Login
    Route::get('login', 'Auth\LoginController@showLoginForm')->name('student.login');
    Route::post('login', 'Auth\LoginController@login');
    Route::post('logout', 'Auth\LoginController@logout')->name('student.logout');

    // Register
    Route::get('register', 'Auth\RegisterController@showRegistrationForm')->name('student.register');
    Route::post('register', 'Auth\RegisterController@register');

    // Passwords
    Route::post('password/email', 'Auth\ForgotPasswordController@sendResetLinkEmail')->name('student.password.email');
    Route::post('password/reset', 'Auth\ResetPasswordController@reset');
    Route::get('password/reset', 'Auth\ForgotPasswordController@showLinkRequestForm')->name('student.password.request');
    Route::get('password/reset/{token}', 'Auth\ResetPasswordController@showResetForm')->name('student.password.reset');

});