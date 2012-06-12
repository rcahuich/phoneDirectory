
<%@ page import="blog.omarello.Contact" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'contact.label', default: 'Contact')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <th><g:message code="contact.fullName" default="Full Name" /></th>
                        
                            <g:sortableColumn property="firstName" title="${message(code: 'contact.firstName.label', default: 'First Name')}" />
                        
                            <g:sortableColumn property="lastName" title="${message(code: 'contact.lastName.label', default: 'Last Name')}" />
                            
                            <g:sortableColumn property="nickName" title="${message(code: 'contact.nickName.label', default: 'Nickname')}" />
                        
                            <th><g:message code="contact.phones.label" default="Number of Phones" /></th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${contactInstanceList}" status="i" var="contactInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${contactInstance.id}">${contactInstance.encodeAsHTML()}</g:link></td>
                        
                            <td>${fieldValue(bean: contactInstance, field: "firstName")}</td>
                        
                            <td>${fieldValue(bean: contactInstance, field: "lastName")}</td>
                        
                            <td>${fieldValue(bean: contactInstance, field: "nickName")}</td>
                        
                            <td>${contactInstance.phones.size()}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${contactInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
