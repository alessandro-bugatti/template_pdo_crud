<?php

require_once 'vendor/autoload.php';
require_once 'conf/config.php';

use League\Plates\Engine;
use Model\TodoRepository;

$template = new Engine('templates','tpl');

//Gestisce l'aggiunta di un nuovo impegno
if (isset($_POST['impegno'])){
    $impegno = $_POST['impegno'];
    if (isset($_POST['id'])){
        $id = $_POST['id'];
        TodoRepository::updateTesto($impegno, $id);
    }
    else
        TodoRepository::add($impegno);
}

$testo = "";
$id = null;

if (isset($_GET['action'])){
    $azione = $_GET['action'];
    $id = $_GET['id'];
    //Gestisce il completamento di un impegno
    if ($azione == 'completa'){
        TodoRepository::completa($id);
    }
    //Gestisce il recupero del testo dell'impegno da modificare
    else if ($azione == 'modifica'){
        $testo = TodoRepository::getTesto($id);
    }
    //Gestisce l'eliminazione
    else if ($azione == 'elimina'){
        TodoRepository::delete($id);
    }
}

$todos = TodoRepository::listAll();

echo $template->render('crud', [
    'todos' => $todos,
    'testo' => $testo,
    'id' => $id
]);