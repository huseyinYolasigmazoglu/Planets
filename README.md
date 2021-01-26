# Planets

My Enviroment:

xCode Version 12.3 (12C33).
My swift version : Swift 5.
Minimum iOS version should be 13.0 .
Not used any third-party libraries.
Unit test written in PlanetsTests.

General Usage:

There is UICollectionView at start screen. It presents name of planets. If you click one planet you will go to detail page.
When application start it try to load planets from https://swapi.dev/api/planets/, if there is a problem then it tries to load from Core Data , from previous run.


Important classes:

Planet : Codable model for https://swapi.dev/api/planets web service.

MainViewController :  it has a uicollectionview , this class call PlanetWebService to get planets. This class also segue to DetailView.
This class hold an PlanetListViewModel instance.

PlanetListViewModel: This class manages most of the bussiness logic . Holds an [Planet?] array and converts it to [PlanetEntity?] ,  
PlanetEntity behave like an ModelView and can also save coreData for data persistance. PlanetListViewModel in init , 
if no data came from web service it will load data from cora data.if data is received from web service , this will be saved. 
This class also has a protocol to be able to refresh data  of  MainViewController.

Webservice : A Generic  web service class.

PlanetWebService : get All Planets from https://swapi.dev/api/planets  and return data with closure.

PlanetDetailViewController : in MainViewController , when a planet cell , this is segued.

PlanetsTests : For Unit tests.

