INSERT – dodaje wiersze do tabeli,
UPDATE – aktualizuje wiersze w tabeli,
DELETE – usuwa wiersze z tabeli

CREATE – tworzą obiekty bazy danych,
ALTER – modyfikują tabele bazy danych,
DROP – usuwają obiekty bazy danych,
TRUNCATE – usuwa wszystkie dane z tabeli

GRANT – nadaje uprawnienia,
REVOKE – usuwa uprawnienia

BEGIN – rozpoczyna transakcję,
COMMIT – zatwierdza transakcję,
ROLLBACK – wycofuje transakcję,
SAVEPOINT – zapisuje punkt przywracania aktualnej transakcji

TYPY DANYCH:

INTEGER – służy on do przechowywania liczb całkowitych,
NVARCHAR(x) – służy on do przechowywania łańcuchów znaków do długości x,
NUMERIC(x, y) – służy do przechowywania liczb rzeczywistych, które mają do x cyfr z y po przecinku

BLOB – służy do przechowywania danych binarnych (ang. binary large object),
DATETIME – służy do przechowywania daty i czasu,
DATE – służy do przechowywania daty,
BOOLEAN – służy do przechowywania wartości logicznych,
TEXT – służy do przechowywania łańcuchów znaków gdzie ciężko jest oszacować maksymalną długość tekstu, lub wahania długości tekstu są duże.


NULL Określa pustą wartość.


Użycie klauzuli WHERE pozwala na odfiltrowanie części wierszy.
Klauzula WHERE służy do filtrowania danych zwróconych przez zapytania typu SELECT. Używana jest także w zapytaniach typu UPDATE, INSERT i DELETE.


ŁĄCZENIE WARUNKÓW

AND ma pierwszeństwo przed OR. Można także użyć nawiasów (), aby określić pierwszeństwo wykonania warunków.

x OR y AND z
x OR (y AND z)
(x OR y) AND z

NEGACJA WARUNKÓW

(NOT x) OR y
NOT (x OR y)


PORÓWNANIA WARTOŚCI

A < B – wiersz spełnia warunek jeśli A jest mniejsze od B,
A <= B – wiersz spełnia warunek jeśli A jest mniejsze bądź równe B,
A = B – wiersz spełnia warunek jeśli A jest równe B,
A != B – wiersz spełnia warunek jeśli A jest różne od B,
A > B – wiersz spełnia warunek jeśli A jest większe od B,
A >= B – wiersz spełnia warunek jeśli A jest większe bądź równe B.

Do określenia zakresu, w którym powinna znaleźć się wartość kolumny możesz użyć BETWEEN.

SQL pozwala także na bardziej swobodne porównywanie łańcuchów znaków. Do tego celu używa się konstrukcji LIKE. W tym przypadku możesz użyć dwóch symboli, które mają specjalne znaczenie:

% – oznacza dowolną liczbę znaków,
_ – oznacza jeden znak.

Niektóre wiersze mogą mieć puste kolumny. Puste, czyli takie, które nie są uzupełnione żadną wartością. W takim przypadku mówi się, że kolumna ma wartość NULL. Aby filtrować wiersze na podstawie tej wartości należy użyć wyrażenia IS NULL.

Jeśli chcesz zwrócić wiersze, dla których kolumna przyjmuje jedną z określonych wartości możesz użyć IN.

Gdy chcemy podejrzeć dane zwracane przez zapytanie. W takim przypadku ważnych jest tylko kilka wynikowych wierszy. W takim przypadku z pomocą przychodzi wyrażenie LIMIT, które pozwala na ograniczenie liczby zwracanych wierszy.

Do poprawnego stronicowania używa się także wyrażenia OFFSET, które pozwala na przeskoczenie odpowiedniej liczby wyników.

Klauzula DISTINCT pozwala na odfiltrowanie powielonych wierszy czy w przypadku wielu kolumn.
DISTINCT wartości NULL traktuje jako równe sobie.

Do sortowania wyników używa się wyrażenia ORDER BY.
ORDER BY ... DESC - sortowanie malejąco
ORDER BY ... ASC - sortowanie rosnąco

Do scalania wyników wielu zapytań służy wyrażenie UNION ALL albo UNION. Oba wyrażenia służą do scalenia wyników wielu zapytań. Mają jednak jedną znaczącą różnicę. UNION zwróci unikalną listę wierszy. UNION ALL zwróci wszystkie wiersze, w wyniku mogą być duplikaty.


FUNKCJE


SELECT LENGTH('abcd');
W przykładzie tym wywołuję funkcję LENGTH, która jako parametr przyjmuje łańcuch znaków abcd. 

ABS – zwraca wartość bezwzględną przyjmowanego argumentu,

LOWER – zwraca kopię łańcucha znaków przekazanego jako parametr, w którym wszystkie litery zamienione są na małe2,
RANDOM – zwraca losową liczbę całkowitą,

SUBSTR3 – SUBSTR(x, y, z) pobiera podzbiór znaków parametru x od litery y o długości z. Parametr z może być pominięty, wtedy funkcja zwraca podzbiór znaków od znaku y do końca. Pierwsza litera ma indeks 1,

TRIM – usuwa spacje z obu stron przekazanego parametru,

UPPER – funkcja działa podobnie jak LOWER, tym razem zwracany łańcuch znaków składa się z wielkich liter.


GRUPOWANIE


GROUP BY - grupuje wiersze

AVG – zwraca średnią wartość,

MIN – zwraca minimalną wartość,

SUM – zwraca sumę wartości,

TOTAL – działa podobnie jak SUM, jedyna różnica polega na tym, że jeśli wszystkie wartości to NULL, wówczas TOTAL zwróci 0, a SUM zwróci NULL.

COUNT - służy do zliczania wierszy, które mają wartość inną niż NULL.

HAVING - filtruje wyniki na podstawie zgrupowanych wartości

Czym różni się WHERE od HAVING?
Klauzula WHERE służy do filtrowania wyników zapytania biorąc pod uwagę pojedynczy wiersz, natomiast klauzula HAVING pozwala na filtrowanie wyników na podstawie zgrupowanych wartości.

Klauzula JOIN pozwala na łączenie ze sobą danych znajdujących się w różnych tabelach.


INNER JOIN

Podstawowym rodzajem złączenia jest INNER JOIN. Z iloczynu kartezjańskiego wybiera ono te wiersze, dla których warunek złączenia jest spełniony. W żadnej z łączonych tabel kolumna użyta do łączenia nie może mieć wartości NULL.


OUTER JOIN
Istnieją trzy rodzaje złączeń typu OUTER:

LEFT OUTER JOIN - zwraca:

wiersze dla których warunek złączenia jest spełniony,
wiersze z “lewej tabeli” dla których nie ma odpowiedników w prawej

RIGHT OUTER JOIN - zwraca:

wiersze dla których warunek złączenia jest spełniony,
wiersze z “prawej tabeli” dla których nie ma odpowiedników w lewej.


FULL OUTER JOIN - zwraca:

wiersze dla których warunek złączenia jest spełniony,
wiersze z “lewej tabeli” dla których nie ma odpowiedników w prawej,
wiersze z “prawej tabeli” dla których nie ma odpowiedników w lewej.


JOIN to to samo co INNER JOIN,
LEFT JOIN to to samo co LEFT OUTER JOIN,
RIGHT JOIN to to samo co RIGHT OUTER JOIN,
FULL JOIN to to samo co FULL OUTER JOIN,
CROSS JOIN to to samo co iloczyn kartezjański.


PODZAPYTANIA

SELECT 1;

to to samo co

SELECT *
	FROM(SELECT 1);

Podzapytanie wewnątrz klauzuli FROM

Wyniki podzapytania użytego wewnątrz klauzuli FROM traktowane są jakby były tabelą. Dlatego w tym przypadku podzapytanie może zwrócić wiele wartości. Kolumny użyte w podzapytaniu stają się kolumnami „tabeli” i mogą być użyte w zapytaniu głównym.

Podzapytania wewnątrz klauzuli WHERE

Podzapytanie może być także użyte do filtrowania wyników głównego zapytania.

Operator EXISTS

Operator EXISTS powoduje, że zwrócone są wyłącznie te wiersze, dla których podzapytanie zwróci co najmniej jeden wiersz. 

Operatory ALL i ANY

Operatory ALL i ANY używa się w połączeniu z operatorami porównania z klauzuli WHERE.

Na przykład wyrażenie kolumna > ALL (podzapytanie) oznacza, że kolumna musi mieć większą wartość niż wszystkie wartości zwrócone przez podzapytanie.

Analogicznie kolumna <= ANY (podzapytanie) oznacza, że kolumna musi mieć wartość mniejszą bądź równą którejkolwiek z wartości zwróconych przez podzapytanie.