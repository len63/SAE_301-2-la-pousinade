<?php

namespace Poussinade\Controller;

use AltoRouter;
use PDOException;
use Poussinade\Model\EvenementModel;

class UserController extends AbstractController
{
    public function __construct(AltoRouter $router)
    {
        parent::__construct($router);
    }

    public function home(): void
    {
        $this->render('pages/home', [
            'user' => $_SESSION['user'] ?? null // Passing user if session exists
        ]);
    }

    public function evenements(): void
    {
        $evenementModel = new EvenementModel($this->db);
        $evenements = $evenementModel->getAllEvenements();

        $this->render('pages/evenements', [
            'evenements' => $evenements
        ]);
    }

    public function addEvenementToDatabase(): void {
        try {
            $titre = $_POST['titre'] ?? '';
            $description = $_POST['description'] ?? '';
            $prix = $_POST['prix'] ?? '';
            $dateDebut = $_POST['dateDebut'] ?? '';
            $dateFin = $_POST['dateFin'] ?? '';

            if (empty($titre) || empty($description) || empty($prix)) {
                $evenementModel = new EvenementModel($this->db);
                $evenements = $evenementModel->getAllEvenements();
                
                $this->render('pages/evenements', [
                    'evenements' => $evenements,
                    'popup_error' => "Données manquantes !!!"
                ]);
                return;
            }

            $evenementModel = new EvenementModel($this->db);

            $rs = $evenementModel->addEvenement($titre, $description, $dateDebut, $dateFin, $prix);
            
            if (empty($rs)) {
                $evenements = $evenementModel->getAllEvenements();
                $this->render('pages/evenements', [
                    'evenements' => $evenements,
                    'popup_error' => "Une erreur est survenue"
                ]);
                return;
            }

            header("Location: /evenements");
            exit;
        }
        catch(PDOException $e) {
            header('Location: /evenements');
            exit;
        }
    }
}
