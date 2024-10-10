# 本地网页部署测试的命令

首先是环境配置：

安装 ruby 

环境安装：

```
gem install jekyll bundler
```

运行以下命令检查Jekyll是否正确安装:

```
jekyll -v
```

运行以下命令安装依赖:

```
bundle install
```

运行：

要重新构建您的Jekyll站点,请按照以下步骤操作:

1. 打开命令行终端(如CMD、PowerShell或Git Bash)。

2. 导航到您的项目根目录。使用 `cd` 命令,例如:

   ```
   cd path/to/your/project
   ```

3. 运行以下命令来清理之前的构建:

   ```
   bundle exec jekyll clean
   ```

4. 然后,运行以下命令来重新构建站点:

   ```
   bundle exec jekyll build
   ```

5. 如果您想在本地预览站点,可以运行:

   ```
   bundle exec jekyll serve
   ```

   这将启动一个本地服务器,通常在 `http://localhost:4000` 或 `http://127.0.0.1:4000`。

6. 在浏览器中打开上述地址,检查您的站点是否正常工作,链接是否正确。

7. 如果您看到任何错误消息,请仔细阅读它们,因为它们通常会指出问题所在。

8. 如果一切正常,但您在浏览器中看不到更改,可能需要清除浏览器缓存或使用隐私模式打开。

如果在重建过程中遇到任何问题或错误消息,请告诉我,我会帮您解决。
