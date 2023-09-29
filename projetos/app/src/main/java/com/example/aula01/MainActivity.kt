package com.example.aula01

import android.os.Bundle
import android.util.Log
import android.widget.Button
import android.widget.EditText
import android.widget.TextView
import androidx.appcompat.app.AppCompatActivity
import com.android.volley.Response
import com.android.volley.toolbox.StringRequest
import com.android.volley.toolbox.Volley
import org.json.JSONArray
import org.json.JSONObject
import java.nio.charset.Charset


class MainActivity : AppCompatActivity() {
    lateinit var txtNumero: EditText
    lateinit var lblResposta: TextView
    lateinit var btn1: Button
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        init();
    }
    fun init(){
        txtNumero = findViewById(R.id.txtNumero)
        lblResposta= findViewById(R.id.lblResultado)
        btn1 = findViewById(R.id.btn)
        btn1.setOnClickListener {
            acessarAPI_PHP_par_impar();
        }
    }
    fun acessarAPI_PHP_par_impar() {
        var numero:Int
        numero = txtNumero.text.toString().toInt()
        val queue = Volley.newRequestQueue(this)
        val url = "http://helioesperidiao.com/par.php"
        val requestBody = "txtNumero="+numero + "&msg=test_msg"
        val stringReq : StringRequest =
            object : StringRequest(Method.POST, url, Response.Listener { response ->
                    var resposta = response.toString()
                    lblResposta.text=resposta
                    println(resposta)
                },
                Response.ErrorListener { error ->
                    Log.d("API", "error => $error")
                }
            ){
                override fun getBody(): ByteArray {
                    return requestBody.toByteArray(Charset.defaultCharset())
                }
            }
        queue.add(stringReq)
    }
}


/*
fun postVolley() {
    val queue = Volley.newRequestQueue(this)
    val url = "http://helioesperidiao.com/par.php"
    val requestBody = "id=1" + "&msg=test_msg"
    val stringReq : StringRequest =
        object : StringRequest(Method.POST, url,
            Response.Listener { response ->
                // response
                var resposta = response.toString()
                val array = JSONArray(resposta)
                for (i in 0 until array.length()) {
                    val item:JSONObject = array.getJSONObject(i)
                    var idProduto = item.get("id")
                    println(idProduto)



                }

                //Log.d("API", strResp)
            },
            Response.ErrorListener { error ->
                Log.d("API", "error => $error")
            }
        ){
            override fun getBody(): ByteArray {
                return requestBody.toByteArray(Charset.defaultCharset())
            }
        }
    queue.add(stringReq)
}
*/