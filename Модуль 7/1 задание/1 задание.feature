﻿#language: ru

@tree
@RegularScenarios

Функционал: прикрепление файла картинки в форму элемента справочника Товар 

Как Менеджер я хочу
иметь возможность прикреплять файлы картинки в справочнике Товар 
чтобы у товаров были прикреплены их картинки

Контекст: 
Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: _1001 загрузка картинки в базу
	Дано загрузка картинки в базу

Сценарий: _1002 проверка возможности прикрепления файла картинки в форму элемента справочника Товар 
	* Открытие формы с товаром
		Дано Я открываю навигационную ссылку "e1cib/data/Справочник.Товары?ref=8ca1000d8843cd1b11dc8eacd471d6c7"
	* Добавляем картинку
		И я нажимаю кнопку выбора у поля с именем "ФайлКартинки"
		И в таблице "Список" я перехожу к строке:
		| 'Код'       |
		| '000000001' |
		И я нажимаю на кнопку с именем 'ФормаВыбрать'	
		И элемент формы с именем "ФайлКартинки" стал равен 'Цветочек'
	* Удаляем картинку
		И я нажимаю кнопку очистить у поля с именем "ФайлКартинки"
		И элемент формы с именем "ФайлКартинки" стал равен ''
	* Закрытие окон	
		И я закрываю все окна клиентского приложения
				