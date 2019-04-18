import { Component, OnInit , Inject} from '@angular/core';
import { Paciente } from 'src/app/_model/paciente';
import { MAT_DIALOG_DATA, MatDialogRef } from '@angular/material';
import { PacienteService } from 'src/app/_service/paciente.service';

@Component({
  selector: 'app-dialog-paciente',
  templateUrl: './dialog-paciente.component.html',
  styleUrls: ['./dialog-paciente.component.css']
})
export class DialogPacienteComponent implements OnInit {

  paciente: Paciente;
  constructor(private dialogRef: MatDialogRef<DialogPacienteComponent>,
    @Inject(MAT_DIALOG_DATA) private data: Paciente,
    private pacienteService: PacienteService
    ) { }

  ngOnInit() {
    this.paciente = new Paciente();
    this.paciente.nombres = this.data.nombres;
    this.paciente.apellidos = this.data.apellidos;
    this.paciente.direccion = this.data.direccion;
    this.paciente.email = this.data.email;
    this.paciente.telefono = this.data.telefono;
    this.paciente.dni = this.paciente.dni;
  }

  cancelar() {
    this.dialogRef.close();
  }

  operar () {
    if (this.paciente != null ) {
      this.pacienteService.registrar(this.paciente).subscribe( data => {
        this.pacienteService.listar().subscribe(pacientes => {
          this.pacienteService.pacienteCambio.next(pacientes);
          this.pacienteService.mensajeCambio.next('Se registro ');
        });
      });
      this.dialogRef.close();
    }
  }

}
