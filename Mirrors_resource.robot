*** Settings ***
Library           Selenium2Library    5s

*** Variables ***
${Browser}        ff
${BrowserAlias}    MirrorsBrowser
${DownloadDir}    ${BaseDir}/DataStore/download
${GUILongWait}    45s
${GUIShortWait}    10s
${WebHost}        mirrors.domain.com
${VersionInfo}    v.1.0.0-beta
