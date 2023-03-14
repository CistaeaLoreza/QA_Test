#language: ru

@tree

Функционал: Создание элементов справочника Номенклатура

Как Тестировщик я хочу
создать 10 элементов справочника Номенклатура с разными наименованиями без дополнительных реквизитов 
чтобы провести нагрузочное тестирование

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий
	И я закрываю все окна клиентского приложения
Сценарий: Создание элементов справочника Номенклатура
* Открытие справочника Номенклатура
	И Я открываю навигационную ссылку "e1cib/list/Catalog.Items"
* Заполнение справочника Номенклатура данными
	И Я запоминаю значение выражения '1' в переменную "Номенклатура"
	И я делаю 10 раз
		И Я запоминаю значение выражения '$Номенклатура$ + 1' в переменную "Номенклатура"
		И Я запоминаю значение выражения '"Вид" + $Номенклатура$' в переменную "ВидНоменклатуры"
		И я проверяю или создаю для справочника "Items" объекты:
			| 'Ref'                                                              | 'DeletionMark' | 'Code' | 'ItemType'                                                         | 'Unit'                                                             | 'MainPricture'                          | 'Vendor'                                                           | 'ItemID' | 'PackageUnit' | 'Description_en'    | 'Description_hash' | 'Description_ru' | 'Description_tr' | 'Height' | 'Length' | 'Volume' | 'Weight' | 'Width' |
			| '{e1cib/data/Catalog.Items?ref=" + StrReplace(New UUID, "-", "")}' | 'False'        |        | '{e1cib/data/Catalog.Items?ref=" + StrReplace(New UUID, "-", "")}' | '{e1cib/data/Catalog.Items?ref=" + StrReplace(New UUID, "-", "")}' | 'ValueStorage:AQEIAAAAAAAAAO+7v3siVSJ9' | '{e1cib/data/Catalog.Items?ref=" + StrReplace(New UUID, "-", "")}' | '58791'  | ''            | '$ВидНоменклатуры$' | ''                 | ''               | ''               |          |          |          | 0.21     |         |
		И я перезаполняю для объекта табличную часть "AddAttributes":
			| 'Ref'                                                              | 'Property'                                                         | 'Value'                                                            |
			| '{e1cib/data/Catalog.Items?ref=" + StrReplace(New UUID, "-", "")}' | '{e1cib/data/Catalog.Items?ref=" + StrReplace(New UUID, "-", "")}' | '{e1cib/data/Catalog.Items?ref=" + StrReplace(New UUID, "-", "")}' |
	И я нажимаю на кнопку с именем 'FormRefresh'