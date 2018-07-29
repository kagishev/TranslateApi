# Translate API
  Web-based language translation API that localizes strings and saves/update translations in the database.
###
   ![alt text](https://raw.githubusercontent.com/kagishev/TranslateApi/master/TranslateAPI.png)
## Features
  This is an API based on Amazon Lambda, API Gateway and DynamoDB. No Inslallation requered. Support for both GET abd PUT HTTP methods. 
## Usage
  Command line access to reireive translation:
  ```
  curl https://o2tkiwaqui.execute-api.us-east-1.amazonaws.com/default/TranslateApi/{source_string}-X GET
  ```
  Where {source_string} is any English string, for example:
  ```
  curl https://o2tkiwaqui.execute-api.us-east-1.amazonaws.com/default/TranslateApi/france -X GET
{
  "source": "france",
  "target": "франция"
}
  ```
  Command line access to update the database with translations:
  ```
  curl -H 'Content-Type: application/json' -X PUT -d '{"target":"{target_string}"}' https://o2tkiwaqui.execute-api.us-east-1.amazonaws.com/default/TranslateApi/{source_string} && echo
  ```
  Where {source_string} and {target_string} is desired translation set:
  ```
  curl -H 'Content-Type: application/json' -X PUT -d '{"target":"франция"}' https://o2tkiwaqui.execute-api.us-east-1.amazonaws.com/default/TranslateApi/france && echo
{}
  ```

Access to the API is also available via user-friendly iterface:
https://s3.amazonaws.com/translateapi/TranslateAPI.html
