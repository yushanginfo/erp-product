package com.yushanginfo.erp.product.web.action

import org.beangle.data.dao.EntityDao
import org.beangle.webmvc.api.action.ActionSupport
import org.beangle.webmvc.api.view.View
import com.yushanginfo.erp.model.Enterprise

class IndexAction extends ActionSupport {

  var entityDao: EntityDao = _

  def index(): View = {
    val enterprises = entityDao.getAll(classOf[Enterprise])
    put("enterprises", enterprises)
    forward()
  }
}