# terraform-201808
一時作成したTerraform用リポジトリ

## 初期アカウントでの使用時注意点

1. 使用するAWSアカウントのアクセスキーIDとシークレットアクセスキーとリージョンを ~/.aws/credentials に定義する
2. aws configure --profile "YOUR PROFILE NAME" を実行する
3. ./init-scripts/create_keypair.sh を実行する
4. ./init-scripts/create_kms_key.sh を実行する
5. 4 で入力したエイリアス名を ../modules/rds/mysql.tf の password に置換する
6. ./init-scripts/terraform_apply.sh を実行する
