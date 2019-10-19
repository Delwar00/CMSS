<?php

namespace App\Http\Controllers\Teacher;

use App\Http\Controllers\Controller;

class HomeController extends Controller
{

    protected $redirectTo = '/teacher/login';

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('teacher.auth:teacher');
    }

    /**
     * Show the Teacher dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    public function index() {
        return view('teacher.home');
    }

}