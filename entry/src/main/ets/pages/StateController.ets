import { router } from '@kit.ArkUI';
import { i18n } from '@kit.LocalizationKit';

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

      Item({ time1: this.data, time2: this.data })

      Button("更新时间")
        .onClick(() => {
          this.data = '时间：' + new Date().getTime();
          let language = i18n.getSystemLanguage();
          console.info(language)
        })
    }
    .height('100%')
    .width('100%')
  }
}

@Component
struct Item {
  @State time: string = "时间：" + new Date().getTime();
  @Prop time1: string
  @Link time2: string

  build() {
    Column({ space: 3 }) {
      Text(`子组件【${this.time}】`)
        .fontSize(20)
        .backgroundColor(Color.Red)
        .onClick(() => {
          this.time = "时间：" + new Date().getTime(); // 点击更新时间，执行build方法
        })
      Text(`子组件@Prop【${this.time1}】`)
        .fontSize(22)
        .backgroundColor(Color.Green)
        .onClick(() => {
          this.time1 = "时间：" + new Date().getTime(); // 点击更新时间，执行build方法
        })
      Text(`子组件@Link【${this.time2}】`)
        .fontSize(24)
        .backgroundColor(Color.Blue)
        .onClick(() => {
          this.time2 = "时间：" + new Date().getTime(); // 点击更新时间，执行build方法
        })
    }

  }
}