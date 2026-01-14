<?php

namespace Poussinade\Entity;

class Evenement
{
    public int $id;
    public string $titre;
    public string $description;
    public float $prix;
    public string $date;

    public function __construct(int $id, string $titre, string $description, string $date, float $prix)
    {
        $this->id = $id;
        $this->titre = $titre;
        $this->description = $description;
        $this->date = $date;
        $this->prix = $prix;
    }
}