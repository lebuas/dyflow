# PRODUCT CONTEXT: Dyfloe
Dyfloe es una aplicación para escritorio enfocada en alta interactividad que permite a los usuarios gestionar su espacio de trabajo.
Módulos principales: Tareas, Snippets, Notas, Workflows y Scripts.

# SPEC: Panel Principal de Navegación (Launcher Mode)

## 1. Diseño Estructural (ASCII Wireframe)
+-----------------------------------------------------------------------+
|  [Q] Search notes, snippets, tasks...                    [✨] Ask AI  |
+-----------------------------------------------------------------------+
|                                                                       |
|  RECENTLY VIEWED                                                      |
|  (L) Recent Items                                         # recent >  |
|                                                                       |
|  PROJECTS                                                             |
|  [N] Notes                                                # notes >   |
|  [< >] Snippets                                         # snippets >  |
|  [/] Tasks                                                # tasks >   |
|  [S] Workflows                                         # workflows >  |
|  [_] Scripts                                             # scripts >  |
|                                                                       |
|  SUPPORT                                                              |
|  (?) Setting                                                             |
|  (!) Suggestions                                                      |
|  (X) Report a problem                                                 |
|                                                                       |
+-----------------------------------------------------------------------+

## 2. Reglas de Comportamiento e Interacción (Globales)

* **Comportamiento de la Ventana (Escritorio):**
  - **Posición:** El contenedor debe renderizarse estrictamente en el **centro absoluto de la pantalla**.
  - **Interactividad Global:** La ventana se muestra u oculta globalmente mediante un comando de teclado (atajo/hotkey del sistema).
  
* **Layout y Estilos Visuales:**
  - **Fondo:** Modo oscuro estricto (Negro/Gris muy oscuro).
  - **Contenedor:** Esquinas redondeadas y sombra pronunciada para dar efecto de flotado.
  - **Tipografía:** Textos secundarios ("RECENTLY VIEWED", "PROJECTS", "SUPPORT") en mayúsculas, tamaño pequeño y color gris claro atenuado.

## 3. Tipos de Elementos (Definición Teórica)

* **Header (Barra de Búsqueda):**
  - Es un elemento tipo *input* de texto que actúa como filtro global para buscar elementos internos dentro de los diferentes proyectos.
  - Incluye a la derecha el botón estático `[✨] Ask AI`.

* **Project (Módulos):**
  - Son botones interactivos que representan las diferentes aplicaciones ejecutables dentro de la plataforma Dyfloe.
  - Tienen metadatos (contadores `#`) alineados a la derecha que muestran información sobre la cantidad de contenido en ese módulo.

* **Support (Ayuda):**
  - Son botones de acción secundaria que muestran opciones de soporte técnico, retroalimentación u obtención de información sobre la aplicación.

## 4. Restricciones para el Diseño de la Primera Interfaz (UI Estática)

*Instrucciones estrictas para la IA de desarrollo:*
1. **Cero Lógica Funcional:** No programar la apertura de paneles, ni redirecciones, ni la lógica interna de búsqueda en esta fase.
2. **Interactividad Visual Base:** Implementar únicamente los estados visuales pasivos: enfoque (`focus`) en la barra de búsqueda y efectos de cambio de fondo (`hover`) tipo mano (`pointer`) al pasar por encima de los botones de Proyectos y Soporte.
3. **Estructura Rígida:** Mantener el orden vertical del wireframe (Header -> Recently Viewed -> Projects -> Support).

---

## 5. Registro de Tareas de Implementación (Tracking de Progreso)
- [ ] Configurar el contenedor flotante centrado en pantalla con estilos CSS oscuros.
- [ ] Diseñar el Header con el buscador y el botón estático de Ask AI.
- [ ] Maquetar la lista de Proyectos con sus íconos, etiquetas y marcadores numéricos `#`.
- [ ] Maquetar la sección inferior de Soporte.
-
