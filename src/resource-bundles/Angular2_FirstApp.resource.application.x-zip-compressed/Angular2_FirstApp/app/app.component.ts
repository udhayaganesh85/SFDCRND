import {AppExtraComponent } from './app.extracomponent';
import { Component, OnInit, trigger, state, style, transition, animate, keyframes, group } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
//import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import {TimePickerComponent} from "angular2-timepicker/timepicker-component";
import { FormGroup, FormControl, FormBuilder, Validator, ReactiveFormsModule } from '@angular/forms';
import { AppServices } from './app.service';

@Component({
    selector: 'my-app',
    templateUrl: 'app/landingPage.html',
    /*animations: [
    trigger('LightsOnOff',[
       state('off',style({
               background-color:'black'
               })),
           state('on',style({
               background-color:'white'
           })),
           transition('off => on',[animate('2s')]),
           transition('on => off',[animate('2s')])
           ])
   ],*/
    providers: [AppServices],
    styles: [` h1, .myContent { color:gray;}
    input.ng-invalid {border-left: 5px solid red }
    input.ng-valid {border-left: 5px solid green}`]
})
export class AppComponent implements OnInit {
    intro = 'Enter your details';
    astroDetails = '';
    getAstroInfo: string;
    _city: string;
    roomState: string = "off";
    constructor(private _appServices: AppServices) {
        //this.astroInfo = this._appServices.readLocation();
    }

    ngOnInit() {
        /* this._appServices.getAstroInfo()
             .subscribe(
             astroInfo => this.getAstroInfo = JSON.stringify(astroInfo),
             () => console.log("Finished"));*/
    }

    toggleLights() {
        console.log('toggle', this.roomState);
        this.roomState = (this.roomState === "off") ? "on" : "off";
    }

    private handleError(error: any) {
        console.log('Yup an error occurred', error);
        return Observable.throw(error.message || error);
    }
    userForm = new FormGroup({
        name: new FormControl(),
        //city: new FormControl('',Validators.required),
        city: new FormControl()
    });

    onLatLongClick() {
        this._city = this.userForm.get('city').value;
        console.log('@@@@@@@@@' + this.userForm.get('city').value);
        this._appServices.readLocation(this._city).subscribe(resp => this.latLongInfo = JSON.stringify(resp));
    }

    onWeatherClick() {
        this._city = this.userForm.get('city').value;
        console.log('@@@@@@@@@' + this.userForm.get('city').value);
        this._appServices.getWeatherInfo(this._city).subscribe(resp => this.astroInfo = JSON.stringify(resp));
    }

    clear() {
        this.name = '';
        this.city = '';
    }
} 