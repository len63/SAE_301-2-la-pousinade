<?php

namespace Poussinade\Gateway\Actualite;

use Poussinade\Entity\Actualite;
use Poussinade\Model\Connection;
use PDO;

class ActualiteGateway
{
    private Connection $db;

    public function __construct(Connection $db)
    {
        $this->db = $db;
    }

    public function listAll(): array
    {
        $query = "SELECT * FROM actualite";
        $this->db->executeQuery($query);

        $result = $this->db->getResults();

        $tab_actualites = [];
        foreach ($result as $row)
        {
            // TODO: 
            /* $tab_actualites[] = new Actualite($row['id_actualite'], $row['titre'], $row['description'], $row['date'], $row['prix']); */
        }
        return $tab_actualites;
    }

    public function findById(int $id): array
    {
        $query = "SELECT * FROM actualite WHERE id_actualite = :id";
        $this->db->executeQuery($query,[':id' =>[$id, PDO::PARAM_INT] ] );

        $results = $this->db->getResults();

        $tab_actualites = [];
        foreach ($results as $row){
            // TODO: 
            /* $tab_actualites[] = new Actualite($row['id_actualite'], $row['titre'], $row['description'], $row['prix'], $row['date']); */
        }
        return $tab_actualites;
    }

    public function insert(string $titre, string $description, string $dateDebut, string $dateFin, string $prix): bool
    {
    // TODO: 
    /* $query = "INSERT INTO actualite (id_actualite, titre, prix, description, date_debut, date_fin) VALUES (:id, :titre, :prix, :description, :date)"; */
    /*     return $this->db->executeQuery($query, [ */
    /*         ':titre' => [$titre, PDO::PARAM_STR], */
    /*         ':description' => [$description, PDO::PARAM_STR], */
    /*         ':date' => [$dateDebut, PDO::PARAM_STR], */
    /*         ':prix' => [$prix, PDO::PARAM_INT] */
    /*     ]); */
    /* } */
}
