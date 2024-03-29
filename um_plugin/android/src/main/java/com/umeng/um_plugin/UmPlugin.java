package com.umeng.um_plugin;

import android.app.Activity;
import android.util.Log;

import com.umeng.analytics.MobclickAgent;
import com.umeng.commonsdk.UMConfigure;

import java.util.HashMap;
import java.util.Map;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

/** UmPlugin */
public class UmPlugin implements MethodCallHandler {

  private Activity activity;

  /** Plugin registration. */
  public static void registerWith(Registrar registrar) {
    final MethodChannel channel = new MethodChannel(registrar.messenger(), "um_plugin");
    channel.setMethodCallHandler(new UmPlugin(registrar.activity()));
  }

  private UmPlugin(Activity activity) {
    this.activity = activity;
  }

  @Override
  public void onMethodCall(MethodCall call, Result result) {
    if (call.method.equals("setup")) {
      setup(call, result);
    } else if (call.method.equals("setAutoPageEnabled")) {
      setAutoPageEnabled(call, result);
    } else if (call.method.equals("addEvent")) {
      addEvent(call, result);
    } else if (call.method.equals("eventDict")) {
      eventDict(call, result);
    } else if (call.method.equals("beginPage")) {
      beginPageView(call, result);
    } else if (call.method.equals("endPage")) {
      endPageView(call, result);
    }  else {
      result.notImplemented();
    }
  }

  private  void  setup(MethodCall call, Result result) {
    Log.wtf("um appKey",(String) call.argument("appKey"));
    UMConfigure.init(activity, (String) call.argument("appKey"), (String) call.argument("channel"), UMConfigure.DEVICE_TYPE_PHONE, null);
    UMConfigure.setLogEnabled(true);
  }

  private  void  addEvent(MethodCall call, Result result) {
    MobclickAgent.onEvent(activity,(String) call.argument("eventId"), (String) call.argument("label"));
  }

  private  void  eventDict(MethodCall call, Result result) {
    HashMap<String, String> map = new HashMap<String, String>();
    map.putAll((Map<String, String>) call.argument("dict"));
    MobclickAgent.onEvent(activity,(String) call.argument("eventId"), map);
  }

  private  void setAutoPageEnabled(MethodCall call, Result result) {
    MobclickAgent.setPageCollectionMode(MobclickAgent.PageMode.AUTO);
  }

  private  void  beginPageView(MethodCall call, Result result) {
    MobclickAgent.onPageStart((String) call.argument("name"));
    MobclickAgent.onPause(activity);
  }
  
  private  void  endPageView(MethodCall call, Result result) {
    MobclickAgent.onPageEnd((String) call.argument("name"));
    MobclickAgent.onPause(activity);
  }


}
