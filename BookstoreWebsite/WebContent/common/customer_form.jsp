
	
		<table class="form">
			<tr>
				<td align="right">E-mail:</td>
				<td align="left"><input type="text" id="email" name="email" size="45" value="${customer.email}"/></td>
			</tr>
			<tr>
				<td align="right">First Name:</td>
				<td align="left"><input type="text" id="firstName" name="firstName" size="45" value="${customer.firstName}" /></td>
			</tr>
			<tr>
				<td align="right">Last Name:</td>
				<td align="left"><input type="text" id="lastName" name="lastName" size="45" value="${customer.lastName}" /></td>
			</tr>
			<tr>
				<td align="right">Password:</td>
				<td align="left"><input type="password" id="password" name="password" size="45" value="${customer.password}" /></td>
			</tr>
			<tr>
				<td align="right">Confirm Password:</td>
				<td align="left"><input type="password" id="confirmpassword" name="confirmpassword" size="45" value="${customer.password}" /></td>
			</tr>
			<tr>
				<td align="right">Phone Number:</td>
				<td align="left"><input type="text" id="phone" name="phone" size="45" value="${customer.phone}"/></td>
			</tr>
			<tr>
				<td align="right">Address Line1:</td>
				<td align="left"><input type="text" id="address1" name="address1" size="45" value="${customer.addressLine1}"/></td>
			</tr>
			<tr>
				<td align="right">Address Line2:</td>
				<td align="left"><input type="text" id="address2" name="address2" size="45" value="${customer.addressLine2}"/></td>
			</tr>
			<tr>
				<td align="right">City:</td>
				<td align="left"><input type="text" id="city" name="city" size="45" value="${customer.city}"/></td>
			</tr>
			<tr>
				<td align="right">State:</td>
				<td align="left"><input type="text" id="state" name="state" size="45" value="${customer.state}"/></td>
			</tr>
			<tr>
				<td align="right">Zip Code:</td>
				<td align="left"><input type="text" id="zipCode" name="zipCode" size="45" value="${customer.zipcode}"/></td>
			</tr>
			<tr>
				<td align="right">Country:</td>
				<td align="left">
				    <select name="country" id="country">
				    <c:forEach items="${mapCountries}" var="country">
				       <option value="${country.value}"<c:if test="${customer.country eq country.value}">selected='selected'</c:if>>${country.key}</option>
				    </c:forEach>
				    </select>
				</td>
			</tr>
			<tr><td>&nbsp;</td></tr>
			<tr>
			   <td colspan="2" align="center">
			      <button type="submit">Save</button>&nbsp;&nbsp;&nbsp;&nbsp;
			      <input type="button" value="Cancel" onclick="history.go(-1);" />
			   </td>
			</tr>
		</table>
		