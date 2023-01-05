package com.signin.kmm.samplewebview

interface Platform {
    val name: String
}

expect fun getPlatform(): Platform