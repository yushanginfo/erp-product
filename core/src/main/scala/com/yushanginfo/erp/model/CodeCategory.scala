package com.yushanginfo.erp.model

import scala.collection.mutable.{ Buffer, ListBuffer }

import org.beangle.data.model.LongId
import org.beangle.data.model.pojo.{ Coded, Named, Updated }

class CodeCategory extends LongId with Coded with Named with Updated {

  var codes: Buffer[Code] = new ListBuffer[Code]
}