package com.signin.kmm.samplewebview

class Config {
    private val host: String = "3029-2405-9800-b650-39c9-4c32-9450-abba-885d.ap.ngrok.io"
    private val schema: String = "https"

    public fun targetURL(): String {
        return "$schema://$host"
    }

    fun trustHost(): String {
        return host
    }
}