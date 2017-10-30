package com.yushanginfo.erp.product.web.action

import com.yushanginfo.erp.model.{ CodeCategory, Scheme, SchemeElement }
import com.yushanginfo.erp.model.SchemeElement
import com.yushanginfo.erp.model.SchemeElement
import com.yushanginfo.erp.model.SchemeElement
import com.yushanginfo.erp.model.SchemeElement
import com.yushanginfo.erp.model.SchemeElement
import com.yushanginfo.erp.model.SchemeElementExpressionType

class SchemeElementAction extends FactorySupport[SchemeElement] {

  override protected def indexSetting(): Unit = {
    put("schemes", entityDao.getAll(classOf[Scheme]))
    put("codeCategories", entityDao.getAll(classOf[CodeCategory]))
    put("expTypes", SchemeElementExpressionType.values)
  }

  override protected def editSetting(element:SchemeElement): Unit = {
    put("schemes", entityDao.getAll(classOf[Scheme]))
    put("codeCategories", entityDao.getAll(classOf[CodeCategory]))
    put("expTypes", SchemeElementExpressionType.values)
  }
}