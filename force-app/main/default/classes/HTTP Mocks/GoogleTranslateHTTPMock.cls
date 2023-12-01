/**
 * Description: HTTP Mock class used to test Google Translate API Callout Successful Outcome.
 */
public with sharing class GoogleTranslateHTTPMock implements HttpCalloutMock{
    
    /**
     * Description: Respond method that is inherited from the HttpCalloudMock interface.
     * 
     * @param req HTTPRequest - HTTP Request fired during test context
     * 
     * @return HTTP Response Mock
     */
    public HTTPResponse respond(HTTPRequest req) {
        
        HttpResponse res = new HttpResponse();
        res.setHeader('Content-Type', 'application/json');
        res.setBody('{"data": {"translations": [{"translatedText": "¡Hola Mundo!"}]}}');
        res.setStatusCode(200);
        return res;
    }

}