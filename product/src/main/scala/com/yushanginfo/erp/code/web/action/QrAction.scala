package com.yushanginfo.erp.code.web.action

import java.io.ByteArrayOutputStream
import java.util.Hashtable
import org.beangle.webmvc.api.action.ActionSupport
import org.beangle.webmvc.api.annotation.param
import org.beangle.webmvc.api.annotation.mapping
import org.beangle.webmvc.api.view.Stream
import org.beangle.webmvc.api.view.View
import com.google.zxing.BarcodeFormat
import com.google.zxing.EncodeHintType
import com.google.zxing.MultiFormatWriter
import com.yushanginfo.erp.product.web.helper.MatrixToImageWriter
import java.io.ByteArrayInputStream

class QrAction extends ActionSupport {

  @mapping("{code}")
  def index(@param("code") code: String): View = {
    val width = 300;
    val height = 300;
    //二维码的图片格式
    val format = "jpg"
    val hints = new Hashtable[EncodeHintType, Any]();
    //内容所使用编码
    hints.put(EncodeHintType.CHARACTER_SET, "utf-8");

    val bitMatrix = new MultiFormatWriter().encode(code, BarcodeFormat.QR_CODE, width, height, hints)
    val buf = new ByteArrayOutputStream()
    MatrixToImageWriter.writeToStream(bitMatrix, format, buf)
    Stream(new ByteArrayInputStream(buf.toByteArray), " 	image/jpeg", code + "." + format)
  }
}