/**
 * Description: Test class for the GoogleTranslateApiHelper class.
 */
@IsTest
public with sharing class GoogleTranslateApiHelperTest {
    
    /**
     * Description: Tests the get translated text method.
     */
    @IsTest
    public static void testGetTranslatedText(){
        Test.setMock(HttpCalloutMock.class, new GoogleTranslateHTTPMock());
        String testText = GoogleTranslateApiHelper.getTranslatedText('Hello World!', 'en', 'es');
        System.assertEquals('¡Hola Mundo!', testText, 'Translated test text does not match expected result.');
    }
}