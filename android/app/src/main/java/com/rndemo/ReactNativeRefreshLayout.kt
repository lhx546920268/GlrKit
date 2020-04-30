package com.rndemo

import com.facebook.react.module.annotations.ReactModule
import com.facebook.react.uimanager.ThemedReactContext
import com.facebook.react.uimanager.ViewGroupManager
import com.scwang.smartrefresh.layout.SmartRefreshLayout
import com.scwang.smartrefresh.layout.header.ClassicsHeader

@ReactModule(name = ReactNativeRefreshLayout.MODULE_NAME)
class ReactNativeRefreshLayout : ViewGroupManager<SmartRefreshLayout>{

    //module名称
    companion object{
        const val MODULE_NAME = "RefreshLayout"
    }

    override fun createViewInstance(reactContext: ThemedReactContext): SmartRefreshLayout {
        val layout = SmartRefreshLayout(reactContext)
        layout.setEnableLoadMore(false)
        layout.setEnableRefresh(true)
        layout.setRefreshHeader(ClassicsHeader(reactContext))

        return layout
    }

    override fun getName(): String {
        return MODULE_NAME
    }


}