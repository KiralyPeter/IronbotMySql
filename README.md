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
A táblák és adatok exportját (amiből imprtálni is lehet) a 'shortuser.sql' fáljbna található (nem mi).

Mellékelem az Insomnia exportját is (Insomnia_...json)
Amúgy csak egy POST üzenetet kezel jelenleg:

```json
{
   "Username": "peter",   
   "Email": "peter@gmail.com"    
}
```

### Update:

Password mezővel kiegészítve:

```json
{
   "Username": "palika",
	"Password": "34211",
   "Email": "palika@gmail.com"
}
```

<span style="color:red;font-weight:700;font-size:20px">
    Fontos!
</span>

A futtatáshoz szükséges konfigurációt a `.env` fájl tartalmazza. A `DB_USERNAME` és `DB_PASSWORD` értékeket a saját lokális beállításoknak megfelelően kell kiölteni!

```
// servert
PORT = 8080

// Connection
DB_PORT = 3306
DB_HOST = localhost
DB_USERNAME = 
DB_PASSWORD = 
DB_NAME = Ironbot
```