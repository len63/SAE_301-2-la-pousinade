<?php 
$pageTitle = 'Needletab - Contact';

ob_start(); 
?>
    <div style="padding: 2rem;">
        <h1>Contact</h1>
        <p>Ceci est la page de contact.</p>
    </div>
<?php 
$childContent = ob_get_clean(); 
require BASE_PATH . '/views/layouts/user.php'; 
?>
