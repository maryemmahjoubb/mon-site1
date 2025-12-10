function verif1() {
    let c = document.getElementById("c").value;
    let d = document.getElementById("d").value;
    let p = document.getElementById("p").value;

    // Récupération des tailles avec name="r"
    let taille = document.querySelector('input[name="r"]:checked');

    // Vérification catégorie
    if (c == 0) {
        alert("La sélection de catégorie est obligatoire");
        return false;
    }

    // Vérification description
    let first = d[0].toUpperCase();
    let last = d[d.length - 1].toUpperCase();

    if (d.length < 10 || d.length > 100) {
        alert("Description invalide : 10 à 100 caractères et commence/finit par une lettre");
        return false;
    }

    // Vérification taille
    if (!taille) {
        alert("La sélection de taille est obligatoire");
        return false;
    }

    // Vérification prix
    if (p < 100 || p > 2000) {
        alert("Le prix doit être entre 100 et 2000");
        return false;
    }
    alert("L'OPERATION EST VALIDE");
    return true;
}
function verif2() {
    let co = document.getElementById("co").value;
    let cin = document.getElementById("cin").value;
    let d = document.getElementById("d").value;

    // Vérif code habit
    if (co < 1) {
        alert("Le code habit doit être supérieur ou égal à 1");
        return false;
    }

    // Vérif CIN
    if (
        cin.length != 8 ||
        (cin.charAt(0) != "1" && cin.charAt(0) != "0") ||
        isNaN(cin)
    ) {
        alert("Le CIN doit commencer par 1 ou 0 et avoir 8 chiffres");
        return false;
    }

    // Vérif durée (d length n'est PAS une fonction => pas de parentheses)
    if (d.length < 1 || d.length > 4 || isNaN(d)) {
        alert("La durée doit être un nombre contenant entre 1 et 4 chiffres");
        return false;
    }
    alert("L'OPERATION EST VALIDE");
    return true;

}

