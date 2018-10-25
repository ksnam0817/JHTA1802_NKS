/**
 * 첨부파일 과 이미지 미리 보기
 * date : 2018.8 (pwg)
 */

// 첨부파일이 추가 함수
function appendAttFile(att_zone){
	var div = document.createElement("div");
	div.setAttribute("style", "width:120px;height:160px;");
	
	// 이미지 태그 생성 및 속성 지정
	var img = document.createElement("img");
	img.setAttribute("name", "img" + cnt);
	img.setAttribute("width", "120px");
	img.setAttribute("height", "160px");
	img.src = "http://placehold.it/120x160";
	img.onclick = imagePreView;//파일 선택 상자와 이미지 미리보기
	
	
	// file 태그 
	var file = document.createElement("input");
	file.setAttribute("type", "file");
	file.setAttribute("name", "attfile" + cnt);
	file.setAttribute("modify", "no"); //자신이 수정되었는지 판단
	file.setAttribute("style", "display:none");
	file.setAttribute("class", "attfile");
	
	// 삭제 버튼
	var btnDel = document.createElement("input");
	btnDel.setAttribute("name", "delFile" + cnt);
	btnDel.setAttribute("type", "button");
	btnDel.setAttribute("value", "X");
	btnDel.setAttribute("class", "delFile");
	btnDel.onclick = function(ev){
		var tag = ev.srcElement;
		var parent = tag.parentNode;
		var file = parent.getElementsByClassName("attfile")[0];
		if(file.getAttribute("modify") == "yes"){
			attZone.removeChild(parent);
		}
	}
	
	div.appendChild(img);
	div.appendChild(file);
	div.appendChild(btnDel);
	
	att_zone.appendChild(div);
	cnt++;
}

// 파일선택 상자 및 이미지 미리보기
function imagePreView(ev){
	var img = ev.srcElement;
	var parent = img.parentNode;
	var fileTag = parent.getElementsByClassName("attfile")[0];
	fileTag.click();
	
	//미리보기
	fileTag.onchange = function(){
		var url = fileTag.files[0];
		var reader = new FileReader();
		reader.readAsDataURL(url);
		reader.onload=function(ev2){
			img.src = ev2.target.result;
		}
		if(fileTag.getAttribute("modify") == "no"){
			appendAttFile(attZone);
		}
		fileTag.setAttribute("modify","yes");
	}
}

