import logging
import sys
from datetime import datetime

from google.cloud import storage

from config import BUCKET_NAME

root = logging.getLogger()
root.setLevel(logging.DEBUG)

handler = logging.StreamHandler(sys.stdout)
handler.setLevel(logging.DEBUG)
formatter = logging.Formatter(
    '%(asctime)s - %(name)s - %(levelname)s - %(message)s')
handler.setFormatter(formatter)
root.addHandler(handler)

logger = logging.getLogger(__name__)

if __name__ == '__main__':
    gcs_client = storage.Client()

    current_time = datetime.utcnow().strftime('%Y%m%d%H%M%S')

    bucket = gcs_client.get_bucket(BUCKET_NAME)
    blob = bucket.blob(f'results/{current_time}.txt')

    blob.upload_from_string(
        'sample_text', content_type='application/x-www-form-urlencoded;charset=UTF-8')

    logger.info(f'File created in bucket {bucket}, at path {blob}')

    sys.exit(0)
