<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Hash;
use App\Models\raw_dump_archive;
use App\Models\raw_dump;
use DB;

class AuthController extends Controller
{
    //user creation
    public function user_creation(Request $request)
    {
      $raw_dump = $this->raw_dump($request->getContent(), 'user_creation',$request['access_token']);

      $data = array();
      $response = array();
      $response['status'] = 0;
      $response['msg'] = 'Invalid Parameter parsed';  
      $response['params'] = array();

       foreach ($request['params'] as $row) {
       
        //Value Assigning Section Process
        $record['email'] = $row['email'];
        $record['password'] = bcrypt($row['password']); 
        $record['name'] = isset($row['name']) ?  $row['name'] :0;       
        $record['ref_id'] = isset($row['ref_id']) ?  $row['ref_id'] : 'NULL';
        $record['latlng'] = isset($row['latlng']) ?  $row['latlng'] :0;
        $record['user_type'] = isset($row['user_type']) ?  $row['user_type'] :0;
        $record['mobile_no'] = isset($row['mobile_no']) ?  $row['mobile_no'] :0;
        $record['alt_mob_no'] = isset($row['alt_mob_no']) ?  $row['alt_mob_no'] : 'NULL';
        $record['aadhaar_no'] = isset($row['aadhaar_no']) ?  $row['aadhaar_no'] : 'NULL';      
        
        

        if (isset($row['remote_id']) && $row['remote_id'] != "0") {
          
         //Validation Field for Duplicate Check Process
          $master_count = User::select('id')->where(
            'email','=', $row['email'])
           ->Where('id','!=', $row['remote_id'])  
           ->get()->count();
        } else {
       
          $master_count = User::select('id')->where(
            'email','=', $row['email'])
           ->get()->count();              
        }
       
        if ($master_count > 0) {
        
          $id_ = (isset($row['remote_id']) && $row['remote_id'] != "0") ? $row['remote_id'] : $row['id'];
          $data[] = array(
              "id" => $id_,
              "email" => $row['email'],
              "msg" => 'email Already Exists'
          );

          $response['params'] = $data;
          continue;
       } 

              //Update Receord Process
              if (isset($row['remote_id']) && $row['remote_id'] != "0") {
              //  $record['m_time'] =   date('Y-m-d H:i:s');
              

                  $update= User::where('id', ($row['remote_id']))->update($record);;

                  if ($update) {
                      $data[] = array(
                          "id" => $row['id'],
                          "remote_id" => $row['remote_id'],
                          "msg" => 'Updated',
                         
                      );
                  }

              } else { 

                //Insert Record Process
                $record['c_time'] =   date('Y-m-d H:i:s');
            
                $user=User::create($record);
                  
                 
                if ($user) {
                     
                    $id = $user['id'];

                    $data[] = array(
                          "id" => $row['id'],
                          "remote_id" => $id,
                          "msg" => 'Inserted'
                      );
                  } else if (!$result) {
                      
                    $data[] = array(
                          "id" => $row['id'],
                          "remote_id" => 0
                      );
                 }
                
               }

              $response['status'] = 1;
              $response['msg'] = 'Completed';
              $response['params'] = $data;   
                           
         }
              
       return $response;
    }
  
 

    //login creation
     public function login(Request $request)
    {
      
       $data = array();       

       $validateData=$request->validate([ 
     
          'params.*.tkn' => 'required',
          'params.*.api_key' => 'required',
          'params.*.email' => 'required',
          'params.*.password' => 'required',
           
         ]);
          

       $cred = request(['email', 'password']);   

        if(!auth()->attempt($cred))
       {
        return response()->json([
          'status' => '0',
          'log_status' => 'login failed'
        ]);

       }   

      
       $user = User::where('email', request('email'))->first();

      //  $user_data = User::select('id as remote_id',
      //  'name','email', 'password', 'ref_id', 'latlng', 'user_type', 'mobile_no','alt_mob_no',
      //  'aadhaar_no','status','c_time','m_time')->get();



       $tokenres = $user->createToken('authToken')->plainTextToken;

        User::where('id', $user->id)
       ->update([
           'status' => 1
        ]);

         $data[] = auth()->user();
          
         //  $u_data = $user_data;

          return response()->json([
        
            'status' => '1',
            'msg' => 'login successfully',
            'token' => $tokenres,
            'params'=>$data,


          ]);        
                  
    }

     public function logout(Request $request)
    {

      $raw_dump = $this->raw_dump($request->getContent(), 'logout',$request['access_token']);

      $user =  User::where('id', $request->id)

       ->update([
           'is_login' => 0
        ]);

        
        $deleted = DB::table('personal_access_tokens')->where('tokenable_id', '=', $request->id)->delete();
    
         if($user > 0){

            return response()->json([
              "status" => '0',
              "msg"=>"logout Successfully",        
              "is_logged_in" => '0',
           ]);

           } else {
               return response()->json([
                  "status" => '0',
                 "msg"=>"logout failed",     
        
            ]);

             }
 
     }

     public function raw_dump($request, $type, $token)
     {
    
      $token_value;
      $tok_id=DB::table('personal_access_tokens')->select('tokenable_id')->where('token','=',$token)->get();
    
      foreach ($tok_id as $key => $tok_value) {
       // print($tok_value->tokenable_id);
        $token_value = $tok_value->tokenable_id;
      }
    
      $record = array();
      $record['user_id'] =   $token_value;
      $record['access_token'] =   $token;
      $record['json_dump'] =   $request;
      $record['request_type'] =   $type;
     // $record['m_time'] =   date('Y-m-d H:i:s');
                
      $user=raw_dump_archive::create($record);  
    
    }
    

}