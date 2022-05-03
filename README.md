#  Workouter

# 🇨🇿

Workouter je aplikace pro zaznamenávání cvičení. Umožňuje zadávat cvičení a ukládat je buď lokálně, nebo na server. Můžete zadat dobu trvání cvičení a nastavit místo konání. Aplikace také sleduje různé aktivity a uchovává je seskupené do skupin, aby k nim měl uživatel přístup.

## Průchod aplikací

Aplikace je jednoduchá s pouze dvěma obrazovkami. Myslím, že v tomto případě by se hlavní pozornost měla soustředit na samotná data a uživatel by neměl být rozptylován dalšími prvky. Proto jsem se rozhodl implementovat obrazovku ExercisesListScreen jako jedinou samostatnou obrazovku. Obrazovka AddExerciseScreen funguje jako sheet prezentovaný z obrazovky ExercisesListScreen, nikoli jako samostatná obrazovka v TabView, aby se uživatel opět soustředil na to, co je důležité.

## Implementace

Aplikace je napsána čistě ve Swiftu a SwiftUI s architekturou MVVM. Používá Dependency Injection (Resolver) pro services/managers a Environment values pro ViewModels do Views.
- Services
	Serviceužba je cokoli, co komunikuje se světem mimo aplikaci. V tomto případě existují dvě služby - AuthenticationService sleduje stav příhlášení uživatele a poskytuje aktuální údaje o uživateli ostatním částem aplikace. Služba ExercisesService je zodpovědná za získávání dat ze serveru.
- Managers
	Manager je cokoli, co pracuje lokálně. V tomto případě je jediným manažerem CoreDataManager. Ten sleduje aktuálně uložená data v CoreData a zpřístupňuje je ostatním částem aplikace.
	
Aplikace používá protokol ExerciseProtocol, ke kterému konformují LocalExercise a RemoteExercise. Tím je zajištěno, že Views jsou schopny zobrazit seznam obou modelů a nezáleží na tom, zda se jedná o Local nebo Remote model.

# 🇬🇧

Workouter is an exercise tracking app. It allows you to keep track of your workouts and store those either localy, or remotely. You can specify the duration of the workout and set its location. The app also keeps track of different activities and keeps those grouped together for you to view.

## App flow

The app is a simple two screen application. I think that in this case, the main focus should be on the data itself and the user shouldn't be distracted by other elements. That is why I chose to implement the ExercisesListScreen as the only standalone screen. The AddExerciseScreen works as a sheet presented from the ExercisesListScreen and not a standalone screen in a TabView to, again, keep the user focused on what is important.

## Implementation

The app is written purely in Swift and SwiftUI with MVVM architecture. It uses dependency injection (Resolver) to keep track of underlying services/managers and environment values to expose ViewModels to Views.
- Services
	A service is anything that communicates with the outisde world. In this case, there are two services- AuthenticationService keeps track of authentication state and provides current user data to other parts of the app. ExercisesService is responsible for retrieving remote data from the server and jeeping its repository up to date.
- Managers
	A manager is anything that works localy. In this case, there is the CoreDataManager as the only manager. It keeps track of currently saved data in CoreData database and exposes the data to other parts of the app.
	
The app uses the ExerciseProtocol to which both local and remote exercises have to conform. This ensures that views are able to display list of both models and don't care whether the model is the local or remote one.

