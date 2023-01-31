﻿#language: ru

@tree

Функционал: создание заказа покупателя

Как менеджер по продажам я хочу
создать заказ покупателя
чтобы продать эти товары 

Контекст:
Дано Я открыл новый сеанс TestClient или подключил уже существующий
И я закрываю все окна клиентского приложения

Сценарий: создание заказа покупателя
* Создание заказа
	И В командном интерфейсе я выбираю 'Продажи' 'Заказ'
	Тогда открылось окно 'Заказ (создание)'
* Заполнение шапки заказа
	И из выпадающего списка с именем "Организация" я выбираю точное значение 'ООО "Товары"'
	И из выпадающего списка с именем "Покупатель" я выбираю точное значение 'Мосхлеб ОАО'
	И из выпадающего списка с именем "Склад" я выбираю точное значение 'Большой'
	И из выпадающего списка с именем "Валюта" я выбираю точное значение 'Рубли'
* Заполнение табличной части	
	И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице "Товары" я нажимаю кнопку выбора у реквизита с именем "ТоварыТовар"
	Тогда открылось окно 'Товары'
	И в таблице "Список" я разворачиваю строку:
		| 'Код'       | 'Наименование' |
		| '000000011' | 'Продукты'     |
	И в таблице "Список" я перехожу к строке:
		| 'Код'       | 'Наименование' |
		| '000000029' | 'Хлеб'         |
	И в таблице "Список" я выбираю текущую строку
	И в таблице "Товары" из выпадающего списка с именем "ТоварыТовар" я выбираю по строке 'Хлеб'
	И в таблице "Товары" я активизирую поле с именем "ТоварыКоличество"
	И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '10'
	И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице "Товары" я нажимаю кнопку выбора у реквизита с именем "ТоварыТовар"
	Тогда открылось окно 'Товары'
	И в таблице "Список" я разворачиваю строку:
		| 'Код'       | 'Наименование' |
		| '000000011' | 'Продукты'     |
	И в таблице "Список" я перехожу к строке:
		| 'Код'       | 'Наименование' |
		| '000000032' | 'Торт '        |
	И в таблице "Список" я выбираю текущую строку
	И в таблице "Товары" из выпадающего списка с именем "ТоварыТовар" я выбираю по строке 'Торт '
	И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '15'
	И я завершаю редактирование строки
* Проверка заполнения итоговой суммы
	И в таблице "Товары" я перехожу к строке:
		| 'Количество' | 'Сумма'  | 'Товар' | 'Цена'  |
		| '10'         | '200,00' | 'Хлеб'  | '20,00' |
	И в таблице "Товары" я активизирую поле с именем "ТоварыЦена"
	И в таблице "Товары" в поле с именем 'ТоварыЦена' я ввожу текст '30,00'
	И в таблице "Товары" я завершаю редактирование строки
	И элемент формы с именем "ТоварыИтогСумма" стал равен '3 300'
	И в таблице "Товары" я перехожу к строке:
		| 'Количество' | 'Сумма'    | 'Товар' | 'Цена'   |
		| '15'         | '3 000,00' | 'Торт ' | '200,00' |
	И в таблице "Товары" я активизирую поле с именем "ТоварыКоличество"
	И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '20'
	И в таблице "Товары" я завершаю редактирование строки
	И элемент формы с именем "ТоварыИтогСумма" стал равен '4 300'
* Запись и проведение заказа	
	И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
	И я жду закрытия окна 'Заказ (создание) *' в течение 20 секунд	