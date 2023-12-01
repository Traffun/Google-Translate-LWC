/**
 * Description: HTTP Mock class used to test Google Translate API Callout Successful Outcome.
 */
public with sharing class GoogleTranslateHTTPMock implements HttpCalloutMock{
    public HTTPResponse respond(HTTPRequest req) {
        
        HttpResponse res = new HttpResponse();
        res.setHeader('Content-Type', 'application/json');
        res.setBody('{"data": {"translations": [{"translatedText": "¡Hola Mundo!"}]}}');
        res.setStatusCode(200);
        return res;
    }

}