public with sharing class GoogleTranslateApiHelper {
    
    /**
     * Description: Method performs a HTTP Callout to the Rapid API Host Endpoint for the Google Translate API.
     * 
     * @param text - Text that will be translated.
     * @param source - Source language for given text.
     * @param target - Target language for translated text.
     * 
     * @return JSON String from the Rapid API Google Translate endpoint
     */
    public static String getTranslatedText(String text,String source,String target){
        API_Endpoint__mdt endpoint = [SELECT Auth_Token__c, Host_URL__c, API_Endpoint__c FROM API_Endpoint__mdt WHERE MasterLabel = 'Google Translate' WITH SECURITY_ENFORCED LIMIT 1]; 
        HttpRequest req = new HttpRequest();
        req.setEndpoint(endpoint.API_Endpoint__c+'?source='+EncodingUtil.urlEncode(source,'utf-8')+'&target='+EncodingUtil.urlEncode(target,'utf-8')+'q='+EncodingUtil.urlEncode(text,'utf-8'));
        req.setMethod('POST');
        req.setHeader('content-type', 'application/x-www-form-urlencoded');
        req.setHeader('Accept-Encoding','application/gzip');
        req.setHeader('X-RapidAPI-Key',endpoint.Auth_Token__c);
        req.setHeader('X-RapidAPI-Host',endpoint.Host_URL__c);
        HTTP http = new HTTP();
        HTTPResponse res = new http.send(req);
        return res.getBody();
    }
}