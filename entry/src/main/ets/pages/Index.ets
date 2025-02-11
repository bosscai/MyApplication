// Index.ets
// 导入页面路由模块
import { router } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';

@Entry
@Component
struct Index {
  @State count: number = 0;

  build() {
    Stack({
      alignContent: Alignment.BottomEnd
    }) {
      Text(this.count.toString())
        .fontSize(50)
        .size({width: '100%', height: '100%'})
        .textAlign(TextAlign.Center)
      Button('+')// 显示一个+按钮
        .size({ width: 80, height: 80 })// 按钮大小
        .fontSize(50)// 按钮文字大小
        .onClick(() => { // 按钮点击事件
          this.count++; // count累加，触发build()方法回调
        })
        .margin(50)
    }
    .height('100%')
    .width('100%')
    .backgroundColor('#FF0000')
  }
}