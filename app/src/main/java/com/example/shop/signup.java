package com.example.shop;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import com.example.shop.databinding.ActivityMainBinding;

public class signup extends AppCompatActivity {
    private ActivityMainBinding binding;



    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_signup);



        Button myButton = findViewById(R.id.hello);
        myButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                Intent intent = new Intent(signup.this, Home.class);
                startActivity(intent);

            }
        });


    }
}


/*
    EditText emailtxt = findViewById(R.id.email_textinputlayout);
    String email = emailtxt.getText().toString() ;

    EditText passwordtxt = findViewById(R.id.password_textinputlayout);
    String Password = emailtxt.getText().toString() ;

    EditText confirmtxt = findViewById(R.id.passwordconfirm_textinputlayout);
    String confirmpassword = emailtxt.getText().toString() ;
                if (email == null || Password == null || confirmpassword == null || Password != confirmpassword )
                        {
                        Toast.makeText(signup.this, "please ensure you have included data correctly", Toast.LENGTH_SHORT).show();
                        }
                        else
                        {
                        Intent intent = new Intent(signup.this, Home.class);
        startActivity(intent);
        }*/
