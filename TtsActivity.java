package com.example.formdemo;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.speech.tts.TextToSpeech;
import android.speech.tts.Voice;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

import java.util.HashSet;
import java.util.Locale;
import java.util.Set;

public class TtsActivity extends AppCompatActivity {

    android.speech.tts.TextToSpeech tts;
    EditText ed1;
    Button b1;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_tts);
        ed1 = findViewById(R.id.edittext);
        b1 = findViewById(R.id.button);

        tts = new android.speech.tts.TextToSpeech(this, new TextToSpeech.OnInitListener() {
            @Override
            public void onInit(int i) {
                if (i!=TextToSpeech.ERROR){

                    /*Set<String> a=new HashSet<>();
                    a.add("male");
                    Voice v=new Voice("en-us-x-sfg#male_2-local",new Locale("en","US"),400,200,true,a);
                    tts.setVoice(v);
                    tts.setSpeechRate(0.8f);*/

                    //tts.setLanguage(Locale.UK);
                    tts.setLanguage(Locale.forLanguageTag("hin"));
                    tts.setSpeechRate(0.8f);
                    //tts.setPitch(1.0f);

                }

            }
        });
        /*,"com.google.android.tts""hin-IND"*/

        b1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                String toSpeak = ed1.getText().toString();

                String str = "ऑडियो रिकॉर्ड करने के लिए स्टार्ट ऑडियो रिकॉर्ड बटन दबाये और ऑडियो रिकॉर्ड स्टॉप करने के लिए स्टॉप ऑडियो रिकॉर्ड बटन दबाये ";
                //tts.speak(toSpeak,TextToSpeech.QUEUE_FLUSH,null);
                tts.speak(str, android.speech.tts.TextToSpeech.QUEUE_FLUSH, null);
                //tts.speak(toSpeak, android.speech.tts.TextToSpeech.QUEUE_FLUSH, null);

            }
        });
    }

    @Override
    protected void onPause() {
        if (tts !=null){
            tts.stop();
            tts.shutdown();
        }
        super.onPause();
    }
}