<?php
/**
 * Questo commento serve solo a eliminare l'indicazione di errore
 * da parte di PHPStorm per la variabile $studenti
 * @var $marche
 * @var $modelli
 * @var $colori
 *
 */
?>

<?php $this->layout('home', ['titolo' => 'Ricerca targhe']);

?>


<h2 class="text-center">
    <?php
    if (isset($_GET['add']))
        echo 'Inserisci tutti i dati del veicolo che vuoi aggiungere al database';
    else
        echo 'Inserisci i dati (anche parziali) del veicolo che vuoi cercare';
    ?>
</h2>

<div class="form-horizontal">
    <?php if (isset($_GET['add'])): ?>
        <div class="form-group">
            <div class="col-3 col-sm-12">
                <label class="form-label" for="n_proprietario">Nome del proprietario</label>
            </div>
            <div class="col-9 col-sm-12">
                <input class="form-input" name="n_proprietario" type="text" id="n_proprietario" placeholder="Mario">
            </div>
        </div>

        <div class="form-group">
            <div class="col-3 col-sm-12">
                <label class="form-label" for="c_proprietario">Cognome del proprietario</label>
            </div>
            <div class="col-9 col-sm-12">
                <input class="form-input" name="c_proprietario" type="text" id="c_proprietario" placeholder="Rossi">
            </div>
        </div>
        <div class="form-group">
            <div class="col-3 col-sm-12">
                <label class="form-label" for="cf">Codice fiscale del proprietario</label>
            </div>
            <div class="col-9 col-sm-12">
                <input class="form-input" name="cf" type="text" id="c_proprietario" placeholder="RBLMRC05L67C618Q">
            </div>
        </div>
    <?php endif; ?>
    <div class="form-group">
        <div class="col-3 col-sm-12">
            <label class="form-label" for="targa">Targa del veicolo</label>
        </div>
        <div class="col-9 col-sm-12">
            <input class="form-input" name="targa" type="text" id="targa" placeholder="CD985FM">
        </div>
    </div>

    <div class="form-group">
        <div class="col-3 col-sm-12">
            <label class="form-label" for="marca">Marca del veicolo</label>
        </div>
        <div class="col-4 col-sm-12">
            <select class="form-select select" name="marca">
                <?php foreach ($marche as $marca): ?>
                    <option><?= $marca['marca'] ?></option>
                <?php endforeach; ?>
            </select>
        </div>
        <div class="col-5 col-sm-12">
            <input class="form-input" name="Amarca" type="text" id="marca" placeholder="Marca non presente">
        </div>
    </div>

    <div class="form-group">
        <div class="col-3 col-sm-12">
            <label class="form-label" for="modello">Modello del veicolo</label>
        </div>
        <div class="col-4 col-sm-12">
            <select class="form-select select" name="modello">
                <?php foreach ($modelli as $modello): ?>
                    <option><?= $modello['modello'] ?></option>
                <?php endforeach; ?>
            </select>
        </div>
        <div class="col-5 col-sm-12">
            <input class="form-input" name="Amodello" type="text" id="modello" placeholder="Modello non presente">
        </div>
    </div>

    <div class="form-group">
        <div class="col-3 col-sm-12">
            <label class="form-label" for="colore">Colore del veicolo</label>
        </div>
        <div class="col-4 col-sm-12">
            <select class="form-select select" name="colore">
                <?php foreach ($colori as $colore): ?>
                    <option><?= $colore['colore'] ?></option>
                <?php endforeach; ?>
            </select>
        </div>
        <div class="col-5 col-sm-12">
            <input class="form-input" name="Acolore" type="text" id="colore" placeholder="Colore non presente">
        </div>
    </div>
    <?php if (isset($_GET['add'])): ?>
        <input type="submit" class="btn btn-primary" value="Aggiungi il veicolo">
    <?php else: ?>
        <input type="submit" class="btn btn-primary" value="Cerca il veicolo">
    <?php endif; ?>
</div>

<?php if (!isset($_GET['add'])) {
    echo '<h5 class="text-center">Se devi inserire un nuovo veicolo premi <a href="index.php?add=1" class="btn">qui</a></h5>';
}
?>


