
#Область ОбработчикиСобытий

Процедура ОбработкаПолученияПолейПредставления(Поля, СтандартнаяОбработка)
	СтандартнаяОбработка = Ложь;
	Поля.Добавить("Наименование");
	Поля.Добавить("ДействуетНаОсновании");
КонецПроцедуры


Процедура ОбработкаПолученияПредставления(Данные, Представление, СтандартнаяОбработка)
	Если ЗначениеЗаполнено(Данные.ДействуетНаОсновании) Тогда
		СтандартнаяОбработка = Ложь;
		Представление = Данные.Наименование + " (на основании " +  Данные.ДействуетНаОсновании + ")"; 
	КонецЕсли;
КонецПроцедуры

#КонецОбласти
