
#Область ОбработчикиСобытийФормы

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	
	// СтандартныеПодсистемы.ПодключаемыеКоманды
	ПодключаемыеКоманды.ПриСозданииНаСервере(ЭтотОбъект);
	// Конец СтандартныеПодсистемы.ПодключаемыеКоманды
	
	// ++ Кузьмина 06.01.2024 
	ЭлементКЛ = Элементы.Добавить("Д_КонтактноеЛицо", Тип("ПолеФормы"),Элементы.ГруппаШапкаПраво);
	ЭлементКЛ.Вид = ВидПоляФормы.ПолеВвода;
	ЭлементКЛ.ПутьКДанным = "Объект.Д_КонтактноеЛицо";
	
	Группа = Элементы.Добавить("ГруппаСкидка", Тип("ГруппаФормы"), Элементы.ГруппаШапкаЛево);
	Группа.Вид = ВидГруппыФормы.ОбычнаяГруппа;
	Группа.ОтображатьЗаголовок = Ложь;
	
	ЭлементСкидка = Элементы.Добавить("Д_СогласованнаяСкидка", Тип("ПолеФормы"),Группа);
	ЭлементСкидка.Вид = ВидПоляФормы.ПолеВвода;
	ЭлементСкидка.ПутьКДанным = "Объект.Д_СогласованнаяСкидка";
	ЭлементСкидка.УстановитьДействие("ПриИзменении", "ПриИзмененииСкидки"); 
	
	КомандаПересчитать = Команды.Добавить("ПересчитатьСкидку");
	КомандаПересчитать.Заголовок = "ПересчитатьСкидку";
	КомандаПересчитать.Действие = "КомандаПересчитатьСкидку";
	
	КнопкаКоманды = Элементы.Добавить("КомандаПересчитатьСкидку", Тип("КнопкаФормы"), Группа); 
	КнопкаКоманды.ИмяКоманды = "ПересчитатьСкидку";
	КнопкаКоманды.Вид = ВидКнопкиФормы.ОбычнаяКнопка;	
		
	// -- Кузьмина
	
КонецПроцедуры

&НаКлиенте
Процедура ПриОткрытии(Отказ)
	
    // СтандартныеПодсистемы.ПодключаемыеКоманды
    ПодключаемыеКомандыКлиент.НачатьОбновлениеКоманд(ЭтотОбъект);
    // Конец СтандартныеПодсистемы.ПодключаемыеКоманды
	
КонецПроцедуры

&НаСервере
Процедура ПриЧтенииНаСервере(ТекущийОбъект)
	
    // СтандартныеПодсистемы.ПодключаемыеКоманды
    ПодключаемыеКомандыКлиентСервер.ОбновитьКоманды(ЭтотОбъект, Объект);
    // Конец СтандартныеПодсистемы.ПодключаемыеКоманды
	
КонецПроцедуры

&НаКлиенте
Процедура ПослеЗаписи(ПараметрыЗаписи)
    ПодключаемыеКомандыКлиент.ПослеЗаписи(ЭтотОбъект, Объект, ПараметрыЗаписи);
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиСобытийЭлементовТаблицыФормыТовары

&НаКлиенте
Процедура ТоварыКоличествоПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Товары.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

&НаКлиенте
Процедура ТоварыЦенаПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Товары.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

&НаКлиенте
Процедура ТоварыПриИзменении(Элемент)
	РассчитатьСуммуДокумента();
КонецПроцедуры

&НаКлиенте
Процедура ТоварыСкидкаПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Товары.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиСобытийЭлементовТаблицыФормыУслуги

&НаКлиенте
Процедура УслугиКоличествоПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Услуги.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

&НаКлиенте
Процедура УслугиЦенаПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Услуги.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

&НаКлиенте
Процедура УслугиСкидкаПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Услуги.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

&НаКлиенте
Процедура УслугиПриИзменении(Элемент)
	РассчитатьСуммуДокумента();
КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

&НаКлиенте
Процедура КомандаПересчитатьСкидку(Команда);
	
	// ++ Кузьмина 06.01.2024 
	ПересчитатьСкидку();
    // -- Кузьмина	
	
КонецПроцедуры

&НаКлиенте
Процедура ПересчитатьСкидку()
	
	// ++ Кузьмина 06.01.2024 
	Для Каждого Стр Из Объект.Товары Цикл
		РассчитатьСуммуСтроки(Стр);	
	КонецЦикла;
	
	Для Каждого Стр Из Объект.Услуги Цикл
		РассчитатьСуммуСтроки(Стр);	
	КонецЦикла;
	// -- Кузьмина

КонецПроцедуры

&НаКлиенте
Асинх Процедура ПриИзмененииСкидки(Элемент)
	// ++ Кузьмина 06.01.2024
	Если Объект.Товары.Количество() > 0 Или Объект.Услуги.Количество() > 0 Тогда
		
		Ответ = Ждать ВопросАсинх("Изменен процент скидки. Пересчитать таблицы товаров и услуг?", РежимДиалогаВопрос.ДаНет);
		
		Если Ответ = КодВозвратаДиалога.Нет Тогда
			Возврат
		КонецЕсли; 
		
		ПересчитатьСкидку();
		
	КонецЕсли;  
	// -- Кузьмина
КонецПроцедуры

&НаКлиенте
Процедура РассчитатьСуммуСтроки(ТекущиеДанные)
	
	// ++ Кузьмина 31.10.2023
	//КоэффициентСкидки = 1 - ТекущиеДанные.Скидка / 100;
	//ТекущиеДанные.Сумма = ТекущиеДанные.Цена * ТекущиеДанные.Количество * КоэффициентСкидки;
	ОбщаяСкидка = ТекущиеДанные.Скидка + Объект.Д_СогласованнаяСкидка;
	КоэффициентВсехСкидок = (1-ОбщаяСкидка/100); 
	ТекущиеДанные.Сумма = ТекущиеДанные.Цена * ТекущиеДанные.Количество * КоэффициентВсехСкидок;
	Если ОбщаяСкидка > 100 Тогда 
		ТекущиеДанные.Сумма = 0;
		Сообщение = Новый СообщениеПользователю();
		Сообщение.Текст = "Общая скидка не должна превышать 100%";
		Сообщение.Сообщить();
	КонецЕсли;
	// -- Кузьмина
	
	РассчитатьСуммуДокумента();
	
КонецПроцедуры

&НаКлиенте
Процедура РассчитатьСуммуДокумента()
	
	Объект.СуммаДокумента = Объект.Товары.Итог("Сумма") + Объект.Услуги.Итог("Сумма");
	
КонецПроцедуры

#Область ПодключаемыеКоманды

// СтандартныеПодсистемы.ПодключаемыеКоманды
&НаКлиенте
Процедура Подключаемый_ВыполнитьКоманду(Команда)
    ПодключаемыеКомандыКлиент.НачатьВыполнениеКоманды(ЭтотОбъект, Команда, Объект);
КонецПроцедуры

&НаКлиенте
Процедура Подключаемый_ПродолжитьВыполнениеКомандыНаСервере(ПараметрыВыполнения, ДополнительныеПараметры) Экспорт
    ВыполнитьКомандуНаСервере(ПараметрыВыполнения);
КонецПроцедуры

&НаСервере
Процедура ВыполнитьКомандуНаСервере(ПараметрыВыполнения)
    ПодключаемыеКоманды.ВыполнитьКоманду(ЭтотОбъект, ПараметрыВыполнения, Объект);
КонецПроцедуры

&НаКлиенте
Процедура Подключаемый_ОбновитьКоманды()
    ПодключаемыеКомандыКлиентСервер.ОбновитьКоманды(ЭтотОбъект, Объект);
КонецПроцедуры
// Конец СтандартныеПодсистемы.ПодключаемыеКоманды

#КонецОбласти

#КонецОбласти
