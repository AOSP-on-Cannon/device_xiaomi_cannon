/*
 * Copyright (C) 2021 The LineageOS Project
 *           (C) 2022 StatiX
 * SPDX-License-Identifier: Apache-2.0
 */

package com.android.cannonextensions

import android.os.Bundle
import com.android.settingslib.collapsingtoolbar.CollapsingToolbarBaseActivity
import com.android.settingslib.collapsingtoolbar.R

class DozeSettingsActivity : CollapsingToolbarBaseActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        fragmentManager
            .beginTransaction()
            .replace(R.id.content_frame, DozeSettingsFragment(), TAG)
            .commit()
    }

    companion object {
        private const val TAG = "DozeSettingsActivity"
    }
}
