<?php 
$pageTitle = 'Poussinade - Evenements';

ob_start(); ?>
    <link rel="stylesheet" href="/css/pages/main.css">
    <link rel="stylesheet" href="/css/components/evenement.css">
<?php $stylesheets = ob_get_clean(); ?>

<?php 
ob_start(); 
?>
    <div class="evenements-container" style="display: flex; flex-wrap: wrap; gap: 1rem;">
        <?php if (!empty($evenements)): ?>
            <?php foreach ($evenements as $event): ?>
                <div class="evenement-item" style="flex: 0 1 200px;">
                    <?php 
                    require BASE_PATH . '/views/components/evenement.php'; 
                    ?>
                </div>
            <?php endforeach; ?>
        <?php else: ?>
            <p>Pas d'evenements</p> 
        <?php endif; ?>
        
        <form action="/addEvenementToDatabase" method="POST" style="margin-top:20px; border-top:1px solid #ccc; padding-top:20px; width:100%;">
            <h3>Ajouter un évènement (Test)</h3>
            <input type="text" name="titre" placeholder="Titre" required>
            <input type="text" name="description" placeholder="Description" required>
            <input type="number" name="prix" placeholder="Prix" step="0.01" required>
            <input type="date" name="dateDebut" required>
            <input type="date" name="dateFin" required>
            <button type="submit" class="btn btn-default">Ajouter</button>
        </form>
    </div>

    <?php if (isset($popup_error) || isset($message) || isset($error)): ?>
        <dialog id="feedback-dialog" class="feedback-dialog" open>
            <div class="dialog-content">
                <h3 class="<?= (isset($error) || isset($popup_error)) ? 'error-title' : 'success-title' ?>">
                    <?= (isset($error) || isset($popup_error)) ? 'Erreur' : 'Succès' ?>
                </h3>
                <p><?= htmlspecialchars($popup_error ?? $error ?? $message) ?></p>
                <form method="dialog">
                    <button class="btn" id="close-dialog">Fermer</button>
                </form>
            </div>
        </dialog>
    <?php endif; ?> 

<?php 
$childContent = ob_get_clean(); 
require BASE_PATH . '/views/layouts/user.php'; 
?>
