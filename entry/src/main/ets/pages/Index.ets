// Index.ets
// 导入页面路由模块
import { router } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';

  build() {
    RelativeContainer() {
      Text(this.message)
        .id('HelloWorld')
        .fontSize($r('app.float.page_text_font_size'))
        .fontWeight(FontWeight.Bold)
        .alignRules({
          center: { anchor: '__container__', align: VerticalAlign.Center },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })
        .backgroundColor('#FF0000')
        .onClick(() => {
          this.message = 'Welcome';
        })
      Button() {
        Text("Next")
          .fontSize(30)
          .fontWeight(FontWeight.Bold)
      }
      .id("btnNext0")
      .type(ButtonType.Capsule)
      .margin({
        top: 20
      })
      .alignRules({
        top: { anchor: 'HelloWorld', align: null },
        left: { anchor: "HelloWorld", align: null },
      })
      .backgroundColor('#0D9FFB')
      .width('40%')
      .height('5%')
      .onClick(() => {
        console.info(`Succeeded in clicking the 'Next' button.`)
        // 跳转到第二页
        router.pushUrl({ url: 'pages/Second' }).then(() => {
          console.info('Succeeded in jumping to the second page.')

        }).catch((err: BusinessError) => {
          console.error(`Failed to jump to the second page. Code is ${err.code}, message is ${err.message}`)
        })
      })

      Button() {
        Text("Next")
          .fontSize(30)
          .fontWeight(FontWeight.Bold)
      }
      .id("btnNext1")
      .alignRules({
        top: { anchor: 'btnNext0', align: VerticalAlign.Center },

      })
      .type(ButtonType.Circle)
      .margin({
        top: 20
      })
      .backgroundColor('#0D9FFB')
      .width('40%')
      .height('5%')

      Button() {
        Text("Next")
          .fontSize(30)
          .fontWeight(FontWeight.Bold)
      }
      .id("btnNext2")
      .alignRules({
        top: { anchor: 'btnNext1', align: VerticalAlign.Center },
      })
      .type(ButtonType.Normal)
      .margin({
        top: 20
      })
      .backgroundColor('#0D9FFB')
      .width('40%')
      .height('5%')
    }
    .height('100%')
    .width('100%')
  }
}