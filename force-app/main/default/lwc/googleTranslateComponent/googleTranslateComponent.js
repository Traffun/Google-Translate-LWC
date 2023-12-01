import { LightningElement,api } from 'lwc';
import translateText from '@salesforce/apex/GoogleTranslateComponentController.translateText';
import langOptions from './googleTranslateLanguages.json'
import {ShowTostEvent} from 'lightning/platformShowToastEvent';

export default class GoogleTranslateComponent extends LightningElement {

    _textToTranslate;
    _sourceLang;
    _translateLang;
    _translatedText;
    isLoading = false;
    langOptions = langOptions();

    @api
    get textToTranslate(){
        return this._textToTranslate;
    }

    set textToTranslate(value){
        this._textToTranslate = value;
    }

    @api
    get sourceLang(){
        return this._sourceLang;
    }

    set sourceLang(value){
        this._sourceLang = value;
    }

    @api
    get translateLang(){
        return this._translateLang;
    }

    set translateLang(value){
        this._translateLang = value;
    }

    @api
    get translatedText(){
        return this._translateLang;
    }

    set translatedText(value){
        this._translatedText = value;
    }



    
    submitValues(){
        this.isLoading = true;
        translateText({textToBeTranslated: this.textToTranslate, sourceLang: this.sourceLang, 
            targetLang: this.translateLang}).then((result) => {
                this.translatedText = result;
                this.error = undefined;
                const event = new ShowToastEvent({
                    title: 'Success!',
                    variant: "successs",
                    message:
                        "Text translated successfully!",
                });
                this.dispatchEvent(event);
            })
            .catch((error)=> {
                this.error = error;
                this.translatedText = undefined;
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
        const event = new ShowToastEvent({
            title: 'Reset',
            message:
                "Reset to default state.",
        });
        this.dispatchEvent(event);
    }
}