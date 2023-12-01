/**
 * Description: Apex Controller for Google Translate Lightning Web Component.
 * 
 * @Author: Nathaniel Payne
 * @Email: nate29797@gmail.com
 */
public with sharing class GoogleTranslateComponentController {
    
    /**
     * Description: Method takes input from Component then passes it to Google Translate Helper to get Translation to retun.
     * 
     * @param textToBeTranslated - Text that needs translated.
     * @param sourceLang - Source Language of given text.
     * @param targetLang - Target Language of translated text.
     * 
     * @return Translated String
     */
    @AuraEnabled
    public static string translateText(String textToBeTranslated,String sourceLang, String targetLang){
        try {
            String translatedJSON = GoogleTranslateApiHelper.getTranslatedText(textToBeTranslated,sourceLang,targetLang);
            GoogleTranslateObjectWrapper wrapper = GoogleTranslateObjectWrapper.parse(translatedJSON);
            return wrapper.data.translations[0].translatedText; 
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}