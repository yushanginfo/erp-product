package com.yushanginfo.erp.product.web.action

import scala.collection.mutable.ListBuffer

import org.beangle.commons.lang.Strings
import org.beangle.data.dao.OqlBuilder
import org.beangle.webmvc.api.annotation.param
import org.beangle.webmvc.api.view.View
import com.yushanginfo.erp.model.{ ProductCategory, Scheme }

class SchemeAction extends FactorySupport[Scheme] {

  override protected def indexSetting(): Unit = {
    put("productCategories", entityDao.getAll(classOf[ProductCategory]))
  }

  override protected def extraCondition(builder: OqlBuilder[Scheme]): Unit = {
    getLong("productCategoryId") match {
      case Some(productCategoryId) =>
        val productCategory = entityDao.get(classOf[ProductCategory], productCategoryId)
        var productCategorys = new ListBuffer[ProductCategory]
        productCategorys += productCategory
        productCategorys ++= productCategory.descendants
        builder.where("scheme.productCategory in (:productCategories)", productCategorys)
      case None =>
    }
  }

  override protected def editSetting(entity: Scheme): Unit = {
    indexSetting
    super.editSetting(entity)
  }

  def checkNameAjax(@param("id") id: String, @param("name") name: String): View = {
    val builder = OqlBuilder.from(classOf[Scheme], "scheme")
    if (Strings.isNotBlank(id)) {
      builder.where("scheme.id != :schemeId", id.toLong)
    }
    builder.where("scheme.name = :name", name.trim)
    put("isOk", entityDao.search(builder).isEmpty)
    forward()
  }
  
}