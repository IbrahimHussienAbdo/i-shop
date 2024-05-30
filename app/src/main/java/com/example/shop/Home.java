package com.example.shop;
import com.example.shop.CartManager;
import androidx.appcompat.app.AppCompatActivity;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.Toast;
import java.util.ArrayList;
import java.util.List;
import java.util.ArrayList;
import java.util.List;


public class Home extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_home);



        Button myButton1 = findViewById(R.id.buttonaddtocart10);
        Button myButton2 = findViewById(R.id.buttonaddtocart20);
        Button myButton3 = findViewById(R.id.buttonaddtocart30);
        Button myButton4 = findViewById(R.id.buttonaddtocart40);
        Button myButton5 = findViewById(R.id.buttonaddtocart50);
        Button myButton6 = findViewById(R.id.buttonaddtocart60);
        Button myButton7 = findViewById(R.id.buttonaddtocart70);
        Button myButton8 = findViewById(R.id.buttonaddtocart80);

        // done sending
        myButton1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                int drawableResourceId = R.drawable.clo1; // Assuming "clo1" is the image name in your drawable folder
                sendData(drawableResourceId,"Coat","1150");

            }
        });

        // done sending
        myButton2.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                sendData(0,"Crop-top","150");

            }
        });

// done
        myButton3.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                sendData(0,"Suit","750");

            }
        });

// done
        myButton4.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                sendData(0,"Crop-top","250");

            }
        });
        myButton5.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                sendData(0,"Sun glasses","150");

            }
        });


        myButton6.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                sendData(0,"Necklase","200");

            }
        });
        myButton7.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                sendData(0,"earring","270");

            }
        });
        myButton8.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                sendData(0,"Necklase","300");

            }
        });





    }

    void sendData (int drawableResourceId , String title , String price ){

            Intent intent = new Intent(Home.this, Cart.class);

            intent.putExtra("imgpath", drawableResourceId); // Adding a string value with a key
            intent.putExtra("title", title); // Adding a string value with a key
            intent.putExtra("price", price); // Adding a string value with a key
            startActivity(intent);


    };


}



// CartManager.java


