package com.moser

import io.ktor.server.engine.*
import io.ktor.server.netty.*
import com.moser.plugins.*
import io.ktor.server.application.*

fun main() {

    val environment= applicationEngineEnvironment {
        connector {
            port=8080
            host="localhost"
        }
        module { configureSecurity() }
        module { configureHTTP() }
        module { configureTemplating() }
        module { configureSerialization() }
        module { configureSockets() }
        module { configureRouting() }
    }

    embeddedServer(Netty, environment).start(wait = true)
}
