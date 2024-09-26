#!/usr/bin/env bash
## bizCode bizMsg lxml 三个依赖只有老脚本才需要使用
## 新脚本基本都不在使用，是否安装按需安装
  # 先用ql内置的面板环境检查命令'ql check'先检查一下面板环境
  # 然后再运行此脚本
  # 此脚本安装的依赖包含了以前的老脚本依赖
  # 如果脚本库中使用的是2020年以后的脚本，有些依赖就多余了
  # 推荐按需安装依赖，如果实在不清楚脚本用了什么依赖
  # 才傻瓜的安装这个脚本
  # 本脚本的代码可以直接复制粘贴到 extra.sh中
  # 就可以用ql内置命令 ql extra 直接运行
  # 考虑到extra.sh可能还会自定义其他脚本，所以才单独做了一个sh文件

reset_nodejs_dist() {
  pnpm install -g crypto-js prettytable dotenv jsdom date-fns tough-cookie tslib ws@7.4.3 ts-md5 jsdom -g jieba fs form-data json5 global-agent png-js @types/node require typescript js-base64 axios moment ds
}

reset_python_dist() {
  pip install  requests canvas ping3 jieba aiohttp
  pip3 install  requests canvas ping3 jieba aiohttp
}

reset_linux_dist() {
  apk add bizCode bizMsg lxml
}

reset_npm_res_cn(){
#无论系统使用什么源，，强制更新成国内源
  npm config set registry https://registry.npmmirror.com
  npm cache clean --force
  npm cache verify
  pip install requests -i https://pypi.tuna.tsinghua.edu.cn/simple


}

reset_npm_pm2_node(){
  echo -e "=====> ............"
  npm i -g pnpm@8.3.1 pm2 ts-node
  patch_version
}


check_dist() {
reset_npm_res_cn
reset_nodejs_dist
reset_python_dist
#reset_linux_dist
}





main() {
  echo -e "=====> 开始安装qinglong依赖一键脚本，本脚本包含很多老旧的依赖，如果使用新脚本可以不安装，实在不清楚脚本库是否需要才安装"


  check_dist

  echo -e "\n=====> 安装结束\n"
}

main
