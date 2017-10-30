package com.yushanginfo.erp.model

import org.beangle.data.model.LongId
import org.beangle.data.model.pojo.{ Coded, Updated }
import org.beangle.data.model.pojo.Remark

class ProductModel extends LongId with Coded with Updated with Remark {

  var category: ProductCategory = _
  
}