import { Component, OnInit } from '@angular/core';
import { FormGroup, FormControl , FormBuilder ,Validators } from '@angular/forms';
import { Signo } from 'src/app/_model/signo';
import { Paciente } from 'src/app/_model/paciente';
import { MatSnackBar, MatDialog } from '@angular/material';
import { PacienteService } from 'src/app/_service/paciente.service';
import { SignoService } from 'src/app/_service/signo.service';
import { Observable } from 'rxjs';
import { map, debounceTime, tap, switchMap } from 'rxjs/operators';
import * as moment from 'moment';
import { ActivatedRoute, Params, Router } from '@angular/router';
import {DialogPacienteComponent} from '../dialog-paciente/dialog-paciente.component';
@Component({
  selector: 'app-edicionsigno',
  templateUrl: './edicionsigno.component.html',
  styleUrls: ['./edicionsigno.component.css']
})
export class EdicionsignoComponent implements OnInit {


  // representamos el form
  form: FormGroup;
  // referenciado desde el html mediante un formControl
  myControlPaciente: FormControl = new FormControl();
  pacienteSeleccionado: Paciente;
  pacientes: Paciente[] = [];
  //
  filteredOptions: Observable<any[]>;


  // flag para saber si es una edicion
  edicion: boolean;
  id: number;

  // atributos
  signo: Signo;
  fechaSeleccionada: Date = new Date();
  maxFecha: Date = new Date();
  mensaje: string;

// inyectamos la capa de pacienteService a usar
  constructor(
    private builder: FormBuilder,
    private pacienteService: PacienteService,
    private snackBar: MatSnackBar,
    private signoService: SignoService,
    private router: Router,
    private route: ActivatedRoute,
    private dialog: MatDialog

  ) { }
// apenas carga el compoenente listamos paciente.
  ngOnInit() {  
    // instanciamos el fomualrio para objetos
    //   usamos el builder para objetos
    this.form = this.builder.group({
      'paciente': this.myControlPaciente,
      'fecha': new FormControl(new Date()),
      'pulso': new FormControl(0),
      'temperatura': new FormControl(0),
      'ritmoRespiratorio': new FormControl(0)
    });
    this.listarPacientes();
    // Todo valueChange devuelve un observable y para poder manipular siempre se ingresa
    // usando un pipe
    // mpa permite transformar o manipular datos.
    this.filteredOptions = this.myControlPaciente.valueChanges.pipe(map(val => this.filter(val)));
    // verifico si hay algun id en el route
    //  si es verdad entonces disparo el initForm
    this.route.params.subscribe((params: Params) => {
      this.id = params['id'];
      this.edicion = this.id != null;
      this.initForm();
    });
    // subcripcion
    this.signoService.actualId.subscribe((d)=>{
      console.log('soy el padre :'+d);
      if (d > 0) {
        this.pacienteService.listarPorId(d).subscribe(r => {
          this.pacienteSeleccionado=r;
          this.listarPacientes();
          this.myControlPaciente.setValue(this.pacienteSeleccionado);
          this.signoService.cambiarCodigo(0);
        })
      }
      
    });


  }
  initForm() {
    if (this.edicion) {
      this.signoService.listarPorId(this.id).subscribe( data => {
        this.form = this.builder.group({
          'paciente' : this.myControlPaciente,
          'fecha': new FormControl(data.fecha),
          'pulso': new FormControl(data.pulso),
          'temperatura': new FormControl(data.temperatura),
          'ritmoRespiratorio': new FormControl(data.ritmoRespiratorio),
          // 'idSigno':  new FormControl(data.idSigno)
        });
        this.myControlPaciente.setValue(data.paciente);
      });
    }
  }
  operar() {

    this.signo = new Signo();
    this.signo.paciente = this.form.value['paciente'];
    this.signo.fecha = moment(this.fechaSeleccionada).toISOString();
    this.signo.pulso = this.form.value['pulso'];
    this.signo.temperatura = this.form.value['temperatura'];
    this.signo.ritmoRespiratorio = this.form.value['ritmoRespiratorio'];
    this.signo.idSigno = this.id;
    if (this.edicion) {
      this.signoService.modificar(this.signo).subscribe(() => {
        this.signoService.listar().subscribe(data => {
          this.signoService.signoCambio.next(data);
          this.signoService.mensajeCambio.next('Se modifico');
        });
      });
    } else {
      this.signoService.registrar(this.signo).subscribe(() => {
        this.signoService.listar().subscribe(data => {
          this.signoService.signoCambio.next(data);
          this.signoService.mensajeCambio.next('Se registro');
        });
      });
    }
    this.router.navigate(['signo']);
  }
  seleccionarPaciente(e: any) {
    this.pacienteSeleccionado = e.option.value;
  }

  limpiarControles() {

    this.pacienteSeleccionado = null;
    this.fechaSeleccionada = new Date();
    this.fechaSeleccionada.setHours(0);
    this.fechaSeleccionada.setMinutes(0);
    this.fechaSeleccionada.setSeconds(0);
    this.fechaSeleccionada.setMilliseconds(0);
    this.mensaje = '';
    // this.signo = null;
  }

  // # siempre significa apodo y se usa para validar el frm

  // FormGroup para tipos de datos simples
  // FormBuilder para tipos de datos complejos (objetos)


  // traemos y filtramos el listado de pacientes
  listarPacientes() {
    this.pacienteService.listar().subscribe(data => {
      this.pacientes = data;
    });
  }

  // filtramos por apellidos y nombres homologandolo todo en minuscula
  // al final retorna la lista de coincidencias que retornaria al pipe
  // todo observable en html siempre debe tener un async para liberar recursos
  filter(val: any) {
    if (val != null && val.idPaciente > 0 ) {
      return this.pacientes.filter(option =>
        option.nombres.toLocaleLowerCase().includes(val.nombres.toLocaleLowerCase()) ||
        option.apellidos.toLocaleLowerCase().includes(val.apellidos.toLocaleLowerCase()));
    } else {
      return this.pacientes.filter( option =>
        option.nombres.toLocaleLowerCase().includes(val.toLocaleLowerCase()) ||
        option.apellidos.toLocaleLowerCase().includes(val.toLocaleLowerCase())
      );
    }
  }

  // si lo que se selecciona esta con data muestra
  displayFn(val: Paciente) {
    return val ? `${val.nombres} ${val.apellidos}` : val;
  }

  estadoBotonRegistrar() {
    return ( this.signo === null || this.pacienteSeleccionado === null);
    // signo === null
  }
  // llamando al maestro de apciente
  openDialogPaciente() {
    const nuevoPaciente = new Paciente;
    this.dialog.open(DialogPacienteComponent, {
      width: '250px',
      data: nuevoPaciente
    });
  }

  // Recepcion emisor
  recepcionEmisor(datito: any) {
    console.log('ya llego el Id:  ... ) ');

    
    // this.pacienteService.listarPorId(id).subscribe (data => {
    //   this.listarPacientes();
    //     this.pacienteSeleccionado = data;
    //     this.myControlPaciente.setValue(this.pacienteSeleccionado);
    // console.log('paciente es :'+ this.pacienteSeleccionado)
    // });
    

  }
}
