<?php

namespace Util;

use Model\UserRepository;

/**
 * Classe per gestire l'autenticazione
 */
class Authenticator{

    private function __construct()
    {
    }

    /**

     */
    public static function start()
    {
        
    }

    public static function user_ok():bool{
        session_start();
        //Controllo se è in corso un tentativo di login
        //verificando la presenza dello username spedito tramite POST
        if (isset($_POST['username'])){
            $username = $_POST['username'];
            $password = $_POST['password'];
            //Verifica se le credenziali sono corrette
            $row = UserRepository::userAuthentication($username, $password);
            //Se non sono valide ritorna false
            if ($row == null)
                return false;
            //Altrimenti memorizza nelle variabili di sessione lo user id e il
            //displayed_name, ritornati dalla funzione precedente
            $_SESSION['user_id'] = $row['id'];
            $_SESSION['displayed_name'] = $row['displayed_name'];
        }
        //Se non è attiva una sessione ritorna falso
        if (!isset($_SESSION['user_id']))
                return false;
        return true;

    }

}