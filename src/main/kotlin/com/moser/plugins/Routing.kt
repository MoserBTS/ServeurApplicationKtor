package com.moser.plugins

import com.example.retrofit.models.Etudiant
import com.serveur.bdd_MySql.Gestion
import io.ktor.server.routing.*
import io.ktor.http.*
import io.ktor.server.locations.*
import io.ktor.server.http.content.*
import io.ktor.server.application.*
import io.ktor.server.freemarker.*
import io.ktor.server.response.*
import io.ktor.server.request.*

fun Application.configureRouting() {
    install(Locations) {
    }

    var maGestion = Gestion()

    routing {
        get("/") {
            call.respondText("Hello World!")
        }
        // Static plugin. Try to access `/static/index.html`
        static("/static") {
            resources("static")
        }

        route("/gestion/etudiant") {
            get("/") {
                call.respond(FreeMarkerContent("index.ftl", mapOf("etudiants" to maGestion.lireLesEtudiants())))
            }
            get("/delete/{id}") {
                val id = call.parameters["id"]
                println("dans supprimer de $id")
                maGestion.supprimerUnEtudiant(id!!.toInt())
                call.respond(FreeMarkerContent("index.ftl", mapOf("etudiants" to maGestion.lireLesEtudiants())))
            }
            /*            get("/edit") {
                var etudiant =call.request.queryParameters["etudiant"]
                var tabEtudiant=((etudiant!!).replace("Etudiant(","").replace(")","").trim()).split(",")
                tabEtudiant.forEach{
                    println(it.trimEnd().trimStart())
                }
                maGestion.miseAJourEtudiant(Etudiant(tabEtudiant[0].replace("id=","").toInt(),
                    tabEtudiant[1].replace("firstname=",""),
                    tabEtudiant[2].replace("lastname=",""),
                    tabEtudiant[3].replace("age=",""),
                    tabEtudiant[4].replace("image=","")))

                call.respond(FreeMarkerContent("index.ftl", mapOf("etudiants" to maGestion.lireLesEtudiants())))
            }*/
            post("/edit/"){
                val postParameters: Parameters = call.receiveParameters()
                val etudiant=Etudiant(
                    postParameters["id"]!!.toInt(),
                    postParameters["firstname"],
                    postParameters["lastname"],
                    postParameters["age"],
                    postParameters["image"])
                println(etudiant.toString())
                maGestion.miseAJourEtudiant(etudiant)
                call.respond(FreeMarkerContent("index.ftl", mapOf("etudiants" to maGestion.lireLesEtudiants())))
            }
            post("/ajouter/"){
                val postParameters: Parameters = call.receiveParameters()
                val etudiant=Etudiant(
                    null,
                    postParameters["firstname"],
                    postParameters["lastname"],
                    postParameters["age"],
                    postParameters["image"])
                println(etudiant.toString())
                maGestion.ajoutEtudiant(etudiant)
                call.respond(FreeMarkerContent("index.ftl", mapOf("etudiants" to maGestion.lireLesEtudiants())))
            }
        }

        route("/test"){
            get("/") {
                call.respondText("get sans parametre")
            }
            get("/parameter") {
                var parameter =call.request.queryParameters["parameter"]
                call.respondText("get avec  parametre: $parameter")
            }

            post("/") {
                val postParameters: Parameters = call.receiveParameters()
                call.respondText("post avec  parametre: ${postParameters["parameter"]}")
            }
        }
    }
}




