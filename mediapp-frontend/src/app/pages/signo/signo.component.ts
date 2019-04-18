import { Component, OnInit , ViewChild } from '@angular/core';
import { SignoService } from './../../_service/signo.service';
import { Signo } from './../../_model/signo';
import { MatSort, MatPaginator, MatTableDataSource, MatSnackBar } from '@angular/material';
import { ActivatedRoute } from '@angular/router';


@Component({
  selector: 'app-signo',
  templateUrl: './signo.component.html',
  styleUrls: ['./signo.component.css']
})
export class SignoComponent implements OnInit {

  displayedColumns = ['id', 'fecha', 'nombre', 'acciones'];
  dataSource: MatTableDataSource<Signo>;
  @ViewChild(MatPaginator) paginator: MatPaginator;
  @ViewChild(MatSort) sort: MatSort;
  constructor(
    private signoService: SignoService,
    public route: ActivatedRoute,
    private snackBar: MatSnackBar
  ) { }

  ngOnInit() {

    this.signoService.signoCambio.subscribe(data => {
      this.dataSource = new MatTableDataSource(data);
      this.dataSource.paginator = this.paginator;
      this.dataSource.sort = this.sort;
    });

    this.signoService.listar().subscribe( data => {
      this.dataSource = new MatTableDataSource(data);
      this.dataSource.paginator = this.paginator;
      this.dataSource.sort = this.sort;
    });

    this.signoService.mensajeCambio.subscribe( data => {
      this.snackBar.open(
        data,
        'Aviso', {
          duration: 2000,
        });
    });
  }
  applyFilter(filterValue: string) {
    filterValue = filterValue.trim();
    filterValue = filterValue.toLowerCase();
    this.dataSource.filter = filterValue;
  }

  eliminar(idEspecialidad: number) {
    this.signoService.eliminar(idEspecialidad).subscribe(() => {
      this.signoService.listar().subscribe(data => {
        this.signoService.signoCambio.next(data);
        this.signoService.mensajeCambio.next('Se eliminó');
      });
    });
  }

}
