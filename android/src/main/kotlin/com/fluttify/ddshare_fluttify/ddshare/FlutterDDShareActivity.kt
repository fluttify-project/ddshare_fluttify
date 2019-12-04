package com.fluttify.ddshare_fluttify.ddshare

import android.app.Activity
import com.android.dingtalk.share.ddsharemodule.IDDAPIEventHandler
import com.android.dingtalk.share.ddsharemodule.message.BaseReq
import com.android.dingtalk.share.ddsharemodule.message.BaseResp
import com.android.dingtalk.share.ddsharemodule.IDDShareApi
import com.android.dingtalk.share.ddsharemodule.DDShareApiFactory
import android.os.Bundle
import io.flutter.Log
import android.widget.Toast
import com.android.dingtalk.share.ddsharemodule.message.SendAuth
import com.android.dingtalk.share.ddsharemodule.ShareConstant
import com.fluttify.ddshare_fluttify.handler.DDResponseHandler


open class FlutterDDShareActivity : Activity(), IDDAPIEventHandler{

    private var mIDDShareApi: IDDShareApi? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        Log.d("lzc", "onCreate==========>")
        try {
            //activity的export为true，try起来，防止第三方拒绝服务攻击
            mIDDShareApi = DDShareApiFactory.createDDShareApi(this, "", false)
            mIDDShareApi?.handleIntent(intent, this)
        } catch (e: Exception) {
            e.printStackTrace()
            Log.d("lzc", "e===========>$e")
        }

    }

    public override fun onResp(baseResp: BaseResp?) {
        val errCode = baseResp?.mErrCode
        Log.d("lzc", "errorCode==========>$errCode")
        val errMsg = baseResp?.mErrStr
        Log.d("lzc", "errMsg==========>$errMsg")
        val type = baseResp?.type
        if (type == ShareConstant.COMMAND_SENDAUTH_V2 && baseResp is SendAuth.Resp) {
            when (errCode) {
                BaseResp.ErrCode.ERR_OK -> Toast.makeText(this, "授权成功，授权码为:" + baseResp.code, Toast.LENGTH_SHORT).show()
                BaseResp.ErrCode.ERR_USER_CANCEL -> Toast.makeText(this, "授权取消", Toast.LENGTH_SHORT).show()
                else -> Toast.makeText(this, "授权异常" + baseResp.mErrStr, Toast.LENGTH_SHORT).show()
            }
        } else {
            when (errCode) {
                BaseResp.ErrCode.ERR_OK -> DDResponseHandler.handleResponse(1) //Toast.makeText(this, "分享成功", Toast.LENGTH_SHORT).show()
                BaseResp.ErrCode.ERR_USER_CANCEL -> DDResponseHandler.handleResponse(0) //Toast.makeText(this, "分享取消", Toast.LENGTH_SHORT).show()
                else -> DDResponseHandler.handleResponse(-1) //Toast.makeText(this, "分享失败" + baseResp?.mErrStr, Toast.LENGTH_SHORT).show()
            }
        }

        finish()
    }

    public override fun onReq(baseReq: BaseReq?) {
        Log.d("lzc", "onReq=============>" )
    }

}