# KebabTable

Projekt opracowano w MySQL przy użyciu phpMyAdmin.

## AllKebab table

![](/AllKebab.png)

Tabela zawiera informacje o ID, nazwie i opisie poszczególnych dań.

## Ingredients table

![](/Ingredients.png)

Tabela zawiera informacje odnośnie rodzajów mięsa, sosów i warzyw zawartych w poszczególnych daniach.

## OrderKebab table

![](/OrderKebab.png)

Tabela zawiera infrofmacje na temat klientów zamawiających dania z restauracji w formie zdalnej. Wśród tychże wymienić można imiona, nazwiska, numery telefonów, adresy zamieszkania, dania jakie zostały zamówione i ich ilość.

## Zapytanie 1

![](/QuestionOne.png)

```
SELECT AllKebab.KebabName, AllKebab.Specification, CONCAT(Ingredients.Meat, Ingredients.Sauce, Ingredients.Vegetables) AS Ingredients, AllKebab.Price AS PriceInPLN
FROM AllKebab
INNER JOIN Ingredients ON (AllKebab.KebabID = Ingredients.AllKebabId);
```

Zadaniem zapytania jest szczegółowo przedstawić ofertę restauracji. Wyświetla wszystkie dania wraz z ich opisem, składnikami oraz ceną.

## Zapytanie 2

![](/QuestionTwo.png)

```
SELECT FirstName, LastName, PhoneNumber, Adress, AllKebab.KebabName
FROM OrderKebab INNER JOIN Ingredients ON OrderKebab.AllKebabId = Ingredients.AllKebabId
INNER JOIN AllKebab ON(AllKebab.KebabID = OrderKebab.AllKebabId )
WHERE Meat IN("Chicken", "Mutton");
```

Zapytanie wyświetla dane o osobach, które zamówiły dania mięsne. będą to imiona, nazwiska, numery telefonów i adresy. Na końcu podana jest informacja jakie danie zostało zamówione.

## Zapytanie 3

![](/QuestionThree.png)

```
SELECT AllKebab.Specification, Ingredients.Sauce, OrderKebab.PhoneNumber, OrderKebab.Adress
FROM  OrderKebab INNER JOIN AllKebab ON (OrderKebab.AllKebabId = AllKebab.KebabID)
INNER JOIN Ingredients ON (OrderKebab.AllKebabId = Ingredients.AllKebabId);
```

Zapytanie pozwala uzyskać informacje odnośnie Numerów telefonów, adresów osób zamawiających oraz opisy, i informacje o sosach jakie zostały dodane do zamówień.

## Zapytanie 4

![](/QuestionFour.png)

```
SELECT KebabName, Meat AS VeganFood
FROM Ingredients
INNER JOIN AllKebab ON (AllKebab.KebabID = Ingredients.AllKebabId)
WHERE NOT Meat="Chicken" AND NOT Meat="Mutton";
```

Zapytanie przedstawia ofertę dań bezmięsnych, podając informację o tych daniach i rodzaju zamiennika, który został podany w miejsce mięsa.
