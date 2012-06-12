<%@ page import="blog.omarello.Contact" %>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
  <g:set var="entityName" value="${message(code: 'contact.label', default: 'Contact')}" />
  <title><g:message code="default.create.label" args="[entityName]" /></title>
  </head>
  <body>
    <div class="nav">
      <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
      <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
    </div>
    <div class="body">
      <h1><g:message code="default.create.label" args="[entityName]" /></h1>
      <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
      </g:if>
      <g:hasErrors bean="${contactInstance}">
        <div class="errors">
          <g:renderErrors bean="${contactInstance}" as="list" />
        </div>
      </g:hasErrors>

        <g:form action="save" method="post" >

        <!-- Render the contact template (_contact.gsp) here -->
        <g:render template="contact" model="['contactInstance':contactInstance]"/>
        <!-- Render the contact template (_contact.gsp) here -->

        <div class="buttons">
          <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
        </div>
      </g:form>
    </div>
    
    <!-- Render the phone template (_phone.gsp) hidden so we can clone it -->
    <g:render template='phone' model="['phone':null,'i':'_clone','hidden':true]"/>
    <!-- Render the phone template (_phone.gsp) hidden so we can clone it -->
    
  </body>
</html>
