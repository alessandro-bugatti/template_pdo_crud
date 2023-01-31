<?php
/**
 * Questo commento serve solo a eliminare l'indicazione di errore
 * da parte di PHPStorm per la variabile $studenti
 * @var $marche
 * @var $modelli
 * @var $colori
 *
 * questa pagina si occuperà solo della ricerca del veicolo
 */
?>



<?php $this->layout('home', ['titolo' => 'Ricerca targhe']);

?>


<h2 class="text-center">Inserisci i dati (anche parziali) del veicolo che vuoi cercare</h2>
<h4 class="text-center">Spunta solo le caselle con le informazioni che conosci</h4>

<form action="./index.php" method="post">
    <div class="form-horizontal">
        <div class="form-group">
            <div class="col-3 col-sm-12">
                <label class="form-checkbox">
                    <input type="checkbox" name="Ctarga">
                    <i class="form-icon"></i> Targa del veicolo
                </label>
            </div>
            <div class="col-9 col-sm-12">
                <input class="form-input" name="targa" type="text" id="targa" placeholder="CD985FM">
            </div>
        </div>

        <div class="form-group">
            <div class="col-3 col-sm-12">
                <label class="form-checkbox">
                    <input type="checkbox" name="Cmarca">
                    <i class="form-icon"></i> Marca del veicolo
                </label>
            </div>
            <div class="col-4 col-sm-12">
                <select class="form-select select" name="marca">
                    <?php foreach ($marche as $marca): ?>
                        <option>
                            <?= $marca['marca'] ?>
                        </option>

                    <?php endforeach; ?>
                </select>
            </div>
            <div class="col-5 col-sm-12">
                <input class="form-input" name="Amarca" type="text" id="marca" placeholder="Marca parziale">
            </div>
        </div>

        <div class="form-group">
            <div class="col-3 col-sm-12">
                <label class="form-checkbox">
                    <input type="checkbox" name="Cmodello">
                    <i class="form-icon"></i> Modello del veicolo
                </label>
            </div>
            <div class="col-4 col-sm-12">
                <select class="form-select select" name="modello">
                    <?php foreach ($modelli as $modello): ?>
                        <option><?= $modello['modello'] ?></option>
                    <?php endforeach; ?>
                </select>
            </div>
            <div class="col-5 col-sm-12">
                <input class="form-input" name="Amodello" type="text" id="modello" placeholder="Modello parziale">
            </div>
        </div>

        <div class="form-group">
            <div class="col-3 col-sm-12">
                <label class="form-checkbox">
                    <input type="checkbox" name="Ccolore">
                    <i class="form-icon"></i> Colore del veicolo
                </label>
            </div>
            <div class="col-4 col-sm-12">
                <select class="form-select select" name="colore">
                    <?php foreach ($colori as $colore): ?>
                        <option><?= $colore['colore'] ?></option>
                    <?php endforeach; ?>
                </select>
            </div>
            <div class="col-5 col-sm-12">
                <input class="form-input" name="Acolore" type="text" id="colore" placeholder="Colore parziale">
            </div>
        </div>
        <h5>Se di un campo conosci solo i dati parziali puoi inserire il "-" per un carattere oppure il "*" per più
            caratteri</h5>
        <input type="submit" class="btn btn-primary" id="cerca" value="Cerca il veicolo">
    </div>
</form>

<h5 class="text-center">Se devi inserire un nuovo veicolo premi <a href="index.php?add=1" class="btn">qui</a></h5>


