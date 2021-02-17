# /bin/bash
compressFile="resume.tar.gz"        # 压缩后的文件名
user="root"                         # 远程登录用户
origin="sugarat.top"                   # 远程登录origin
targetDir="/www/wwwroot/resume.sugarat.top"     # 目标目录
echo "开始-----上传"
scp $compressFile $user@$origin:./
echo "开始-----部署"
ssh -p22 ${user}@${origin} "rm -rf ${targetDir}/* && tar -zvxf ${compressFile} -C ${targetDir}"
echo "清理-----临时的文件"
rm -rf $compressFile