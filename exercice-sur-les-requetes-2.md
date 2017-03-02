# Exemples de requetes 2

## Compter le nombre d'utilisateurs dans la base de donnees
```sql
SELECT COUNT ( * )
From users
```
## Compter le nombre de fonctions dans la base de donnees
```sql
SELECT COUNT ( * )
From functions
```
## Compter le nombre d'instances dans la base de donnees
```sql
SELECT COUNT( * )
from instances
```
## Compter le nombre d'invoices dans la base de donnees
```sql
SELECT COUNT( * )
from invoices
```
## Compter le nombre d'invoices appartenant à Bob
```sql
SELECT COUNT( * )
from invoices,users
Where invoices.user_id=users.id
and full_name="Bob"
```

## Compter le nombre d'instances totales dont les fonctions appartiennent à Bob
```sql
SELECT COUNT( * )
from instances,users,functions
Where instances.function_id=functions.id
and functions.user_id=users.id
and full_name="Bob"
```
## Calculer la somme (amount) gagnee via l'utilisation de la fonction SHA1
```sql
SELECT SUM(amount)
FROM functions,invoices,users
Where invoices.user_id=users.id
and users.id=functions.user_id
And title="SHA1"
```
