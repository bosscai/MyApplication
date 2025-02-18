import { router } from '@kit.ArkUI';

@Entry
@Component
struct StateController {
  @State data: string = '时间：' + new Date().getTime();

  build() {
    Column({ space: 10 }) {
      Text("父组件：" + this.data)
        .fontSize(20)
        .backgroundColor(Color.Pink)
        .onClick(() => {
          router.back()
        })

      Item()
      Item()

      Button("更新时间")
        .onClick(() => {
          router.back()
          this.data = '时间：' + new Date().getTime();
        })
    }
    .height('100%')
    .width('100%')
  }
}

@Component
struct Item {
  @State time: string = "时间：" + new Date().getTime();

  build() {
    Text(`子组件【${this.time}】`)
      .fontSize(20)
      .backgroundColor(Color.Grey)
      .onClick(() => {
        this.time = "时间：" + new Date().getTime(); // 点击更新时间，执行build方法
      })
  }
}