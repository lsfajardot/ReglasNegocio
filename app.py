from pyswip import Prolog
import time
prolog = Prolog()
prolog.consult('notasestudiantes.pl')

def estudiantes():
    print("Estos son tus estudiantes inscritos: ")
    for result in prolog.query("calificacionEstudiante(X,Y)"):    
        print ("> " + str(result['X']).capitalize())
def calificacionesEstudiantes():
    print("\nTerminado el semestre...")
    for result in prolog.query("calificacionEstudiante(X,Y)"):
        print ("La Nota de " + str(result['X']).capitalize()  + " fue: " +  str(result['Y']))
def fallasEstudiantes():
    print("\nTerminado el semestre...")
    for result in prolog.query("fallas(X,Y)"):
        print ("Las Fallas de " + str(result['X']).capitalize()  + " fueron: " +  str(result['Y']))
def consolidadoNotasEstudiantes():
    print("\nEn Conclusion...Las Notas fueron:")
    for result in prolog.query("pasoElTrabajo(X,Y,Z)"):
        print (str(result['X']).capitalize() + " sacó " +  str(result['Y']) + " y el resultado fue: " 
        + str(result['Z']))

def consolidadoFallasEstudiantes():
    print("\nEn Conclusion...Las Fallas fueron:")
    for result in prolog.query("pasoLaAsistencia(X,Y,Z)"):
        print (str(result['X']).capitalize() + " tuvo " +  str(result['Y']) + " Fallas, entonces tiene: " 
        + str(result['Z']))
def promedioFallas():
    for fallas in prolog.query("promediofallas(Falla)"):       
        print("\nEl promedio de las fallas del curso fue: " + str(fallas['Falla'])) 
def totalAprobados():
    for totAprobados in prolog.query("totalAprobados(T)"):       
        print("\nEl Total de Aprobados del curso fue: " + str(totAprobados['T'])) 
    for totEstudiantes in prolog.query("totalestudiantes(T)"):       
        str(totEstudiantes['T'])
    for porcAprobados in prolog.query("porcentaje("+str(totAprobados['T'])+","
    +str(totEstudiantes['T'])+",S)"):
        print("   Es decir el: " + str(porcAprobados['S'])+"%") 
def totalReprobados():
    for totReprobados in prolog.query("totalReprobados(T)"):       
        print("\nEl Total de Reprobados del curso fue: " + str(totReprobados['T'])) 
    for totEstudiantes in prolog.query("totalestudiantes(T)"):       
        str(totEstudiantes['T'])
    for porcReprobados in prolog.query("porcentaje("+str(totReprobados['T'])+","
    +str(totEstudiantes['T'])+",S)"):
        print("   Es decir el: " + str(porcReprobados['S'])+"%") 

def pasan():
    print("\nPasan: ")
    for pasan in prolog.query("pasaPorNotaYAsistencia(X)"):
        print("El estudiante:   " + str(pasan['X']).capitalize())
def pierden():
    print("\nPierden: ")
    for pierde in prolog.query("pierdePorNotaOAsistencia(X)"):
        print("El estudiante:   " + str(pierde['X']).capitalize())

        
def main():
    print("\nA continuación seleccione alguna de las siguientes opciones:\n\na. Conocer los estudiantes inscritos al curso.\nb. Ver la nota final de los estudiantes.\nc. Ver las fallas de los estudiantes \nd. Ver los estados de los estudiantes por notas.\ne. Ver los estados de los estudiantes por fallas\nf. Promedio de fallas del curso\ng. Definitivas\nh. Total Aprobados\ni. Total Reprobados")
    opcion = input ("\nIngrese una opcion: ")
    print ("Ha seleccionado la opcion: ", opcion)
    if opcion == "a":
        estudiantes()
        time.sleep(5)
        main()
    elif opcion == "b":
        calificacionesEstudiantes()
        time.sleep(7)
        main()
    elif opcion == "c":
        fallasEstudiantes()
        time.sleep(7)
        main()
    elif opcion == "d":
        consolidadoNotasEstudiantes()
        time.sleep(7)
        main()
    elif opcion == "e":
        consolidadoFallasEstudiantes()
        time.sleep(7)
        main()
    elif opcion == "f":
        promedioFallas()
        time.sleep(5)
        main()
    elif opcion == "g":
        pasan()
        pierden()
        time.sleep(10)
        main()
    elif opcion == "h":
        totalAprobados()
        time.sleep(2)
        main()
    elif opcion == "i":
        totalReprobados()
        time.sleep(2)
        main()
    elif opcion == "":
        main()
print("\n \n \n¡Bienvenido al curso de Informatica!")
main()
# estudiantesReprobados()
# porcentajes()