[@b.head/]
<div class="container">
    <div class="hero-unit">
      <h1>${productModel.category.name} ${productModel.code} <img  style="height:30px" src="${base}/code/bar/${productModel.code}.jpg"/></h1>
      <p>${productModel.remark!}</p>
      <p><img  style="height:100px" src="${base}/code/qr/${productModel.code}.jpg"/></p>
      <p>
        [@b.a class="btn btn-primary btn-large" href="!index"]
          首页
        [/@]
        &nbsp;
        [@b.a class="btn btn-primary btn-large" href="!search"]
          查找
        [/@]
        &nbsp;
        [@b.a class="btn btn-primary btn-large" href="!editNew"]
          再编一个
        [/@]
      </p>
    </div>
</div>
[@b.foot/]