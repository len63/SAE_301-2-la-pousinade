<?php

namespace Poussinade\Controller;

use AltoRouter;
use PDOException;
use Poussinade\Model\EvenementModel;
use finfo;

class UserController extends AbstractController
{
    public function __construct(AltoRouter $router)
    {
        parent::__construct($router);
    }

    public function home(): void
    {
        echo $this->twig->render('user/home.html.twig', []);
    }

    public function evenements(): void
    {
        $evenementModel = new EvenementModel($this->db);
        $evenements = $evenementModel->getAllEvenements();

        echo $this->twig->render('user/evenements.html.twig', [
            'evenements' => $evenements
        ]);
    }

    public function addEvenementToDatabase(): void {
        try {
            $titre = $_POST['titre'];
            $description = $_POST['description'];
            $prix = $_POST['prix'];
            $dateDebut = $_POST['dateDebut'];
            $dateFin = $_POST['dateFin'];

            if (empty($titre) || empty($description) || empty($prix)) {
                echo $this->twig->render('user/evenements.html.twig', [
                    'popup_error' => "Données manquantes !!!"
                ]);
                header('Location: \evenements');
                return;
            }

            $evenementModel = new EvenementModel($this->db);

            $rs = $evenementModel->addEvenement($titre, $description, $dateDebut, $dateFin, $prix);
            if (empty($rs)) {
                echo $this->twig->render('user/evenements.html.twig', [
                    'popup_error' => "Une erreur est survenue"
                ]);
                header('Location: \evenements');
                return;
            }

            echo $this->twig->render('user/evenements.html.twig');

            header("Location: /evenements");
        }
        catch(PDOException $e) {
            header('/evenements');
            return;
        }
        header('Location: /evenements');
    }
}
