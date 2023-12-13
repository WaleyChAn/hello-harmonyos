/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import web_webview from '@ohos.web.webview'
import call from '@ohos.telephony.call';
import batteryInfo from '@ohos.batteryInfo';
import geoLocationManager from '@ohos.geoLocationManager';

interface  testData {
  type: number,
  massage: string
}

@Entry
@Component
struct Index {
  @State message:string = '暂无'
  controller: web_webview.WebviewController = new web_webview.WebviewController()


  testObj = {
    test(data: testData): void {
      const { type,massage } = data
      this.message = massage

      switch (type) {
        case 1:
          AlertDialog.show({                   // 点击按钮，弹出一个对话框
            title: "弹窗",                 // 设置标题
            message: "这里是弹窗的内容",          // 设置内容
            alignment: DialogAlignment.Center, // 设置弹窗的对齐方式
            confirm: {                         // 单个按钮的配置文本
              value: "text",
              fontColor: Color.Red,
              backgroundColor: "#aabbcc",
              action: () => {
                console.log("点击了")
              }
            }
          })
          break;
        case 2:
          // 调用查询能力接口
          let isSupport = call.hasVoiceCapability();
          if (!isSupport) {
            console.log("not support voice capability, return.");
            return;
          }
          // 如果设备支持呼叫能力，则继续跳转到拨号界面，并显示拨号的号码
          call.makeCall("12312111212", (err)=> {
            if (!err) {
              console.log("make call success.");
            } else {
              console.log("make call fail, err is:" + JSON.stringify(err));
            }
          });
          break;
        case 3:
          AlertDialog.show({                   // 点击按钮，弹出一个对话框
            title: "电池电量",                 // 设置标题
            message: `${batteryInfo.batterySOC}`,          // 设置内容
            alignment: DialogAlignment.Center, // 设置弹窗的对齐方式
            confirm: {                         // 单个按钮的配置文本
              value: "text",
              fontColor: Color.Red,
              backgroundColor: "#aabbcc",
              action: () => {
                console.log("点击了")
              }
            }
          })
          break;
        case 4:
          var requestInfo = {
            'priority': 0x201,
            'timeInterval': 0,
            'distanceInterval': 0,
            'maxAccuracy': 0
          };
          geoLocationManager.on('locationChange', requestInfo, (location) => {
            AlertDialog.show({                   // 点击按钮，弹出一个对话框
              title: "地址信息",                 // 设置标题
              message: 'locationChanger: data: ' + JSON.stringify(location),          // 设置内容
              alignment: DialogAlignment.Center, // 设置弹窗的对齐方式
              confirm: {                         // 单个按钮的配置文本
                value: "text",
                fontColor: Color.Red,
                backgroundColor: "#aabbcc",
                action: () => {
                  console.log("点击了")
                }
              }
            })
          });

          break;

        default:
          break;
      }
    },
    toString(): void {
      console.log('toString' + "interface instead.")
    }
  }

  @Styles btnStyle() {
    .margin({
      top: 25,
      right: '5%',
      left: '5%'
    })
    .backgroundColor(Color.Yellow)
    .width('40%')
    .height(50)
  }

  build() {
    Row() {
      Column() {
        Web({
          src: $rawfile('demo.html'),
          controller: this.controller
        })
          .width('80%')
          .height('60%')
          .backgroundColor('#eee')
          .javaScriptAccess(true)
          .javaScriptProxy({
            object: this.testObj,
            name: "objName",
            methodList: ["test", "toString"],
            controller: this.controller,
          })

        Text('软件内：' + this.message)
          .fontSize(36)
          .margin({
            top: 25
          })
          .fontWeight(FontWeight.Bold)
        Button() {
          Text('点击')
            .fontSize(24)
        }
        .type(ButtonType.Capsule)
        .btnStyle()
        .onClick(() => {
          this.message = '点击'
          this.controller.runJavaScript('test("软件内点击")')

         })
        .width('80%')
      }
      .width('100%')
    }
    .height('100%')
  }
}