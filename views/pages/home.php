<?php 
$pageTitle = 'Needletab - Home';

// Define Stylesheets for this page
ob_start(); ?>
    <link rel="stylesheet" href="/css/pages/home.css">
    <link rel="stylesheet" href="/css/components/button.css">
    <link rel="stylesheet" href="/css/components/input.css">
    <link rel="stylesheet" href="/css/components/card.css">
    <link rel="stylesheet" href="/css/components/badge.css">
<?php $stylesheets = ob_get_clean(); ?>

<?php 
// Start capturing the main content
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
// Extend the User Layout
require BASE_PATH . '/views/layouts/user.php'; 
?>
