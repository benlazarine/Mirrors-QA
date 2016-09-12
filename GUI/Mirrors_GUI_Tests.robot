*** Settings ***
Suite Teardown    Close All Browsers
Resource          ../Mirrors_resource.robot

*** Test Cases ***
Open Mirrors WebSite Default Page
    [Tags]    GUI    smoke
    Comment    Define variables to be used
    Open Browser    http://${WebHost}/browse/iplant/home/shared    ${Browser}    ${BrowserAlias}
    Comment    Open the browser fullscreen
    Maximize Browser Window
    Wait Until Page Contains    walia_rice_salt    ${GUIShortWait}

Verify Page Title Is Set
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Title Should Be    CyVerse Data Commons

Verify CyVerse Home (top) link
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Link    CyVerse Home

Verify CyVerse Home (top) link href
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Link    http://www.cyverse.org

Verify Data Store (top) link
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Link    Data Store

Verify Data Store (top) link href
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Link    http://www.cyverse.org/data-store

Verify Discovery Environment (top) link
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Link    Discovery Environment

Verify Discovery Environment (top) link href
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Link    http://www.cyverse.org/discovery-environment

Verify Atmosphere (top) link
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Link    Atmosphere

Verify Atmosphere (top) link href
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Link    http://www.cyverse.org/atmosphere

Verify About (top) link
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Link    About

Verify About CyVerse Mirrors (top) link href
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Link    https://pods.iplantcollaborative.org/wiki/display/DS/Sharing+Data+with+the+Public+in+the+Community+Data+Directory+and+Mirrors+Site

Verify Version info text
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain    Data Commons Mirrors ${VersionInfo}

Verify CyVerse 2016 text
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain    © 2016 CyVerse

Verify CyVerse Home website (bottom) link
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Link    CyVerse Home

Verify CyVerse's Website website (bottom) link href
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Link    http://www.cyverse.org/

Verify Data Store website (bottom) link
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Link    Data Store

Verify Data Store website (bottom) link href
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Link    http://www.cyverse.org/data-store

Verify Discovery Environment website (bottom) link
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Link    Discovery Environment

Verify Discovery Environment website (bottom) link href
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Link    http://preview.iplantcollaborative.org/de

Verify Atmosphere website (bottom) link
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Link    Atmosphere

Verify Atmosphere website (bottom) link href
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Link    https://atmo.iplantcollaborative.org

Verify About website (bottom) link
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Link    About

Verify About website (bottom) link href
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Link    https://pods.iplantcollaborative.org/wiki/display/DS/Sharing+Data+with+the+Public+in+the+Community+Data+Directory+and+Mirrors+Site

Goto iplantcollaborative collection
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Wait Until Page Contains Element    link=iplantcollaborative    ${GUIShortWait}
    Comment    Click Link    iplantcollaborative
    Click Link    /browse/iplant/home/shared/iplantcollaborative
    Wait Until Page Contains Element    link=example_data    ${GUIShortWait}

Goto iplantcollaborative/example_data collection
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Click Link    /browse/iplant/home/shared/iplantcollaborative/example_data
    Wait Until Page Contains Element    link=assembly_stats    ${GUIShortWait}

Goto iplantcollaborative/example_data/assembly_stats collection
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Click Link    /browse/iplant/home/shared/iplantcollaborative/example_data/assembly_stats
    Wait Until Page Contains Element    link=input    ${GUIShortWait}

Goto iplantcollaborative/example_data/assembly_stats/input collection
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Click Link    /browse/iplant/home/shared/iplantcollaborative/example_data/assembly_stats/input
    Wait Until Page Contains Element    link=BAgenomeRay41.fa    ${GUIShortWait}

Verify Breadcrumb link shared
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Wait Until Page Contains Element    link=BAgenomeRay41.fa    ${GUIShortWait}
    Page Should Contain Link    /browse/iplant/home/shared

Verify Breadcrumb link iplantcollaborative
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Link    /browse/iplant/home/shared/iplantcollaborative

Verify Breadcrumb link example_data
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Link    /browse/iplant/home/shared/iplantcollaborative/example_data

Verify Breadcrumb link assembly_stats
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Link    /browse/iplant/home/shared/iplantcollaborative/example_data/assembly_stats

Verify Breadcrumb link input
    [Tags]    GUI    smoke    skipped
    Switch Browser    ${BrowserAlias}
    Page Should Contain Link    /browse/iplant/home/shared/iplantcollaborative/example_data/assembly_stats/input

Verify Breadcrumb link BAgenomeRay41.fa
    [Tags]    GUI    smoke    skipped
    Switch Browser    ${BrowserAlias}
    Page Should Contain Link    /browse/iplant/home/shared/iplantcollaborative/example_data/assembly_stats/input/BAgenomeRay41.fa
    Comment    " BAgenomeRay41.fa                         "

Open File Info Page
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Comment    Click Link    BAgenomeRay41.fa
    Click Link    \#preview-0a0bef0a-4128-11e5-9404-3c4a92e4a804
    Wait Until Page Contains    Previews are limited to the first 8kB. Download to view entire file.    ${GUIShortWait}
    Wait Until Page Does Not Contain    Loading preview    ${GUIShortWait}

Verify "X" window close
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    id=modal-close

Verify assembly_stats/input File Path
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain    File Path

Verify assembly_stats/input File Path value
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Comment    Page Should Contain    /iplant/home/shared/iplantcollaborative/example_data/assembly_stats/input/BAgenomeRay41.fa
    Page Should Contain    /iplant/home/shared/iplantcollaborative/example_data/assembly_stats/input

Verify BAgenomeRay41.fa File Name
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain    File Name

Verify BAgenomeRay41.fa File Name value
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Comment    Page Should Contain    /iplant/home/shared/iplantcollaborative/example_data/assembly_stats/input/BAgenomeRay41.fa
    Page Should Contain    BAgenomeRay41.fa

Verify File Size
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain    File Size

Verify File Size value
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain    92.8 MB

Verify Checksum
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain    Checksum

Verify Checksum value
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain    md5: ec081c643416951eff5cb3b79f35d17d

Verify Created
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain    Created

Verify Last Modified
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain    Last Modified

Verify Download button
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    css=div[id="download_button"]

Verify Open in the Discovery Environment button
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Comment    Page Should Contain Element    xpath=//btn[contains(text(), "Open in the Discovery Environment")]
    Comment    Page Should Contain Link    https://de.iplantcollaborative.org/de/?type=data&folder=/iplant/home/shared/iplantcollaborative/example_data/assembly_stats/input
    Page Should Contain Link    Open in the Discovery Environment

Verify Preview message
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain   Previews are limited to the first 8kB. Download to view entire file.

Verify scaffold-0 text
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    xpath=//code[contains(text(), ">scaffold-0")]

Open Download Link for File
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Comment    Click Button    Download
    Click Element    css=.btn.btn-primary

Verify Download Link I'm not a robot text
    [Tags]    GUI    smoke    skipped
    Switch Browser    ${BrowserAlias}
    Page Should Contain    I'm not a robot
    Comment    Page Should Contain    xpath=//class[contains(text(), "I'm not a robot")]

Verify Download Link I'm not a robot checkbox
    [Tags]    GUI    smoke    skipped
    Switch Browser    ${BrowserAlias}
    Comment    Page Should Contain Element    id=recaptcha-anchor
    Page Should Contain Element    css=div.recaptcha-checkbox-checkmark

Verify reCAPTCHA Privacy link
    [Tags]    GUI    smoke    skipped
    Switch Browser    ${BrowserAlias}
    Comment    Page Should Contain Link    Privacy
    Page Should Contain Element    link=Privacy

Verify reCAPTCHA Terms link
    [Tags]    GUI    smoke    skipped
    Switch Browser    ${BrowserAlias}
    Comment    Page Should Contain Link    Terms
    Page Should Contain Element    link=Terms

Verify s_2.txt preview
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Comment    Next line presses ESCAPE key to return back to data view
    Press Key    css=.modal-open    \\27
    Wait Until Page Contains Element    link=shared    ${GUIShortWait}
    Click Link    /browse/iplant/home/shared
    Wait Until Page Contains Element    link=iplantcollaborative    ${GUIShortWait}
    Click Link    /browse/iplant/home/shared/iplantcollaborative
    Wait Until Page Contains Element    link=example_data    ${GUIShortWait}
    Click Link    /browse/iplant/home/shared/iplantcollaborative/example_data
    Wait Until Page Contains Element    link=abyss    ${GUIShortWait}
    Click Link    /browse/iplant/home/shared/iplantcollaborative/example_data/abyss
    Wait Until Page Contains Element    link=transcriptome    ${GUIShortWait}
    Click Link    /browse/iplant/home/shared/iplantcollaborative/example_data/abyss/transcriptome
    Wait Until Page Contains Element    link=s_peruvianum    ${GUIShortWait}
    Click Link    /browse/iplant/home/shared/iplantcollaborative/example_data/abyss/transcriptome/s_peruvianum
    Wait Until Page Contains Element    link=presley    ${GUIShortWait}
    Click Link    /browse/iplant/home/shared/iplantcollaborative/example_data/abyss/transcriptome/s_peruvianum/presley
    Wait Until Page Contains Element    link=s_2.txt    ${GUIShortWait}
    Comment    Click Link    s_2.txt
    Click Link    \#preview-97a28c32-e104-11e3-80a7-6abdce5a08d5
    Wait Until Page Contains    gggggfggggggfgggg]ggBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB    ${GUIShortWait}
    Page Should Contain    Previews are limited to the first 8kB. Download to view entire file.

Verify s_2.txt preview - 1st line
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Comment    Page Should Contain    gggggfggggggfgggg]ggBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB
    Page Should Contain Element    xpath=//code[contains(text(), "gggggfggggggfgggg]ggBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB")]

Verify s_2.txt preview - 2nd line
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Comment    Page Should Contain    @PRESLEY_0018:2:1:2210:1104#0/2
    Page Should Contain Element    xpath=//code[contains(text(), "@PRESLEY_0018:2:1:2210:1104#0/2")]

Verify s_2.txt preview - 3rd line
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Comment    Page Should Contain    TNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNN
    Page Should Contain Element    xpath=//code[contains(text(), "TNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNN")]

Verify s_2.txt preview - 4th line
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Comment    Page Should Contain    +PRESLEY_0018:2:1:2210:1104#0/2
    Page Should Contain Element    xpath=//code[contains(text(), "+PRESLEY_0018:2:1:2210:1104#0/2")]

Verify WGSOryza_metadata_fields.csv preview
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Comment    Next line presses ESCAPE key to return back to data view
    Press Key    css=.modal-open    \\27
    Click Link    /browse/iplant/home/shared
    Wait Until Page Contains Element    link=commons_repo    ${GUIShortWait}
    Comment    Click Link    data_commons
    Click Link    /browse/iplant/home/shared/commons_repo
    Wait Until Page Contains Element    link=curated    ${GUIShortWait}
    Click Link    /browse/iplant/home/shared/commons_repo/curated
    Wait Until Page Contains Element    link=Duitama_rice_variation_2015    ${GUIShortWait}
    Click Link    /browse/iplant/home/shared/commons_repo/curated/Duitama_rice_variation_2015
    Wait Until Page Contains Element    link=WGSOryza_CIAT_metadata    ${GUIShortWait}
    Click Link    /browse/iplant/home/shared/commons_repo/curated/Duitama_rice_variation_2015/WGSOryza_CIAT_metadata
    Wait Until Page Contains Element    link=WGSOryza_metadata_fields.csv    ${GUIShortWait}
    Comment    Click Link    WGSOryza_metadata_fields.csv
    Click Link    \#preview-4efd833e-0e2f-11e5-b339-3c4a92e4a804
    Wait Until Page Contains    NCBI label,display label,comment    ${GUIShortWait}
    Wait Until Page Contains    file_name,file name,File to which metadata for the row should be appended.    ${GUIShortWait}

Verify WGSOryza_metadata_fields.csv preview - 1st line
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    xpath=//code[contains(text(), "NCBI label,display label,comment")]

Verify WGSOryza_metadata_fields.csv preview - 2nd line
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    xpath=//code[contains(text(), "file_name,file name,File to which metadata for the row should be appended.")]

Verify WGSOryza_project_metadata.csv preview
    [Tags]    GUI    smoke
    Comment    Next line presses ESCAPE key to return back to data view
    Press Key    css=.modal-open    \\27
    Comment    Click Link    WGSOryza_project_metadata.csv
    Click Link    \#preview-4ef1e3e4-0e2f-11e5-81b2-3c4a92e4a804
    Wait Until Page Contains    bioproject ID,project name,project creator,project contribitor,project description,publication ID    ${GUIShortWait}
    Wait Until Page Contains    PRJNA205324,Whole genome sequencing of elite rice cultivars as a comprehensive information resource for marker assisted selection,Jorge    ${GUIShortWait}

Verify WGSOryza_project_metadata.csv preview - 1st line
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    xpath=//code[contains(text(), "bioproject ID,project name,project creator,project contribitor,project description,publication ID")]

Verify WGSOryza_project_metadata.csv preview - 2nd line
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    xpath=//code[contains(text(), "PRJNA205324,Whole genome sequencing of elite rice cultivars as a comprehensive information resource for marker assisted selection,Jorge")]

Verify WGSOryza_sample_metadata.csv preview
    [Tags]    GUI    smoke
    Comment    Next line presses ESCAPE key to return back to data view
    Press Key    css=.modal-open    \\27
    Comment    Click Link    WGSOryza_sample_metadata.csv
    Click Link    \#preview-4efb1ec8-0e2f-11e5-b0ae-3c4a92e4a804
    Wait Until Page Contains    file_name,sample_name,description,bioproject_id,sample_title,organism,cultivar,age,dev_stage,geo_loc_name,tissue,biomaterial_provider,    ${GUIShortWait}
    Wait Until Page Contains    042-87-34_bowtie2_NGSEP_SV.gff,042-87-34,,PRJNA205324,SAMN00027378,Oryza nivara,042-87-34,,,042-87-34,vascular leaf,,Nivara,0,300,0,27,    ${GUIShortWait}

Verify WGSOryza_sample_metadata.csv preview - 1st line
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    xpath=//code[contains(text(), "file_name,sample_name,description,bioproject_id,sample_title,organism,cultivar,age,dev_stage,geo_loc_name,tissue,biomaterial_provider,")]

Verify WGSOryza_sample_metadata.csv preview - 2nd line
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    xpath=//code[contains(text(), "042-87-34_bowtie2_NGSEP_SV.gff,042-87-34,,PRJNA205324,SAMN00027378,Oryza nivara,042-87-34,,,042-87-34,vascular leaf,,Nivara,0,300,0,27,")]

Select File Too Big to Download via HTTP - genome.fa
    [Tags]    GUI    smoke    skipped
    Switch Browser    ${BrowserAlias}
    Comment    Next line presses ESCAPE key to return back to data view
    Press Key    css=.modal-open    \\27
    Click Link    /browse/iplant/home/shared
    Wait Until Page Contains Element    link=walia_rice_salt    ${GUIShortWait}
    Click Link    /browse/iplant/home/shared/iplantcollaborative
    Wait Until Page Contains Element    link=testing_tools    ${GUIShortWait}
    Click Link    /browse/iplant/home/shared/iplantcollaborative/example_data
    Wait Until Page Contains Element    link=abyss    ${GUIShortWait}
    Click Link    /browse/iplant/home/shared/iplantcollaborative/example_data/Blat_with_BAM_output
    Wait Until Page Contains Element    link=genome.fa    ${GUIShortWait}
    Comment    Click Link    genome.fa
    Click Link    \#preview-8d6786d2-e1a4-11e3-883c-6abdce5a08d5
    Wait Until Page Contains    Previews are limited to the first 8kB. Download to view entire file.    ${GUIShortWait}
    Wait Until Page Contains Element    xpath=//code[contains(text(), ">chr1")]    ${GUIShortWait}
    Page Should Contain    File Path
    Page Should Contain    /iplant/home/shared/iplantcollaborative/example_data/Blat_with_BAM_output
    Page Should Contain    File Name
    Page Should Contain    genome.fa
    Page Should Contain    File Size
    Page Should Contain    2.9 GB
    Page Should Contain    Checksum
    Page Should Contain    md5: 778b721c18da97441889f6609e30a752
    Page Should Contain    Created
    Page Should Contain    Last Modified
    Page Should Contain    Due to the size of this file, it cannot be downloaded from this page.
    Page Should Contain    To download without a CyVerse account follow the instructions detailed on
    Page Should Contain Link    this page
    Page Should Contain Link    https://wiki.cyverse.org/wiki/display/DS/Downloading+Data+Files+Without+a+User+Account
    Page Should Contain Link    Go to the Discovery Environment
    Page Should Contain     Previews are limited to the first 8kB. Download to view entire file.
    Page Should Contain Element    xpath=//code[contains(text(), ">chr1")]
    Page Should Contain Element    xpath=//code[contains(text(), "NNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNN")]

Select File Too Big to Download via HTTP - genome.fa
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Comment    Next line presses ESCAPE key to return back to data view
    Press Key    css=.modal-open    \\27
    Click Link    /browse/iplant/home/shared
    Wait Until Page Contains Element    link=walia_rice_salt    ${GUIShortWait}
    Click Link    /browse/iplant/home/shared/iplantcollaborative
    Wait Until Page Contains Element    link=testing_tools    ${GUIShortWait}
    Click Link    /browse/iplant/home/shared/iplantcollaborative/example_data
    Comment    Wait Until Page Contains Element    link=zmapqtl    ${GUIShortWait}
    Wait Until Page Contains Element    link=abyss    ${GUIShortWait}
    Click Link    /browse/iplant/home/shared/iplantcollaborative/example_data/Blat_with_BAM_output
    Wait Until Page Contains Element    link=genome.fa    ${GUIShortWait}
    Comment    Click Link    genome.fa
    Click Link    \#preview-8d6786d2-e1a4-11e3-883c-6abdce5a08d5
    Wait Until Page Contains    Previews are limited to the first 8kB. Download to view entire file.    ${GUIShortWait}
    Wait Until Page Contains Element    xpath=//code[contains(text(), ">chr1")]    ${GUIShortWait}

Verify File too big - genome.fa - File Path label
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain    File Path

Verify File too big - genome.fa - File Path value text
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain    /iplant/home/shared/iplantcollaborative/example_data/Blat_with_BAM_output

Verify File too big - genome.fa - File Name label
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain    File Name

Verify File too big - genome.fa - File Name value text
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain    genome.fa

Verify File too big - genome.fa - File Size label
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain    File Size

Verify File too big - genome.fa - 2.9 GB label
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain    2.9 GB

Verify File too big - genome.fa - Checksum label
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain    Checksum

Verify File too big - genome.fa - Checksum value
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain    md5: 778b721c18da97441889f6609e30a752

Verify File too big - genome.fa - Created label
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain    Created

Verify File too big - genome.fa - Last Modified label
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain    Last Modified

Verify File too big - genome.fa - Due to the size... label
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain    Due to the size of this file, it cannot be downloaded from this page.

Verify File too big - genome.fa - To download without... label
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain    To download without a CyVerse account follow the instructions detailed on

Verify File too big - genome.fa - this page link
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Link    this page

Verify File too big - genome.fa - Registered CyVerse users... label
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain    Registered CyVerse users can download from the Discovery Environment (DE).

Verify File too big - genome.fa - Go to the Discovery Environment button
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Link    Go to the Discovery Environment

Select File Too Big to Download via HTTP - freddy.tar.gz
    [Tags]    GUI    smoke    skipped
    Switch Browser    ${BrowserAlias}
    Comment    Next line presses ESCAPE key to return back to data view
    Press Key    css=.modal-open    \\27
    Click Link    /browse/iplant/home/shared
    Wait Until Page Contains Element    link=walia_rice_salt    ${GUIShortWait}
    Click Link    /browse/iplant/home/shared/iplantcollaborative
    Wait Until Page Contains Element    link=testing_tools    ${GUIShortWait}
    Click Link    /browse/iplant/home/shared/iplantcollaborative/example_data
    Wait Until Page Contains Element    link=abyss    ${GUIShortWait}
    Click Link    /browse/iplant/home/shared/iplantcollaborative/example_data/abyss
    Wait Until Page Contains Element    link=transcriptome    ${GUIShortWait}
    Click Link    /browse/iplant/home/shared/iplantcollaborative/example_data/abyss/transcriptome
    Wait Until Page Contains Element    link=freddy.tar.gz    ${GUIShortWait}
    Comment    Click Link    freddy.tar.gz
    Click Link    \#preview-991a03c4-e104-11e3-80a7-6abdce5a08d5
    Wait Until Page Contains    Preview not available    ${GUIShortWait}
    Page Should Contain    File Path
    Page Should Contain    /iplant/home/shared/iplantcollaborative/example_data/abyss/transcriptome
    Page Should Contain    File Name
    Page Should Contain    freddy.tar.gz
    Page Should Contain    File Size
    Page Should Contain    6.9 GB
    Page Should Contain    Checksum
    Page Should Contain    md5: 778b721c18da97441889f6609e30a752
    Page Should Contain    Created
    Page Should Contain    Last Modified
    Page Should Contain    Due to the size of this file, it cannot be downloaded from this page.
    Page Should Contain    To download without a CyVerse account follow the instructions detailed on
    Page Should Contain Link    this page
    Page Should Contain Link    https://wiki.cyverse.org/wiki/display/DS/Downloading+Data+Files+Without+a+User+Account
    Page Should Contain Link    Go to the Discovery Environment
    Page Should Contain     Preview not available

Select File Too Big to Download via HTTP - freddy.tar.gz
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Comment    Next line presses ESCAPE key to return back to data view
    Comment    Press Key    css=.modal-open    \\27
    Press Key    css=.modal-body    \\27
    Click Link    /browse/iplant/home/shared
    Wait Until Page Contains Element    link=walia_rice_salt    ${GUIShortWait}
    Click Link    /browse/iplant/home/shared/iplantcollaborative
    Wait Until Page Contains Element    link=testing_tools    ${GUIShortWait}
    Click Link    /browse/iplant/home/shared/iplantcollaborative/example_data
    Wait Until Page Contains Element    link=abyss    ${GUIShortWait}
    Click Link    /browse/iplant/home/shared/iplantcollaborative/example_data/abyss
    Wait Until Page Contains Element    link=transcriptome    ${GUIShortWait}
    Click Link    /browse/iplant/home/shared/iplantcollaborative/example_data/abyss/transcriptome
    Wait Until Page Contains Element    link=freddy.tar.gz    ${GUIShortWait}
    Comment    Click Link    freddy.tar.gz
    Click Link    \#preview-991a03c4-e104-11e3-80a7-6abdce5a08d5
    Wait Until Page Contains    Preview not available    ${GUIShortWait}

Verify File too big - freddy.tar.gz - File Path label
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain    File Path

Verify File too big - freddy.tar.gz - File Path value text
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain    /iplant/home/shared/iplantcollaborative/example_data/abyss/transcriptome

Verify File too big - freddy.tar.gz - File Name label
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain    File Path

Verify File too big - freddy.tar.gz - File Name value text
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain    freddy.tar.gz

Verify File too big - freddy.tar.gz - File Size label
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain    File Size

Verify File too big - freddy.tar.gz - 6.9 GB label
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain    6.9 GB

Verify File too big - freddy.tar.gz - Checksum label
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain    Checksum

Verify File too big - freddy.tar.gz - Checksum value
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain    md5: 564d8bf2b7b38af868a3845c9b13c8d0

Verify File too big - freddy.tar.gz - Created label
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain    Created

Verify File too big - freddy.tar.gz - Last Modified label
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain    Last Modified

Verify File too big - freddy.tar.gz - Due to the size label
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain    Due to the size of this file, it cannot be downloaded from this page.

Verify File too big - freddy.tar.gz - Due to the size... label
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain    Due to the size of this file, it cannot be downloaded from this page.

Verify File too big - freddy.tar.gz - To download without... label
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain    To download without a CyVerse account follow the instructions detailed on

Verify File too big - freddy.tar.gz - this page link
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Link    this page

Verify File too big - freddy.tar.gz - Registered CyVerse users... label
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain    Registered CyVerse users can download from the Discovery Environment (DE).

Verify File too big - freddy.tar.gz - Go to the Discovery Environment button
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Link    Go to the Discovery Environment

Verify File too big - freddy.tar.gz - Preview not available
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain     Preview not available
