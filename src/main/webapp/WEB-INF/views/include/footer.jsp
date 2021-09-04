<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
@font-face {
	font-family: 'Pretendard-Thin';
	src:
		url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Thin.woff')
		format('woff');
	font-weight: 100;
	font-style: normal;
	
}

*{
	font-family: 'Pretendard-Thin';
	box-sizing: border-box;
}

footer{
	display: flex; 
	flex-direction:column; 
	justify-content:center; 
	align-content: center;
	position: static;
    left: 0;
    bottom: 0;
 	font-size: 15px; 
 	background-color: #a3adb8; 
 	text-align: center;
	height: 200px; 
	width: 100%;
}
.logos{
	width: 30px;
	height: 30px;
	margin: 0 5px;
	

}
</style>
<footer>
	<div>
		<a href="http://www.hanuledu.co.kr/"> 
			<img alt="x" src="imgs/hanulIcon.png" class="logos"></a> 
		<a href="https://www.youtube.com/channel/UC3iuwDedhE-R3xdA_0MNh0g/featured">
			<img alt="x" src="imgs/youtubeIcon.png" class="logos"></a> 
		<a href="http://www.naver.com/"> 
			<img alt="x" src="imgs/navericon.png" class="logos" style="border-radius: 10px;"></a>
	</div>
	<br />
	<div  style="font-weight: bold">
		<div>TEAM A</div>
		<div>연락처 : 062-362-7797</div>
		<div>주소 : 대한민국 광주광역시 서구 경열로 3 (한울직업전문학교) 202호</div>
		<div>copyright © 한울직업전문학교 All Rights Reserved</div>
	</div>
	<br />
</footer>