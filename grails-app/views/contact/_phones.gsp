<script type="text/javascript">
    var childCount = ${contactInstance?.phones.size()} + 0;

    function addPhone(){
      var clone = $("#phone_clone").clone()
      var htmlId = 'phonesList['+childCount+'].';
      var phoneInput = clone.find("input[id$=number]");

      clone.find("input[id$=id]")
             .attr('id',htmlId + 'id')
             .attr('name',htmlId + 'id');
      clone.find("input[id$=deleted]")
              .attr('id',htmlId + 'deleted')
              .attr('name',htmlId + 'deleted');
      clone.find("input[id$=new]")
              .attr('id',htmlId + 'new')
              .attr('name',htmlId + 'new')
              .attr('value', 'true');
      phoneInput.attr('id',htmlId + 'number')
              .attr('name',htmlId + 'number');
      clone.find("select[id$=type]")
              .attr('id',htmlId + 'type')
              .attr('name',htmlId + 'type');

      clone.attr('id', 'phone'+childCount);
      $("#childList").append(clone);
      clone.show();
      phoneInput.focus();
      childCount++;
    }

    //bind click event on delete buttons using jquery live
    $('.del-phone').live('click', function() {
        //find the parent div
        var prnt = $(this).parents(".phone-div");
        //find the deleted hidden input
        var delInput = prnt.find("input[id$=deleted]");
        //check if this is still not persisted
        var newValue = prnt.find("input[id$=new]").attr('value');
        //if it is new then i can safely remove from dom
        if(newValue == 'true'){
            prnt.remove();
        }else{
            //set the deletedFlag to true
            delInput.attr('value','true');
            //hide the div
            prnt.hide();
        }
    });

</script>

<div id="childList">
    <g:each var="phone" in="${contactInstance.phones}" status="i">
        
        <!-- Render the phone template (_phone.gsp) here -->
        <g:render template='phone' model="['phone':phone,'i':i,'hidden':false]"/>
        <!-- Render the phone template (_phone.gsp) here -->
        
    </g:each>
</div>
<input type="button" value="Add Phone" onclick="addPhone();" />
