cordova.define('cordova/plugin_list', function(require, exports, module) {
module.exports = [
    {
        "file": "plugins/com.Crittercism.PhoneGap/www/js/crittercism.js",
        "id": "com.Crittercism.PhoneGap.CrittercismJSInterface",
        "clobbers": [
            "window.Crittercism"
        ]
    }
];
module.exports.metadata = 
// TOP OF METADATA
{
    "com.Crittercism.PhoneGap": "1.0.0"
}
// BOTTOM OF METADATA
});