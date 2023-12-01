/**
 * Description: Apex Controller for Google Translate Lightning Web Component.
 * 
 * @Author: Nathaniel Payne
 * @Email: nate29797@gmail.com
 */
public with sharing class GoogleTranslateComponentController {
    
    @AuraEnabled
    public static string translateText(String textToBeTranslated,String sourceLang, String targetLang){
        try {
            String translatedJSON = GoogleTranslateApiHelper.getTranslatedText(textToBeTranslated,sourceLang,targetLang);
            GoogleTranslateObjectWrapper wrapper = GoogleTranslateObjectWrapper.parse(translatedJSON);
            return wrapper.Translations.translatedText; 
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}