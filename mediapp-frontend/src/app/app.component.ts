import { Menu } from './_model/menu';
import { MenuService } from './_service/menu.service';
import { LoginService } from './_service/login.service';
import { Component, OnInit } from '@angular/core';
import { MatDialog } from '@angular/material';
import { PerfilComponent } from './pages/perfil/perfil.component';
import { JwtHelperService } from '@auth0/angular-jwt';
import {  TOKEN_NAME } from './_shared/var.constants';
import { Perfil } from './_model/perfil';
// import { PerfilService } from './_service/perfil.service';;

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent implements OnInit {

  menus: Menu[] = [];

  constructor(public loginService: LoginService, private menuService: MenuService, private dialog: MatDialog) {
  }

  perfil: Perfil;
  ngOnInit() {

    this.menuService.menuCambio.subscribe(data => {
      this.menus = data;
    });
  }


  openDialog() {
    const helper = new JwtHelperService();
    let tk = JSON.parse(sessionStorage.getItem(TOKEN_NAME));
    const decodedToken = helper.decodeToken(tk.access_token);
    this.perfil = new Perfil();
    this.perfil.nombre = decodedToken.user_name;
    this.perfil.descripcion = decodedToken.roles;
    // console.log(this.perfil );
    this.dialog.open(PerfilComponent, {
      width: '450px',
      // height: '350px',
      data: this.perfil
    });
  }

}
