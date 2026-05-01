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

