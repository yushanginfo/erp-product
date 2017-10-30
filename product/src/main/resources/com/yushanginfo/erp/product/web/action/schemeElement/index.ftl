[@b.head/]
  [@b.toolbar title="方案组成部分"/]
  <table class="indexpanel">
    <tr>
      <td class="index_view">
        [@b.form title="ui.searchForm" name="searchForm" action="!search" target="elements" theme="search"]
          <input type="hidden" value="schemeElement.scheme.id,schemeElement.startAt" name="orderBy"/>
          [@b.select label="方案" name="schemeElement.scheme.id" items=schemes?sort_by(["name"]) empty="..."/]
          [@b.textfields names="schemeElement.startAt;开始位,schemeElement.endAt;结束位"/]
          [@b.select label="代码种类" name="schemeElement.name" items=codeCategories?sort_by(["name"]) empty="..."/]
          [@b.select label="表达类型" name="schemeElement.expType" items=expTypes empty="..."/]
        [/@]
      </td>
      <td class="index_context">
        [@b.div id="elements"/]
      </td>
    </tr>
  </table>
  <script>
    $(function() {
      $(document).ready(function() {
        document.title = "方案组成部分";
        bg.form.submit("searchForm", "${b.url("!search")}", "elements");
      });
    });
  </script>
[@b.foot/]