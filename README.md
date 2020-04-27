**Universidad Distrital Francisco José de Caldas**

**Facultad de Ingeniería**

**Especialización en Ingeniería de Software**

**Asignatura de Informática 1**

**Docente: Alejandro Paolo Daza**

![](ReglasNegocio_html_670be77737dc3351.png)

| **Nombre: Angee Paola Ballesteros Maldonado** | **Código: 20201099027** |
| --- | --- |
| **Nombre: Luigi Santiago Fajardo Toloza** | **Código:** 20201099029 |
| **Nombre: Jeisson Jair Ariza Pulido** | **Código:** 20201099026 |

**Diseño de un aplicativo para notas de una asignatura basado en reglas de negocio con Prolog**

**Requerimiento:** Se requiere desarrollar un aplicativo para validar las notas de los estudiantes y las fallas de los mismos en una asignatura, de esta manera, basados en un conjunto de reglas definidas en prolog el aplicativo determinara si el estudiante aprueba o reprueba la asignatura. La elección del lenguaje en el cual sea creada la interfaz de interpretación de estas reglas es de libre elección. La explicación de despliegue, así como la explicación de las herramientas seleccionadas debe ser clara en el README del proyecto.

**Procedimiento:** Para este proceso se utilizarán tres herramientas, la primera de estas es SWI-Prolog, esta herramienta es una implementación en código abierto del lenguaje de programación Prolog, dicho lenguaje es un lenguaje de programación lógico e interpretado usado habitualmente en el campo de la Inteligencia artificial. Por otra parte, el equipo de desarrollo decidió utilizar Python como el lenguaje en el cual se va implementar la interfaz grafica del desarrollo, por lo cual se debe tener instalado este lenguaje en la maquina a desarrollar y adicionalmente es imperativo utilizar PySwip, la cual es una librería que permite generar un puente entre Prolog y Python. Los desarrollos serán trabajados en SWI-Prolog para el lenguaje Prolog y Visual Studio Code para el desarrollo en Python.

**Desarrollo:**

Luego de instalar las herramientas requeridas y de corroborar el correcto funcionamiento de la misma, se procede a crear las reglas de la lógica del funcionamiento del aplicativo de notas.

El primer paso consiste en crear los datos que van a ser evaluados en el conjunto de reglas, para este aplicativo se 
utilizan dos listados, el primero contiene las fallas de cada estudiante durante el semestre, mientras que el segundo contiene las notas obtenidas por los estudiantes en el semestre.

![](ReglasNegocio_html_f15b188ad672e5cb.png)

**Figura [1]: Datos que ingresan al sistema de reglas.**

El siguiente paso consiste en crear los vectores que permiten consolidar los valores promedio de las asistencias y las notas obtenidas por los estudiantes del curso.

![](ReglasNegocio_html_893c33eb9cb3997f.png)

**Figura [2]: Creación de vectores para los cálculos de porcentajes y promedios.**

Ahora se procede a crear la primera regla que permite clasificar la asistencia, para dicha tarea se tienen en cuenta las siguientes reglas:

1.  Si las fallas son 0, la asistencia es completa

2.  Si las fallas se encuentran entre 1 y 4, la asistencia es suficiente.

3.  Si las fallas son 5, la asistencia se considera como una oportunidad.

4.  Si las fallas son mayores a 5, entonces el estudiante perdió por fallas.

Luego de crear las reglas para la asistencia, procedemos a clasificar a los estudiantes dependiendo de la calificación que obtienen por sus fallas.

![](ReglasNegocio_html_3680b356dee9a904.png)

**Figura [3]: Reglas de asistencia.**

Posteriormente se crean las reglas para clasificar a los estudiantes dependiendo de la calificación obtenida en el semestre, dichas reglas son las siguientes.

1.  Si la nota es menor a 2.5 entonces el estudiante perdió.

2.  Si la nota se encuentra entre 2.5 y 3.0, entonces el estudiante solicita una ayuda al profesor.

3.  Si la nota se encuentra entre 3.0 y 4.9, entonces el estudiante aprobó la asignatura.

4.  Si la nota es 5.0, entonces el estudiante tuvo una nota perfecta.

Ahora se procede a crear la clasificación de los estudiantes basados en la regla a la cual aplican.

![](ReglasNegocio_html_f24cdf3b17c57c3a.png)

**Figura [4]: Reglas de notas.**

Ahora se procede a crear las reglas basadas en la nota obtenida y las fallas de cada estudiante, para dicho calculo de la nota definitiva se combinan las reglas definidas en los procesos anteriormente mostrados.

![](ReglasNegocio_html_7e13a8176d097a52.png){width="450" height="245"}

**Figura [5]: Reglas de nota definitiva.**

Luego de crear las reglas del aplicativo se procede a crear el aplicativo que va a implementar dichas reglas, el código es el siguiente:

![](ReglasNegocio_html_6651eb36a1da8700.png)

![](ReglasNegocio_html_397a824d109a770.png)

![](ReglasNegocio_html_3c02a64d55ecace9.png)

![](ReglasNegocio_html_d217850db33698b.png)
![](ReglasNegocio_html_98f94ea8602185bb.png)
