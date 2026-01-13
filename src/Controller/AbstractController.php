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
            // Render the error view if connection fails
            $this->render('errors/db_error');
            die();
        }
    }

    /**
     * Renders a PHP view file.
     * 
     * @param string $viewPath The path to the view file inside the 'views' directory (without .php)
     * @param array $data Associative array of variables to pass to the view
     */
    protected function render(string $viewPath, array $data = []): void
    {
        // Extract data keys to variables
        extract($data);

        // Add current route name as a variable (replaces Twig global)
        $match = $this->router->match();
        $current_route = $match ? $match['name'] : null;

        // Start output buffering
        ob_start();
        
        // Require the view file. 
        // Note: The view file is responsible for loading its layout (parent) if needed.
        require BASE_PATH . '/views/' . $viewPath . '.php';
        
        // Output the buffer
        echo ob_get_clean();
    }
}
