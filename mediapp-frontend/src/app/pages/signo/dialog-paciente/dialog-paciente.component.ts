import { Component, OnInit , Inject, Output , EventEmitter } from '@angular/core';
import { Paciente } from 'src/app/_model/paciente';
import { MAT_DIALOG_DATA, MatDialogRef } from '@angular/material';
import { PacienteService } from 'src/app/_service/paciente.service';
import { SignoService } from 'src/app/_service/signo.service';


@Component({
  selector: 'app-dialog-paciente',
  templateUrl: './dialog-paciente.component.html',
  styleUrls: ['./dialog-paciente.component.css']
})
export class DialogPacienteComponent implements OnInit {

  paciente: Paciente;
  // @Output() emisor = new EventEmitter();
  id: number;
  constructor(private dialogRef: MatDialogRef<DialogPacienteComponent>,
    @Inject(MAT_DIALOG_DATA) private data: Paciente,
    private pacienteService: PacienteService,
    private signoService: SignoService
    ) { }

  ngOnInit() {
    this.paciente = new Paciente();
    this.paciente.nombres = this.data.nombres;
    this.paciente.apellidos = this.data.apellidos;
    this.paciente.direccion = this.data.direccion;
    this.paciente.email = this.data.email;
    this.paciente.telefono = this.data.telefono;
    this.paciente.dni = this.paciente.dni;
    this.signoService.actualId.subscribe(data =>{
      console.log('soy el hijo modal :' + data)
      this.id = data;
    })
    
  }

  cancelar() {
    this.dialogRef.close();
  }

  operar () {
    if (this.paciente != null ) {      
      this.pacienteService.registrar2(this.paciente).subscribe( data => {
    //     // fecha: 21/17/2019
    //     // autor:yasmani
    //     // descripcion : obtengo solo el headers del  retorno de tipo any que me 
    //     // devuelve registrar 2, le hago un split y obtengo el ultimo valor del arreglo 
    //     // el cual es enviado hacia el dialog-paciente.component.ts 
    //     // alli se encuentra la funcion recepcionEmisor que revibe el id y hace una busqueda.
    //     // falta mejorar
        let codigoURI: number;
        console.log('mensaje :' +   data.headers.get('Location'));
        let ArrayTemp =  data.headers.get('Location').split('/'); 
        let tam =  ArrayTemp.length;
        let codigo= Number(ArrayTemp[tam - 1]);
        ArrayTemp.forEach(tag => console.log('keys' + codigo));
        console.log('el ID es :' + codigo);
        this.pacienteService.mensajeCambio.next('Se registro '); 
        
        this.signoService.cambiarCodigo(codigo); 
        console.log('cerrando ....'); 
        this.dialogRef.close();     
      });
    }     
  }

}
