package com.example.shop;
import com.example.shop.CartManager;
import androidx.appcompat.app.AppCompatActivity;

import android.annotation.SuppressLint;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.net.Uri;
import android.os.Bundle;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Toast;

import java.util.List;

public class Cart extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_cart);


        // Inside ActivityB in onCreate() or another appropriate method
        Intent intent = getIntent();
        if (intent != null) {
/*
            int drawableResourceId = intent.getIntExtra("drawableId", 0);
*/
            String title = intent.getStringExtra("title"); // Retrieving the string value
            String price = intent.getStringExtra("price"); // Retrieving the string value



/*
            ImageView img = findViewById(R.id.cartimage); // Assuming you have a TextView in your layout with id valueTextView
*/
            TextView titlee = findViewById(R.id.carttitle); // Assuming you have a TextView in your layout with id valueTextView
            TextView pricee = findViewById(R.id.price); // Assuming you have a TextView in your layout with id valueTextView

            titlee.setText(title);
            pricee.setText(price);

            int drawableResourceId = intent.getIntExtra("drawableId", 0);
            if (drawableResourceId != 0) {
                ImageView imageView = findViewById(R.id.cartimage); // Assuming you have an ImageView in OtherActivity with ID imageView
                imageView.setImageResource(drawableResourceId); // Set the image to the ImageView

            }

            Button myButton = findViewById(R.id.buttonbuynow);
            myButton.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    // Define the functionality when the button is clicked
                    // For example, show a toast message
                    Toast.makeText(Cart.this, "Button clicked!", Toast.LENGTH_SHORT).show();

                    Intent intent = new Intent(Cart.this, Payment.class);
                    startActivity(intent);
                    // You can add more functionality here, like navigating to another activity or performing an action.
                }
            });
        }
    }
}
