package com.fluttify.ddshare_fluttify.handler

import io.flutter.plugin.common.MethodChannel

public class DDResponseHandler {
    companion object {
        public var channel: MethodChannel? = null
        @JvmStatic
        public fun setMethodChannel(channel: MethodChannel) {
            DDResponseHandler.channel = channel
        }

        /// 1-成功，0-取消，-1-失败
        fun handleResponse(response: Int) {
            channel?.invokeMethod("Callback::com.android.dingtalk.share.ddsharemodule.IDDAPIEventHandler::onResp", response)
        }
    }

}