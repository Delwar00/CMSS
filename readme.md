<?php

namespace App\Http\Controllers;

use App\AcademicYear;
use App\AllClass;
use App\Exam;
use App\ExamSchedule;
use App\Subject;
use Exception;
use App\Suggestion;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;
class SuggestionController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $data['class_info']=AllClass::all();
//        $data['exam_info']=Exam::all();
        $data['academics_year']=AcademicYear::where('is_running',1)->first();
        $data['exam_info']=Exam::join('a1_academic_years','b1_exams.academic_year_id','a1_academic_years.id')
            ->select('a1_academic_years.start_year','b1_exams.*')
            ->where('a1_academic_years.is_running',1)
            ->get();
        return view('admin.exam.exam_suggestion.add_exam_suggestion',$data);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(),[
            'title'         =>['required','string','max:255'],
            'exam_id'       =>['required','integer'],
            'class_id'      =>['required','integer'],
            'subject_id'    =>['required','integer'],
            'suggestion'     =>['required'],
        ]);

        if ($validator->fails()) {
             back()->withErrors($validator->errors());
        } else {
//            $id = Suggestion::insertGetId($request->except('_token', 'status'));
//                if($request->hasFile('suggestion')){
//                    $path = $request->file('suggestion')->store('Suggestion');
//                    Suggestion::where('id','=',$id)->update([
//                        'suggestion'=>$path,
//                    ]);
//                }
            $insert_director = new Suggestion();
            $insert_director->title = $request->title;
            $insert_director->exam_id = $request->exam_id;
            $insert_director->class_id = $request->class_id;
            $insert_director->subject_id = $request->subject_id;
            $insert_director->note = $request->note;

            if ($request->hasFile('suggestion')) {
                $file = $request->file('suggestion');
                $original_name=$request->file('suggestion')->getClientOriginalName();
                $image =Str::random(3) . '_' .$original_name;
                $destinationPath = public_path() . '/uploads/sugg/';
                $file->move($destinationPath, $image);
                $insert_director->suggestion = $image;
            }

            $insert_director->save();
            return redirect()->back()->with('status', 'Suggestion Added Successfully!');

        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Suggestion  $suggestion
     * @return \Illuminate\Http\Response
     */
    public function show(Suggestion $suggestion,$id)
    {
        $data['exam_suggestion']=AllClass::find($id)->suggestion;
        return view('admin.exam.exam_suggestion.exam_suggestion',$data);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Suggestion  $suggestion
     * @return \Illuminate\Http\Response
     */
    public function edit(Suggestion $suggestion,$id)
    {
        $data['suggestion']=Suggestion::find($id);
        $data['class_info']=AllClass::all();
//        $data['exam_info']=Exam::all();
        $data['academics_year']=AcademicYear::where('is_running',1)->first();
        $data['exam_info']=Exam::join('a1_academic_years','b1_exams.academic_year_id','a1_academic_years.id')
            ->select('a1_academic_years.start_year','b1_exams.*')
            ->where('a1_academic_years.is_running',1)
            ->get();
        return view('admin.exam.exam_suggestion.edit_exam_suggestion',$data);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Suggestion  $suggestion
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Suggestion $suggestion,$id)
    {
        $validator = Validator::make($request->all(),[
            'title'         =>['required','string','max:255'],
            'exam_id'       =>['required','integer'],
            'class_id'      =>['required','integer'],
            'subject_id'    =>['required','integer'],
            'suggestion'     =>['required'],
        ]);

        if ($validator->fails()) {
            back()->withErrors($validator->errors());
        } else {
            $edit_director = Suggestion::find($id);
            $edit_director->title = $request->title;
            $edit_director->exam_id = $request->exam_id;
            $edit_director->class_id = $request->class_id;
            $edit_director->subject_id = $request->subject_id;
            $edit_director->note = $request->note;
            if ($request->hasFile('suggestion')) {
                $full_path=public_path() . '/uploads/sugg/'.$edit_director->suggestion;
                if (file_exists($full_path)) {
                    unlink($full_path);
                }

                $file = $request->file('suggestion');
                $original_name=$request->file('suggestion')->getClientOriginalName();
                $image = Str::random(3) . '_' . $original_name;
                $destinationPath = public_path() . '/uploads/sugg/';
                $file->move($destinationPath, $image);
                $edit_director->suggestion = $image;
            }

            $edit_director->save();
            //return $edit_director;
            //$edit_director->save();

            return back()->with('status', 'Suggestion Updated Successfully!');
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Suggestion  $suggestion
     * @return \Illuminate\Http\Response
     */
    public function destroy(Suggestion $suggestion,$id)
    {
        try {
            Suggestion::where('id',$id)->delete();
        } catch (Exception $e) {
            return back()->withError('Suggestion has Child/Childs. You must DELETE the Child/Childs first!')
                ->with('server_error','Server Error Message :: '.$e->getMessage());
        }

        return back()->with('status', 'Suggestion Deleted Successfully!');
    }
    //depends on class get subject
    public function subjectList(Request $request)
    {
        $string="";
        $subjects=Subject::where('class_id','=',$request->class_id)->get();
        foreach($subjects as $subject){
            $string.="<option value='$subject->id'> $subject->name</option>";
        }
        echo $string;
    }
}
