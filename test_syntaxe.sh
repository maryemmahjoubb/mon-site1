#!/bin/bash
# Script pour vérifier la syntaxe PHP

echo "Démarrage des tests de syntaxe PHP..."

# Vérifie la syntaxe de tous les fichiers .php
find . -name "*.php" -exec php -l {} \; | grep -v "No syntax errors detected"

if [ $? -eq 0 ]; then
  echo "✅ Tous les fichiers PHP ont une syntaxe valide."
  exit 0
else
  echo "❌ Erreur de syntaxe détectée dans un ou plusieurs fichiers PHP."
  exit 1
fi