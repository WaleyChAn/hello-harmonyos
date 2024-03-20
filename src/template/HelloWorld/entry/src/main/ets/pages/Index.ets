import router from '@ohos.router';

@Entry
@Component
struct Index {
  @State message: string = 'Hello World'

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Button('下一步')
          .width('80%')
          .margin(20)
          .onClick(()=>{
            router.pushUrl({
              url: 'pages/Second',
            })
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}