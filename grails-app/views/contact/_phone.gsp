<div id="phone${i}" class="phone-div" <g:if test="${hidden}">style="display:none;"</g:if>>
    <g:hiddenField name='phonesList[${i}].id' value='${phone?.id}'/>
    <g:hiddenField name='phonesList[${i}].deleted' value='false'/>
	<g:hiddenField name='phonesList[${i}].new' value="${phone?.id == null?'true':'false'}"/>
    
    <g:textField name='phonesList[${i}].number' value='${phone?.number}' />    
    <g:select name="phonesList[${i}].type"
        from="${blog.omarello.Phone.PhoneType.values()}"
        optionKey="key"
        optionValue="value"
        value = "${phone?.type?.key}"/>
    
    <span class="del-phone">
        <img src="${resource(dir:'images/skin', file:'icon_delete.png')}" 
            style="vertical-align:middle;"/>
    </span>
</div>
