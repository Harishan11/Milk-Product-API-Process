<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\MasterController;
use App\Http\Controllers\EntryController;
use App\Http\Controllers\SettingController;



/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

//User 
Route::post('/user_creation',[AuthController::class,'user_creation']);

//login 
Route::post('login',[AuthController::class,'login']);

//logout
Route::post('logout',[AuthController::class,'logout']);

//Master 
Route::post('/tax_data',[MasterController::class,'tax_data']);

Route::post('/item_data',[MasterController::class,'item_data']);

Route::post('/item_category_data',[MasterController::class,'item_category_data']);

Route::post('/item_group_data',[MasterController::class,'item_group_data']);

Route::post('/pincode_data',[MasterController::class,'pincode_data']);

Route::post('/order_cut_off_time_data',[MasterController::class,'order_cut_off_time_data']);

//pushmaster
Route::post('/push_master',[MasterController::class,'push_master']);

//pushmaster
Route::post('/get_master_record',[MasterController::class,'get_master_record']);

//updatemasterstatus
Route::post('/UpdateMasterStatus',[MasterController::class,'UpdateMasterStatus']);

//setting 
Route::post('/banner_upload_data',[SettingController::class,'banner_upload_data']);

//entries
Route::post('/sale_order_data',[EntryController::class,'sale_order_data']);

Route::post('/sale_order_item_data',[EntryController::class,'sale_order_item_data']);

Route::post('sale_approved_data',[EntryController::class,'sale_approved_data']);

//push data entry
Route::post('/push_entry',[EntryController::class,'push_entry']);

