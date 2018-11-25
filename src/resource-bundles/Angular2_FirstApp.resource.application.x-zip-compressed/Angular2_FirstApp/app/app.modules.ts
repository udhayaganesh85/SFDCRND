import { NgModule }      from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
//import { FormGroup , FormControl , ReactiveFormsModule , FormsModule } from '@angular/forms';
import {HttpModule} from '@angular/http';
import { ReactiveFormsModule } from '@angular/forms';
import { AppComponent }  from './app.component';
//import { BrowserAnimationsModule } from '@angular/platform-browser/animations';

@NgModule({
  imports:      [
    BrowserModule,
    ReactiveFormsModule ,HttpModule],
  declarations: [ AppComponent ],
 // providers : [AppServices],
  bootstrap:    [ AppComponent ]
})
export class AppModule { }


/*
Copyright 2017 Google Inc. All Rights Reserved.
Use of this source code is governed by an MIT-style license that
can be found in the LICENSE file at http://angular.io/license
*/