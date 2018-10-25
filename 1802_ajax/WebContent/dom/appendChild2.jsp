<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>appendChild2</title>
</head>
<body>
<div id='append_child'>
	<h3>appendChild2</h3>
	<p id='info'>
	첨부파일을 추가하거나 삭제함
	</p>
	<input type='button' value='첨부추가' onclick='append()' />
	<input type='button' value='첨부 모두 삭제' onclick='removeAll()' />
	<p/>
	
	<div id='result'></div>
</div>

<!-- 화면부분 끝, 스크립트부분 시작! -->
<script>
var cnt = 0;
var rs = document.getElementById('result');

function append() {
	var ele = makePanel();
	rs.appendChild(ele);
}


// 하나의 div 안에 input과 button을 추가하여 반환
function makePanel() {
	var div = document.createElement("div");
	var img = document.createElement("img");
	var file = document.createElement("input");
	var btn = document.createElement("input");
	var br = document.createElement("br");
	
	// div
	div.setAttribute("style", "display:inline-block; margin:10px;");
	
	// img tag
	img.setAttribute("width", "150px");
	img.setAttribute("height", "100px");
	img.setAttribute("name", "img" + cnt);
	img.setAttribute("title", "클릭하면 이미지 선택!");
	img.setAttribute("src", "http://via.placeholder.com/350x150");
	img.addEventListener("click", loadImage);
	
	
	// file태그 상자의 속성 지정
	// <input type='file' name='file0' class='file' style='display:none' />
	file.setAttribute("type", "file");
	file.setAttribute("name", "file" + cnt);
	file.setAttribute("class", "file");
	file.setAttribute("style", "display:none;");
	
	// 삭제버튼 속성 지정
	btn.setAttribute("type", "button");
	btn.setAttribute("value", "Del");
	btn.addEventListener("click", remove);	// btn.onclick = remove;
	
	
	div.appendChild(img);
	div.appendChild(file);
	div.appendChild(br);
	div.appendChild(btn);
	cnt++;
	
	return div;
}


function removeAll() {
	rs.innerHTML = '';
}

function remove(ev) {
	var ele = ev.srcElement;				// 이벤트가 발생한 버튼
	var pDiv = ele.parentNode;				// 버튼을 포함한 구성요소
	
	rs.removeChild(pDiv);
}
function loadImage(ev){
	var evTag = ev.srcElement;			// 이벤트가 발생한 요소(img tag)
	var parent = evTag.parentNode;		// img박스와 button을 감싸고 있는 div
	var file = parent.getElementsByClassName("file").item(0);
	
	file.click();
	
	// 파일 미리보기
	file.onchange = function(ev2) {
		var f =  ev2.srcElement;
		var url = f.files[0];						// 첫번째 파일(그런데 어차피 파일 1개)
		
		var reader = new FileReader();
		reader.readAsDataURL(url);					
		reader.onload = function(e) {				// 이미지 로딩이 완료되면
			evTag.src = e.target.result;			// e.target.result부분 => 외우세요
		}
	}
	
}
</script>

</body>
</html>