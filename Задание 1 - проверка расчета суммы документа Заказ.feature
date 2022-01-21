﻿#language: ru

Функционал: расчет суммы документа Заказ при изменении количества и цены

Как тестировщик я хочу
изменить количество и сумму документа Заказ 
чтобы проверить правильность расчета 

Контекст: 
Дано Я открыл новый сеанс TestClient или подключил уже существующий

Сценарий: расчет суммы документа Заказ при изменении количества и цены
* Открытие формы редактирования заказа
	И я закрываю все окна клиентского приложения
	И В командном интерфейсе я выбираю 'Продажи' 'Заказы'
	Тогда открылось окно 'Заказы товаров'
	И в таблице "Список" я перехожу к строке:
		| 'Номер'     | 'Организация'  |
		| '000000006' | 'ООО "Товары"' |
	И в таблице "Список" я выбираю текущую строку
	Тогда открылось окно 'Заказ * от *'
* Проверка изменения табличной части
	Тогда таблица "Товары" содержит строки:
		| 'Товар'  | 'Цена'     | 'Количество' | 'Сумма'    |
		| 'Сапоги' | '3 500,00' | '2'          | '7 000,00' |
	И в таблице "Товары" в поле с именем 'ТоварыЦена' я ввожу текст '4 000,00'
	И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '4'
	Тогда таблица "Товары" содержит строки:
		| 'Товар'  | 'Цена'     | 'Количество' | 'Сумма'     |
		| 'Сапоги' | '4 000,00' | '4'          | '16 000,00' |
