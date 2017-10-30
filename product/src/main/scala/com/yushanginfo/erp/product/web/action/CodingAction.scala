package com.yushanginfo.erp.product.web.action

import java.time.Instant

import org.beangle.data.model.pojo.Updated
import org.beangle.webmvc.api.annotation.ignore
import org.beangle.webmvc.api.view.View
import org.beangle.webmvc.execution.Handler

import com.yushanginfo.erp.model.ProductModel
import com.yushanginfo.erp.model.Scheme
import org.beangle.data.dao.OqlBuilder
import com.yushanginfo.erp.model.Enterprise

class CodingAction extends FactorySupport[ProductModel] {

  override protected def indexSetting(): Unit = {
    val query = OqlBuilder.from(classOf[ProductModel], "pm").select("count(*)")
    val rs = entityDao.search(query)
    put("productModelCount", rs.head)

    val enterprises = entityDao.getAll(classOf[Enterprise])
    put("enterprises", enterprises)
    forward()
  }

  override protected def editSetting(entity: ProductModel): Unit = {
    getLong("schemeId") match {
      case None           => put("schemes", entityDao.getAll(classOf[Scheme]))
      case Some(schemeId) => put("scheme", entityDao.get(classOf[Scheme], schemeId))
    }
  }

  @ignore
  override protected def saveAndRedirect(model: ProductModel): View = {
    try {
      val code = model.code
      val query = OqlBuilder.from(classOf[ProductModel], "pm")
      query.where("pm.code=:code", code)
      val pms = entityDao.search(query)
      var pm = model
      if (pms.isEmpty) {
        model.updatedAt = Instant.now
        saveOrUpdate(model)
      } else {
        pm = pms.head
      }
      redirect("info", "&id=" + pm.id, "info.save.success")
    } catch {
      case e: Exception => {
        val redirectTo = Handler.mapping.method.getName match {
          case "save"   => "editNew"
          case "update" => "edit"
        }
        logger.info("saveAndRedirect failure", e)
        redirect(redirectTo, "info.save.failure")
      }
    }
  }

}