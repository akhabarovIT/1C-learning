﻿#language: ru

@tree
@RegularScenarios

Функционал: Проверка формирования отчета Остатки

Как Менеджер я хочу
отслеживать остатки товаров на складе 
чтобы знать актуальную информацию о наличи и расходе товаров

Контекст: 
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: _2001 Проверка формирования отчета
	* Открытие формы с товаром
		Дано Я открываю навигационную ссылку "e1cib/app/Отчет.ОстаткиТоваровНаСкладах?vrn=Основной"
	* Проверка документа
		И я нажимаю на кнопку с именем 'ФормаСформировать'
		Тогда Табличный документ "Результат" равен макету "Шаблон документа" по шаблону	

Сценарий: _2002 Проверка формирования отчета с фильтром
	* Открытие формы с товаром
		Дано Я открываю навигационную ссылку "e1cib/app/Отчет.ОстаткиТоваровНаСкладах?vrn=Основной"
	* Изменение настроек
		И я нажимаю на кнопку 'Настройки...'
		И из выпадающего списка с именем "КомпоновщикНастроекПользовательскиеНастройкиЭлемент0Значение" я выбираю по строке 'Начало этого дня'
		И я устанавливаю флаг с именем 'КомпоновщикНастроекПользовательскиеНастройкиЭлемент1Использование'
		И я нажимаю кнопку выбора у поля с именем "КомпоновщикНастроекПользовательскиеНастройкиЭлемент1Значение"
		И в таблице "Список" я перехожу к строке
			| 'Наименование' |
			| 'Продукты' |
		И в таблице "Список" я перехожу на один уровень вниз
		И в таблице "Список" я перехожу к строке:
			| 'Наименование' |
			| 'Хлеб'         |
		И в таблице "Список" я выбираю текущую строку
		И я нажимаю на кнопку 'Завершить редактирование'
		И я нажимаю на кнопку 'Сформировать'
		Тогда Табличный документ "Результат" равен макету "Шаблон документа с фильтром" по шаблону	
				