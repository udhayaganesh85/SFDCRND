import {Injectable} from '@angular/core';
import 'rxjs/Rx';
import {Http, Response} from '@angular/http';
import { Subject } from 'rxjs/Subject';
import { Observable } from 'rxjs/Observable';
require('rxjs/add/operator/map');

@Injectable()
export class AppServices {
    private _url: string = "./app/appdata.json";
    options: RequestOptions;
    private headers: Headers;
    private actionUrl: string;

    Response: response;
    private _url1: string = 'https://maps.googleapis.com/maps/api/geocode/json?address=chennai&key=AIzaSyCZnkgwsuvs6eaFcJSlN1ig2SrSVWyO_KI';
    private _url2: string = 'http://date.jsontest.com/';
    //private _url2: string = 'http://date.jsontest.com/';
    constructor(private _http: Http) {
    }

    readLocation( _city:  string) {
        // return [{"id":1},{"id":2}];
       this. _url1 = 'https://maps.googleapis.com/maps/api/geocode/json?address='+_city+'&key=AIzaSyCZnkgwsuvs6eaFcJSlN1ig2SrSVWyO_KI';
   
        console.log('###########################'+this._url1);
        return this._http.get(this._url1).map(res => res.json()).catch(this.handleError);
    }

    getWeatherInfo( _city:  string)
    {
            this._url2  = 'https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20weather.forecast%20where%20woeid%20in%20(select%20woeid%20from%20geo.places(1)%20where%20text%3D%22chennai%22)&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys';
            return this._http.get(this._url2).map(response => response.json()).catch(this.handleError);
    }
    
    getAstroInfo() {
        //return [{"id":1},{"id":2}];
        console.log("came to service");
        //return this._http.get(this._url2, this.options).map(response => response.json()).catch(this.handleError);
        return this._http.get(this._url2, this.options).map(response => response.json()).catch(this.handleError);
        //    return this._http.get(this._url).map(this.extractData).catch(this.handleError);
    }

    private extractData(res: Response) {
        let body = res.json();
        return JSON.parse(JSON.stringify(body || null))

    }

    private handleError(error: any) {
        console.log('Yup an error occurred', error);
        return Observable.throw(error.message || error);
    }
}

