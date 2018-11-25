public class ParkLocator
{
    public static string[] country(String param)
    {
        ParkService.ParksImplPort ser = new ParkService.ParksImplPort();
        String[] resp = ser.byCountry(param);
        system.debug(resp);
        return resp;
    }
}