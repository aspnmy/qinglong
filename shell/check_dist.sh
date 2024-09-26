#!/usr/bin/env bash
## 常用 nodejs依赖  pnpm install -g crypto-js prettytable dotenv jsdom date-fns tough-cookie tslib ws@7.4.3 ts-md5 jsdom -g jieba fs form-data json5 global-agent png-js @types/node require typescript js-base64 axios moment ds
## 常用 python依赖  pnpm install -g requests canvas ping3 jieba aiohttp
## 常用 linux依赖 pnpm install -g bizCode bizMsg lxml
reset_nodejs_dist() {
  pnpm install -g crypto-js prettytable dotenv jsdom date-fns tough-cookie tslib ws@7.4.3 ts-md5 jsdom -g jieba fs form-data json5 global-agent png-js @types/node require typescript js-base64 axios moment ds
}

reset_python_dist() {
  pnpm install -g pnpm install -g requests canvas ping3 jieba aiohttp
}

reset_linux_dist() {
  pnpm install -g bizCode bizMsg lxml
}

check_dist() {
package_name="date-fns axios ts-node typescript png-js crypto-js md5 dotenv got ts-md5 tslib @types/node requests tough-cookie jsdom download tunnel fs ws js-base64 jieba canvas crypto-js prettytable dotenv jsdom date-fns tough-cookie tslib ws@7.4.3 ts-md5 jsdom -g jieba fs form-data json5 global-agent png-js @types/node require typescript js-base64 axios moment ds requests canvas ping3 jieba aiohttp bizCode bizMsg lxml"

for i in $package_name; do
    case $i in
        canvas)
            cd /ql/data/scripts
            pnpm ls $i
            echo -e $i
            ;;
        *)
            pnpm ls $i -g
            echo -e $i
            ;;
    esac
done




}

pm2_log() {
  echo -e "---> pm2日志"
  local panelOut="/root/.pm2/logs/panel-out.log"
  local panelError="/root/.pm2/logs/panel-error.log"
  tail -n 300 "$panelOut"
  tail -n 300 "$panelError"
}

check_nginx() {
  local nginxPid=$(ps -eo pid,command | grep nginx | grep -v grep)
  echo -e "=====> 检测nginx服务\n$nginxPid"
  if [[ $nginxPid ]]; then
    echo -e "\n=====> nginx服务正常\n"
    nginx -s reload
  else
    echo -e "\n=====> nginx服务异常，重新启动nginx\n"
    nginx -c /etc/nginx/nginx.conf
  fi
}

check_ql() {
  local api=$(curl -s --noproxy "*" "http://0.0.0.0:5700")
  echo -e "\n=====> 检测面板\n\n$api\n"
  if [[ $api =~ "<div id=\"root\"></div>" ]]; then
    echo -e "=====> 面板服务启动正常\n"
  fi
}

check_pm2() {
  pm2_log
  local currentTimeStamp=$(date +%s)
  local api=$(
    curl -s --noproxy "*" "http://0.0.0.0:5600/api/system?t=$currentTimeStamp" \
      -H 'Accept: */*' \
      -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36' \
      -H 'Referer: http://0.0.0.0:5700/crontab' \
      -H 'Accept-Language: en-US,en;q=0.9,zh-CN;q=0.8,zh;q=0.7' \
      --compressed
  )
  echo -e "\n=====> 检测后台\n\n$api\n"
  if [[ $api =~ "{\"code\"" ]]; then
    echo -e "=====> 后台服务启动正常\n"
  fi
}

main() {
  echo -e "=====> 开始检测"
  npm i -g pnpm@8.3.1 pm2 ts-node
  patch_version

  check_dist
  #reset_nodejs_dist
  #reset_python_dist
  #reset_linux_dist

  check_ql
  check_nginx
  check_pm2
  #reload_update
  reload_pm2
  echo -e "\n=====> 检测结束\n"
}

main
