﻿#language: ru

@tree

Функционал: проверка создания клиента

Как Оператор я хочу
создать клиента 
чтобы вести клиентскую базу

Контекст:
Дано Я открыл новый сеанс TestClient или подключил уже существующий
И я закрываю все окна клиентского приложения

Сценарий: проверка создания клиента
* Открытие формы создания клиента
	И В командном интерфейсе я выбираю 'Продажи' 'Контрагенты'
	Тогда открылось окно 'Контрагенты'
	И я нажимаю на кнопку с именем 'ФормаСоздать'	
* Заполнение наименования клиента
	И в поле с именем 'Наименование' я ввожу текст 'Рожки да Ножки'
	И из выпадающего списка с именем "ВидЦен" я выбираю точное значение 'Оптовая'
* Заполнение номера телефона клиента
	И в поле с именем 'Телефон' я ввожу текст '79999999999'
* Сохранение
	И я нажимаю на кнопку с именем 'ФормаЗаписать'
* Проверка сохранения по коду
	И я запоминаю значение поля "Код" как "Код"
	И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
	И я жду закрытия окна 'Рожки да Ножки (Контрагент)' в течение 20 секунд
	Тогда таблица "Список" стала равной:
		| 'Код'   |
		| '$Код$' |		