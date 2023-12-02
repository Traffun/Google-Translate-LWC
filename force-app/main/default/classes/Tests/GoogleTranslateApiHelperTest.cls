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
        String testJSON = GoogleTranslateApiHelper.getTranslatedText('Hello World!', 'en', 'es');
        GoogleTranslateObjectWrapper wrapper = GoogleTranslateObjectWrapper.parse(testJSON);
        String testText =  wrapper.data.translations[0].translatedText;
        System.assertEquals('¡Hola Mundo!', testText, 'Translated test text does not match expected result.');
    }
}