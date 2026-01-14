<?php

namespace Poussinade\Gateway\Evenement;

use Poussinade\Entity\Evenement;
use Poussinade\Model\Connection;
use PDO;

class EvenementGateway
{
    private Connection $db;

    public function __construct(Connection $db)
    {
        $this->db = $db;
    }

    public function listAll(): array
    {
        $query = "SELECT * FROM evenement";
        $this->db->executeQuery($query);

        $result = $this->db->getResults();

        $tab_evenements = [];
        foreach ($result as $row)
        {
            $tab_evenements[] = new Evenement($row['id_evenement'], $row['titre'], $row['description'], $row['date'], $row['prix']);
        }
        return $tab_evenements;
    }

    public function findById(int $id): array
    {
        $query = "SELECT * FROM evenement WHERE id_evenement = :id";
        $this->db->executeQuery($query,[':id' =>[$id, PDO::PARAM_INT] ] );

        $results = $this->db->getResults();

        $tab_evenements = [];
        foreach ($results as $row){
            $tab_evenements[] = new Evenement($row['id_evenement'], $row['titre'], $row['description'], $row['prix'], $row['date']);
        }
        return $tab_evenements;
    }

    public function insert(string $titre, string $description, string $dateDebut, string $dateFin, string $prix): bool
    {
    $query = "INSERT INTO evenement (id_evenement, titre, prix, description, date_debut, date_fin) VALUES (:id, :titre, :prix, :description, :date)";
        return $this->db->executeQuery($query, [
            ':titre' => [$titre, PDO::PARAM_STR],
            ':description' => [$description, PDO::PARAM_STR],
            ':date' => [$dateDebut, PDO::PARAM_STR],
            ':prix' => [$prix, PDO::PARAM_INT]
        ]);
    }
}
