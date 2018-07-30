#!/bin/bash

#%
#% ${scriptName} - Shell wrapper for TranslateAPI.
#% Usage:
#%  ${scriptName} --source <source_string>  :: get translation.
#%  ${scriptName} --source <source_string> --target <target_string> :: insert/update translation.
#% 
#%    <source_string>   ::   Source string
#%    <target_string>>  ::   Target string
#%

scriptName=$(echo ${0##*/})

if [[ ! ($# -eq 2 || $# -eq 4) ]]; then
 awk -v scriptName="${scriptName}" '/^#%/ {gsub("[$]{scriptName}", scriptName, $0); print substr($0,3)}' $0
 exit 1
elif [[ $# -eq 2 ]]; then
  if [[ ! $1 = "--source" ]]; then
    echo ">> ${scriptName} ERROR: value '$1' is incorrect, exiting" 1>&2
    exit 1
  fi
elif [[ $# -eq 4 ]]; then
  if [[ (! ($1 = "--source" && $3 = "--target")) || (! $3 = "--target") ]]; then
    echo ">> ${scriptName} ERROR: values '$1' or '$3' are incorrect, exiting" 1>&2
    exit 1
  fi
fi

if [[ $# -eq 2 ]]; then
  target=`curl --silent https://o2tkiwaqui.execute-api.us-east-1.amazonaws.com/default/TranslateApi/$2 | grep "target" | cut -d : -f 2`

  if [ $target = \"\" ]; then
    echo "Translation not found"
  else
    echo "Translation: ${target}"
  fi
elif [[ $# -eq 4 ]]; then
  curl -H 'Content-Type: application/json' -X PUT -d "{\"target\":\"$4\"}" \
  https://o2tkiwaqui.execute-api.us-east-1.amazonaws.com/default/TranslateApi/$2
fi

exit 0
