*** Settings ***
Library           OperatingSystem
Resource          ../Mirrors_resource.robot

*** Test Cases ***
Download a small file via curl
    [Tags]    CL    smoke
    Comment    Define variables to be used
    ${FileName} =    Set Variable    Blasttestoutput.txt
    ${FilePath} =    Set Variable    download/iplant/home/shared/iplantcollaborative/example_data/blastp
    ${output} =    Run    curl -s -L -o ${DownloadDir}/${FileName} http://${WebHost}/${FilePath}/${FileName}
    File Should Exist    ${DownloadDir}/${FileName}
    ${FileSize} =    Get File Size    ${DownloadDir}/${FileName}
    Should Be Equal as Integers    ${FileSize}    ${427065}

Download a medium file via curl
    [Tags]    CL    smoke
    Comment    Define variables to be used
    ${FileName} =    Set Variable    250_pe_all.fq.gz
    ${FilePath} =    Set Variable    download/iplant/home/shared/iplantcollaborative/example_data/abyss/genome/maize_chr10_sim
    ${output} =    Run    curl -s -L -o ${DownloadDir}/${FileName} http://${WebHost}/${FilePath}/${FileName}
    File Should Exist    ${DownloadDir}/${FileName}
    ${FileSize} =    Get File Size    ${DownloadDir}/${FileName}
    Should Be Equal as Integers    ${FileSize}    ${391415385}
