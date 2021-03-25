<!--- All methods in this helper will be available in all handlers,views & layouts --->
<cfscript>
function chron(string log = "schedulr", string type = "information", required string message){
	cfhttp(url = "https://api.kisdigital.com/chron/log", method = "POST", charset = "utf-8"){
		cfhttpparam(type = "header", name = "Content-Type", value = "application/json");
		cfhttpparam(type = "body", value = serializeJSON({
			"appid": "882c8177-1c27-4f75-a854-6e9a2aa444d1",
			"type": type,
			"log": log,
			"message": message
		}));
	}
}
</cfscript>