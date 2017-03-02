# Exemples de requetes

## Afficher l'utilisateur dont l'adresse email est : robert@gmail.com

> SELECT * FROM users WHERE email="robert@gmail.com"

## Afficher l'utilisateur dont le token est : 1151322064

> SELECT * FROM users WHERE token="1151322064"

## Afficher les fonctions appartenant au developpeur : Bob

> SELECT title,code FROM users,functions WHERE users.id = functions.user_id AND full_name="Bob"

## Afficher les fonctions appartenant au developpeur : Robert H.

> SELECT title,code FROM users,functions WHERE users.id = functions.user_id AND full_name="Robert H."

## Afficher toutes les fonctions dont le code commence par : return

> SELECT * FROM functions WHERE code LIKE "return%"

## Afficher toutes les utilisateurs dont le nom commence par : Ro

> SELECT * FROM users WHERE full_name LIKE "Ro%"

## Afficher la fonction dont le nom se termine par : 1

> SELECT * FROM functions WHERE title LIKE "%1"

## Afficher toutes les instances de la fonction : SHA1

> SELECT * FROM instances, functions WHERE instances.id = functions.instance_id AND title="SHA1"

## Afficher toutes les factures de Bob.

> SELECT * FROM users,invoices WHERE users.id = invoices.user_id AND full_name="Bob"

## Afficher toutes les factures et les classer par montant

> SELECT * FROM invoices Order by amount
