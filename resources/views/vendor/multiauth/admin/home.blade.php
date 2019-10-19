@extends('multiauth::layouts.app')
@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                  {{-- {{ ucfirst(config('multiauth.prefix')) }} --}}
                   Welcome To Our Dashboard</div>
                <div class="card-body">
                  @admin('super')
                  <button>Super</button>
                  @endadmin
                  @admin('visitor')
                  <button>visitor</button>
                  @endadmin
                  @admin('subscriber')
                  <button>subscriber</button>
                  @endadmin
                  @admin('admin')
                  <button>admin</button>
                  @endadmin
                </div>

            </div>
        </div>
    </div>
</div>
@endsection
