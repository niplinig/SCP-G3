# Sistema Contador de Personas en Espacios Públicos



### Objetivo del Proyecto

Diseñar e implementar una base de datos relacional para el monitoreo de aglomeraciones en una área definida.



### Objetivo del Proyecto

- Definir el área de investigación
- Establecer un rango de monitoreo
- Realizar múltiples observaciones para la obtención de datos
- Validar los datos recopilados
- Determinar la existencia de aglomeraciones



### Especificaciones del Sistema:

- Sistema Operativo Linux
- Distribución de Linux Debian 10.10
- 2 GB Memoria
- 10 GB Almacenamiento
- RDMS MySQL Community Server 5.7
- MySQL Workbench Community 8.0
- 10 MBps Velocidad de carga y descarga



### Roles de usuario:

**Observador:** Entidad que realiza observaciones, toma muestra y recopila datos.

**Digitador:** Entidad encargada de validar los datos y digitalizar la información.

**Miembros del grupo:** Personas que forma parte del grupo.



### Casos de Uso: Escenario como párrafo

**Título:** Definir área

**Actor primario:** Miembros del grupo

**Escenario de éxito:** Miembros del grupo investigan posibles lugares donde realizar la investigación. Miembros del grupo escogen un lugar más accesible. Miembros del grupo delimitan el área a cubrir.



**Título:** Establecer monitoreo

**Actor primario:** Miembros del grupo

**Escenario de éxito:** Miembros del grupo organizan un rango de fechas. Miembros del grupo deciden los días de monitoreo. Miembros del grupo deciden rango de horas para realizar observaciones.

**Pre-condiciones:** Miembros del grupo han definido el área de investigación



**Título:** Realizar observaciones

**Actor primario:** Observador

**Escenario de éxito:** Observador recorren el área de investigación. Observador toman nota del número de personas presentes en el área. Observador llevan una cuenta a lo largo de las horas establecidas.

**Pre-condiciones:** Miembros del grupo han establecido monitoreo.



**Título:** Validar los datos

**Actor primario:** Miembros del grupo

**Escenario de éxito:** Miembros del grupo revisan datos observados anteriormente. Miembros del grupo calculan el promedio y desviación estándar de los datos. Miembros del grupo comparan los datos anteriores y los datos más recientes. Miembros del grupo verifican que los datos guarden congruencia y consistencia.

**Pre-condiciones:** Miembros del grupo han tomado al menos diez o más observación antes.



**Título:** Digitalizar datos

**Actor primario:** Digitador

**Escenario de éxito:** Digitador *registra las observaciones*. Digitador escribe la información en editor de texto. Digitador escribe comentarios de la información obtenida.

**Pre-condiciones:** Miembros del grupo han validado datos.



**Título:** Determinar aglomeraciones

**Actor primario:** Miembros del grupo

**Escenario de éxito:** Miembros del grupo *generan un informe* de la información digitalizada. Miembros del grupo definen la aglomeración. Miembros del grupo determinan aglomeraciones con la información dada. Miembros del grupo *redactan conclusiones.*

**Pre-condiciones:** Miembros del grupo han digitalizado datos.



### Descripciones Funcionales

- Registrar observación
- Generar Informe
- Redactar conclusión



**Nombre:** Registrar observación

**Descripción:** Con los datos validados se procede a colocarlos en un informe, llenando todos los campos importantes del informe.

**Nota:** Pueden haber campos opcionales en el formulario.

**Entrada:** Datos validados

**Salida:** Formulario.



**Nombre:** Generar Informe

**Descripción:** Con los formularios de las observaciones se llena un informe que explica con más detalles el porqué de la información en el informe.

**Entrada:** Formularios.

**Salida:** Informe.



**Nombre:** Redactar Conclusión

**Descripción:** Una vez analizados los informes se puede proceder a sacar conclusiones de los informes. Las conclusiones solo dan información relevante de los informes.

**Entrada:** Informes.

**Salida:** Conclusión.
