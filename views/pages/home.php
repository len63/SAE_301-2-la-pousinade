<?php 
$pageTitle = 'Needletab - Home';

ob_start(); ?>

<?php $stylesheets = ob_get_clean(); ?>

<?php 
ob_start(); 
?>
    <div class="home">
        <header class="home__header">
            <h1 class="home__header__title">Accueil</h1>
            <h2 class="home__header__subtitle">Projet en cours</h2>

            <?php if (isset($user) && $user): ?>
                <div class="user-info">
                    <p>Bienvenue, <strong><?= htmlspecialchars($user->username) ?></strong> (<?= htmlspecialchars($user->email) ?>)</p>
                </div>
            <?php endif; ?>
        </header>
    </div>
<?php 
$childContent = ob_get_clean(); 
require BASE_PATH . '/views/layouts/user.php'; 
?>
