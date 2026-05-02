1. Introducción y entorno de desarrollo

Introducción
Actualmente, las aplicaciones enfocadas en entretenimiento y redes sociales han tomado gran relevancia debido a la necesidad de los usuarios de compartir opiniones, descubrir contenido y registrar sus experiencias digitales. En el ámbito cinematográfico, muchas personas buscan plataformas donde puedan organizar las películas que han visto, calificarlas y encontrar recomendaciones según sus gustos personales.

Por ello, el presente proyecto propone el desarrollo de una aplicación móvil inspirada en Letterboxd, utilizando el framework Flutter. La aplicación permitirá a los usuarios registrar películas vistas, asignar puntuaciones, escribir reseñas, crear listas personalizadas y administrar una watchlist de futuras películas por visualizar.

El proyecto busca aplicar conceptos de desarrollo móvil multiplataforma, diseño de interfaces modernas y experiencia de usuario, integrando herramientas actuales utilizadas en la industria del software. Asimismo, se priorizará una interfaz intuitiva, visualmente atractiva y optimizada para dispositivos móviles Android.

Herramientas utilizadas:
-Flutter
Framework principal utilizado para el desarrollo de la aplicación móvil multiplataforma mediante el lenguaje Dart.
-Visual Studio Code
Editor de código empleado para la programación, depuración y administración del proyecto.
-Android Studio
Herramienta utilizada para el emulador Android y la configuración del SDK necesario para ejecutar aplicaciones móviles.
-GitHub
Plataforma utilizada para almacenar el repositorio del proyecto y gestionar el desarrollo colaborativo.
-Inkscape
Software de diseño vectorial utilizado para la creación de logos, mockups e interfaces visuales.

1.1. Captura de requisitos

1.1.1. Requisitos funcionales
Registro e inicio de sesión:
 El sistema debe permitir a los usuarios registrarse e iniciar sesión mediante correo electrónico, Google o redes sociales.
Gestión de perfil:
 El sistema debe permitir al usuario crear y editar su perfil, incluyendo foto, biografía y listas favoritas.
Búsqueda de películas:
 El sistema debe permitir buscar películas por título, género, año o actores.
Visualización de detalles:
 El sistema debe mostrar información detallada de cada película (sinopsis, elenco, duración, calificación, tráiler).
Registro de películas vistas:
 El sistema debe permitir marcar películas como vistas y registrar la fecha de visualización.
Calificación y reseñas:
 El sistema debe permitir calificar películas (por ejemplo, de 1 a 5 estrellas) y escribir reseñas.
Creación de listas:
 El sistema debe permitir crear listas personalizadas (ej: “Mis favoritas”, “Películas por ver”).
Sistema de recomendaciones:
 El sistema debe sugerir películas basadas en el historial y preferencias del usuario.
Seguimiento de usuarios:
 El sistema debe permitir seguir a otros usuarios y ver su actividad.
Feed de actividad:
 El sistema debe mostrar un feed con las actividades recientes de usuarios seguidos (reseñas, listas, calificaciones).
Notificaciones:
 El sistema debe enviar notificaciones sobre nuevos seguidores, comentarios o recomendaciones.
Modo offline básico:
 El sistema debe permitir visualizar contenido previamente cargado sin conexión a internet.
Integración con API externa:
 El sistema debe consumir una API de películas (como TMDB) para obtener información actualizada.

Diagrama de casos de uso

1.1.2. Requisitos no funcionales

Compatibilidad:
 La aplicación debe ser compatible con dispositivos Android e iOS (Flutter multiplataforma).
Rendimiento:
 La aplicación debe responder en menos de 2 segundos en operaciones comunes como búsqueda o carga de listas.
Escalabilidad:
 El sistema backend debe soportar un crecimiento progresivo de usuarios sin degradar el rendimiento.
Seguridad:
 Los datos del usuario deben estar protegidos mediante autenticación segura y cifrado (HTTPS).
Usabilidad:
 La interfaz debe ser intuitiva, con navegación clara y diseño centrado en el usuario.
Disponibilidad:
 El sistema debe garantizar una disponibilidad mínima del 99%.
Mantenibilidad:
 El código debe seguir buenas prácticas (ej: arquitectura limpia, separación de capas) para facilitar cambios futuros.
Portabilidad:
 La aplicación debe poder desplegarse fácilmente en diferentes dispositivos móviles.
Consumo de recursos:
 La aplicación debe optimizar el uso de batería y memoria del dispositivo.
Internacionalización:
 La aplicación debe permitir múltiples idiomas (ej: español e inglés).
 
2. Diagrama de despliegue
<img width="769" height="666" alt="image" src="https://github.com/user-attachments/assets/a34915e2-0de2-4344-9716-651c893ac8b5" />

3. Diagrama de casos de uso
<img width="732" height="640" alt="image" src="https://github.com/user-attachments/assets/e8cf9551-978f-4ba1-bb30-fb065a37beec" />

4.  Descripción de casos de uso 

CU-01: Registrar usuario 
Actor: Usuario
Descripción: Permite a un nuevo usuario crear una cuenta en la aplicación.
Flujo principal:
El usuario abre la app.
Selecciona “Registrarse”.
Ingresa correo, contraseña y datos básicos.
El sistema valida los datos.
El sistema crea la cuenta.
Postcondición:
 El usuario queda registrado y puede iniciar sesión.
<img width="269" height="541" alt="Image" src="https://github.com/user-attachments/assets/501fde2f-3332-4864-af2e-01cca57f96b5" />

CU-02: Iniciar sesión 
Actor: Usuario
Descripción: Permite al usuario ingresar a la aplicación mediante sus credenciales para acceder a las funcionalidades de la app.

Flujo principal:

El usuario abre la aplicación.
El usuario ingresa sus credenciales en los campos correspondientes.
El usuario selecciona la opción de “Iniciar sesión”. 
El sistema valida que los campos no estén vacíos. 
El sistema verifica la validez de las credenciales en la base de datos.
El sistema autentica al usuario.
El sistema inicia la sesión del usuario.
El usuario es redirigido a la pantalla principal.

<img width="341" height="702" alt="image" src="https://github.com/user-attachments/assets/320b7bdc-444f-4f82-bd96-17fa0274d7db" />


CU-03: Gestionar perfil
Actor: Usuario
Descripción: Permite al usuario visualizar y actualizar la información de su perfil en la aplicación, incluyendo foto, descripción de usuario, listas favoritas, etc.
Entidades relacionadas: Usuario, Lista, Favoritos.
Flujo principal:
El usuario registrado accede a la sección “Perfil”
El sistema muestra la información actual del perfil (foto, nombre de usuario, biografia)
El usuario selecciona la opción “Editar perfil”
Modifica uno o más campos (foto, biografía, etc.)
El usuario guarda los cambios
El sistema valida la información y actualiza los datos del usuario
Se muestra el perfil actualizado
Mockup asociados: Pantalla de perfil, pantalla de edición de perfil

<img width="570" height="393" alt="image" src="https://github.com/user-attachments/assets/124ae173-f098-4603-ad14-7b2216f9663a" />

CU-04: Calificar y reseñar película
Actor: Usuario
Descripción: Permite al usuario calificar y escribir una reseña sobre una película.
Flujo principal:
El usuario selecciona una película.
Elige una calificación (1–5 estrellas).
Escribe una reseña.
El sistema guarda la información.
Postcondición:
 La calificación y reseña quedan registradas.

<img width="555" height="544" alt="image" src="https://github.com/user-attachments/assets/72a8a3f8-7466-4923-96df-b4b8758ac2e3" />

CU-05: Crear lista de películas
Actor: Usuario
Descripción: Permite al usuario crear listas personalizadas de películas.
Flujo principal:
El usuario accede a la sección de listas.
Selecciona “Crear lista”.
Ingresa nombre y descripción.
Añade películas.
El sistema guarda la lista.
Postcondición:
 La lista queda disponible en el perfil del usuario.

<img width="581" height="379" alt="image" src="https://github.com/user-attachments/assets/e0a82296-1707-4e19-bc4a-8d5e2f66c3c6" /> <img width="181" height="318" alt="image" src="https://github.com/user-attachments/assets/11a2678c-3da7-4386-8cc3-e26730461b77" />



CU-06: Buscar películas
Actor: Usuario
Descripción: Permite al usuario buscar películas dentro de la aplicación mediante criterios
De Filtros: Título, Género, Año de estreno, Calificación
De Ordenamiento: A → Z / Z → A , Más reciente / Más antiguo, Mayor a menor calificación / Menor a mayor calificación
Flujo principal:
El usuario accede a la sección de búsqueda
El usuario ingresa un término de búsqueda y/o selecciona uno o más filtros disponibles.
El usuario de manera opcional selecciona un criterio de ordenamiento
El sistema valida que al menos un criterio de búsqueda o filtro haya sido ingresado
El sistema consulta los datos disponibles a través de la API de películas.
El sistema muestra una lista de resultados que coincidan con los criterios ingresados.
El usuario visualiza los resultados obtenidos.
Flujo alternativo: Si no se encuentran resultados, el sistema muestra un mensaje indicando que no hay coincidencias y sugiere modificar los criterios de búsqueda.
Postcondición: El usuario visualiza una lista de películas que coinciden con su búsqueda y puede seleccionar una para ver sus detalles

CU-07: Ver detalles de película
Actor: Usuario
Descripción:
Flujo principal:






