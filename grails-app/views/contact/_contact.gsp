<div class="dialog">
  <table>
      <tbody>

      <tr class="prop">
        <td valign="top" class="name">
          <label for="firstName"><g:message code="contact.firstName.label" default="First Name" /></label>
        </td>
        <td valign="top" class="value ${hasErrors(bean: contactInstance, field: 'firstName', 'errors')}">
    <g:textField name="firstName" value="${contactInstance?.firstName}" />
    </td>
    </tr>

    <tr class="prop">
      <td valign="top" class="name">
        <label for="lastName"><g:message code="contact.lastName.label" default="Last Name" /></label>
      </td>
      <td valign="top" class="value ${hasErrors(bean: contactInstance, field: 'lastName', 'errors')}">
    <g:textField name="lastName" value="${contactInstance?.lastName}" />
    </td>
    </tr>

    <tr class="prop">
      <td valign="top" class="name">
        <label for="nickName"><g:message code="contact.nickName.label" default="Nick Name" /></label>
      </td>
      <td valign="top" class="value ${hasErrors(bean: contactInstance, field: 'nickName', 'errors')}">
    <g:textField name="nickName" value="${contactInstance?.nickName}" />
    </td>
    </tr>

    <tr class="prop">
      <td valign="top" class="name">
        <label for="phones"><g:message code="contact.phones.label" default="Phones List" /></label>
      </td>
        <td valign="top" class="value ${hasErrors(bean: contactInstance, field: 'phones', 'errors')}">

        <!-- Render the phones template (_phones.gsp) here -->
        <g:render template="phones" model="['contactInstance':contactInstance]" />
        <!-- Render the phones template (_phones.gsp) here -->

    </td>
    </tr>
    </tbody>
  </table>
</div>
