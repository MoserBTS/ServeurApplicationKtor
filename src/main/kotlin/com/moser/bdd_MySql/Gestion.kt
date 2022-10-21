package com.serveur.bdd_MySql

import com.example.retrofit.models.Etudiant
import java.sql.*


class Gestion() {
    var laConnexion = Connexion("jdbc:mysql://localhost/etudiants", "root", "")
    //var laConnexion = Connexion("jdbc:mysql://localhost/etudiants", "root", "mdp")//pour rpi


    init {
        //laConnexion.voirLesBdd().forEach { bdd-> println(bdd) }
    }

    fun lireLesEtudiants(): ArrayList<Etudiant> {
        var arLesEtudiants = ArrayList<Etudiant>()
        var prepStatement = laConnexion.getConnexion()
            .prepareStatement("SELECT * from info")
        var rs = prepStatement.executeQuery()
        while (rs.next()) {
            arLesEtudiants.add(Etudiant(rs.getInt("id"),
                rs.getString("firstname"),
                rs.getString("lastname"),
                rs.getString("age"),
                rs.getString("image"),
            ))
        }
        return arLesEtudiants
    }

    fun lireUnEtudiants(id: String):Etudiant  {
        lateinit var etudiant:Etudiant
        var prepStatement = laConnexion.getConnexion()
            .prepareStatement("SELECT * from info where id=?")
        prepStatement.setString(1,id)
        var rs = prepStatement.executeQuery()
        while (rs.next()) {
            etudiant=Etudiant(rs.getInt("id"),
                rs.getString("firstname"),
                rs.getString("lastname"),
                rs.getString("age"),
                rs.getString("image"))
        }
        println(etudiant)
        return etudiant
    }

    fun ajoutEtudiant(etudiant: Etudiant): Int {
         var prepStatement = laConnexion.getConnexion()
            .prepareStatement("insert into etudiants.info(firstname, lastname, age, image) VALUES (?, ?, ?, ?) ")
        prepStatement.setString(1,etudiant.firstname)
        prepStatement.setString(2,etudiant.lastname)
        prepStatement.setString(3,etudiant.age)
        prepStatement.setString(4,etudiant.image)
        return prepStatement.executeUpdate()
    }

    fun supprimerUnEtudiant(id:Int):Int{
        var prepStatement = laConnexion.getConnexion()
            .prepareStatement("delete from etudiants.info where id=?")
        prepStatement.setInt(1,id)
        return prepStatement.executeUpdate()
    }

    fun miseAJourEtudiant(etudiant: Etudiant):Int{
        var prepStatement = laConnexion.getConnexion()
            .prepareStatement("UPDATE info SET firstname = ?,lastname = ?,age = ?,image = ? WHERE id = ?")
        prepStatement.setString(1,etudiant.firstname)
        prepStatement.setString(2,etudiant.lastname)
        prepStatement.setString(3,etudiant.age)
        prepStatement.setString(4,etudiant.image)
        prepStatement.setInt(5, etudiant.id!!)
        return prepStatement.executeUpdate()
    }
}