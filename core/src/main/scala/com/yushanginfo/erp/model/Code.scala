package com.yushanginfo.erp.model

import org.beangle.data.model.LongId
import org.beangle.data.model.pojo.{ Coded, Named, Updated }

class Code extends LongId with Coded with Named with Updated {

  var category: CodeCategory = _
}