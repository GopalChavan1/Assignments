from google.cloud import storage

def create_bucket_class_location(bucket_name):
    """
    Creates a new bucket with a specified storage class and location.
    """

    # Create Storage Client
    storage_client = storage.Client()

    print("Storage Client Object :", storage_client)

    # Create Bucket Object
    bucket = storage_client.bucket(bucket_name)

    print("Bucket Object :", bucket)

    # Set Storage Class
    bucket.storage_class = "STANDARD"

    # Create Bucket in US Region
    new_bucket = storage_client.create_bucket(
        bucket,
        location="US"
    )

    print(
        "Created bucket {} in {} with storage class {}".format(
            new_bucket.name,
            new_bucket.location,
            new_bucket.storage_class,
        )
    )

    return new_bucket


# -----------------------------
# Main Program
# -----------------------------
if __name__ == "__main__":

    bucket_name = "dummy-bwt-123"   # Bucket name must be globally unique

    val = create_bucket_class_location(bucket_name)

    print("-" * 40)
    print(val)
    print("-" * 40)

                      