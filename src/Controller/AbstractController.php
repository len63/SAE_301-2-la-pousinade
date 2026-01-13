<?php

namespace Poussinade\Controller;

use AltoRouter;
use PDOException;
use Poussinade\Model\Connection;

abstract class AbstractController
{
    protected Connection $db;
    protected AltoRouter $router;

    public function __construct(AltoRouter $router)
    {
        $this->router = $router;

        $config = require BASE_PATH . '/config/database.php';
        
        // PostgreSQL DSN
        /* $dsn = sprintf( */
        /*     'pgsql:host=%s;port=%d;dbname=%s', */
        /*     $config['host'], */
        /*     $config['port'], */
        /*     $config['dbname'] */
        /* ); */

        $dsn = 'mysql:host='.$config['host'].';port='.$config['port'].';dbname='.$config['dbname'];

        try {
            $this->db = new Connection($dsn, $config['user'], $config['password']);
        } catch (PDOException $e) {
            $this->render('errors/db_error');
            die();
        }
    }

    protected function render(string $viewPath, array $data = []): void
    {
        extract($data);

        $match = $this->router->match();
        $current_route = $match ? $match['name'] : null;

        ob_start();
        
        require BASE_PATH . '/views/' . $viewPath . '.php';
        
        echo ob_get_clean();
    }
}
