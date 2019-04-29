# Examen FullStack

##### Tareas Realizadas. 

 - Modificacion del token con el nuevo atributo llamado roles.
* Crear un mantenimiento completo para la tabla Signo.
- Uso de modal para crear un Paciente desde el mantenimiento de Signo(incluye el desafio).

> Salida de la cadena modificada con los roles respectivos.

![configuracionCadenaToken](https://user-images.githubusercontent.com/5384490/56916206-fc6d7980-6a7d-11e9-8735-d69b07bf4b86.png)

> clase **CorsFilter** implementada para especificarle que atributo del header debe ser leido.

![img02](https://user-images.githubusercontent.com/5384490/56916434-7998ee80-6a7e-11e9-92ca-264036b1c17d.png)

> clase **CustomerTokenEnhancer** permite la personalizacion del token mediante la implementacion de la interfaz TokenEnhancer


![img03](https://user-images.githubusercontent.com/5384490/56916441-7e5da280-6a7e-11e9-8e6d-b88e6303d059.png)

> clase **Signo** representa el modelo al cual se le hara mantenimiento

![img04](https://user-images.githubusercontent.com/5384490/56916454-81f12980-6a7e-11e9-8326-e271339217d2.png)

##### Front End (Angular).
>  Accedemos al Key del token  y lo envio al modal para su visualizacion

![img11](https://user-images.githubusercontent.com/5384490/56917681-c16d4500-6a81-11e9-861f-64b9346bb5b4.png)

> Implementacion del reto **Pacienete** el cual permite crear desde el modal y luego ser seleccionado automaticamente desde la lista desplegable,  para ello se decidio emplear una variable reactiva en el ServicioSigno del tipo **behaevivorSubject** cual se dispare a cual quier cambio , para ello siempre la inicializo en 0 y luego que se dispara el cambio la vuelvo a inicializar en 0. (creo que hay mejores formas  ........)

![img05](https://user-images.githubusercontent.com/5384490/56917610-8d921f80-6a81-11e9-81cb-a42642fc2c8f.png)

![img07](https://user-images.githubusercontent.com/5384490/56917616-908d1000-6a81-11e9-9f80-460bbbcc9ef6.png)

![img09](https://user-images.githubusercontent.com/5384490/56917619-93880080-6a81-11e9-9364-8a94cb1ceeca.png)

> Tambien se adjunta una copia de la base de datos en el directio **mediapp-backend**

