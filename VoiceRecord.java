package com.example.formdemo;

import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.RecyclerView;

import android.os.Bundle;
import android.view.MotionEvent;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.ImageView;

public class VoiceRecord extends AppCompatActivity  {

    ImageView imageView;
    boolean isRecording  = false;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_voice_record);
        imageView=findViewById(R.id.imgMic);

        imageView.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                if (isRecording) {
                    //stop
                    imageView.setImageDrawable(getResources().getDrawable(R.drawable.record_btn_stopped,null));
                    isRecording=false;
                }else {
                    //start
                    isRecording=true;
                    imageView.setImageDrawable(getResources().getDrawable(R.drawable.record_btn_recording,null));

                }
            }
        });


    }

}