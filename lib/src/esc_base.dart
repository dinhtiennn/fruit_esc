import 'package:psdk_device_adapter/psdk_device_adapter.dart';
import 'package:psdk_frame_father/father/command/print/commander.dart';
import 'package:psdk_frame_father/father/psdk.dart';
import 'package:psdk_frame_father/father/types/lifecycle.dart';

import '../psdk_fruit_esc.dart';

abstract class BasicESC<T extends BasicESC<T>> extends PSDK<T> {
  late Lifecycle _lifecycle;
  late Commander _commander;

  BasicESC({required Lifecycle lifecycle}) {
    _commander = Commander.make();
    _lifecycle = lifecycle;
  }

  @override
  ConnectedDevice connectedDevice() {
    return _lifecycle.connectedDevice;
  }

  @override
  Commander commander() {
    return _commander;
  }

  /// 走纸一行命令(3.75mm)
  /// @param row 走纸点行
  T lineRow({required int row}) {
    return push(ELineRow(row: row));
  }

  /// 走纸命令
  /// @param dot 走纸点行
  T lineDot({required int dot}) {
    return push(ELineDot(dot: dot));
  }

  /// 回纸命令
  ///
  /// @param dot 走纸点行
  /// @return
  T backLineDot({required int dot}) {
    return push(EBackLineDot(dot: dot));
  }

  /// 查询电量
  T batteryVolume() {
    return push(EBatteryVolume());
  }

  /// 使能打印机
  T enable() {
    return push(EEnable());
  }

  /// 获取关机时间
  T getShutdownTime() {
    return push(EGetShutdownTime());
  }

  /// 打印图片
  T image({required EImage arg}) {
    return push(arg);
  }

  /// 学习缝隙
  T learnLabelGap() {
    return push(ELearnLabelGap());
  }

  /// 画线
  T line({required ELine arg}) {
    return push(arg);
  }

  /// 设置打印起始横向位置
  ///
  /// @param location 0:居左 1:居中 2:居右
  T location({required int location}) {
    return push(ELocation(location: location));
  }

  /// 查询MAC
  T mac() {
    return push(EMac());
  }

  /// 查询打印机所有信息
  T info() {
    return push(EInfo());
  }

  /// 查询打印机型号
  T model() {
    return push(EModel());
  }

  /// 查询蓝牙名称
  T name() {
    return push(EName());
  }

  /// 纸张类型
  T paperType({required EPaperType arg}) {
    return push(arg);
  }

  /// 纸张类型(Q1 Q2 Q3 D11 D30 B21 B22用这个)
  T paperTypeQ3({required EPaperTypeQ3 arg}) {
    return push(arg);
  }

  /// 获取当前设备纸张类型(Q1 Q2 Q3 D11 D30 B21 B22用这个)
  /// 返回值：0X01 黑标纸，0x02 连续纸，否则:间隙
  T getPaperTypeQ3() {
    return push(EGetPaperTypeQ3());
  }

  /// 打印定位
  T position() {
    return push(EPosition());
  }

  /// 查询打印机固件版本
  T printerVersion() {
    return push(EPrinterVersion());
  }

  /// 设置关机时间(分钟)
  T setShutdownTime({required int time}) {
    return push(ESetShutdownTime(time: time));
  }

  /// 查询SN
  T sn() {
    return push(ESN());
  }

  /// 查询打印机状态
  T state() {
    return push(EState());
  }

  /// 结束打印任务
  T stopJob() {
    return push(EStopJob());
  }

  /// 设置打印机浓度(0-2)
  /// @param thickness 0:低浓度 1:中浓度 2:高浓度
  T thickness({required int thickness}) {
    return push(EThickness(thickness: thickness));
  }

  /// 查询蓝牙固件版本
  T version() {
    return push(EVersion());
  }

  /// 唤醒打印机
  T wakeup() {
    return push(EWakeup());
  }

  /// 获取标签纸张信息
  T getNfcPaper() {
    return push(ENfcPaper());
  }

  /// 获取标签UID
  T getNfcUID() {
    return push(ENfcUID());
  }

  /// 获取标签已使用长度
  T getNfcUsedLength() {
    return push(ENfcUsedLength());
  }

  /// 获取标签剩余长度
  T getNfcRestLength() {
    return push(ENfcRestLength());
  }

  /// 设置蓝牙类型(支持压缩的机器需要调用)
  T setBTType() {
    return push(EBTType());
  }

  /// 切刀(立刻切)
  T cut() {
    return push(ECut());
  }

  /// 切刀(固件固定走纸后才切)
  T lineDotCut() {
    return push(ELineDotCut());
  }

  /// 设置当前时间(部分机型适用)
  T setCurrentTime({required ESetCurrentTime arg}) {
    return push(arg);
  }

  /// 使能灰阶
  T enableGray() {
    return push(EEnableGray());
  }

  /// 打印图片(灰阶)
  T imageGray({required EImageGray arg}) {
    return push(arg);
  }

  /// 查询NN
  T nn() {
    return push(ENN());
  }
}
