# quik-lua-rpc
RPC-сервис для вызова процедур из QLUA -- Lua-библиотеки торгового терминала QUIK (ARQA Technologies).

Содержание
=================

  * [Зачем?](#Зачем)
  * [Как это работает?](#Как-это-работает)
  * [Как пользоваться?](#Как-пользоваться)
    * [Установка программы](#Установка-программы)
    * [Установка зависимостей](#Установка-зависимостей)
    * [Запуск программы](#Запуск-программы)
  * [Схемы сообщений](#Схемы-сообщений)
  * [Примеры](#Примеры)
  * [Разработчикам](#Разработчикам)
  * [FAQ](#faq)

Зачем?
--------
Торговый терминал QUIK -- одно из немногих средств для торговли на российском рынке. Он предоставляет API в виде библиотеки QLua, написанной на Lua. Написать торговую программу, работающую с QUIK, на чём либо отличном от Lua до сих пор было не так просто (хотя и предпринимаются попытки вытащить API QLua в другие языки, например, в C# -- [**QUIKSharp**](https://github.com/finsight/QUIKSharp)).

Как это работает?
--------
Данный сервис представляет собой RPC-прокси над API библиотеки QLua. Сервис исполняется в терминале QUIK в виде Lua-скрипта и имеет прямой доступ к библиотеке QLua. Общение сторонних программ с сервисом осуществляется посредством [**ZeroMQ**](http://zeromq.org/) ("сокеты на стероидах"), реализуя паттерн REQ/REP (Request / Response), по протоколу TCP. Запросы на вызов удалённых процедур и ответы с результатами выполнения этих процедур передаются в бинарном виде, сериализованные с помощью [**Protocol Buffers**](https://developers.google.com/protocol-buffers/). 

Помимо вызова удалённых процедур сервис также может рассылать оповещения о событиях терминала QUIK, реализуя паттерн PUB/SUB (Publisher / Subscriber).

Соответственно, выбор языка программирования для взаимодействия с QLua ограничивается лишь наличием на этом языке реализаций ZeroMQ и Protocol Buffers, коих довольно большое количество.

Как пользоваться?
--------
### Установка программы

Скопировать репозиторий в `%PATH_TO_QUIK%/lua/`, где `%PATH_TO_QUIK%` -- путь до терминала QUIK. Если папки `lua` там нет, нужно её создать.

### Установка зависимостей

Распаковать архив `redist.zip`, лежащий в корне репозитория, и следовать инструкциям согласно именам папок. 

Если боитесь запускать приложенные .exe-файлы, то можете скачать соответствующие файлы с сайта Microsoft самостоятельно (обратите внимание, что нужны версии для платформы `x86`): https://support.microsoft.com/en-us/help/2977003/the-latest-supported-visual-c-downloads.
	
### Запуск программы
В терминале QUIK в меню Lua-скриптов добавить и запустить скрипт `%PATH_TO_SERVICE%/main.lua`, где `%PATH_TO_SERVICE%` -- путь до папки с программой включительно (например, `D:/QUIK/lua/quik-lua-rpc`).

Конфигурации точек подключения находятся в файле `%PATH_TO_SERVICE%/config.json`.

Краткая справка по формату конфигурационного файла на примере:
	
```javascript
{
    // Точки подключения. Может быть сколько угодно различных точек подключения со своими настройками.
    "endpoints": [
    {
        // Тип точки подключения: 
        // "RPC" -- для удалённого вызова процедур,
        // "PUB" -- для рассылки событий терминала.
        "type": "RPC", 
        // Признак активности/неактивности точки. Ненужные на данный момент точки можно деактивировать.
        "active": true, 
        // TCP-адрес точки подключения. 
        // На данный момент ZeroMQ не поддерживает ipc-абстракцию под Windows, 
        // поэтому  для транспорта остаётся TCP.
        "address": {
            "host": "127.0.0.1",
            "port": 5560
        },
        // Секция настройки аутентификации для точки подключения.
        "auth": {
            // Механизм аутентификации ZeroMQ: 
            // "NULL" или пустая строка (нет аутентификации), 
            // "PLAIN" (пара логин/пароль без шифрования трафика),
            // "CURVE" (ключевая пара и шифрование трафика).
            "mechanism": "CURVE",
            // Секция настройки PLAIN-аутентификации.
	    // Может отсутствовать при выборе механизма NULL или CURVE.
            "plain": {
                // Список пользователей для точки подключения.
                "users": [
                    {"username": "test_user", "password": "test_password"}
                ]
            },
            // Секция настройки CURVE-аутентификации.
	    // Может отсутствовать при выборе механизма NULL или PLAIN.
            "curve": {
                    // Серверная ключевая пара CURVE
                    "server": {
                        "public": "rq:rM>}U?@Lns47E1%kR.o@n%FcmmsL/@{H8]yf7",
                        "secret": "JTKVSB%%)wK0E.X)V>+}o?pNmC{O&4W4b!Ni{Lh6"
                    }, 
                    // Список публичных CURVE-ключей пользователей
                    "clients": ["Yne@$w-vo<fVvi]a<NY6T1ed:M$fCG*[IaLV{hID"]
            }
        }
    }, 

    {
        "type": "PUB", 
        "active": true, 
        "address": {
            "host": "127.0.0.1",
            "port": 5561
        },
        "auth": {
            "mechanism": "PLAIN", 
            "plain": {
                    "users": [
                        {"username": "admin", "password": "letmein"}
                    ]
            }
        }
    }]
}
```

Убедитесь, что используемые вами порты открыты.

### Схемы сообщений
Схемы сообщений расположены внутри директории `qlua/rpc` в виде файлов .proto (Protocol Buffers).

### Примеры

Пример клиента на Java: https://github.com/Enfernuz/quik-lua-rpc-java-client

### Разработчикам

Актуальную инструкцию для разработчиков можно найти здесь: https://github.com/Enfernuz/quik-lua-rpc/blob/master/CONTRIBUTING.md

### FAQ

Q: **Используешь Protocol Buffers, но не используешь gRPC. Как так?**

A: Для Lua пока не запилили генерацию стабов gRPC. Что уж говорить, даже биндинг для Protocol Buffers -- это fan-made опенсорс, оставляющий желать лучшего.

Q: **А что насчёт Thrift? Там вроде есть поддержка Lua.**

A: Если мне память не изменяет, там в зависимостях библиотеки, для которых исходники только под UNIX (например, `luabpack`).

Q: **JSON-RPC будет?**

A: ["Мы работаем над этим."](https://github.com/Enfernuz/quik-lua-rpc/tree/feature/json-rpc)
