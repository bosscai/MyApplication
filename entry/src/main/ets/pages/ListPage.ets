import router from '@ohos.router'

class Student {
  public sid: number;
  public name: string;
  public age: number;
  public address: string;
  public avatar: string;

  constructor(sid: number = -1, name: string, age: number = 16, address: string = "Beijing", avatar: string = "") {
    this.sid = sid;
    this.name = name;
    this.age = age;
    this.address = address;
    this.avatar = avatar;
  }
}

abstract class BaseDataSource<T> implements IDataSource {
  private mDataSource: T[] = new Array();

  constructor(mDataSource: T[]) {
    this.mDataSource = mDataSource;
  }

  totalCount(): number {
    return this.mDataSource == null ? 0 : this.mDataSource.length
  }

  getData(index: number): T | null {
    return this.mDataSource[index];
  }

  registerDataChangeListener(listener: DataChangeListener): void {

  }

  unregisterDataChangeListener(listener: DataChangeListener): void {

  }
}

class StudentDataSource extends BaseDataSource<Student> {
  constructor(students: Student[]) {
    super(students)
  }
}

function mock(): Student[] {
  let students: Array<Student> = [];
  students[0] = new Student(0, "@State学习", 15, "address: ", "app.media.startIcon")
  for (let i = 1; i < 20; i++) {
    students[i] = new Student(i, "student " + i, i + 15, "address: " + i, "app.media.startIcon")
  }
  return students;
}

@Entry
@Component
struct ListPage {
  private student: Student[] = mock();
  private dataSource: StudentDataSource = new StudentDataSource(this.student);

  build() {

    Column({ space: 10 }) {
      List() {
        LazyForEach(this.dataSource, (item: Student, index:number) => {
          ListItem() {
            Row() {
              Image($r("app.media.app_icon"))
                .height('100%')
                .width(80)
              Column() {
                Text(this.getName(item))
                  .fontSize(20)
                Text("address: " + item.address)
                  .fontSize(17)
              }
              .margin({ left: 3 })
              .alignItems(HorizontalAlign.Start)
              .layoutWeight(1)
            }
            .width("100%")
            .height("100%")
          }.onClick(()=>{
            if (index == 0) {
              router.pushUrl({
                url:"pages/StateController"
              },()=>{
                console.log("push success")
              })
            }
          })
          .width("100%")
          .height(60)
        })
      }
      .divider({
        strokeWidth: 3,
        color: Color.Gray
      })
      .width('100%')
      .height('50%')
      .backgroundColor(Color.Pink)
    }
    .width('100%')
    .height('100%')
    .padding(10)

  }

  getName(item: Student): string {
    console.log("index:" + item.sid)
    return "index:" + item.sid + ", " + item.name;
  }
}