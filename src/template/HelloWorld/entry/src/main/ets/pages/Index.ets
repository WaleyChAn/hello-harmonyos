import router from '@ohos.router';

@Entry
@Component
struct Index {
  private tabsControler: TabsController = new TabsController()
  @State message: string = 'Hello World'


  build() {
    Row() {
      Column() {
        Tabs({barPosition:BarPosition.End, controller:this.tabsControler}) {
          TabContent(){
            Column(){
              Image($r('app.media.icon'))
                .width(100)
                .margin(20)
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
          }
          .tabBar('green')
          TabContent(){
            Column(){
              Text(this.message)
                .fontSize(50)
                .fontWeight(FontWeight.Bold)
            }
          }
          .tabBar('green')
        }

      }
      .width('100%')
    }
    .height('100%')
  }
}