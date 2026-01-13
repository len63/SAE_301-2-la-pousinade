<?php 
ob_start(); 
?>

<?php 
require BASE_PATH . '/views/components/navbar.php'; 
?>

<?= $childContent ?? '' ?>

<?php 
$content = ob_get_clean(); 
require BASE_PATH . '/views/layouts/base.php'; 
?>
