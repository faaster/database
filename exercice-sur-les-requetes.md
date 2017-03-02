# Exemples de requetes

# Exemples de requetes

## Afficher l'utilisateur dont l'adresse email est : robert@gmail.com

Select *
From users
WHERE email="robert@gmail.com"

## Afficher l'utilisateur dont le token est : 1318937061

Select *
From users
WHERE token="1318937061"

## Afficher les fonctions appartenant au developpeur : Bob

Select title,code
From users,functions
WHERE users.id=functions.user_id
AND full_name="Bob"

## Afficher les fonctions appartenant au developpeur : Robert H.

Select title,code
From users,functions
WHERE users.id=functions.user_id
AND full_name="Robert H."

## Afficher toutes les fonctions dont le code commence par : return

Select title,code
From functions
WHERE code="return"


## Afficher toutes les utilisateurs dont le nom commence par : Ro

Select *
From users
WHERE full_name LIKE "Ro%"

## Afficher la fonction dont le nom se termine par : 1

Select *
From functions
WHERE title LIKE "%1"

## Afficher toutes les instances de la fonction : SHA1

Select *
From instances,functions
WHERE instances.function_id=functions.id
and title="SHA1"


## Afficher toutes les factures de Bob.

Select *
From users,invoices
Where users.id=invoices.user_id
And Full_name="Bob"

## Afficher toutes les factures et les classer par montant

Select *
from invoices
Order by amount
