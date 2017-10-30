package com.yushanginfo.erp.product.web

import org.beangle.cdi.bind.BindModule
import com.yushanginfo.erp.product.web.action.{ CodeAction, CodeCategoryAction, ProductCategoryAction, ProductModelAction, CodingAction, SchemeAction, SchemeElementAction }
import com.yushanginfo.erp.product.web.action.IndexAction
import com.yushanginfo.erp.code.web.action.QrAction
import com.yushanginfo.erp.code.web.action.BarAction

class DefaultModule extends BindModule {

  protected override def binding() {
    bind(classOf[ProductCategoryAction], classOf[CodeCategoryAction], classOf[CodeAction], classOf[SchemeAction])
    bind(classOf[SchemeElementAction], classOf[ProductModelAction], classOf[CodingAction])
    bind(classOf[IndexAction],classOf[QrAction],classOf[BarAction])
  }
}