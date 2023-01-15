<?php

namespace Model;
use Util\Connection;

class TodoRepository{

    public static function listAll(): array{
        $pdo = Connection::getInstance();
        $sql = 'SELECT * FROM todo ORDER BY completato, data DESC';
        $stmt = $pdo->query($sql);
        return $stmt->fetchAll();
    }

    public static function add(string $testo): int{
        $pdo = Connection::getInstance();
        $sql = 'INSERT INTO todo (testo) VALUES (:testo)';
        $stmt = $pdo->prepare($sql);
        $stmt->execute([
                'testo' => $testo
            ]
        );
        return $stmt->rowCount();
    }

    public static function completa(int $id): bool{
        $pdo = Connection::getInstance();
        $sql = 'UPDATE todo SET completato = 1 WHERE id = :id';
        $stmt = $pdo->prepare($sql);
        $stmt->execute([
            'id' => $id
        ]);
        if ($stmt->rowCount() == 1)
            return true;
        return false;
    }

    public static function getTesto(int $id): string{
        $pdo = Connection::getInstance();
        $sql = 'SELECT testo FROM todo WHERE id = :id';
        $stmt = $pdo->prepare($sql);
        $stmt->execute([
                'id' => $id
            ]
        );
        $row = $stmt->fetch();
        return $row['testo'];
    }


    public static function updateTesto(string $testo, int $id): bool{
        $pdo = Connection::getInstance();
        $sql = 'UPDATE todo SET testo = :testo WHERE id = :id';
        $stmt = $pdo->prepare($sql);
        $stmt->execute([
            'testo' => $testo,
            'id' => $id
        ]);
        if ($stmt->rowCount() == 1)
            return true;
        return false;
    }

    public static function delete(int $id):bool
    {
        $pdo = Connection::getInstance();
        $sql = 'DELETE FROM todo WHERE id = :id';
        $stmt = $pdo->prepare($sql);
        $stmt->execute([
            'id' => $id
        ]);
        if ($stmt->rowCount() == 1)
            return true;
        return false;
    }
}