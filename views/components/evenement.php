<div class="evenement-card">
    <div class="evenement-color"></div>
    <div class="evenement-info">
        <p><strong>Id :</strong> <?= htmlspecialchars($event->id) ?></p>
        <p><strong>Titre :</strong> <?= htmlspecialchars($event->titre) ?></p>
        <p><strong>Description :</strong> <?= htmlspecialchars($event->description) ?></p>
        <p><strong>Prix :</strong> <?= htmlspecialchars($event->prix) ?></p>
        <p><strong>Date :</strong> <?= htmlspecialchars($event->date) ?></p>
    </div>
</div>
