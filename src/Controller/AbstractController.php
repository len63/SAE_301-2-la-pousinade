<?php

namespace Poussinade\Controller;

use AltoRouter;
use PDOException;
use Twig\Environment;
use Twig\Error\LoaderError;
use Twig\Error\RuntimeError;
use Twig\Error\SyntaxError;
use Twig\Loader\FilesystemLoader;

use Poussinade\Model\Connection;

abstract class AbstractController
{
    protected Environment $twig;
    protected Connection $db;
    protected AltoRouter $router;

    /**
     * @throws RuntimeError
     * @throws SyntaxError
     * @throws LoaderError
     * @throws UserFetchException
     */
    public function __construct(AltoRouter $router)
    {
        $this->router = $router;
        $loader = new FilesystemLoader(BASE_PATH . '/templates');
        $this->twig = new Environment($loader);

        // Add current route name as a global variable to Twig
        $match = $this->router->match();
        $this->twig->addGlobal('current_route', $match ? $match['name'] : null);

        $config = require BASE_PATH . '/config/database.php';

        try {
            // PostgreSQL DSN
            $dsn = sprintf(
                'pgsql:host=%s;port=%d;dbname=%s',
                $config['host'],
                $config['port'],
                $config['dbname']
            );

            $this->db = new Connection($dsn, $config['user'], $config['password']);
        } catch (PDOException $e) {
            echo $this->twig->render('error/db_error.html.twig');
            die();
        }
    }
}
