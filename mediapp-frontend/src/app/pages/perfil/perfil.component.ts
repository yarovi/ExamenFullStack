import { Component, OnInit, Inject } from '@angular/core';
import { MAT_DIALOG_DATA, MatDialogRef } from '@angular/material';
import { Perfil } from 'src/app/_model/perfil';
@Component({
  selector: 'app-perfil',
  templateUrl: './perfil.component.html',
  styleUrls: ['./perfil.component.css']
})
export class PerfilComponent implements OnInit {

  perfil: Perfil;
  constructor(private dialogRef: MatDialogRef<PerfilComponent>, @Inject(MAT_DIALOG_DATA) public data: Perfil) { }

  ngOnInit() {
    this.perfil = new Perfil();
    this.perfil.nombre = this.data.nombre;
    this.perfil.descripcion = this.data.descripcion;
  }
  cancelar() {
    this.dialogRef.close();
  }

}
