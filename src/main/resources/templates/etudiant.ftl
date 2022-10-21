<#import "template.ftl" as layout />
<@layout.mainLayout title="Gestion etudiant">

    <form action="/etudiant/gestion/" method="post">
        <div class="form-group">
            <label class="control-label col-sm-2" for="nom_stand"><b>Nom</b></label>
            <div class="col-sm-4">
                <input type="text" class="form-control" id="nom" name="nom" placeholder="Entrer le nom"
                       value="${(etudiant.firstname)!}" required>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-2" for="prenom"><b>Prénom</b></label>
            <div class="col-sm-4">
                <input type="text" class="form-control" id="prenom" name="prenom" placeholder="Entrer le prénom"
                       value="${(etudiant.lastname)!}" required>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-2" for="age"><b>Age</b></label>
            <div class="col-sm-4">
                <input type="text" class="form-control" id="age" name="age" placeholder="Entrer l'age"
                       value="${(etudiant.age)!}" required>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-2" for="image"><b>Image</b></label>
            <div class="col-sm-4">
                <input type="text" class="form-control" id="age" name="age" placeholder="Entrer l'url de l'image"
                       value="${(etudiant.image)!}">
            </div>
        </div>
        <input type="hidden" id="id" name="id" value="${(etudiant.id)!}">
        <span> <br/>    </span>
        <div class="row">
            <div class="col-sm-4">
                <button type="submit" class="btn btn-secondary float-right mr-3"><b>Valider</b></button>
                <a href="/gestion/etudiant/" class="btn btn-danger float-right mr-3" role="button"><b>Annuler</b></a>
            </div>
        </div>
    </form>

</@layout.mainLayout>