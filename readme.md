# Struttura di un progetto semplice che realizza tutte le funzionalità CRUD

In questo progetto, rispetto alla versione *plain* che potrebbe fare le stesse cose,
è stata inserita un po' più di struttura, in particolare:
- un file di configurazione, `config.php`, che contiene le informazioni di configurazione comuni a tutte le pagine, in questo esempio i parametri di connessione al database. In questo repository è presente un file `config.example.php` che non contiene dei dati veri ma solo un esempio per capire come funziona: ovviamente i segretissimi dati veri che permettono l'accesso al database non si vuole che vengano versionati.
- una classe, `Connection`, che si occupa di leggere le informazioni di connessione ed espone un metodo statico, `getInstance`, che può essere utilizzato in qualsiasi parte del codice per recuperare una connessione funzionante al database. Nel caso la connessione non fosse possibile verrà lanciata un'eccezione.
- una classe che rappresenta il *Model*, che in questo esempio è una lista di impegni. Questa classe, `TodoRepository`, astrae il *Controller* da dover accedere direttamente al database, permettendogli invece di chiamare dei metodi statici per effettuare l'operazione che interessa, ad esempio avere una lista di tutti gli impegni esistenti nel database. Tutto il codice SQL è isolato qua dentro, permettendo ipoteticamente di modificare la fonte dei dati, sostituendo il database o addirittura utilizzando una forma di memorizzazione diversa (file, database non relazionali, ...) senza che il controller ne venga impattato.
- il controller in questo esempio è il solo file `index.php`, che verifica il tipo di azione che l'utente vuole effettuare, effettua le operazioni necessarie e restituisce la pagina con il risultato dell'azione scelta dall'utente.
- come già visto negli esercizi precedenti, il controller utilizza un template, in questo caso `crud.tpl`, per separare la *View* dal resto del codice.

## Passi per rendere il progetto funzionante sul proprio PC

1.  Scaricare questo progetto nel modo preferito (con git, come file zip, forkando il progetto...)
2. Importare la tabella _todo_ che si trova nel file _todo_list.sql_ all'interno di un database, chiamandolo `todo_list`. Per importarlo con DataGrip si può andare nel menù contestuale "SQL scripts -> Run SQL script..." oppure nel menù "Import/Export -> Restore with mysql". In qualsiasi di questi due modi si dovrebbe arrivare ad avere la tabella _todo_ all'interno del database `todo_list`.
3. Creare il file `config.php` nella cartella `conf` e copiare al suo interno il contenuto di `config.example.php`, modificando i valori delle costanti in modo che contengano i veri dati di connessione, che nel caso di XAMPP locale saranno
    ```php
    const DB_HOST = 'localhost';
    const DB_NAME = 'todo_list';
    const DB_USER = 'root';
    const DB_PASSWORD = '';
   ```
4. Verificare di avere installato `composer` sulla propria macchina, se non è presente scaricarlo dal sito e installarlo. Per verificare se è presente e funzionante aprire un terminale e digitare 
    ```php
    composer --version
    ```

    Se appare la versione vuol dire che va bene, altrimenti qualcosa è andato storto. Se si utilizza il terminale integrato in PHPStorm è necessario riavviarlo per rendere visibile `composer`.
5. Eseguire i seguenti comandi
   
    ```php
    composer update
    composer dump-autoload
    ```
    verrà in questo modo creata la cartella `vendor` con all'interno tutte le librerie.