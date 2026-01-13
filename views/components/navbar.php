    
<nav class="navbar">
    <img src="/images/needletab.png"/>

    <ul class="navbar__links">
        <li class="navbar__links__button">
            <a class="<?= ($current_route === 'home') ? 'active' : '' ?>" href="/">Accueil</a>
        </li>
        <li class="navbar__links__button">
            <a class="<?= ($current_route === 'evenements') ? 'active' : '' ?>" href="/evenements">Evenements</a>
        </li>
        <li class="navbar__links__button">
            <a class="<?= ($current_route === 'apropos') ? 'active' : '' ?>" href="/actualites">Actualites</a>
        </li>
        <li class="navbar__links__button">
            <a class="<?= ($current_route === 'contact') ? 'active' : '' ?>" href="/contact">Contact</a>
        </li>
    </ul>
</nav>

  
