
import { Paciente } from './paciente';

export class Signo {
  idSigno: number;
  fecha: string;
  temperatura: number;
  pulso: number;
  ritmoRespiratorio: number;
  paciente: Paciente;
}
