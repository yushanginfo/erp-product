package com.yushanginfo.erp.code.web.action

import java.io.{ ByteArrayInputStream, ByteArrayOutputStream }
import java.util.Hashtable

import org.beangle.webmvc.api.action.ActionSupport
import org.beangle.webmvc.api.annotation.{ mapping, param }
import org.beangle.webmvc.api.view.{ Stream, View }

import com.google.zxing.{ BarcodeFormat, EncodeHintType, MultiFormatWriter }
import com.yushanginfo.erp.product.web.helper.MatrixToImageWriter

class BarAction extends ActionSupport {
  @mapping("{code}")
  def index(@param("code") code: String): View = {
    val width = 300;
    val height = 100;
    //二维码的图片格式
    val format = "jpg"
    val hints = new Hashtable[EncodeHintType, Any]();
    //内容所使用编码
    hints.put(EncodeHintType.CHARACTER_SET, "utf-8");

    val bitMatrix = new MultiFormatWriter().encode(code, BarcodeFormat.CODE_128, width, height, hints)
    val buf = new ByteArrayOutputStream()
    MatrixToImageWriter.writeToStream(bitMatrix, format, buf)
    Stream(new ByteArrayInputStream(buf.toByteArray), " 	image/jpeg", code + "." + format)
  }
}