import { Injectable } from '@angular/core';
import { Signo } from '../_model/signo';
import { HttpClient } from '@angular/common/http';
import { Subject } from 'rxjs';
import { HOST } from './../_shared/var.constants';

@Injectable({
  providedIn: 'root'
})
export class SignoService {

  signoCambio = new Subject<Signo[]>();
  mensajeCambio = new Subject<string>();
  url: string = `${HOST}/signo`;
  constructor(private http: HttpClient) { }

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
}
