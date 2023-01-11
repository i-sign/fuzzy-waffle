package com.signin.kmm.samplewebview.android

import android.annotation.SuppressLint
import android.content.Intent
import android.os.Bundle
import android.view.ViewGroup
import android.webkit.WebResourceRequest
import android.webkit.WebView
import android.webkit.WebViewClient
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.material.*
import androidx.compose.runtime.Composable
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.viewinterop.AndroidView
import com.signin.kmm.samplewebview.Config

class MainActivity : ComponentActivity() {

    @SuppressLint("UnusedMaterialScaffoldPaddingParameter")
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            MyApplicationTheme {
                Scaffold(
                    topBar = { TopAppBar(title = { Text("Webview") }) },
                    content = { CustomWebview() }
                )
            }
        }
    }
}

@Composable
fun GreetingView(text: String) {
    Text(text = text)
}

@Composable
fun CustomWebview() {
    val config: Config = Config()
    val webviewURL: String = config.targetURL()

    AndroidView(factory = {
        WebView(it).apply {
            layoutParams = ViewGroup.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.MATCH_PARENT
            )
            webViewClient = object : WebViewClient() {
                override fun shouldOverrideUrlLoading(
                    view: WebView?,
                    request: WebResourceRequest?
                ): Boolean {
                    if (request?.url?.host == config.trustHost()) {
                        return false
                    } else {
                        val intent = Intent(Intent.ACTION_VIEW, request?.url)
                        view?.context?.startActivity(intent)
                        return true
                    }
                }
            }
            settings.javaScriptEnabled = true
            loadUrl(webviewURL)
        }
    }, update = { it.loadUrl(webviewURL) })
}

@Preview
@Composable
fun DefaultPreview() {
    MyApplicationTheme {
        // GreetingView("Hello, Android!")
        CustomWebview()
    }
}
