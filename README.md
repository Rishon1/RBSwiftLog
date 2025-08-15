Podfile

```bash
pod 'RBSwiftLog'
```


## 遇到问题一： Sandbox: rsync(2373) deny(1) file-write-create /Xcode/DerivedData/RBTestDemo-eyaqrbzicokcvycszinkeewrkanh/Build/Products/Debug-iphoneos/RBTestDemo.app/Frameworks/SnapKit.framework/SnapKit_Privacy.bundle

### 这个错误是由于Xcode的沙盒机制限制了rsync命令对文件系统的写入权限导致的，常见于使用CocoaPods集成第三方库（如SnapKit）时
‌禁用用户脚本沙盒‌（推荐方案）：
在Xcode中打开项目
进入Targets → Build Settings
搜索"ENABLE_USER_SCRIPT_SANDBOXING"
将其值设置为"NO"
