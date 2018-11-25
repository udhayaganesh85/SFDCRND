import {Result} from './Result';
/*
 class AddressComponent
{
    public long_name: string  ,
    public short_name: string  ,
    public  types:Array<string>
}

class Northeast
{
    public lat: number,
    public lng: number
}

class Southwest
{
    public lat: number ,
    public lng: number
}

class Bounds
{
    public  northeast: Northeast,
    public  southwest:Southwest
}

class Location
{
    public lat: number,
    public lng: number
}

class Northeast2
{
    public lat: number,
    public lng: number
}

class Southwest2
{
    public lat: number ,
    public lng: number
}

class Viewport
{
    public northeast:Northeast2  ,
    public southwest:Southwest2 
}

class Geometry
{
    public bounds: Bounds  ,
    public location: Location  ,
    public location_type: String,
    public viewport: Viewport 
}

class RootObject
{
    public results: Array<string> ,
    public status: string
}

*/
export class Result
{
   // public  address_components: Array<AddressComponent> ,
    public formatted_address: string  ,
    //public geometry: Geometry ,
    public place_id: string 
    //public types: Array<string>
}
