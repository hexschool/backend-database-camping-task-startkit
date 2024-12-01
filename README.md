# db-migrate-startkit

## 事前準備

下載安裝Docker Desktop
* [Windows版](https://desktop.docker.com/win/main/amd64/Docker%20Desktop%20Installer.exe?utm_source=docker&utm_medium=webreferral&utm_campaign=dd-smartbutton&utm_location=module&_gl=1*1x0tato*_gcl_au*NDk4NzQwNjM1LjE3MjczMzQ0NDY.*_ga*MTkxMzI2NzM5NC4xNjU5OTM4NTcy*_ga_XJWPQMJYHQ*MTcyNzMzMzcxNy4xNTYuMS4xNzI3MzM0NDY4LjM3LjAuMA..)
* Mac版
  * [Intel處理器](https://desktop.docker.com/mac/main/amd64/Docker.dmg?utm_source=docker&utm_medium=webreferral&utm_campaign=dd-smartbutton&utm_location=module&_gl=1*sjadaf*_gcl_au*NDk4NzQwNjM1LjE3MjczMzQ0NDY.*_ga*MTkxMzI2NzM5NC4xNjU5OTM4NTcy*_ga_XJWPQMJYHQ*MTcyNzMzMzcxNy4xNTYuMS4xNzI3MzM0NDY4LjM3LjAuMA..)
  * [M系列處理器](https://desktop.docker.com/mac/main/arm64/Docker.dmg?utm_source=docker&utm_medium=webreferral&utm_campaign=dd-smartbutton&utm_location=module&_gl=1*sjadaf*_gcl_au*NDk4NzQwNjM1LjE3MjczMzQ0NDY.*_ga*MTkxMzI2NzM5NC4xNjU5OTM4NTcy*_ga_XJWPQMJYHQ*MTcyNzMzMzcxNy4xNTYuMS4xNzI3MzM0NDY4LjM3LjAuMA..)

下載並安裝Node.js
* [下載連結](https://nodejs.org/zh-tw)

下載並安裝Dbeaver Community
* [Windows版](https://dbeaver.io/files/dbeaver-ce-latest-x86_64-setup.exe)
* Mac版
  * [Intel處理器](https://dbeaver.io/files/dbeaver-ce-latest-macos-x86_64.dmg)
  * [M系列處理器](https://dbeaver.io/files/dbeaver-ce-latest-macos-aarch64.dmg)

## 開始使用

### 安裝套件

>執行前請確保已經安裝了Node.js

打開終端機並輸入以下指令
```
$ pnpm i
```

### 新增一組遷移
在終端機輸入以下指令來新增一組遷移，your_file_name請替換成任何你要的檔案名稱，檔案名稱之間不可有空白
```
$ pnpm run create your_file_name
```
執行後程式將自動產生一組遷移在migrations資料夾下，一組遷移將包含3個檔案，檔案皆以日期時間加上剛剛輸入的文字命名：

範例如下：
```
2024092600000-your_file_name-up.sql
2024092600000-your_file_name-down.sql
2024092600000-your_file_name.js
```
* 2024092600000-your_file_name-up.sql：執行遷移時會被執行的sql檔案

* 2024092600000-your_file_name-down.sql：執行遷移失敗時，才會被執行的sql檔案，一般作為還原up檔執行到一半的sql用，不需要可空白

* 2024092600000-your_file_name.js：執行此組遷移的程式檔案，請勿修改

那些遷移檔案內容的小技巧：
* 每組遷移盡量保持單一職責，例如需要新增表並寫入資料，建議拆分成兩組遷移，一組新增表，一組寫入資料
* 不修改已經執行過的遷移，如有需要，應該新增新的遷移來修改

### 首次在本機開啟資料庫並執行遷移

> 請確保Docker Desktop已經正常啟動，並能夠看到容器頁面(Containers)

打開終端機並輸入以下指令，程式將自動啟動資料庫，並運行遷移
```
$ pnpm run start
```

啟動後，請檢查Docker Desktop程式界面中裡是否新增db-migrate-startkit的容器堆疊，該堆疊裡了有兩個容器：
* db_migrate-1：執行遷移檔案的容器，執行後會自動關閉（狀態（STATUS）為Exited）。請務必進入檢查查看遷移的執行結果，確保遷移執行成功。
* postgres-1：資料庫容器，狀態應為Running

啟動時，程式將自動產生pgdata資料夾，用以保存資料庫的資料，如將其刪除，將清空所有資料。

程式執行遷移時，將依照遷移檔案的日期，由遠至近執行，且每組遷移只會執行一次，先前執行成功過的遷移不會被再次執行。

### 重新啟動資料庫
```
$ pnpm run restart
```
### 關閉資料庫
```
$ pnpm run stop
```

### 關閉資料庫並清除資料
```
$ pnpm run clean
```
