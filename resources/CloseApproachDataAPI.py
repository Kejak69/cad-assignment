import requests
import json

class CloseApproachDataAPI(object):
    """
    Class for close approach data test suite
    """
    def __init__(self) -> None:
        self.api_url = 'https://ssd-api.jpl.nasa.gov/cad.api'
    
    def get_request(self, query_string):
        """
        Request data from endpoint. Requested data is defined by query_string paremeter
        Parameters: query_string
        Return value: requested data
        """
        return_value = requests.get(self.api_url + query_string)
        return return_value.content

    def verify_result(self, expected, actual):
        """
        Compares are given paremetes equal 
        Return value: True if expected == actual and Fail if expected != actual 
        """
        if expected == json.loads(actual):
            result = True
        else:
            result = False

        return result