# changeAppIconDemo
动态修改app图标demo

先看效果
![iconchange.gif](https://upload-images.jianshu.io/upload_images/2893691-4e3e79b57aa2d385.gif?imageMogr2/auto-orient/strip)

注意三个地方就行了
1.将需要替换的备选icon图片放在工程文件夹下，不要放在Assets.xcassets文件夹下。
2.在info.plist里面配置相关键值对，如下图所示
![icon.jpg](https://upload-images.jianshu.io/upload_images/2893691-b93b980911af3680.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
3.在你想要添加切换icon功能的控制器下，添加如下关键代码即可：
```
- (void)viewDidLoad {
[super viewDidLoad];
// Do any additional setup after loading the view.
UIButton *changeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
changeBtn.frame = CGRectMake(100, 100, 100, 40);
[changeBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
[changeBtn setTitle:@"替换icon" forState:UIControlStateNormal];
[changeBtn setTitle:@"还原icon" forState:UIControlStateSelected];
[changeBtn addTarget:self action:@selector(changeClick:) forControlEvents:UIControlEventTouchUpInside];
[self.view addSubview:changeBtn];
}


-(void)changeClick:(UIButton *)sender{
sender.selected = !sender.isSelected;
if (sender.selected == YES) {
[[UIApplication sharedApplication] setAlternateIconName:@"iconbear" completionHandler:^(NSError * _Nullable error) {
if (error == nil) {
NSLog(@"替换成功");
}else{
NSLog(@"替换失败");
}
}];
}else{
[[UIApplication sharedApplication] setAlternateIconName:nil completionHandler:^(NSError * _Nullable error) {
if (error == nil) {
NSLog(@"还原成功");
}else{
NSLog(@"还原失败");
}
}];
}
}

```
根据最新的苹果app审核指南
>4.6 备选 App 图标
App 可以使用自定图标以传达特定信息 (例如表达对某个运动团队的喜爱)，前提是每次更改都由用户发起，**并且 app 中应包含恢复至原始图标的设置**。所有图标变体必须与 app 的内容相关，并且更改内容在所有系统资源之间应保持一致，以便“设置”和“通知”等位置中显示的图标与新的 Springboard 图标相吻合。这项功能不可用于动态、自动或连续性更改，例如用于反映最新天气信息和日历通知等。

上述提到需要包含一个恢复至原始图标的设置，那么我们就需要按照要求添加一个一键恢复原始图标的功能即可。

本人微信公众号：放心安慰剂

![image](//upload-images.jianshu.io/upload_images/2893691-7c7ceba73171f2fd.jpg?imageMogr2/auto-orient/strip|imageView2/2/w/430)

