<?php
/**
 * Questo commento serve solo a eliminare l'indicazione di errore
 * da parte di PHPStorm per la variabile $studenti
 * @var $todos
 * @var $testo
 * @var $id
 */
?>

<?php $this->layout('home', ['titolo' => 'Esempio CRUD']) ?>

<h1>Cose da fare</h1>

<form method="post" action="index.php">
    <div class="form-group">
        <label for="todo">

        </label><textarea name="impegno" class="form-input form" id="todo" placeholder="Aggiungi un impegno" rows="3">
<?php if ($testo != ''):?>
<?=$this->e($testo)?>
<?php endif;?></textarea>
    </div>
    <?php if ($testo != ''):?>
        <input type="hidden" name="id" value="<?=$id?>">
    <?php endif; ?>
    <button>
        <?php if ($testo == ''):?>
            Aggiungi un impegno
        <?php else:?>
            Modifica il testo
        <?php endif; ?>
    </button>
</form>

<table class="table table-striped table-hover">
    <thead>
        <tr>
            <th>Da fare</th>
            <th>Data</th>
            <th>Completato</th>
            <th>Modifica</th>
            <th>Elimina</th>
        </tr>
    </thead>
    <tbody>
        <?php foreach ($todos as $todo):?>
        <tr>
            <td>
                <?php if($todo['completato'] == 1):?>
                    <s><?=$this->e($todo['testo'])?></s>
                <?php else:?>
                    <?=$this->e($todo['testo'])?>
                <?php endif;?>
            </td>
            <td><?=date('d-m-Y', strtotime($todo['data']))?></td>
            <?php if($todo['completato'] == 1):?>
                <td><i class="icon icon-check text-success"></i></td>
                <td><i class="icon icon-cross"></i></td>
                <td><a href="?action=elimina&id=<?=$todo['id']?>"><i class="icon icon-delete"></i></a></td>
            <?php else:?>
                <td><a href="?action=completa&id=<?=$todo['id']?>"><i class="icon icon-flag text-error"></i></a></td>
                <td><a href="?action=modifica&id=<?=$todo['id']?>"><i class="icon icon-edit"></i></a></td>
                <td><a href="?action=elimina&id=<?=$todo['id']?>"><i class="icon icon-delete"></i></a></td>
            <?php endif;?>
            </tr>
        <?php endforeach; ?>
    </tbody>
</table>


