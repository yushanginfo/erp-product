package com.yushanginfo.erp.model

import org.beangle.data.model.LongId
import org.beangle.data.model.pojo.Updated
import com.yushanginfo.erp.model.SchemeElementExpressionType.ExpType

class SchemeElement extends LongId with Updated {

  var scheme: Scheme = _

  var startAt: Int = _

  var endAt: Int = _

  var codeCategory: Option[CodeCategory] = None

  var literal: Option[String] = None

  var expType: ExpType = _
}

object SchemeElementExpressionType extends Enumeration {

  val NUMBER = new ExpType(1, "数字")

  val STRING = new ExpType(2, "字符")

  class ExpType(id: Int, n: String) extends Val(id) {
    
    val name = {
      n
    }
  }
}
