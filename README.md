
<style>
red { color: red }
yellow { color: yellow }
orange { color: orange }
</style>

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

<span style="color:red;font-weight:700;font-size:20px">
    Fontos!
</span>

A szerver akkor indul el sikeresen, ha fut az adatbázis kezelő és létezik benne az adatbázis.

A működéshez MariaBD szükséges, és létre kell hozni egy 'Ironbot' adatbázist.
A táblák és adatok exportját (amiből másolással javaslom végrehajtani a szükséges parancsokat) a 'shortuser.sql' fáljbna található.

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

Mellékelem az Insomnia exportját is (Insomnia_...json), de ez csak példának van.

## Jelenlez az alábbi POST funkciók működnek:

### <orange>/user/signup (regisztráció)</orange>


A kapott üzenetből felveszi a felhjasználót a 'shortuser' táblába. Ha a felhasználó (email cím) létezik, akkor hibaüzenetet ad vissza.

A sikeres vagy sikertelen regisztrációra egyértelmű hibaüzenetet ad.

Paraméterek példákkal:

```json
{
   "Username": "palika",
	"Password": "34211",
   "Email": "palika@gmail.com"
}
```

### <orange>/user/login</orange>

Megfelelő email cím és jelszó párosra egy tokent ad vissza, amivel a felhasználó további "belééptetett" állapotát lehet kezelni.

Paraméterek példákkal:
```json
{
	"Email": "palika@gmail.com",
  "Password": "34211"   
}
```

Sikeres "belépés" esetén egy tokent ad vissza:

```json
{
	"token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJFbWFpbCI6InBhbGlrYUBnbWFpbC5jb20iLCJpYXQiOjE3MDY5NTc1NTYsImV4cCI6MTcwNjk4NjM1Nn0.wy79_pICN9IrDDC7oiG-Oo5DgxclFnVeQc6xAG7nO-k"
}
```

Sikertelen "belépés" esetén hibaüzenetet ad.

### <orange>/user/getalluser</orange>

Paraméter megadása nem szükséges. Visszaadja az adatbázisban lévő felhasználók adatait (jelenleg: Id, Username, Email). Böngészőből is meg lehet hívni (pl.: http://localhost:8080/user/getalluser)

```json
[
	{
		"Id": 1,
		"Username": "peter",
		"Email": "peter@valahol.com"
	},
	{
		"Id": 3,
		"Username": "peter",
		"Email": "peter@gmail.com"
	},
	{
		"Id": 4,
		"Username": "petyko",
		"Email": "petyko@gmail.com"
	},
	{
		"Id": 5,
		"Username": "petike",
		"Email": "petike@gmail.com"
	},
	{
		"Id": 6,
		"Username": "palika",
		"Email": "palika@gmail.com"
	}
]
```