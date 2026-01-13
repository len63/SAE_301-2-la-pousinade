<?php

namespace Poussinade\Entity;

class Evenement
{
    public int $id;
    public string $titre;
    public string $description;
    public float $prix;
    public string $dateDebut;
    public string $dateFin;

    public function __construct(int $id, string $titre, string $description, string $dateDebut, string $dateFin, float $prix)
    {
        $this->id = $id;
        $this->titre = $titre;
        $this->description = $description;
        $this->dateDebut = $dateDebut;
        $this->dateFin = $dateFin;
        $this->prix = $prix;
    }
}