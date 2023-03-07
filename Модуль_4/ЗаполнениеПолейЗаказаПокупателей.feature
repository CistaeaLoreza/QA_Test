﻿#language: ru

@tree

Функционал: Заполнение полей документа Заказ покупателя

Как Тестировщик я хочу
Протестировать заполнение полей документа Заказ покупателя 
чтобы заказ был составлен для нужного клиента  

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий
	И я закрываю все окна клиентского приложения

Сценарий: Заполнение полей документа Заказ покупателя
* Создание заказа
	И Я открываю навигационную ссылку "e1cib/list/Document.SalesOrder"
	И я нажимаю на кнопку с именем 'FormCreate'
* Проверка на блокировку поля Контрагент
	И Проверяю шаги на Исключение:
			| '	И из выпадающего списка с именем "LegalName" я выбираю по строке "Клиент 2"' |
* Заполнение шапки			
	И я нажимаю кнопку выбора у поля с именем "Partner"
	И в таблице "List" я перехожу к строке:
		| 'Код' | 'Наименование'            |
		| '2'   | 'Клиент 2 (2 соглашения)' |
	И в таблице "List" я выбираю текущую строку
	И я нажимаю кнопку выбора у поля с именем "Agreement"
	И в таблице "List" я перехожу к строке:
		| 'Вид'     | 'Вид взаиморасчетов' | 'Код' | 'Наименование'                                        |
		| 'Обычное' | 'По соглашениям'     | '3'   | 'Индивидуальное соглашение 2 (расчет по соглашениям)' |
	И в таблице "List" я выбираю текущую строку
* Проверка заполнености шапки
	Тогда элемент формы с именем "Partner" стал равен 'Клиент 2 (2 соглашения)'
	Тогда элемент формы с именем "LegalName" стал равен 'Клиент 2'
	Тогда элемент формы с именем "Agreement" стал равен 'Индивидуальное соглашение 2 (расчет по соглашениям)'
	Тогда элемент формы с именем "Status" стал равен 'Согласовано'
	Тогда элемент формы с именем "Company" стал равен 'Собственная компания 1'
	Тогда элемент формы с именем "Store" стал равен 'Склад 1 (с контролем остатка)'						
* Запись заказа
	И я нажимаю на кнопку с именем 'FormWrite'	