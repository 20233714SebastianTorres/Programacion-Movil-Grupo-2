# 1. Introducción y entorno de desarrollo

Actualmente, las aplicaciones enfocadas en entretenimiento y redes sociales han tomado gran relevancia debido a la necesidad de los usuarios de compartir opiniones, descubrir contenido y registrar sus experiencias digitales. En el ámbito cinematográfico, muchas personas buscan plataformas donde puedan organizar las películas que han visto, calificarlas y encontrar recomendaciones según sus gustos personales.

Por ello, el presente proyecto propone el desarrollo de una aplicación móvil inspirada en Letterboxd, utilizando el framework Flutter. La aplicación permitirá a los usuarios registrar películas vistas, asignar puntuaciones, escribir reseñas, crear listas personalizadas y administrar una watchlist de futuras películas por visualizar.

El proyecto busca aplicar conceptos de desarrollo móvil multiplataforma, diseño de interfaces modernas y experiencia de usuario, integrando herramientas actuales utilizadas en la industria del software. Asimismo, se priorizará una interfaz intuitiva, visualmente atractiva y optimizada para dispositivos móviles Android.

## Herramientas utilizadas

- **Flutter**  
Framework principal utilizado para el desarrollo de la aplicación móvil multiplataforma mediante el lenguaje Dart.

- **Visual Studio Code**  
Editor de código empleado para la programación, depuración y administración del proyecto.

- **Android Studio**  
Herramienta utilizada para el emulador Android y la configuración del SDK necesario para ejecutar aplicaciones móviles.

- **GitHub**  
Plataforma utilizada para almacenar el repositorio del proyecto y gestionar el desarrollo colaborativo.

- **Inkscape**  
Software de diseño vectorial utilizado para la creación de logos, mockups e interfaces visuales.

- **Figma**  
Es una herramienta de diseño digital que se usa para crear interfaces.

---

## 1.1. Captura de requisitos

### 1.1.1. Requisitos funcionales

**Registro e inicio de sesión:**  
El sistema debe permitir a los usuarios registrarse e iniciar sesión mediante correo electrónico, Google o redes sociales.

**Gestión de perfil:**  
El sistema debe permitir al usuario crear y editar su perfil, incluyendo foto, biografía y listas favoritas.

**Búsqueda de películas:**  
El sistema debe permitir buscar películas por título, género, año o actores.

**Visualización de detalles:**  
El sistema debe mostrar información detallada de cada película (sinopsis, elenco, duración, calificación, tráiler).

**Registro de películas vistas:**  
El sistema debe permitir marcar películas como vistas y registrar la fecha de visualización.

**Calificación y reseñas:**  
El sistema debe permitir calificar películas (por ejemplo, de 1 a 5 estrellas) y escribir reseñas.

**Creación de listas:**  
El sistema debe permitir crear listas personalizadas (ej: “Mis favoritas”, “Películas por ver”).

**Sistema de recomendaciones:**  
El sistema debe sugerir películas basadas en el historial y preferencias del usuario.

**Seguimiento de usuarios:**  
El sistema debe permitir seguir a otros usuarios y ver su actividad.

**Feed de actividad:**  
El sistema debe mostrar un feed con las actividades recientes de usuarios seguidos (reseñas, listas, calificaciones).

**Notificaciones:**  
El sistema debe enviar notificaciones sobre nuevos seguidores, comentarios o recomendaciones.

**Modo offline básico:**  
El sistema debe permitir visualizar contenido previamente cargado sin conexión a internet.

**Integración con API externa:**  
El sistema debe consumir una API de películas (como TMDB) para obtener información actualizada.

---

### 1.1.2. Requisitos no funcionales

**Compatibilidad:**  
La aplicación debe ser compatible con dispositivos Android e iOS (Flutter multiplataforma).

**Rendimiento:**  
La aplicación debe responder en menos de 2 segundos en operaciones comunes como búsqueda o carga de listas.

**Escalabilidad:**  
El sistema backend debe soportar un crecimiento progresivo de usuarios sin degradar el rendimiento.

**Seguridad:**  
Los datos del usuario deben estar protegidos mediante autenticación segura y cifrado (HTTPS).

**Usabilidad:**  
La interfaz debe ser intuitiva, con navegación clara y diseño centrado en el usuario.

**Disponibilidad:**  
El sistema debe garantizar una disponibilidad mínima del 99%.

**Mantenibilidad:**  
El código debe seguir buenas prácticas (ej: arquitectura limpia, separación de capas) para facilitar cambios futuros.

**Portabilidad:**  
La aplicación debe poder desplegarse fácilmente en diferentes dispositivos móviles.

**Consumo de recursos:**  
La aplicación debe optimizar el uso de batería y memoria del dispositivo.

**Internacionalización:**  
La aplicación debe permitir múltiples idiomas (ej: español e inglés).

---

## 2. Diagrama de despliegue

![Diagrama de despliegue](https://github.com/user-attachments/assets/a34915e2-0de2-4344-9716-651c893ac8b5)

---

## 3. Diagrama de casos de uso

![Diagrama de casos de uso](https://github.com/user-attachments/assets/e8cf9551-978f-4ba1-bb30-fb065a37beec)

---

## 4. Descripción de casos de uso

### CU-01: Registrar usuario

**Actor:** Usuario  
**Descripción:** Permite a un nuevo usuario crear una cuenta en la aplicación.

**Flujo principal:**

1. El usuario abre la app.  
2. Selecciona “Registrarse”.  
3. Ingresa correo, contraseña y datos básicos.  
4. El sistema valida los datos.  
5. El sistema crea la cuenta.  

**Postcondición:**  
El usuario queda registrado y puede iniciar sesión.

![Registrar usuario](https://github.com/user-attachments/assets/501fde2f-3332-4864-af2e-01cca57f96b5)

---

### CU-02: Iniciar sesión

**Actor:** Usuario  
**Descripción:** Permite al usuario ingresar a la aplicación mediante sus credenciales para acceder a las funcionalidades de la app.

**Flujo principal:**

1. El usuario abre la aplicación.  
2. El usuario ingresa sus credenciales en los campos correspondientes.  
3. El usuario selecciona la opción de “Iniciar sesión”.  
4. El sistema valida que los campos no estén vacíos.  
5. El sistema verifica la validez de las credenciales en la base de datos.  
6. El sistema autentica al usuario.  
7. El sistema inicia la sesión del usuario.  
8. El usuario es redirigido a la pantalla principal.  

![Iniciar sesión](https://github.com/user-attachments/assets/320b7bdc-444f-4f82-bd96-17fa0274d7db)

---

### CU-03: Gestionar perfil

**Actor:** Usuario  
**Descripción:** Permite al usuario visualizar y actualizar la información de su perfil en la aplicación, incluyendo foto, descripción de usuario, listas favoritas, etc.  

**Entidades relacionadas:** Usuario, Lista, Favoritos  

**Flujo principal:**

1. El usuario registrado accede a la sección “Perfil”  
2. El sistema muestra la información actual del perfil (foto, nombre de usuario, biografia)  
3. El usuario selecciona la opción “Editar perfil”  
4. Modifica uno o más campos (foto, biografía, etc.)  
5. El usuario guarda los cambios  
6. El sistema valida la información y actualiza los datos del usuario  
7. Se muestra el perfil actualizado  

**Mockup asociados:** Pantalla de perfil, pantalla de edición de perfil  

![Gestionar perfil](https://github.com/user-attachments/assets/124ae173-f098-4603-ad14-7b2216f9663a)

---

### CU-04: Calificar y reseñar película

**Actor:** Usuario  
**Descripción:** Permite al usuario calificar y escribir una reseña sobre una película.

**Flujo principal:**

1. El usuario selecciona una película.  
2. Elige una calificación (1–5 estrellas).  
3. Escribe una reseña.  
4. El sistema guarda la información.  

**Postcondición:**  
La calificación y reseña quedan registradas.

![Reseña](https://github.com/user-attachments/assets/72a8a3f8-7466-4923-96df-b4b8758ac2e3)

---

### CU-05: Crear lista de películas

**Actor:** Usuario  
**Descripción:** Permite al usuario crear listas personalizadas de películas.

**Flujo principal:**

1. El usuario accede a la sección de listas.  
2. Selecciona “Crear lista”.  
3. Ingresa nombre y descripción.  
4. Añade películas.  
5. El sistema guarda la lista.  

**Postcondición:**  
La lista queda disponible en el perfil del usuario.

![Lista 1](https://github.com/user-attachments/assets/e0a82296-1707-4e19-bc4a-8d5e2f66c3c6)  
![Lista 2](https://github.com/user-attachments/assets/11a2678c-3da7-4386-8cc3-e26730461b77)

---

### CU-06: Buscar películas

**Actor:** Usuario  

**Descripción:**  
Permite al usuario buscar películas dentro de la aplicación mediante criterios:

- **Filtros:** Título, Género, Año de estreno, Calificación  
- **Ordenamiento:** A → Z / Z → A, Más reciente / Más antiguo, Mayor a menor calificación / Menor a mayor calificación  

**Flujo principal:**

1. El usuario accede a la sección de búsqueda  
2. El usuario ingresa un término de búsqueda y/o selecciona los filtros y criterios de ordenamiento deseados  
3. El usuario presiona el botón "Aplicar"  
4. El sistema valida que se haya ingresado al menos un término de búsqueda o seleccionado un filtro  
5. El sistema consulta los datos disponibles a través de la API de películas  
6. El sistema muestra la lista de películas resultantes con información básica (póster, título en español, título original año)  
7. El usuario visualiza los resultados obtenidos  

**Flujo alternativo:**  
Si no se encuentran resultados, el sistema muestra un mensaje indicando que no hay coincidencias y sugiere modificar los criterios de búsqueda.

**Postcondición:**  
El usuario visualiza una lista de películas que coinciden con su búsqueda y puede seleccionar una para ver sus detalles.

![Buscar](https://github.com/user-attachments/assets/2decf29c-7d9b-425b-b8fc-05f9e6ec369f)
