<?php 
$pageTitle = 'Database Error';

ob_start(); ?>
    <link rel="stylesheet" href="/css/pages/login.css">
<?php $stylesheets = ob_get_clean(); ?>

<?php ob_start(); ?>
    <div class="card" style="margin-top: 2rem;">
        <h1>Database Connection Error</h1>
        <p>We are sorry, but we could not connect to the database. Please try again later.</p>
    </div>
<?php 
$content = ob_get_clean(); 
require BASE_PATH . '/views/layouts/base.php'; 
?>
