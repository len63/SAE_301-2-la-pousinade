<?php 
// This file acts as a wrapper. It captures its content and passes it to the base layout.
ob_start(); 
?>

<?php 
// Include the Navbar component
require BASE_PATH . '/views/components/navbar.php'; 
?>

<!-- Child content injection -->
<?= $childContent ?? '' ?>

<?php 
$content = ob_get_clean(); 
// Inherit from base
require BASE_PATH . '/views/layouts/base.php'; 
?>
