const SUPPORTED_LANGUAGES=[
  {code:"en",label:"English"},
  {code:"vi",label:"Tiếng Việt"},
  {code:"ja",label:"日本語"},
  {code:"zh",label:"简体中文"},
  {code:"es",label:"Español"},
  {code:"fr",label:"Français"},
  {code:"de",label:"Deutsch"},
  {code:"ru",label:"Русский"},
  {code:"ko",label:"한국어"}
];
class TranslationManager{
  constructor(){this.currentLanguage="en",this.localeData={},this.fallbackData={}}async fetchJson(a){try{const t="undefined"!=typeof chrome&&chrome.runtime?.getURL?chrome.runtime.getURL(`languages/${a}.json`):`./languages/${a}.json`,e=await fetch(t);return e.ok?await e.json():{}}catch(a){return{}}}
  async loadLanguage(a="en"){this.currentLanguage=a,0===Object.keys(this.fallbackData).length&&"en"!==a&&(this.fallbackData=await this.fetchJson("en")),this.localeData=await this.fetchJson(a),this.applyTranslations()}
  tr(a){return this.localeData[a]||this.fallbackData[a]||a}renderDropdown(a,t="en"){a&&(a.innerHTML=SUPPORTED_LANGUAGES.map(e=>`<option value="${e.code}" ${e.code===t?"selected":""}>${e.label}</option>`).join(""))}
  applyTranslations(){document.querySelectorAll("[data-i18n]").forEach(a=>{const t=a.getAttribute("data-i18n"),e=this.tr(t);e&&(a.textContent=e)}),document.querySelectorAll("[data-i18n-placeholder]").forEach(a=>{const t=a.getAttribute("data-i18n-placeholder"),e=this.tr(t);e&&a.setAttribute("placeholder",e)})}
}
const i18n=new TranslationManager;