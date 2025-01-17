﻿package com.ekoaw.audio.server.application.util

import com.ekoaw.audio.server.domain.model.ResponseModel

object ResponseBuilder {
    fun success(message: String = "success"): ResponseModel {
        return ResponseModel(status = "success", message = message)
    }

    fun error(message: String, code: String? = null): ResponseModel {
        return ResponseModel(status = "error", message = message, code = code)
    }
}
