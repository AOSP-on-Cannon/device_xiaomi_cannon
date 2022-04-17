/*
 * Copyright (C) 2021 The LineageOS Project
 *           (C) 2022 StatiX
 * SPDX-License-Identifier: Apache-2.0
 */

package com.android.cannonextensions

import android.app.Service
import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.content.IntentFilter
import android.os.IBinder
import android.util.Log

class DozeService : Service() {
    private lateinit var pickupSensor: PickupSensor
    private lateinit var pocketSensor: PocketSensor

    private val screenStateReceiver = object : BroadcastReceiver() {
        override fun onReceive(context: Context, intent: Intent) {
            when (intent.action) {
                Intent.ACTION_SCREEN_ON -> onDisplayOn()
                Intent.ACTION_SCREEN_OFF -> onDisplayOff()
            }
        }
    }

    override fun onCreate() {
        Log.d(TAG, "Creating service")
        pickupSensor = PickupSensor(this, resources.getString(R.string.pickup_sensor_type))
        pocketSensor = PocketSensor(this, resources.getString(R.string.pocket_sensor_type))

        val screenStateFilter = IntentFilter()
        screenStateFilter.addAction(Intent.ACTION_SCREEN_ON)
        screenStateFilter.addAction(Intent.ACTION_SCREEN_OFF)
        registerReceiver(screenStateReceiver, screenStateFilter)
    }

    override fun onStartCommand(intent: Intent?, flags: Int, startId: Int): Int {
        return START_STICKY
    }

    override fun onDestroy() {
        super.onDestroy()

        unregisterReceiver(screenStateReceiver)
        pickupSensor.disable()
        pocketSensor.disable()
    }

    override fun onBind(intent: Intent?): IBinder? = null

    private fun onDisplayOn() {
        if (DozeUtils.isPickUpEnabled(this)) {
            pickupSensor.disable()
        }
        if (DozeUtils.isPocketEnabled(this)) {
            pocketSensor.disable()
        }
    }

    private fun onDisplayOff() {
        if (DozeUtils.isPickUpEnabled(this)) {
            pickupSensor.enable()
        }
        if (DozeUtils.isPocketEnabled(this)) {
            pocketSensor.enable()
        }
    }

    companion object {
        private const val TAG = "DozeService"
    }
}
