import router from '@ohos.router'

@Entry
@Component
struct ListPage {
  @State message: string = 'Hello World';
  private arr: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

  build() {
    Row() {
      Column() {

        RelativeContainer() {
          List({ space: 10 }) {
            ForEach(this.arr, (item: number) => {
              ListItem() {
                Text(`${item}`)
                  .width('100%')
                  .height(100)
                  .fontSize(20)
                  .fontColor(Color.White)
                  .textAlign(TextAlign.Center)
                  .borderRadius(10)
                  .backgroundColor(0x007DFF)
                  .onClick(() => {
                    if (item === 0) {
                      //跳转到GridPage页面
                      router.push({
                        url: 'pages/GridPage'
                      })
                    }
                  })
              }
            })
          }.margin({top:200})

        }

      }
      .width('100%')
    }
    .height('100%')
    .backgroundColor('#FF0000')

  }
}