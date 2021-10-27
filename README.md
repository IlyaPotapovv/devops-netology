# devops-netologynew line
newline
**/.terraform/* - исключает локальные каталоги .terraform

*.tfstate
*.tfstate.* - исключает все файлы с расширением tfstate

crash.log - исключает все файлы с таким названием 

*.tfvars - исключает все файлы с расширением tfvars. Файлы данного типа содержат в себе важные данные: ключи, пароль и т.д.

override.tf
override.tf.json
*_override.tf
*_override.tf.json - исключить все файлы с названием override.tf, override.tf.json; файлы, в конце названия которых _override.tf и _override.tf.json

!example_override.tf - но добавить в комиты файлы с названием example_override.tf, даже если они попадают под исключение выше

.terraformrc
terraform.rc - игнорирует файлы с таким названием 
hghghghghghghghghg