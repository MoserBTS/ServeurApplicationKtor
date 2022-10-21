<#import "template.ftl" as layout />
<@layout.mainLayout title="Gestion etudiant">

    <input id="freemarkervar" type="hidden" value="${etudiant.id}"/>
    <!-- Modal -->
    <div class="modal-dialog modal-dialog-centered" id="modalConfirmer" tabindex="-1" aria-labelledby="modalConfirmationLabel" aria-hidden="true">
        <div class="modal-dialog  modal-xl">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Attention</h5>
                    <button type="button" class="btn-close" onclick="btnAnnuler()" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <p>Voulez-vous supprimer l'étudiant <b${etudiant.firstname} ${etudiant.lastname}?/>
                    <img src="${etudiant.image}" alt="pas d'image" height="60" width="auto">
                    </p>
                </div>
                <div class="modal-footer">
                    <button type="button" id="btnAnnuler" onclick="btnAnnuler()" class="btn btn-secondary" data-bs-dismiss="modal"><b>Annuler</b></button>
                    <button type="button" id="btnValider"  onclick="btnValider()" class="btn btn-danger"><b>Valider</b></button>
                </div>
            </div>
        </div>
    </div>

    <!-- JS du Modal -->
    <script>
        function btnValider() {
            var val = document.getElementById("freemarkervar").value
            document.location.href="/gestion/delete{val}";
        }

        function btnAnnuler() {
            document.location.href="/gestion/etudiant/"
        }
    </script>

</@layout.mainLayout>