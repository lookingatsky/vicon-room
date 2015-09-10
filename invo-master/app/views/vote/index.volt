{% if isWeixin == 1 %}
<style>
*{
	margin:0;
	padding:0;
}
html body{
	margin:0;
	padding:0;
	background:#eee;
	font-family:"微软雅黑";
}
.voteFrame{
	margin:0 auto;
	width:650px;
	text-align:center;
}
.title{
	width:100%;
}	
.title img{
	width:100%;
}
.instruct{
	min-height:20px;
	background:#fff;
	text-align:left;
	padding:20px;
}
.time{
	min-height:20px;
	line-height:20px;
	background:#fff;
	text-align:left;
	padding:20px;
	border-bottom:2px solid #aaa;
}
hr{
	margin:0;
	padding:0;
}
.clear{
	clear:both;
}
.fLeft{
	float:left;
}
.info{
	height:80px;
}
.info div{
	width:33%;
}
.visitor{
	height:40px;
	margin-top:15px;
}
.voter{
	height:40px;
	margin-top:15px;
	border-left:2px solid #ddd;
	border-right:2px solid #ddd;
}
.num{
	height:40px;
	margin-top:15px;	
}
.timeLimit{
	background:green;
	text-align:left;
	color:#ddd;
	padding:20px;
}
.timeLimit div:nth-child(1){
	height:20px;
}
.timeLimit div:nth-child(2){

}
.detail{
	min-height:100px;
	width:95%;
	margin:auto;
	border:0px solid #000;
	margin-top:20px;
}
.detail ul{
	list-style-type:none;
	margin:0;
	padding:0;
}
.detail ul li{
	width:100%%;
	margin-bottom:10px;
	border:0px solid #000;
	min-height:20px;
	background:#fff;
	padding:5px;
	cursor:pointer;
}
.detail ul li .voteName{
	background:#eee;
	height:30px;
	line-height:30px;
}
.detail ul li .voteButton{
	height:30px;
	line-height:30px;
	text-align:left;
}
.detailLeft{
	width:300px;
	margin-right:10px;
	float:left;
}
.detailRight{
	width:300px;
	float:left;
}
</style>
<div class="voteFrame">
	<div class="title">
		<img src="/img/20150605/1.jpg" />	
	</div>
	<div class="info">
		<div class="num fLeft">
			参与选手<br />
			10
		</div>
		<div class="voter fLeft">
			累计投票<br />
			2030
		</div>
		<div class="visitor fLeft">
			访问量<br />
			21400
		</div>
		<div class="clear"></div>
	</div>
	<div class="timeLimit">
		<div>距活动结束还有：</div>
		<div>97天23时57分24秒</div>
	</div>
	<div class="time">
		2015-09-09 至 2015-10-01	
	</div>
	<div class="instruct">
		<div>活动介绍</div>
		<div>邀请你的小伙伴给他们投票吧，看看谁的人气高~~</div>
	</div>
	<div class="detail">
		<div class="detailLeft">
			<ul>
				<li>
					<img src="/img/20150605/aesthetics_4-1.jpg" />
					<div class="voteName">选手名字</div>
					<div class="voteButton">为她投票</div>
				</li>
				<li>
					<img src="/img/20150605/20150817161812.jpg" />
					<div class="voteName">选手名字</div>
					<div class="voteButton">为她投票</div>
				</li>
				<li>
					<img src="/img/20150605/201508121522953.jpg" />
					<div class="voteName">选手名字</div>
					<div class="voteButton">为她投票</div>
				</li>
				<li>
					<img src="/img/20150605/20150812172127.jpg" />
					<div class="voteName">选手名字</div>
					<div class="voteButton">为她投票</div>
				</li>
				<li>
					<img src="/img/20150605/3.jpg" />
					<div class="voteName">选手名字</div>
					<div class="voteButton">为她投票</div>
				</li>
			</ul>		
		</div>
		<div class="detailRight">
			<ul>
				<li>
					<img src="/img/20150605/201508121522953.jpg" />
					<div class="voteName">选手名字</div>
					<div class="voteButton">为她投票</div>
				</li>
				<li>
					<img src="/img/20150605/20150817161812.jpg" />
					<div class="voteName">选手名字</div>
					<div class="voteButton">为她投票</div>
				</li>
				<li>
					<img src="/img/20150605/20150812172127.jpg" />
					<div class="voteName">选手名字</div>
					<div class="voteButton">为她投票</div>
				</li>
				<li>
					<img src="/img/20150605/aesthetics_4-1.jpg" />
					<div class="voteName">选手名字</div>
					<div class="voteButton">为她投票</div>
				</li>				
				<li>
					<img src="/img/20150605/3.jpg" />
					<div class="voteName">选手名字</div>
					<div class="voteButton">为她投票</div>
				</li>
			</ul>			
		</div>
		<div class="clear"></div>
	</div>
</div>
{% else %}
<style>
body{
	background-color: #3d3d3d;
	margin:0;
	padding:0;
	font-size:18px;
	font-family:"微软雅黑";
}
.showFrame{
	width:650px;
	min-height:150px;
	background:#fff;
	margin:auto;
	box-shadow:0px 3px 11px #000;
}
.title{
	height:30px;
	line-height:30px;
	padding:15px 40px;
	
	font-weight:bold;
}
.time{
	background:green;
	height:20px;
	line-height:20px;
	color:#fff;
	border-top:3px solid darkgreen;
	padding:15px 40px;
}
.footer{
	height:20px;
	padding:15px 40px;
}	
</style>
	<div class="showFrame">
		<div><img src="/img/20150605/erweima.jpg" /></div>
		<div class="time">时间:2014-10-29 至 2016-02-08</div>
		<div class="title">仅限微信客户端浏览，微信扫描上图的二维码，进入微信投票。</div>
		<div class="footer"><a href="#">tech@zhwbchina.com</a></div>
	</div>
{% endif %}