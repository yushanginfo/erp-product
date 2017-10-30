package com.yushanginfo.erp.product.web.action

import org.beangle.commons.lang.Strings
import org.beangle.data.dao.OqlBuilder
import org.beangle.webmvc.api.annotation.param
import org.beangle.webmvc.api.view.View
import com.yushanginfo.erp.model.{ CodeCategory, ProductCategory }

class CodeCategoryAction extends FactorySupport[CodeCategory] {

  def checkCodeAjax(@param("id") id: String, @param("code") code: String): View = {
    val builder = OqlBuilder.from(classOf[CodeCategory], "codeCategory")
    if (Strings.isNotBlank(id)) {
      builder.where("codeCategory.id != :id", id.toLong)
    }
    builder.where("codeCategory.code = :code", code);
    put("isOk", entityDao.search(builder).isEmpty)
    
    forward()
  }
}