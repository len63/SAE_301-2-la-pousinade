<?php

namespace Poussinade\Controller;

use AltoRouter;
use Exception;
use Poussinade\Controller\UserController;

class FrontController
{
    private AltoRouter $router;

    public function __construct()
    {
        $this->router = new AltoRouter();

        $this->router->map('GET', '/', UserController::class . '@home', 'home');

        $this->router->map('GET', '/evenements', UserController::class . '@evenements', 'evenements');
        $this->router->map('POST', '/addEvenementToDatabase', UserController::class . '@addEvenementToDatabase', 'addEvenementToDatabase');

        $this->router->map('GET', '/actualites', UserController::class . '@actualites', 'actualites');
        $this->router->map('GET', '/contact', UserController::class . '@contact', 'contact');
    }

    public function handleRequest(): void
    {
        $match = $this->router->match();

        if ($match) {
            list($controllerName, $action) = explode('@', $match['target']);
            $controllerObject = new $controllerName($this->router);

            if (is_callable([$controllerObject, $action])) {
                call_user_func_array([$controllerObject, $action], [$match['params']]);
            } else {
                header($_SERVER["SERVER_PROTOCOL"] . ' 500 Internal Server Error');
                echo "Méthode non trouvée";
            }
        } else {
            header($_SERVER["SERVER_PROTOCOL"] . ' 404 Not Found');
            echo "Page non trouvée";
        }
    }
}
