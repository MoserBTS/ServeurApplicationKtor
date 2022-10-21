<#import "template.ftl" as layout />
<@layout.mainLayout>
    <div class="row">
        <div class="col">
            <button type="button" class="btn btn-secondary float-right mr-2" data-bs-toggle="modal"
                    data-bs-target="#modalAjouter">Nouveau étudiant
            </button>
        </div>
    </div>
    <div class="row">
        <div class="col">
            <p></p>
        </div>
    </div>
    <div class="row">
        <div class="col">
            <table class="table table table-bordered table-striped text-center">
                <thead class="table-dark" >
                <tr>
<#--                    <th scope="col">Id</th>-->
                    <th scope="col">Nom</th>
                    <th scope="col">Prénom</th>
                    <th scope="col">Age</th>
                    <th scope="col">Url image</th>
                    <th scope="col">Image</th>
                    <th></th>
                </tr>
                </thead>
                <tbody>
                <#list etudiants as etu>
                    <tr>
<#--                        <td class="align-middle">${etu.id}</td>-->
                        <td class="align-middle">${etu.firstname}</td>
                        <td class="align-middle">${etu.lastname}</td>
                        <td class="align-middle">${etu.age}</td>
                        <td class="align-middle">${etu.image}</td>
                        <td class="align-middle"><img src="${etu.image}" alt="pas d'image" height="100"
                                                      width="auto">
                        </td>
                        <td class="align-middle">
                            <button type="button" class="btn btn-secondary float-right mr-2" data-bs-toggle="modal"
                                    data-bs-target="#modalEditer${etu.id}">Modifier
                            </button>

                            <button type="button" class="btn btn-danger float-right mr-2" data-bs-toggle="modal"
                                    data-bs-target="#modalSuppression${etu.id}">Supprimer
                            </button>
                            <#--                            <a href="/gestion/etudiant/confirmation/${etu.id}" class="btn btn-danger float-right mr-3" role="button"><b>Supprimer</b></a>-->
                        </td>
                    </tr>
                </#list>
                </tbody>
            </table>
        </div>
        <!-- List Modal supprimer Modifier-->
        <#list etudiants as etu>
            <!-- Modal supprimer-->
            <div class="modal fade" id="modalSuppression${etu.id}">
                <input id="freemarkervarDelete${etu.id}" type="hidden" value="${etu.id}"/>
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">Attention </h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                    aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            Voulez-vous supprimer l'étudiant <b> ${etu.firstname} ${etu.lastname}?</b>
                            <img src="${etu.image}" alt="pas d'image" height="60" width="auto">
                        </div>
                        <div class="modal-footer">
                            <button type="button" id="btnAnnulerDelete"
                                    class="btn btn-secondary" data-bs-dismiss="modal"><b>Annuler</b>
                            </button>
                            <a href="/gestion/etudiant/delete/${etu.id}" class="btn btn-danger float-right mr-2"
                               role="button">Supprimer</a>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Modal Modifier-->
            <div class="modal fade" id="modalEditer${etu.id}">
                <input id="freemarkervarEdit" type="hidden" value="${etu.id}"/>
                <div class="modal-dialog">
                    <form action="/gestion/etudiant/edit/" method="post">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title">Attention </h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                        aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <div class="form-group">
                                    <label class="control-label col-sm-2" for="firstname"><b>Nom</b></label>
                                    <div class="col">
                                        <input type="text" class="form-control" id="firstname" name="firstname"
                                               placeholder="Entrer le nom"
                                               value="${(etu.firstname)!}" required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-sm-2" for="lastname"><b>Prénom</b></label>
                                    <div class="col">
                                        <input type="text" class="form-control" id="lastname" name="lastname"
                                               placeholder="Entrer le prénom"
                                               value="${(etu.lastname)!}" required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-sm-2" for="age"><b>Age</b></label>
                                    <div class="col">
                                        <input type="text" class="form-control" id="age" name="age"
                                               placeholder="Entrer l'age"
                                               value="${(etu.age)!}" required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-sm-2" for="image"><b>Image</b></label>
                                    <div class="col">
                                        <input type="text" class="form-control" id="image" name="image"
                                               placeholder="Entrer l'url de l'image"
                                               value="${(etu.image)!}">
                                    </div>
                                </div>
                                <input type="hidden" id="id" name="id" value="${(etu.id)!}">
                                <span> <br/>    </span>
                            </div>
                            <div class="modal-footer">
                                <button type="button" id="btnAnnulerEdit"
                                        class="btn btn-secondary" data-bs-dismiss="modal"><b>Annuler</b>
                                </button>
                                <button type="submit"  class="btn btn-danger float-right mr-2">Modifier</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </#list>
        <!-- Modal Ajouter-->
        <div class="modal fade" id="modalAjouter">
            <input id="freemarkervarEdit" type="hidden"/>
            <div class="modal-dialog">
                <form action="/gestion/etudiant/ajouter/" method="post">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">Ajout d'un étudiant</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                    aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label class="control-label col-sm-2" for="firstname"><b>Nom</b></label>
                                <div class="col">
                                    <input type="text" class="form-control" id="firstname" name="firstname"
                                           placeholder="Entrer le nom"
                                           value="${(etu.firstname)!}" required>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-2" for="lastname"><b>Prénom</b></label>
                                <div class="col">
                                    <input type="text" class="form-control" id="lastname" name="lastname"
                                           placeholder="Entrer le prénom"
                                           value="${(etu.lastname)!}" required>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-2" for="age"><b>Age</b></label>
                                <div class="col">
                                    <input type="text" class="form-control" id="age" name="age"
                                           placeholder="Entrer l'age"
                                           value="${(etu.age)!}" required>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-2" for="image"><b>Image</b></label>
                                <div class="col">
                                    <input type="text" class="form-control" id="image" name="image"
                                           placeholder="Entrer l'url de l'image"
                                           value="${(etu.image)!}">
                                </div>
                            </div>
                            <input type="hidden" id="id" name="id" value="${(etu.id)!}">
                            <span> <br/>    </span>
                        </div>
                        <div class="modal-footer">
                            <button type="button" id="btnAnnulerEdit"
                                    class="btn btn-secondary" data-bs-dismiss="modal"><b>Annuler</b>
                            </button>
                            <button type="submit"  class="btn btn-danger float-right mr-2">Ajouter</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</@layout.mainLayout>