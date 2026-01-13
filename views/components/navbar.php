<nav class="navbar">

    <ul class="navbar__links">
        <li class="navbar__links__button">
            <a class="<?= ($current_route === 'home') ? 'active' : '' ?>" href="/">Accueil</a>
        </li>
        <li class="navbar__links__button">
            <a class="<?= ($current_route === 'evenements') ? 'active' : '' ?>" href="/evenements">Evenements</a>
        </li>
    </ul>
</nav>
