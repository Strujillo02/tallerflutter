# TALLER 1

* En app_router.dart se utilizo para crear las rutas de las demas pantallas

* app_theme se crean los temas que van a utilizar en la aplicacion como los colores de appbar y el menu

* base_view se crea la plantilla de la appbar donde cada vez que la llamemos recibra el cuerpo y el titulo como parametro

* custom_draw se crea se crea todo lo del menu, incluyendo la navegacion entre las paginas por medio del router

* home_view es la pagina de inicio llamando a la appbar con el grid

* grid_view llama al menu y la appbar y se le añade el gridview que es para mostrar ciertos datos como en una celda

* tabbar_view llama al menu y la appbar y se le añade el tabbar que es como una pantalla con 3 body el cual uno de ellos tiene una imagen que hace parte como mi widget cualquiera

* main llama al router el cual el router va a llamar al home_view

* ciclo_vida_screen ejecuta los siguientes metodos: 
initState(): Se ejecuta una vez cuando se crea el widget. Ideal para inicializar variables.
didChangeDependencies(): Se ejecuta cuando cambian las dependencias del widget, útil para reaccionar a cambios en el contexto.
build(): Construye la interfaz del widget y se ejecuta cada vez que hay una actualización visual.
setState(): Actualiza el estado del widget y provoca una reconstrucción de la UI.
dispose(): Se ejecuta cuando el widget se elimina de la memoria, útil para liberar recursos.

* detalle_screen ese recibe los parametros de los diferentes 3 diferentes formas de como se envian en el paso_parametro_screen:
'go': Navega a una nueva pantalla sin posibilidad de volver atrás.
'push': Agrega una nueva pantalla a la pila de navegación, permitiendo regresar.
'replace': Reemplaza la pantalla actual con una nueva, sin opción de volver a la anterior.


# TALLER 2

* En el future_view se creo un arreglo vacio, luego llamamos al metodo obtenerdatos apenas se ejecute la pantalla , y este metodo llama a cargar datos que llena al arreglo con nosmbres, cuando la lista esta vacia muestra una carga circular mientras se cargan los datos para luego ser mostrados en un listview

* En el isolate_view se crea un hilo que realiza una sumatoria de 1 hasta 5000, mostrando en pantalla el resultado de dicha operacion y permite continuar ejecutando en proceso mientras esta en otras pantallas.

* En el timer_view inicia un contador en 0, tiene un metodo que es iniciarTemporizador que aumenta el contador en 1 cada segundo, reiniciarTemporizador que este pone a el contador en 0, y pausarTemporizador cancela en temporizador para que no siga contando, y son llamados en botones para su ejecucion.

* Se agregaron las nuevas funcionalidades al custom_drawer

# TALLER 3 

* Se trabajo con la api de Meal y se modelo tal cual como los datos aparecen en el json, los atributos del objeto fueron: idMeal, strMeal y trMealThumb.

* Se creo el service, que es este es el que trae los datos de la API, y se los pasa a la vista, ahi hay 2 metodos, el getmeals trae lista todas las comidas, y el getmealbyid solo trae uno por id. Utilizando el modelo

* Comida_list_view muestra todas las comidas con el metodo getmeals del service y llama al modelo.

* Comida_detail_view muestra una comida consultda por id con el metodo getmealbyid del service y llama al modelo.

* para finalizar se llama las views desde el app_router.


