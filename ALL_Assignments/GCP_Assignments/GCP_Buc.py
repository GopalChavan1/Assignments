from google.cloud import storage
#from google.cloud import storage

storage_client = storage.Client()

print("Storage Client Created Successfully")

from google.cloud import storage

storage_client = storage.Client()

bucket_name = "demo-storage-bucket-12345"

bucket = storage_client.create_bucket(
    bucket_name,
    location="ASIA-SOUTH1"
)

print(f"Bucket '{bucket.name}' created successfully.")
from google.cloud import storage

storage_client = storage.Client()

print("Available Buckets:\n")

for bucket in storage_client.list_buckets():
    print(bucket.name)

with open("file1.txt", "w") as file:
    file.write("Welcome to Google Cloud Storage")

print("Local file created.")
