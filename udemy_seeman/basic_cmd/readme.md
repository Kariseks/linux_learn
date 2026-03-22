cat << 'EOF' > README.md
# 🔍 Poradnik: Podstawy `grep` w Bashu

Krótki, praktyczny przewodnik po `grep` (*Global Regular Expression Print*) – jednym z najpotężniejszych i najczęściej używanych narzędzi do wyszukiwania wzorców tekstowych w systemach Linux/Unix.

---

## 🛠️ Podstawowa składnia

`grep [OPCJE] "WZÓR" [PLIK...]`

## 🚩 Najważniejsze flagi

Zestawienie przełączników, które warto znać na pamięć – uratują Ci mnóstwo czasu w terminalu:

| Flaga | Pełna nazwa | Działanie |
| :---: | :--- | :--- |
| `-i` | `--ignore-case` | Ignoruje wielkość liter (znajdzie "BŁĄD", "Błąd" i "błąd"). |
| `-v` | `--invert-match` | **Odwraca** wyszukiwanie. Wyświetla linie, które NIE zawierają wzorca. |
| `-r` / `-R` | `--recursive` | Przeszukuje rekurencyjnie pliki w obecnym katalogu i podkatalogach. |
| `-n` | `--line-number` | Wyświetla numer linii, w której znaleziono dopasowanie (świetne do debugowania). |
| `-l` | `--files-with-matches` | Zwraca tylko nazwy plików, w których występuje wzorzec (ukrywa znaleziony tekst). |
| `-c` | `--count` | Zlicza, ile razy wzorzec wystąpił w pliku i zwraca samą liczbę. |
| `-E` | `--extended-regexp` | Pozwala na używanie rozszerzonych wyrażeń regularnych (działa jak polecenie `egrep`). |

---

## 💻 Przykłady z życia wzięte

### 1. Proste wyszukiwanie w pliku
Szuka słowa "error" w pliku logów, ignorując wielkość liter i podając numery linii:

`grep -in "error" /var/log/syslog`

### 2. Przeszukiwanie całego projektu
Szuka wystąpień funkcji "zaloguj" we wszystkich plikach w obecnym katalogu i podkatalogach:

`grep -r "zaloguj" .`

### 3. Użycie potoków (Pipes `|`) – prawdziwa siła `grep`
Najczęściej `grep` nie działa sam, ale filtruje to, co wypluwają inne komendy.

Szukanie konkretnego procesu (np. `nginx`):
`ps aux | grep "nginx"`

Filtrowanie historii komend (szukanie komendy dockera, której zapomniałeś):
`history | grep "docker run"`

---

## 🧠 Pro Tip: Podstawy Regex z `grep`

`grep` zyskuje supermoce, gdy zamiast zwykłych słów użyjesz symboli wyrażeń regularnych:

* `^` – oznacza **początek linii**. Np. `grep "^Start"` znajdzie tylko linie zaczynające się od "Start".
* `$` – oznacza **koniec linii**. Np. `grep "koniec.$"` znajdzie linie kończące się słowem "koniec.".
* `.` – zastępuje **dowolny pojedynczy znak**.
* `*` – oznacza **zero lub więcej wystąpień** poprzedniego znaku.

---

> 💡 **Wskazówka:** Aby poznać wszystkie możliwości tego narzędzia, wpisz `man grep` w swoim terminalu.
EOF
