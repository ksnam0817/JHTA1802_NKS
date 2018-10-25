<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>left_menu.jsp</title>



</head>
<body>
<div id='All'>All
	<div id='Selector'>
		<fieldset>
		<legend>Selector</legend>
		<ul>
			<li onclick="loadPage('./selector/selector_attribute.jsp')">Selector_attribute</li>
			<li onclick="loadPage('./selector/selector_attr.jsp')">Selector_attr</li>
			<li onclick="loadPage('./selector/selector_dom.jsp')">Selector_dom</li>
			<li onclick="loadPage('./selector/selector_dom2.jsp')">Selector_dom2</li>
		</ul>
		</fieldset>
	</div>
	
	<div id='Filter'>
		<fieldset>
		<legend>Filter</legend>
		<ul>
			<li onclick="loadPage('./filter/filter_mountains.jsp')">Filter Mountains</li>
		</ul>
		</fieldset>
	</div>
	
	<div id='Traverse'>
		<fieldset>
		<legend>Traverse</legend>
		<ul>
			<li onclick="loadPage('./traverse/traverse.jsp')">Traverse 1</li>
		</ul>
		</fieldset>
	</div>
	
	<div id='Manipulation'>
		<fieldset>
		<legend>Manipulation</legend>
		<ul>
			<li onclick="loadPage('./manipulation/manipulation.jsp')">Manipulation 1</li>
		</ul>
		</fieldset>
	</div>
	
	<div id='Core'>
		<fieldset>
		<legend>Core</legend>
		<ul>
			<li onclick="loadPage('./core/get.jsp')">get</li>
			<li onclick="loadPage('./core/each.jsp')">each</li>
			<li onclick="loadPage('./core/attribute.jsp')">attribute</li>
		</ul>
		</fieldset>
	</div>
	
	
	<div id='Event'>
		<fieldset>
		<legend>Event</legend>
		<ul>
			<li onclick="loadPage('./event/keyEvent.jsp')">keyEvent</li>
			<li onclick="loadPage('./event/oneEvent.jsp')">oneEvent</li>
			<li onclick="loadPage('./event/toggleEvent.jsp')">toggleEvent</li>
			<li onclick="loadPage('./event/triggerEvent.jsp')">triggerEvent</li>
		</ul>
		</fieldset>
	</div>
	
	<div id='Effect'>
		<fieldset>
		<legend>Effect</legend>
		<ul>
			<li onclick="loadPage('./effect/popupSubMenu.jsp')">popupSubMenu</li>
			<li onclick="loadPage('./effect/screenSliding.jsp')">screenSliding</li>
			<li onclick="loadPage('./effect/win8Style.jsp')">win8Style</li>
		</ul>
		</fieldset>
	</div>
	
	<div id='Interaction'>
		<fieldset>
		<legend>Interaction</legend>
		<ul>
			<li>Interaction 1</li>
			<li>Interaction 2</li>
			<li>Interaction 3</li>
		</ul>
		</fieldset>
	</div>
	
	<div id='Widget'>
		<fieldset>
		<legend>Widget</legend>
		<ul>
			<li onclick="loadPage('./widget/tab.jsp')">tab</li>
			<li onclick="loadPage('./widget/accordion.jsp')">accordion</li>
			<li onclick="loadPage('./widget/menu.jsp')">menu</li>
			<li onclick="loadPage('./widget/autocomplete.jsp')">autocomplete</li>
			<li onclick="loadPage('./widget/autoDB.jsp')">autoDB</li>
		</ul>
		</fieldset>
	</div>
	
	<div id='Ajax'>
		<fieldset>
		<legend>Ajax</legend>
		<ul>
			<li onclick="loadPage('./ajax/loadHTML.jsp')">loadHTML</li>
			<li onclick="loadPage('./ajax/loadJSON.jsp')">loadJSON</li>
			<li onclick="loadPage('./ajax/loadXML.jsp')">loadXML</li>
		</ul>
		</fieldset>
	</div>
	
	<div id='Parsing'>
		<fieldset>
		<legend>Parsing</legend>
		<ul>
			<li>Parsing 1</li>
			<li>Parsing 2</li>
			<li>Parsing 3</li>
		</ul>
		</fieldset>
	</div>
	
	<div id='Board'>
		<fieldset>
		<legend>Board</legend>
		<ul>
			<li onclick="loadPage('./board/list.jsp')">Board1</li>
		</ul>
		</fieldset>
	</div>
</div>
</body>
</html>