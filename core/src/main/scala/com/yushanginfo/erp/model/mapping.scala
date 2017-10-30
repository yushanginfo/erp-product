package com.yushanginfo.erp.model

import org.beangle.data.orm.MappingModule

class DefaultMapping extends MappingModule {

  def binding(): Unit = {
    defaultIdGenerator("auto_increment")

    bind[Enterprise]

    bind[ProductCategory].on(e => declare(
      e.code is (length(50), notnull),
      e.name is (length(200), notnull),
      e.children is depends("parent")))

    bind[CodeCategory].on(e => declare(
      e.code is (length(50), notnull),
      e.name is (length(200), notnull),
      e.codes is depends("category")))

    bind[Code].on(e => declare(
      e.code is (length(50), notnull),
      e.name is (length(200), notnull)))

    bind[Scheme].on(e => declare(
      e.name is length(200),
      e.elements is depends("scheme")))

    bind[SchemeElement] //FIXME

    bind[ProductModel].on(e => declare(
      e.code is (length(200), unique, notnull)))
  }
}