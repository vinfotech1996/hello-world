package com.example.formdemo;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.app.ActivityCompat;
import androidx.core.content.ContextCompat;

import android.Manifest;
import android.app.Dialog;
import android.app.ProgressDialog;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Bundle;
import android.os.Environment;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;
import android.widget.Toast;
import android.widget.VideoView;
import java.io.File;
import java.net.URISyntaxException;

public class CompressVideo extends AppCompatActivity {

    // Initialize variable
    Button btSelect;
    VideoView videoView1, videoView2;
    TextView textView1, textView2, textView3;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_compress_video);

        // Assign variable
        btSelect = findViewById(R.id.bt_select);
        videoView1 = findViewById(R.id.video_view1);
        videoView2 = findViewById(R.id.Video_view2);
        textView1 = findViewById(R.id.TextView1);
        textView2 = findViewById(R.id.text_view2);
        textView3 = findViewById(R.id.TextView3);


        btSelect.setOnClickListener(
                new View.OnClickListener() {
                    @Override public void onClick(View v)
                    {
                        // check condition
                        if (ContextCompat.checkSelfPermission(
                                CompressVideo.this,
                                Manifest.permission
                                        .WRITE_EXTERNAL_STORAGE)
                                == PackageManager
                                .PERMISSION_GRANTED) {
                            // When permission is granted
                            // Create method
                            selectVideo();
                        }
                        else {
                            // When permission is not granted
                            // request permission
                            ActivityCompat.requestPermissions(
                                    CompressVideo.this,
                                    new String[] {
                                            Manifest.permission
                                                    .WRITE_EXTERNAL_STORAGE },
                                    1);
                        }
                    }
                });
    }

    private void selectVideo()
    {
        // Initialize intent
        Intent intent = new Intent(Intent.ACTION_PICK);
        // Set type
        intent.setType("video/*");
        // set action
        intent.setAction(Intent.ACTION_GET_CONTENT);
        // Start activity result
        startActivityForResult(
                Intent.createChooser(intent, "Select Video"),
                100);
    }

    @Override
    public void onRequestPermissionsResult(
            int requestCode, @NonNull String[] permissions,
            @NonNull int[] grantResults)
    {
        super.onRequestPermissionsResult(
                requestCode, permissions, grantResults);
        // check condition
        if (requestCode == 1 && grantResults.length > 0
                && grantResults[0]
                == PackageManager.PERMISSION_GRANTED) {
            // When permission is granted
            // Call method
            selectVideo();
        }
        else {
            // When permission is denied
            // Display Toast
            Toast
                    .makeText(getApplicationContext(),
                            "Permission Denied !",
                            Toast.LENGTH_SHORT)
                    .show();
        }
    }

    @Override
    protected void onActivityResult(int requestCode,
                                    int resultCode,
                                    @Nullable Intent data)
    {
        super.onActivityResult(requestCode, resultCode,
                data);
        // Check condition
        if (requestCode == 100 && resultCode == RESULT_OK
                && data != null) {
            // When result is ok
            // Initialize Uri
            Uri uri = data.getData();
            // Set video uri
            videoView1.setVideoURI(uri);
            // Initialize file
            File file = new File(
                    Environment.getExternalStorageDirectory()
                            .getAbsolutePath());
            // Create compress video method
            new CompressVideoView().execute(
                    "false", uri.toString(), file.getPath());
        }
    }

    private class CompressVideoView
            extends AsyncTask<String, String, String> {

        // Initialize dialog
        Dialog dialog;

        @Override protected void onPreExecute()
        {
            super.onPreExecute();
            // Display dialog
            dialog = ProgressDialog.show(
                    CompressVideo.this, "", "Compressing...");
        }

        @Override
        protected String doInBackground(String... strings)
        {
            // Initialize video path
            String videoPath = null;


            try {
                // Initialize uri
                Uri uri = Uri.parse(strings[1]);
                // Compress video
                videoPath = SiliCompressor.with(CompressVideo.this)
                        .compressVideo(uri, strings[2]);

            }
            catch (URISyntaxException e) {
                e.printStackTrace();
            }
            // Return Video path
            return videoPath;
        }

        @Override protected void onPostExecute(String s)
        {
            super.onPostExecute(s);
            // Dismiss dialog
            dialog.dismiss();

            // Visible all views
            videoView1.setVisibility(View.VISIBLE);
            textView1.setVisibility(View.VISIBLE);
            videoView2.setVisibility(View.VISIBLE);
            textView2.setVisibility(View.VISIBLE);
            textView3.setVisibility(View.VISIBLE);

            // Initialize file
            File file = new File(s);
            // Initialize uri
            Uri uri = Uri.fromFile(file);
            // set video uri
            videoView2.setVideoURI(uri);

            // start both video
            videoView1.start();
            videoView2.start();

            // Compress video size
            float size = file.length() / 1024f;
            // Set size on text view
            textView3.setText(String.format("Size : %.2f KB", size));
        }
    }

}
