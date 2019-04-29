import { Injectable } from '@angular/core';
import { Signo } from '../_model/signo';
import { HttpClient } from '@angular/common/http';
import { Subject, BehaviorSubject } from 'rxjs';
import { HOST } from './../_shared/var.constants';
import { PacienteService } from './paciente.service';

@Injectable({
  providedIn: 'root'
})
export class SignoService {

  signoCambio = new Subject<Signo[]>();
  mensajeCambio = new Subject<string>();
  url: string = `${HOST}/signo`;

  codigoPaciente = new BehaviorSubject(0);
  actualId = this.codigoPaciente.asObservable();

  constructor(private http: HttpClient,
    pacienteService: PacienteService) { }

  listar() {
    return this.http.get<Signo[]>(this.url);
  }

  // listarEspecialidadPorId(id: number) {
  //   return this.http.get<Signo>(`${this.url}/${id}`);
  // }

  registrar(signo: Signo) {
    return this.http.post(this.url, signo);
  }

  modificar(signo: Signo) {
    return this.http.put(this.url, signo);
  }

  eliminar(id: number) {
    return this.http.delete(`${this.url}/${id}`);
  }

  listarPorId( id: number) {
    return this.http.get<Signo>(`${this.url}/${id}`);
  }

  cambiarCodigo(id: number){
    this.codigoPaciente.next(id);
  }
}
