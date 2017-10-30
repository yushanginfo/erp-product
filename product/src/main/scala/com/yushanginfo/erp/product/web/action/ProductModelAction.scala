package com.yushanginfo.erp.product.web.action

import com.yushanginfo.erp.model.{ ProductModel, Scheme }

class ProductModelAction extends FactorySupport[ProductModel] {

  override protected def indexSetting(): Unit = {
    put("schemes", entityDao.getAll(classOf[Scheme]))
  }


}