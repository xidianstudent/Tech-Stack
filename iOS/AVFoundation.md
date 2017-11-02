# AVFoundation
> AVFoundation可以用来play和create基于时间轴的音视频。比如可以播放，编辑和重编码媒体文件。

###总览
AVFoundation框架API有两部分：Video和Audio。
其中Audio也可以由高层API来处理：**AVAudioPlayer**（音频播放）和**AVAudioRecorder**（音频录制）。如果需要配置Audio的行为模式，可以使用**AVAudioSession**。
  
###通过AVFoundation操作Media
**AVAsset**类是AVFoundation的基础类，用来表示Media信息。AVAsset实例是由多个Media数据（VideoTracks和AudioTracks）组成，它提供了所有Media的汇总信息，包括title，duration，natural present size等。AVAsset是一个父类，子类包括**AVURLAsset**（URL）和**AVComposition**（Edit）。

**AVAssetTrack**是AVAsset的内部片段，包括VideoTrack和AudioTrack。

> 另外一个重要的概念是，AVAsset和AVAssetTrack初始化后，并不代表马上可以使用（例如MP3需要时间去解析）。而是用block的方式。

###Playback
AVFoundation定义了*player item*，用来分离AVAsset。这样就可以通过多个*player item*来播放同一个AVAsset实例。
可以通过**AVPlayer**来播放*player item*，并直接将结果渲染到**Core Animation layer**上。

###Read，Write and Reencoding Asset
AVFoundation允许用户重新生成AVAsset。

* AVAssetExportsession方式
* AVAssetReader和AVAssetWriter

### 缩略图
生成视频的缩略图，AVFoundation提供了 **AVAssetImageGenerator**类产生缩略图。

###编辑功能
*  **AVComposition**

> AVFoundation中，使用AVComposition类从AVAsset中抽取Track生成新的AVAsset。通过**AVMutableComposition**来增加或删除*tracks*，并改变*track*的顺序，以及修改audio的音量，video的透明度。**AVCompisition**保存在内存当中，包含了*tracks*，可以通过AVAssetExportSession导出到文件。
>

* **AVAssetReader和AVAssetWriter**

> 通过AVAssetWriter将sample buffer或image保存到文件。

###拍照和视频录制
camera和micphone的录制，通过**AVCaptureSession**类完成。
*capture session*定义了从输入设备到输出之间的数据流向。输入设备可以是camera或者micphone，输出可以是一个layer或者文件等。我们可以通过给*capture session*发送消息来控制数据流向，比如数据流的开始，结束。

