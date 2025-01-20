#!/bin/sh

echo "Start creating access key"

sleep 15

until $(curl --output /dev/null --silent --head --fail "${MINIO_SERVER_URL_ONE}"/minio/health/live); do
  echo "Waiting for MinIO to be available..."
  sleep 5
done

mc alias set minio "${MINIO_HOST_URL}" "${MINIO_ROOT_USER}" "${MINIO_ROOT_PASSWORD}"
mc admin user add minio "${MINIO_SERVER_ACCESS_KEY}" "${MINIO_SERVER_SECRET_KEY}"
mc admin policy attach minio readwrite --user="${MINIO_SERVER_ACCESS_KEY}"

echo "Finished creating access key!"

