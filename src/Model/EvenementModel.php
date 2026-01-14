<?php

namespace Poussinade\Model;

use Poussinade\Gateway\Evenement\EvenementGateway;

class EvenementModel
{
    private EvenementGateway $gateway;

    public function __construct(Connection $co)
    {
        $this->gateway = new EvenementGateway($co);
    }

    public function getAllEvenements(): array
    {
        return $this->gateway->listAll();
    }

    public function getEvenementsById(int $id): array
    {
        return $this->gateway->findById($id);
    }

    public function addEvenement(string $titre, string $description, string $dateDebut, string $dateFin, string $prix): bool
    {
        // Fixed: added $ signs to variables
        return $this->gateway->insert($titre, $description, $dateDebut, $dateFin, $prix);
    }
}
