#Использовать logos

Перем Наименование;
Перем ПутьКХранилищу;
Перем ПутьКРабочемуКаталогу;
Перем ПутьИсполняемомуФайлуГит;
Перем ПутьКВременномуКаталогу;
Перем ВерсияПлатформы;
Перем ДоменПочтыПоУмолчанию;
Перем ПользовательХранилища;
Перем ПарольПользователяХранилища;
Перем УровеньЛогаСинхронизации;
Перем КоличествоЦикловОжиданияЛицензии;
Перем ИмяРасширения;

Перем ИндексПодписчиков;
Перем ПараметрыПодписчиков;

Перем МенеджерСинхронизации;
Перем КаталогПлагинов;
Перем ПутьКФайлуВключенныхПлагинов;
Перем ЛокальноеУправлениеПлагинами;

Перем Лог;

Процедура Синхронизировать() Экспорт

	Лог.Информация("=================================");
	Лог.Информация("Начало синхронизации с хранилищем");
	Лог.Информация("Наименование: <%1>", Наименование);
	Лог.Информация("Путь к хранилищу: <%1>", ПутьКХранилищу);
	Лог.Информация("Путь к рабочей копии: <%1>", ПутьКРабочемуКаталогу);

	ПроверитьВозможностьСинхронизации();

	МенеджерСинхронизации = ПолучитьМенеджерСинхронизации();

	Если МенеджерСинхронизации.ТребуетсяСинхронизироватьХранилищеСГит(ПутьКРабочемуКаталогу, ПутьКХранилищу) Тогда

		МенеджерСинхронизации.Синхронизировать(ПутьКРабочемуКаталогу, ПутьКХранилищу);

		Лог.Информация("Завершена синхронизации с хранилищем");
		Лог.Информация("Наименование: <%1>", Наименование);
		Лог.Информация("Путь к хранилищу: <%1>", ПутьКХранилищу);
		Лог.Информация("Путь к рабочей копии: <%1>", ПутьКРабочемуКаталогу);
	
	Иначе
		Лог.Информация("--> Синхронизация не требуется <--");	
	КонецЕсли;
	Лог.Информация("=================================");

КонецПроцедуры

Процедура ПроверитьВозможностьСинхронизации()
	// TODO: Написать проверку какую? )
КонецПроцедуры

Функция ПолучитьМенеджерСинхронизации()
	
	МенеджерСинхронизации = Новый МенеджерСинхронизации();
	МенеджерСинхронизации.ВерсияПлатформы(ВерсияПлатформы)
						.ДоменПочтыПоУмолчанию(ДоменПочтыПоУмолчанию)
						.ИсполняемыйФайлГит(ПутьИсполняемомуФайлуГит)
						.ПодпискиНаСобытия(ИндексПодписчиков)
						.ПараметрыПодписокНаСобытия(ПараметрыПодписчиков)
						.УровеньЛога(УровеньЛогаСинхронизации)
						.ЦикловОжиданияЛицензии(КоличествоЦикловОжиданияЛицензии)
						.РежимУдаленияВременныхФайлов(Истина)
						.АвторизацияВХранилищеКонфигурации(ПользовательХранилища, ПарольПользователяХранилища);

	Если ЗначениеЗаполнено(ИмяРасширения) Тогда
		МенеджерСинхронизации.ИмяРасширения(ИмяРасширения);
	КонецЕсли;

	Возврат МенеджерСинхронизации;

КонецФункции

// Устанавливает путь к каталогу плагинов
//
// Параметры:
//   НовыйКаталогПлагинов - Строка - путь к каталогу плагинов
//
// Возвращаемое значение:
//   Объект.МенеджерСинхронизации - ссылка на текущий объект класса <МенеджерСинхронизации>
//
Функция КаталогПлагинов(Знач НовыйКаталогПлагинов) Экспорт
	КаталогПлагинов = НовыйКаталогПлагинов;
	Возврат ЭтотОбъект;
КонецФункции

// Устанавливает уровень вывода логов
//
// Параметры:
//   НовыйУровеньЛога - Строка - уровень вывода лога
//
// Возвращаемое значение:
//   Объект.МенеджерСинхронизации - ссылка на текущий объект класса <МенеджерСинхронизации>
//
Функция УровеньЛога(Знач НовыйУровеньЛога) Экспорт

	УровеньЛогаСинхронизации = НовыйУровеньЛога;
	Возврат ЭтотОбъект;

КонецФункции

// Устанавливает путь к файлу включенных плагинов
//
// Параметры:
//   НовыйПутьКФайлуВключенныхПлагинов - Строка - путь к файлу включенных плагинов
//
// Возвращаемое значение:
//   Объект.МенеджерСинхронизации - ссылка на текущий объект класса <МенеджерСинхронизации>
//
Функция ФайлВключенныхПлагинов(Знач НовыйПутьКФайлуВключенныхПлагинов) Экспорт
	ПутьКФайлуВключенныхПлагинов = НовыйПутьКФайлуВключенныхПлагинов;
	Возврат ЭтотОбъект;
КонецФункции

Процедура ПрочитатьПараметры(Знач ВходящиеПараметры) Экспорт

	Наименование = ВходящиеПараметры.Наименование;
	ПользовательХранилища = ВходящиеПараметры.ПользовательХранилища;
	ПарольПользователяХранилища = ВходящиеПараметры.ПарольПользователяХранилища;
	ВерсияПлатформы = ВходящиеПараметры.ВерсияПлатформы;
	ИмяРасширения = ВходящиеПараметры.ИмяРасширения;
	ПутьКХранилищу = ВходящиеПараметры.ПутьКХранилищу;
	ПутьКРабочемуКаталогу = ВходящиеПараметры.ПутьКРабочемуКаталогу;
	ПутьИсполняемомуФайлуГит = ВходящиеПараметры.ПутьИсполняемомуФайлуГит;
	ПутьКВременномуКаталогу = ВходящиеПараметры.ПутьКВременномуКаталогу;
	ДоменПочтыПоУмолчанию = ВходящиеПараметры.ДоменПочтыПоУмолчанию;
	КоличествоЦикловОжиданияЛицензии = ВходящиеПараметры.КоличествоЦикловОжиданияЛицензии;
		
	ПрочитатьПлагины(ВходящиеПараметры.Плагины);

	ПараметрыПодписчиков = ВходящиеПараметры.НастройкиПлагинов;

КонецПроцедуры

Процедура ПрочитатьПлагины(Знач НастройкаПлагинов)
	
	ИнициализироватьУправлениеПлагинами();

	ЛокальноеУправлениеПлагинами.ВключитьПлагины(НастройкаПлагинов.ВключенныеПлагины);
	ЛокальноеУправлениеПлагинами.ВключитьПлагины(НастройкаПлагинов.ДополнительныеПлагины);
	ЛокальноеУправлениеПлагинами.ОтключитьПлагины(НастройкаПлагинов.ОтключенныеПлагины);

	ИндексПодписчиков = ЛокальноеУправлениеПлагинами.ПолучитьИндексПлагинов();

КонецПроцедуры

Процедура ИнициализироватьУправлениеПлагинами()
	
	Если ЛокальноеУправлениеПлагинами = Неопределено Тогда

		ЛокальноеУправлениеПлагинами = Новый УправлениеПлагинами;
		ЛокальноеУправлениеПлагинами.УстановитьКаталогПлагинов(КаталогПлагинов);
		ЛокальноеУправлениеПлагинами.УстановитьФайлВключенныхПлагинов(ПутьКФайлуВключенныхПлагинов);
		ЛокальноеУправлениеПлагинами.ЗагрузитьПлагины();
			
	КонецЕсли;

КонецПроцедуры

Процедура ПриСозданииОбъекта()

	Лог = Логирование.ПолучитьЛог("oscript.lib.gitsync.batch");
	УровеньЛогаСинхронизации = Лог.Уровень();

КонецПроцедуры
