<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>{{ config('app.name', 'Laravel') }}</title>

    <link type="text/css" rel="stylesheet" href="{{ asset('/adminContent') }}/css/font-awesome.min.css"/>
    <link href="{{ asset('/adminContent') }}/css/bootstrap.min.css" rel="stylesheet">
    <link type="text/css" rel="stylesheet" href="{{ asset('/adminContent') }}/css/style.css"/>
  </head>
  <body>
    <div class="container-fluid">
        	<div class="row">
            @auth
            <div class="col-md-2 well ">
                <div class="image-area text-center">
                  <img class="img-circle" src="{{ asset('/adminContent') }}/images/avatar.png" alt="avatar">
                  <h4>Admin <span class="dot"></span></h4>
                </div>
                <hr>
                <h3>Main Navigation</h3>
                <hr>
                <div class="menu-area">
                    <ul>
                      <li ><i class="fa fa-bank"></i><a href="">  Dashboard</a></li>
                      <li><i class="fa fa-image"></i><a href="">  Manage Student</a></li>
                      <li><i class="fa fa-bar-chart"></i><a href="">  Charts</a></li>
                      <li>
                        <a data-toggle="collapse" href="#collapse1"><i class="fa fa-bar-chart"></i>  Result</a>
                        <div id="collapse1" class="panel-collapse collapse">
                          <ul>
                            <li><i class="fa fa-group"></i><a href="">  All Student</a></li>
                            <li><i class="fa fa-bank"></i><a href="">  Attendance</a></li>
                            <li><i class="fa fa-image"></i><a href="">  Leave</a></li>
                            <li><i class="fa fa-cubes"></i><a href="">  Expense</a></li>
                          </ul>
                        </div>
                      </li>
                      <li><i class="fa fa-group"></i><a href="">  All Student</a></li>
                      <li><i class="fa fa-bank"></i><a href="">  Attendance</a></li>
                      <li><i class="fa fa-image"></i><a href="">  Leave</a></li>
                      <li><i class="fa fa-cubes"></i><a href="">  Expense</a></li>
                      <li><i class="fa fa-group"></i><a href="">  All Student</a></li>
                      <li><i class="fa fa-bank"></i><a href="">  Attendance</a></li>
                      <li><i class="fa fa-image"></i><a href="">  Leave</a></li>
                      <li><i class="fa fa-cubes"></i><a href="">  Expense</a></li>

                    </ul>
                </div>
            </div>
            <div class="col-md-10 standard ">
                <div class="col-md-12 header well">
                  <i class="fa fa-bars"></i>
                  <span>Attendance System</span>
                <div class="dropdown pull-right">
                  <i class="fa fa-envelope"><sup>10</sup></i>
                    <a class="dropdown-toggle" data-toggle="dropdown">  Rahim
                    <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                      <li><a href="#">Setting</a></li>
                      <li><a href="#">
                            <a  href="{{ route('logout') }}"
                               onclick="event.preventDefault();
                                             document.getElementById('logout-form').submit();">
                                {{ __('Logout') }}
                            </a>

                            <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                                @csrf
                            </form>
                      </a></li>
                    </ul>
                 </div>
               </div>

           @endauth
                 <div class="col-md-12 ">
                   <main class="py-4">
                       @yield('content')
                   </main>
                 </div>

            @auth
            </div>
            </div>
          </div>
      </div>
    @endauth
    <script src="{{ asset('/adminContent') }}/js/jquery-3.2.1.js"></script>
    <script src="{{ asset('/adminContent') }}/js/bootstrap.min.js"></script>
  </body>
</html>
