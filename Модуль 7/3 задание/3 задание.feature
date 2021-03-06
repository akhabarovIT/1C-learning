#language: ru

@tree
@RegularScenarios

Функционал: Проверка документа Расход (Продажа) товара

Как Менеджер я хочу
фиксировать продажи товаров покупателям 
чтобы видеть остатки товаров 

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: _3001 Проверка документа Расход (Продажа) товара
	* Открытие формы
		И В командном интерфейсе я выбираю 'Продажи' 'Продажи'
		И я нажимаю на кнопку с именем 'ФормаСоздать'
	* Выбор организации без поля валюты
		И из выпадающего списка с именем "Организация" я выбираю точное значение 'ООО "1000 мелочей"'
		Тогда элемент формы с именем "Организация" стал равен 'ООО "1000 мелочей"'
		И поле с именем "Валюта" отсутствует на форме	
	* Заполнение шапки документа
		И из выпадающего списка с именем "Организация" я выбираю точное значение 'ООО "Все для дома"'
		Тогда элемент формы с именем "Организация" стал равен 'ООО "Все для дома"'
		И поле с именем "Валюта" присутствует на форме
		И я нажимаю кнопку выбора у поля с именем "Покупатель"
		И в таблице "Список" я перехожу к строке
			| 'Код'       | 'Наименование'    |
			| '000000015' | 'Магазин "Обувь"' |
		И в таблице "Список" я выбираю текущую строку
		Тогда элемент формы с именем "Покупатель" стал равен 'Магазин "Обувь"'
		И из выпадающего списка с именем "Склад" я выбираю точное значение 'Большой'
		Тогда элемент формы с именем "Склад" стал равен 'Большой'	
		И я запоминаю значение поля с именем "Склад" как "$Склад$"
		И из выпадающего списка с именем "ВидЦен" я выбираю точное значение 'Оптовая'	
		Тогда элемент формы с именем "ВидЦен" стал равен 'Оптовая'
		И из выпадающего списка с именем "Валюта" я выбираю точное значение 'Рубли'
		Тогда элемент формы с именем "Валюта" стал равен 'Рубли'
		И я запоминаю значение поля с именем "Покупатель" как "$Покупатель$"
		И я запоминаю значение поля с именем "Валюта" как "$Валюта$"
	* Заполнение табличной части документа
		И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
		И в таблице "Товары" я нажимаю кнопку выбора у реквизита с именем "ТоварыТовар"	
		И в таблице "Список" я перехожу к строке:
			| 'Наименование' |
			| 'Продукты'     |
		И в таблице "Список" я выбираю текущую строку
		И в таблице "Список" я перехожу к строке:
			| 'Код'       | 'Наименование' |
			| '000000030' | 'Колбаса'      |
		И в таблице "Список" я выбираю текущую строку	
		И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '3,00'
		И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
		И в таблице "Товары" я нажимаю кнопку выбора у реквизита с именем "ТоварыТовар"	
		И в таблице "Список" я перехожу к строке:
			| 'Наименование' |
			| 'Продукты'     |
		И в таблице "Список" я выбираю текущую строку
		И в таблице "Список" я перехожу к строке:
			| 'Код'       | 'Наименование' |
			| '000000029' | 'Хлеб'         |
		И в таблице "Список" я выбираю текущую строку
		И в таблице "Товары" я перехожу к строке:
			| 'Товар' |
			| 'Хлеб'  |
		И в таблице "Товары" в поле 'Количество' я ввожу текст '2,00'
		И в таблице "Товары" я завершаю редактирование строки
	* Проверка подсчета 'Сумма (итог)'
		И в таблице "Товары" я перехожу к строке:
			| 'Товар'   |
			| 'Колбаса' |
		И я запоминаю значение поля "Количество" таблицы "Товары" как '$КоличествоПервого$'
		И я запоминаю значение поля "Цена" таблицы "Товары" как '$ЦенаПервого$'
		И в таблице "Товары" я перехожу к следующей строке
		И в таблице "Товары" я перехожу к строке:
			| 'Товар' |
			| 'Хлеб'  |
		И я запоминаю значение поля "Количество" таблицы "Товары" как '$КоличествоВторого$'
		И я запоминаю значение поля "Цена" таблицы "Товары" как '$ЦенаВторого$'
		И элемент формы с именем "ТоварыИтогСумма" стал равен '{(Число("$КоличествоПервого$") * Число("$ЦенаПервого$")) + (Число("$КоличествоВторого$") * Число("$ЦенаВторого$"))}'	
		И я запоминаю значение поля с именем "ТоварыИтогСумма" как "$ИтогСумма$"
	* Запись документа
		И я нажимаю на кнопку с именем 'ФормаЗаписать'
		И я запоминаю значение поля с именем "Номер" как "$НомерДокумента$"
		И я закрываю все окна клиентского приложения
	* Проведение документа	
		И Я открываю навигационную ссылку "e1cib/list/Документ.РасходТовара"
		И в таблице "Список" я перехожу к строке
			| 'Номер'            |
			| '$НомерДокумента$' |
		И в таблице "Список" я выбираю текущую строку
		И я нажимаю на кнопку с именем 'ФормаПровести'
		И пауза 3
	* Проверка 'Регистр взаиморасчетов с контрагентами'
		И В текущем окне я нажимаю кнопку командного интерфейса 'Регистр взаиморасчетов с контрагентами'
		И таблица "Список" содержит строки:
			| 'Период' | 'Регистратор' | 'Номер строки' | 'Контрагент'   | 'Сумма'                                   | 'Валюта'   |
			| '*'      | '*'           | '1'            | '$Покупатель$' | '{Формат(Число("$ИтогСумма$"), "ЧДЦ=2")}' | '$Валюта$' |
	* Проверка 'Регистр продаж'	
		И В текущем окне я нажимаю кнопку командного интерфейса 'Регистр продаж'
		И таблица "Список" содержит строки:
			| 'Период' | 'Регистратор' | 'Номер строки' | 'Покупатель'   | 'Товар'   | 'Количество'                                      | 'Сумма'                                                                      |
			| '*'      | '*'           | '1'            | '$Покупатель$' | 'Колбаса' | '{Формат(Число("$КоличествоПервого$"), "ЧДЦ=2")}' | '{Формат((Число("$КоличествоПервого$") * Число("$ЦенаПервого$")), "ЧДЦ=2")}' |
			| '*'      | '*'           | '2'            | '$Покупатель$' | 'Хлеб'    | '{Формат(Число("$КоличествоВторого$"), "ЧДЦ=2")}' | '{Формат((Число("$КоличествоВторого$") * Число("$ЦенаВторого$")), "ЧДЦ=2")}' |
	* Проверка 'Регистр товарных запасов'
		И В текущем окне я нажимаю кнопку командного интерфейса 'Регистр товарных запасов'
		И таблица "Список" содержит строки:
			| 'Период' | 'Регистратор' | 'Номер строки' | 'Товар'   | 'Склад'   | 'Количество'                                      |
			| '*'      | '*'           | '1'            | 'Колбаса' | '$Склад$' | '{Формат(Число("$КоличествоПервого$"), "ЧДЦ=2")}' |
			| '*'      | '*'           | '2'            | 'Хлеб'    | '$Склад$' | '{Формат(Число("$КоличествоВторого$"), "ЧДЦ=2")}' |
	* Проверка печатной формы 'Расходная товарная накладная'
		И В текущем окне я нажимаю кнопку командного интерфейса 'Основное'
		И я нажимаю на кнопку с именем 'ФормаДокументРасходТовараПечатьРасходнойНакладной'
		И табличный документ "SpreadsheetDocument" равен по шаблону:
		| 'Расход товара' | ''             | ''                               | ''                                                          |
		| ''              | ''             | ''                               | ''                                                          |
		| 'Номер'         | '*'            | ''                               | ''                                                          |
		| 'Дата'          | '*'            | ''                               | ''                                                          |
		| 'Покупатель'    | '$Покупатель$' | ''                               | ''                                                          |
		| 'Склад'         | '$Склад$'      | ''                               | ''                                                          |
		| 'Сумма'         | '$ИтогСумма$*' | ''                               | ''                                                          |
		| 'Вес'           | ''             | ''                               | ''                                                          |
		| ''              | ''             | ''                               | ''                                                          |
		| 'Товар'         | 'Цена'         | 'Количество'                     | 'Сумма'                                                     |
		| 'Колбаса'       | '300'          | '{Число("$КоличествоПервого$")}' | '{(Число("$КоличествоПервого$") * Число("$ЦенаПервого$"))}' |
		| 'Хлеб'          | '20'           | '{Число("$КоличествоВторого$")}' | '{(Число("$КоличествоВторого$") * Число("$ЦенаВторого$"))}' |
	