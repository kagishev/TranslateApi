# Translate API
  Web-based language translation API that localizes strings and saves/updates translations in the database.
###
   ![alt text](https://raw.githubusercontent.com/kagishev/TranslateApi/master/TranslateAPI.png)
## Features
  This is an API based on Amazon Lambda, API Gateway and DynamoDB. No installation is required. Support for both GET abd PUT HTTP methods. 
## Usage
  Command line access to retreive translation:
  ```ruby
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

### Initial set of translations:
```
USA
США
 
croatia
хорватия
 
england
англия
 
france
франция
 
germany
германия
 
italy
италия
 
mexico
мексика
 
russia
россия
 
test
тест
 
ukraine
украина

```
