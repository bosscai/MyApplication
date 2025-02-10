// 导入页面路由模块
import { router } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';

@Entry
@Component
struct Second {
  @State message: string = 'Hello Second Page';

  build() {
    RelativeContainer() {
      Text(this.message)
        .id('SecondHelloWorld')
        .fontSize($r('app.float.page_text_font_size'))
        .fontWeight(FontWeight.Bold)
        .alignRules({
          center: { anchor: '__container__', align: VerticalAlign.Center },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })
        .onClick(() => {
          console.info(`Succeeded in clicking the 'Back' button.`)
          try {
            // 返回第一页
            router.back()
            console.info('Succeeded in returning to the first page.')
          } catch (err) {
            let code = (err as BusinessError).code;
            let message = (err as BusinessError).message;
            console.error(`Failed to return to the first page. Code is ${code}, message is ${message}`)
          }
        })

      Button()
        .id('btn2ListPage').onClick(()=>{
        // 跳转到第二页
        router.pushUrl({ url: 'pages/ListPage' }).then(() => {
          console.info('Succeeded in jumping to the ListPage page.')

        }).catch((err: BusinessError) => {
          console.error(`Failed to jump to the ListPage page. Code is ${err.code}, message is ${err.message}`)
        })
      })
    }
    .height('100%')
    .width('100%')
  }
}