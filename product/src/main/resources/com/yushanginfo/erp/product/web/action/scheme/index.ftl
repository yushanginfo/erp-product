[@b.head/]
  [@b.toolbar title="方案"/]
  <table class="indexpanel">
    <tr>
      <td class="index_view">
        [@b.form title="ui.searchForm" name="searchForm" action="!search" target="schemes" theme="search"]
          [@b.textfields names="scheme.name;名称"/]
          [@b.select label="产品种类" name="productCategoryId" items=productCategories?sort_by(["fullName"]) option="id,fullName" empty="..."/]
          [@b.startend label="开用日期,结束日期" name="scheme.beginOn,scheme.endOn" format="date"/]
        [/@]
      </td>
      <td class="index_context">
        [@b.div id="schemes"/]
      </td>
    </tr>
  </table>
  <script>
    $(function() {
      $(document).ready(function() {
        document.title = "方案";
        
        bg.form.submit("searchForm", "${b.url("!search")}", "schemes");
      });
    });
  </script>
[@b.foot/]