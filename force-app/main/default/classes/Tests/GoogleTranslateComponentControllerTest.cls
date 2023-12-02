/**
 * Description: Test class for the GoogleTranslateComponentController class.
 */
@IsTest
public with sharing class GoogleTranslateComponentControllerTest {
    
    /**
     * Description: Tests the translated text method.
     */
    @IsTest
    public static void testTranslateText(){
        Test.setMock(HttpCalloutMock.class, new GoogleTranslateHTTPMock());
        String testText = GoogleTranslateComponentController.translateText('Hello World', 'en', 'es');
        System.assertEquals('¡Hola Mundo!', testText, 'Translated test text does not match expected result.');
    }
}