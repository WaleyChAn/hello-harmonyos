# Harmony OS 从入门到放弃

想到哪写到哪~😄

---

## Docs

首先当然是各种文档

- ✨ [HarmonyOS Developer API](https://developer.harmonyos.com/cn/docs/documentation/doc-references-V3/js-apis-app-ability-ability-0000001544464065-V3)，平时开发对字段用，不过不熟悉的话建议看一下指南。这个网站更多的是**应用层**和**框架层**相关的内容；
- ✨ [Openharmony](https://www.openharmony.cn/mainPlay)，主要看一下论坛和示例视频。这个网站的内容比较泛，**系统服务层**相关的东西在这里能找到一些；
- ✨ [ArkUI-X 码云仓库](https://gitee.com/arkui-x)，github 也有，同名仓库就不贴啦；

## Issues

问题很多啦...当然指的是我的问题很多 😕，不过主要的就下面两个：

- [x] 🎉 ArkUI 是否能够实现一端开发，多端、多平台发布；
- [ ] 🍀 ArkUI 对原生调用的扩展性如何，对于未封包的自定义底层功能调用，如何实现；

第一个问题暂时有结论了，基于 ArkUI-X 的扩展包，可以实现跨平台的封装（下面会说到这个问题）；
第二个问题暂时无解，因为对 ArkUI 的框架还不熟悉，不清楚他的全部功能。ArkUI 对原生调用，官方已经用 Ohos 这个包封装好了，在[API](https://developer.harmonyos.com/cn/docs/documentation/doc-references-V3/_o_h___native_x_component-0000001497210885-V3)可以查找相关能力。

## ArkUI 相关

ArkUI 大概再这个位置，作为鸿蒙生态下一个承上启下的作用，构建用户 UI 界面，调用底层功能。HarmonyOS Developer 项目，主要是对 ArkUI 生态的一次大型构建，让大家都来用 ArkUI 开发桌面应用。其他系统能供鸿蒙给我们写好了。但是这样构建的应用本身不具备跨平台能力，只能在鸿蒙系统下运行。

![这是图片](https://github.com/WaleyChAn/hello-harmonyos/blob/master/src/picture/QQ%E6%88%AA%E5%9B%BE20231207214729.png?raw=true)

开发语言是类 web 的开发范式，基于 ArkTS 构建应用，也可以使用常规的 js+css 这种写法。
ArkTS 可以理解为 Typescript 的超集，而 Typescript 又是 js 的超集，超超集 😄。写完的代码又方舟编译器构建成 hap，可在 HarmonyOS 下运行。

![这是图片](https://raw.githubusercontent.com/WaleyChAn/hello-harmonyos/master/src/picture/%E5%BE%AE%E4%BF%A1%E6%88%AA%E5%9B%BE_20231207215651.png)

## ArkUI-X 大佬出场

[ArkUI-X 码云仓库](https://gitee.com/arkui-x) 再贴一次吧，ArkUI 应用的能力，靠 ArkUI-X 这个包来实现
，具体他是如何实现的，看这个[ArkUI 跨平台设计总体说明](https://gitee.com/arkui-x/docs/blob/master/zh-cn/framework-dev/design/design-overview.md) ，和 flutter 的跨 ios 能力有点类似，反正意思是鸿蒙替你做了。

不过 ArkUI-X 这个插件有个地方要特殊说明的。当前 HarmonyOS Developer 主推的，是基于 API9 的 HarmonyOS 3.x，而 ArkUI-X，是需要 API10 才能用的，也就是 HarmonyOS 4.x（next）。简单来说就是：

- 基于 API9 的 ArkUI 构建的.hap/.app，只能在 HarmonyOS 3.x 的系统上运行，没法打包成安卓/IOS；
- 基于 API10 的 ArkUI-X 工具包，可以对 ArkUI 工程进行转译编码，但是编码的.hap/.app 不能在 HarmonyOS 3.x 上运行，只能在 4 以上，不过可以打包成安卓工程和苹果工程了
- `补充说明：`ArkUI-X 打包成的安卓和 IOS 都是工程代码，不是直接可运行安装的文件，需要到各自的 Android Studio 和 Xcode 等软件进行打包、发包；

先写到这吧，具体项目搭建 → 项目代码 → 项目打包，后面说 🏃
