package com.yushanginfo.erp.model



import org.beangle.commons.collection.Collections
import org.beangle.data.model.LongId
import org.beangle.data.model.pojo.{ Coded, Named, Updated }
import scala.collection.mutable.Buffer
import scala.collection.mutable.ListBuffer
import java.util.ArrayList

class ProductCategory extends LongId with Coded with Named with Updated {

  var parent: Option[ProductCategory] = None

  var children = Collections.newBuffer[ProductCategory]

  def getFullName(): String = {
    fullNameCollect(parent.orNull) + name
  }

  private def fullNameCollect(parent: ProductCategory): String = {
    if (null == parent) "" else parent.getFullName() + "---"
  }

  def getFullNameWithCode(): String = {
    fullNameCollectWithCode(parent.orNull) + name + "(" + code + ")"
  }

  private def fullNameCollectWithCode(parent: ProductCategory): String = {
    if (null == parent) "" else parent.getFullNameWithCode() + "---"
  }
  
  def descendants(): Buffer[ProductCategory] = {
    var allChildren = Collections.newBuffer[ProductCategory]
    if (Collections.isNotEmpty(children)) {
      allChildren ++= children
      children.foreach((child: ProductCategory) => allChildren ++= child.descendants)
    }
    allChildren
  }
}