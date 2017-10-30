package com.yushanginfo.erp.product.web.action

import org.beangle.commons.lang.Strings
import org.beangle.data.dao.OqlBuilder
import org.beangle.webmvc.api.annotation.param
import org.beangle.webmvc.api.view.View
import com.yushanginfo.erp.model.{ Code, CodeCategory }
import org.beangle.webmvc.api.context.ActionContext

class CodeAction extends FactorySupport[Code] {

  override protected def indexSetting(): Unit = {
    put("categories", entityDao.getAll(classOf[CodeCategory]))
  }

  override protected def editSetting(entity: Code): Unit = {
    super.editSetting(entity)
    indexSetting
  }
  
  def checkCodeAjax(@param("id") id: String, @param("code") code: String, @param("categoryId") categoryId: String): View = {
    val builder = OqlBuilder.from(classOf[Code], "code")
    if (Strings.isNotBlank(id)) {
      builder.where("code.id != :id", id.toLong)
    }
    builder.where("code.code = :code", code);
    builder.where("code.category.id = :categoryId", categoryId.toLong);
    put("isOk", entityDao.search(builder).isEmpty)
    
    forward()
  }
}