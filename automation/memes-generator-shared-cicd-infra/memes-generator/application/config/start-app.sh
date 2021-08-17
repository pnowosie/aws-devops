#!/bin/bash
set -e

PROJECT="memes-generator"
STAGE="dev"
APPLICATION_NAME="memes-generator"
REGION="eu-west-1"
USER="memes"
GROUP="memes"

APP_DIR="/opt/$APPLICATION_NAME"
APP_JAR="$APPLICATION_NAME.jar"

DB_SECRET="$PROJECT/$STAGE/data/rds/app-user-secret"

SECRET=$(aws secretsmanager get-secret-value --secret-id $DB_SECRET --output text --query SecretString --region $REGION)
DB_HOST=$(echo $SECRET | jq '.host' | sed 's|\"||g')
DB_PORT=$(echo $SECRET | jq '.port' | sed 's|\"||g')
DB_NAME=$(echo $SECRET | jq '.dbname' | sed 's|\"||g')
DB_APP_USER=$(echo $SECRET | jq '.username' | sed 's|\"||g')
DB_APP_PASSWORD=$(echo $SECRET | jq '.password' | sed 's|\"||g')

PICTURES_BUCKET_PARAM="/$PROJECT/$STAGE/application/pictures-bucket/name"
MEMES_BUCKET_PARAM="/$PROJECT/$STAGE/application/memes-bucket/name"

PICTURES_BUCKET=$(aws ssm get-parameter --name "$PICTURES_BUCKET_PARAM" --output text --query Parameter.Value --region $REGION)
MEMES_BUCKET=$(aws ssm get-parameter --name "$MEMES_BUCKET_PARAM" --output text --query Parameter.Value --region $REGION)

PROPS_FILE="application.properties"

touch "$APP_DIR/$PROPS_FILE"
{
    echo "spring.jpa.database-platform=org.hibernate.dialect.PostgreSQLDialect"
    echo "logging.level.org.hibernate.SQL=DEBUG"
    echo "spring.datasource.username=$DB_APP_USER"
    echo "spring.datasource.password=$DB_APP_PASSWORD"
    echo "spring.datasource.url=jdbc:postgresql://$DB_HOST:$DB_PORT/$DB_NAME"
    echo "meme.generator.s3.raw-images-bucket=$PICTURES_BUCKET"
    echo "meme.generator.s3.generated-bucket=$MEMES_BUCKET"
    echo "meme.generator.s3.endpoint=https://s3.$REGION.amazonaws.com"
    echo "logging.file.path=/var/log/$APPLICATION_NAME"
} > "$APP_DIR/$PROPS_FILE"

chown $USER:$GROUP "$APP_DIR/$PROPS_FILE"

cd "$APP_DIR"

/usr/bin/java -jar "$APP_JAR"
