<!DOCTYPE html>
<html lang="fr" data-theme="light">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?= isset($pageTitle) ? htmlspecialchars($pageTitle) : 'Needletab' ?></title>
    <link rel="stylesheet" href="/css/main.css">
    <?php if (isset($stylesheets)): ?>
        <?= $stylesheets ?>
    <?php endif; ?>
</head>
<body>
    <?= $content ?>
    
    <?php if (isset($javascripts)): ?>
        <?= $javascripts ?>
    <?php endif; ?>
    <script src="/js/dark-mode.js"></script>
</body>
</html>
