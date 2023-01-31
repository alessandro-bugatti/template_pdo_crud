<?php

namespace Model;
use Util\Connection;

class Getter{
    public static function getTarghe(): array{
        $pdo = Connection::getInstance();
        $sql = 'SELECT distinct targa FROM veicolo';
        $stmt = $pdo->query($sql);
        return $stmt->fetchAll();
    }

    public static function getMarche(): array{
        $pdo = Connection::getInstance();
        $sql = 'SELECT marca FROM veicolo';
        $stmt = $pdo->query($sql);
        return $stmt->fetchAll();
    }

    public static function getModelli(): array{
        $pdo = Connection::getInstance();
        $sql = 'SELECT modello FROM veicolo';
        $stmt = $pdo->query($sql);
        return $stmt->fetchAll();
    }

    public static function getColore(): array{
        $pdo = Connection::getInstance();
        $sql = 'SELECT colore FROM veicolo';
        $stmt = $pdo->query($sql);
        return $stmt->fetchAll();
    }

    public static function insert(
        int $nome_proprietario,
        int $cognome_proprietario,
        string $codice_fiscale,
        string $targa,
        string $marca,
        string $modello,
        string $colore,
    ): array{
        $pdo = Connection::getInstance();
        $sql = 'INSERT INTO veicolo (
                     nome_proprietario, 
                     cognome_proprietario, 
                     codice_fiscale, 
                     targa,
                     marca,
                     modello, 
                     colore) 
                VALUES (
                        :nome_proprietario, 
                        :cognome_proprietario, 
                        :codice_fiscale, 
                        :targa, 
                        :marca, 
                        :modello, 
                        :colore)';
        $stmt = $pdo->prepare($sql);
        $stmt->execute([
            'nome_proprietario' => $nome_proprietario,
            'cognome_proprietario' => $cognome_proprietario,
            'codice_fiscale' => $codice_fiscale,
            'targa' => $targa,
            'marca' => $marca,
            'modello' => $modello,
            'colore' => $colore,
        ]);
        return $stmt->fetchAll();
    }

}