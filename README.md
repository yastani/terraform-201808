# terraform-201808
一時作成したTerraform用リポジトリ

## 初期アカウントでの使用時注意点

1. 使用するAWSアカウントのアクセスキーIDとシークレットアクセスキーとリージョンを `~/.aws/credentials` に定義する
2. `aws configure --profile "YOUR PROFILE NAME"` を実行する
3. `./init-scrpits`に移動する
4. `./create_keypair.sh` を実行する
5. `./create_kms_key.sh` を実行する
6. 5 で入力したエイリアス名を `../modules/rds/mysql.tf` の password に置換する
7. `./create_s3bucket_terraform.sh` を実行する
8. 7 で作成したS3バケット名を `../environments/*/backend.tf` に定義されているS3バケット名に置換する
9. `./terraform_apply.sh` を実行する
