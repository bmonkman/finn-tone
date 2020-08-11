import connexion
import six
import random

from openapi_server.models.error import Error  # noqa: E501
from openapi_server.models.tone import Tone  # noqa: E501
from openapi_server import util

tones = ['humorous', 'ironic', 'cynical']

def load_tone_by_id(user_id):  # noqa: E501
    """Get tone of a user

     # noqa: E501

    :param user_id: The id of the user whose tone to retrieve
    :type user_id: str

    :rtype: Tone
    """
    return Tone(tone=random.choice(tones))
