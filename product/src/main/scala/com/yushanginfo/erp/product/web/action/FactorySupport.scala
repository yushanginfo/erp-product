package com.yushanginfo.erp.product.web.action

import org.beangle.commons.collection.Order
import org.beangle.commons.lang.Strings
import org.beangle.data.dao.OqlBuilder
import org.beangle.data.model.Entity
import org.beangle.data.model.pojo.Updated
import org.beangle.webmvc.api.view.View
import org.beangle.webmvc.entity.action.RestfulAction
import java.lang.reflect.Method

abstract class FactorySupport[T <: Entity[_]] extends RestfulAction[T] {

  override def getQueryBuilder(): OqlBuilder[T] = {
    val builder: OqlBuilder[T] = OqlBuilder.from(entityName, simpleEntityName)
    populateConditions(builder)
    //extraCondition(builder)
    var orderBy: String = get(Order.OrderStr).orNull
    if (null == orderBy) {
      orderBy = ""
    }
    if (Strings.isNotBlank(orderBy)) {
      orderBy += ","
    }
    orderBy += simpleEntityName + ".id"
    builder.orderBy(orderBy).limit(getPageLimit)
  }

  protected def extraCondition(builder: OqlBuilder[T]): Unit = {}
}