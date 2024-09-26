<img width="100" src="https://user-images.githubusercontent.com/22700758/191449379-f9f56204-0e31-4a16-be5a-331f52696a73.png">

<h1 >Qinglong</h1>



### Qing-long dist 依赖一键安装脚本 使用说明

```bash
## bizCode bizMsg lxml 三个依赖只有老脚本才需要使用
## 新脚本基本都不在使用，是否安装按需安装
  # 先用ql内置的面板环境检查命令'ql check'先检查一下面板环境
  # 然后再运行此脚本
  # 此脚本安装的依赖包含了以前的老脚本依赖
  # 如果脚本库中使用的是2020年以后的脚本,有些依赖就多余了
  # 推荐按需安装依赖，如果实在不清楚脚本用了什么依赖
  # 才傻瓜的安装这个脚本
  # 本脚本的代码可以直接复制粘贴到 extra.sh中
  # 就可以用ql内置命令 ql extra 直接运行
  # 考虑到extra.sh可能还会自定义其他脚本,所以才单独做了一个sh文件

```
![交互式脚本使用形式](https://i-blog.csdnimg.cn/direct/28829e783be941559e4c9a8408fc92da.png#pic_center)


### Qing-long dist 安装方式
```bash
# 适合qing-long v2.15.0以上版本
# 进入ql主目录，容器下也是一样的
cd /ql/shell
# 下载脚本文件
wget https://raw.githubusercontent.com/aspnmy/qinglong/refs/heads/install_dist/shell/check_dist
# 配置执行权限
chmod +x check_dist
# 按提示执行脚本 查询脚本命令说明
./check_dist help
##  check_dist install_onec 安装常用依赖--包含老脚本依赖,但不包含bizCode bizMsg lxml
./check_dist install_onec
##  check_dist install_nodejs_dist 安装qinglong-nodejs依赖
./check_dist install_nodejs_dist
##  check_dist install_python_dist 安装qinglong-python依赖
./check_dist install_python_dist
##  check_dist install_linux_dist 安装bizCode bizMsg lxml依赖
./check_dist install_linux_dist
##  check_dist install_base 修复qinglong-组件环境
./check_dist install_base

```


