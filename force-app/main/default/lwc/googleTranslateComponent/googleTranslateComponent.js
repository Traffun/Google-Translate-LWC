import { LightningElement,api } from 'lwc';
import translateText from '@salesforce/apex/GoogleTranslateComponentController.translateText';
import langOptionsFile from '@salesforce/resourceUrl/GoogleTranslateLanguages';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';

export default class GoogleTranslateComponent extends LightningElement {

    textToTranslate;
    sourceLang;
    translateLang;
    translatedText;
    isLoading = false;
    isDisabled = true;
    langOptions = [
        {
          "label": "English",
          "value": "en"
        },
        {
          "label": "Spanish",
          "value": "es"
        },
        {
          "label": "French",
          "value": "fr"
        },
        {
          "label": "Arabic",
          "value": "ar"
        },
        {
          "label": "Japanese",
          "value": "ja"
        }];

    setTextToTranslate(event){
        this.textToTranslate = event.detail.value;
        this.checkButtonStatus();
    }

    setSourceLang(event){
        this.sourceLang = event.detail.value;
        this.checkButtonStatus();
    }

    setTranslateLang(event){
        this.translateLang = event.detail.value;
        this.checkButtonStatus();
        
    }

    checkButtonStatus(){
        if(this.translateLang !== undefined && this.sourceLang !== undefined && this.textToTranslate !== undefined){
            this.isDisabled = false;
        }else{
            this.isDisabled = true;
        }
    }

    submitValues(){
        this.isLoading = true;
        translateText({textToBeTranslated: this.textToTranslate, sourceLang: this.sourceLang, 
            targetLang: this.translateLang}).then((result) => {
                this.translatedText = result;
                this.error = undefined;
                this.isLoading = false;
                const event = new ShowToastEvent({
                    title: 'Success!',
                    variant: "success",
                    message:
                        "Text translated successfully!",
                });
                this.dispatchEvent(event);
            })
            .catch((error)=> {
                this.error = error;
                this.translatedText = undefined;
                this.isLoading = false;
                console.log("Error: "+error.body.message);
                const event = new ShowToastEvent({
                    title: 'Error',
                    variant: "error",
                    message:
                        "An error was encountered when translating text.",
                });
                this.dispatchEvent(event);
            });
    }

    clearValues(){
        this.textToTranslate = undefined;
        this.sourceLang = undefined;
        this.translateLang = undefined;
        this.translatedText = undefined;
        this.isDisabled = true;
        const event = new ShowToastEvent({
            title: 'Reset',
            message:
                "Reset to default state.",
        });
        this.dispatchEvent(event);
    }
}