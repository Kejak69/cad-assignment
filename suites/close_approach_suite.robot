[Documentation]     Test suite to test https://ssd-api.jpl.nasa.gov/cad.api endpoint.

*** Settings ***
Library         ..${/}resources${/}CloseApproachDataAPI.py
Variables       ..${/}resources${/}CloseApproachVariables.py



*** Test Cases ***
Default sorting close-approach NEOs within 10LD between 2022-01-01 and 2022-01-03
    [Documentation]     Testing that default sorting by date
    Get NEOs within 10LD between 2022-01-01 and 2022-01-03 default sorting
    Verify result NEOs within 10LD between 2022-01-01 and 2022-01-03 default sorting

Ascending sort close-approach NEOs within 10LD between 2022-01-01 and 2022-01-03
    [Documentation]     Testing that asending sorting by distance is working correctly 
    Get NEOs within 10LD between 2022-01-01 and 2022-01-03 sort by distance ascending
    Verify result NEOs within 10LD between 2022-01-01 and 2022-01-03 sort by distance ascending

Descending sort close-approach NEOs within 10LD between 2022-01-01 and 2022-01-03
    [Documentation]     Testing that desending sort by distance is working correctly 
    Get NEOs within 10LD between 2022-01-01 and 2022-01-03 sort by distance descending
    Verify result NEOs within 10LD between 2022-01-01 and 2022-01-03 sort by distance descending



*** Keywords ***
Get NEOs within 10LD between 2022-01-01 and 2022-01-03 default sorting
    [Documentation]     Request data from endpoint using '?dist-max=10LD&date-min=2022-01-01&date-max=2022-01-03' query string
    ${return_val}       CloseApproachDataAPI.get_request        ?dist-max=10LD&date-min=2022-01-01&date-max=2022-01-03
    Set Test Variable       ${return_val}

Verify result NEOs within 10LD between 2022-01-01 and 2022-01-03 default sorting
    [Documentation]     Verifies that requested data is correctly sorted by date as default
    ${result}       CloseApproachDataAPI.verify_result    ${default_sorting}      ${return_val}
    Run Keyword If      ${result} != ${True}       Fail     Actual return values is not as expected ${default_sorting} != ${return_val}

Get NEOs within 10LD between 2022-01-01 and 2022-01-03 sort by distance ascending
    [Documentation]     Request data from endpoint using '?dist-max=10LD&date-min=2022-01-01&date-max=2022-01-03&sort=dist' query string
    ${return_val}       CloseApproachDataAPI.get_request        ?dist-max=10LD&date-min=2022-01-01&date-max=2022-01-03&sort=dist
    Set Test Variable       ${return_val}

Verify result NEOs within 10LD between 2022-01-01 and 2022-01-03 sort by distance ascending
    [Documentation]     Verifies that requested data is correctly sorted by distance as ascending
    ${result}       CloseApproachDataAPI.verify_result    ${sort_ascending}      ${return_val}
    Run Keyword If      ${result} != ${True}       Fail     Actual return values is not as expected ${sort_ascending} != ${return_val}

Get NEOs within 10LD between 2022-01-01 and 2022-01-03 sort by distance descending
    [Documentation]     Request data from endpoint using '?dist-max=10LD&date-min=2022-01-01&date-max=2022-01-03&sort=-dist' query string
    ${return_val}       CloseApproachDataAPI.get_request        ?dist-max=10LD&date-min=2022-01-01&date-max=2022-01-03&sort=-dist
    Set Test Variable       ${return_val}

Verify result NEOs within 10LD between 2022-01-01 and 2022-01-03 sort by distance descending
    [Documentation]     Verifies that requested data is correctly sorted by distance as descending
    ${result}       CloseApproachDataAPI.verify_result    ${sort_descending}      ${return_val}
    Run Keyword If      ${result} != ${True}       Fail     Actual return values is not as expected ${sort_descending} != ${return_val}