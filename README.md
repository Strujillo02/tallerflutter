En app_router.dart se utilizo para crear las rutas de las demas pantallas

app_theme se crean los temas que van a utilizar en la aplicacion como los colores de appbar y el menu

base_view se crea la plantilla de la appbar donde cada vez que la llamemos recibra el cuerpo y el titulo como parametro

custom_draw se crea se crea todo lo del menu, incluyendo la navegacion entre las paginas por medio del router

home_view es la pagina de inicio llamando a la appbar con el grid

grid_view llama al menu y la appbar y se le añade el gridview que es para mostrar ciertos datos como en una celda

tabbar_view llama al menu y la appbar y se le añade el tabbar que es como una pantalla con 3 body el cual uno de ellos tiene una imagen que hace parte como mi widget cualquiera

main llama al router el cual el router va a llamar al home_view

ciclo_vida_screen ejecuta los siguientes metodos: 
initState(): Se ejecuta una vez cuando se crea el widget. Ideal para inicializar variables.
didChangeDependencies(): Se ejecuta cuando cambian las dependencias del widget, útil para reaccionar a cambios en el contexto.
build(): Construye la interfaz del widget y se ejecuta cada vez que hay una actualización visual.
setState(): Actualiza el estado del widget y provoca una reconstrucción de la UI.
dispose(): Se ejecuta cuando el widget se elimina de la memoria, útil para liberar recursos.

detalle_screen ese recibe los parametros de los diferentes 3 diferentes formas de como se envian en el paso_parametro_screen:
'go': Navega a una nueva pantalla sin posibilidad de volver atrás.
'push': Agrega una nueva pantalla a la pila de navegación, permitiendo regresar.
'replace': Reemplaza la pantalla actual con una nueva, sin opción de volver a la anterior.
