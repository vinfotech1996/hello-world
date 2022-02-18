package com.vinfotech.marugaamkadu;

import androidx.appcompat.app.AppCompatActivity;

import android.app.ProgressDialog;
import android.graphics.Bitmap;
import android.net.http.SslError;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.webkit.SslErrorHandler;
import android.webkit.WebResourceError;
import android.webkit.WebResourceRequest;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;

import com.google.android.material.tabs.TabLayout;

public class BlogNewsFeed extends AppCompatActivity {

    public WebView myWebView;

    ProgressDialog progressDialog;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_blog_news_feed);

        myWebView=findViewById(R.id.webViews);


        WebViewClient webViewClient = new WebViewClient();
        //myWebView.setWebViewClient(new myWebViewClient());
        myWebView.setWebViewClient(webViewClient);
        myWebView.loadUrl("http://www.marugaamkadu.blogspot.com");
        WebSettings webSettings = myWebView.getSettings();
        webSettings.setJavaScriptEnabled(true);


        //myWebView.getSettings().setLoadsImagesAutomatically(true);
        //myWebView.getSettings().setJavaScriptEnabled(true);   // its righttt
        //myWebView.setScrollBarStyle(View.SCROLLBARS_INSIDE_OVERLAY);
        //myWebView.loadUrl("http://www.marugaamkadu.blogspot.com");
        //WebSettings webSettings = myWebView.getSettings();
        //webSettings.setJavaScriptEnabled(true);
        //myWebView.loadUrl("http://marugaamkadu.blogspot.com");

        //myWebView.setWebViewClient(new WebViewClient());

        /*if (getSupportActionBar()!=null){
            getSupportActionBar().setDisplayHomeAsUpEnabled(true);
            getSupportActionBar().setDisplayShowHomeEnabled(true);
        }*/
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);

    }

    @Override
    public void onBackPressed() {
        if (myWebView.canGoBack())
        {
            myWebView.goBack();
        }
        else {
            super.onBackPressed();
        }
    }

    /*private class myWebViewClient extends WebViewClient {

        @Override
        public boolean shouldOverrideUrlLoading(WebView view, String url) {
           // return super.shouldOverrideUrlLoading(view, url);
            view.loadUrl(url);
            return true;
        }

        *//*@Override
        public void onReceivedSslError(WebView view, SslErrorHandler handler, SslError error) {
            //super.onReceivedSslError(view, handler, error);
            handler.proceed();
            super.onReceivedSslError(view, handler, error);
        }*//*

        @Override
        public void onReceivedError(WebView view, int errorCode, String description, String failingUrl) {
            super.onReceivedError(view, errorCode, description, failingUrl);
        }

        @Override
        public void onPageStarted(WebView view, String url, Bitmap favicon) {
            //super.onPageStarted(view, url, favicon);
            progressDialog = ProgressDialog.show(BlogNewsFeed.this,null,getResources().getString(R.string.app_name),true);
            progressDialog.setCanceledOnTouchOutside(false);
            *//*progressDialog = new ProgressDialog(BlogNewsFeed.this);
            progressDialog.setMessage("pllll waitt");
            progressDialog.show();*//*
        }

        @Override
        public void onPageFinished(WebView view, String url) {
            //super.onPageFinished(view, url);
            progressDialog.dismiss();
            *//*if (progressDialog!=null){
                progressDialog.dismiss();
            }*//*
        }

    }*/
}