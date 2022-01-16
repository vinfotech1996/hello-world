package com.example.formdemo;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.text.Editable;
import android.text.TextWatcher;
import android.view.View;
import android.widget.EditText;
import android.widget.ImageView;

public class ChatSms extends AppCompatActivity {

    EditText typeSms;
    ImageView send,audio;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_chat_sms);

        typeSms = findViewById(R.id.editTextTextPersonName);
        send = findViewById(R.id.imageView2);
        audio =findViewById(R.id.imageView3);

        typeSms.addTextChangedListener(new TextWatcher() {
            @Override
            public void beforeTextChanged(CharSequence charSequence, int i, int i1, int i2) {

            }

            @Override
            public void onTextChanged(CharSequence charSequence, int i, int i1, int i2) {

                if (charSequence.toString().length()<1){
                    send.setVisibility(View.GONE);
                }else send.setVisibility(View.VISIBLE); 


            }

            @Override
            public void afterTextChanged(Editable editable) {

            }
        });

    }
}