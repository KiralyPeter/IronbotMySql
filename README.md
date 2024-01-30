# IronBot backend MySQL/MariaDB adatbázishoz

## Jelenlegi verzió (2024-01-30)

A projekt beüzemelése:
```
npm i
```

A projekt elindítása:
```
npm start
```

Egyenlőre egy /signup funkció van, ami a kapott üzenetből felveszi a felhjasználót a 'shortuser' táblába. Ha a felhasználó (email cím) létezik, akkor hibaüzenetet ad vissza.

A működéshez MariaBD szükséges, és létre kell hozni egy 'Ironbot' adatbázist.
A táblák és adatok exportját (amiből imprtálni is lehet) a 'shortuser.sql' fáljbna található.

Mellékelem az Insomnia exportját is (Insomnia_...json)
Amúgy csak egy POST üzenetet kezel jelenleg:

```json
{
   "Username": "peter",   
   "Email": "peter@gmail.com"    
}
```

