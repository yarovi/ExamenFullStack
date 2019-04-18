import { MatPaginatorImpl } from './../_shared/mat-paginator';
import { NgModule } from '@angular/core';
import { MatTableModule, MatToolbarModule, MatPaginatorModule,
  MatIconModule, MatButtonModule, MatSortModule, MatFormFieldModule,
   MatInputModule, MatCardModule, MatSnackBarModule, MatSidenavModule,
   MatMenuModule, MatDividerModule, MatDialogModule, MatSelectModule,
   MatDatepickerModule, MatNativeDateModule, MAT_DATE_LOCALE,
   MatExpansionModule, MatAutocompleteModule, MatProgressBarModule,
   MatPaginatorIntl } from '@angular/material';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import {MatListModule} from '@angular/material/list';
import {MatGridListModule} from '@angular/material/grid-list';
@NgModule({
  imports: [
    BrowserAnimationsModule,
    MatTableModule,
    MatToolbarModule,
    MatPaginatorModule,
    MatIconModule,
    MatButtonModule,
    MatSortModule,
    MatFormFieldModule,
    MatInputModule,
    MatCardModule,
    MatSnackBarModule,
    MatSidenavModule,
    MatMenuModule,
    MatDividerModule,
    MatDialogModule,
    MatSelectModule,
    MatDatepickerModule,
    MatNativeDateModule,
    MatExpansionModule,
    MatAutocompleteModule,
    MatProgressBarModule,
    MatListModule,
    MatGridListModule
  ],
  exports: [
    MatTableModule,
    MatToolbarModule,
    MatPaginatorModule,
    MatIconModule,
    MatButtonModule,
    MatSortModule,
    MatFormFieldModule,
    MatInputModule,
    MatCardModule,
    MatSnackBarModule,
    MatSidenavModule,
    MatMenuModule,
    MatDividerModule,
    MatDialogModule,
    MatSelectModule,
    MatDatepickerModule,
    MatNativeDateModule,
    MatExpansionModule,
    MatAutocompleteModule,
    MatProgressBarModule,
    MatListModule,
    MatGridListModule
  ],
  providers: [
    { provide: MatPaginatorIntl, useClass: MatPaginatorImpl},
    { provide: MAT_DATE_LOCALE, useValue: 'es-ES' }
  ]

})
export class MaterialModule { }
