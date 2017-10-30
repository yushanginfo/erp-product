package com.yushanginfo.erp.model

import scala.collection.mutable.{ Buffer, ListBuffer }

import org.beangle.data.model.LongId
import org.beangle.data.model.pojo.{ Named, Updated }
import org.beangle.data.model.pojo.TemporalOn

class Scheme extends LongId with Named with Updated with TemporalOn {

  var productCategory: ProductCategory = _

  var elements: Buffer[SchemeElement] = new ListBuffer[SchemeElement]
}