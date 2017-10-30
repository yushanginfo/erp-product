package com.yushanginfo.erp.product.web.action

import java.time.Instant

import scala.collection.mutable.Set

import org.beangle.commons.collection.Collections
import org.beangle.commons.lang.Strings
import org.beangle.data.dao.OqlBuilder
import org.beangle.webmvc.api.annotation.param
import org.beangle.webmvc.api.view.View
import com.yushanginfo.erp.model.ProductCategory

import javax.persistence.EntityNotFoundException
import org.beangle.data.model.pojo.Updated

class ProductCategoryAction extends FactorySupport[ProductCategory] {

  override protected def editSetting(entity: ProductCategory): Unit = {
    super.editSetting(entity)
    
    val builder = OqlBuilder.from(classOf[ProductCategory], "productCategory")
    if (entity.persisted) {
      builder.where("productCategory != :productCategory", entity);
    }
    builder.orderBy("productCategory.name, productCategory.code")
    var parent = Collections.newBuffer[ProductCategory] ++ entityDao.search(builder)
    if (entity.persisted) {
      val filters = Collections.newSet[ProductCategory]
      putParents(filters, entity)
      
      parent --= filters
    }

    put("parent", parent)
  }

  def checkCodeAjax(@param("id") id: String, @param("code") code: String, @param("parentId") parentId: String): View = {
    val builder = OqlBuilder.from(classOf[ProductCategory], "productCategory")
    if (Strings.isNotBlank(id)) {
      builder.where("productCategory.id != :id", id.toLong)

      val hisPC = entityDao.get(classOf[ProductCategory], id.toLong)
      // 防止异常
      if (null == hisPC) {
        throw new EntityNotFoundException("ID of " + id + " of Entity is not found!!!")
      }
      val filters = Collections.newSet[ProductCategory]
      filters += hisPC
      putParents(filters, hisPC)
      builder.where("productCategory not in (:productCategories)", filters)
    }
    builder.where("productCategory.code = :code", code);
    put("isOk", entityDao.search(builder).isEmpty)
    
    forward()
  }

  final private def putParents(parents: Set[ProductCategory], current: ProductCategory): Unit = {
    if (Collections.isNotEmpty(current.children)) {
      parents ++= current.children
      current.children.foreach(child => putParents(parents, child))
    }
  }
}