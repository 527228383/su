<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <link rel="stylesheet" href="css/style.css">
  <link rel="stylesheet" href="css/responsive.css">
<title>用户注册</title> 
<script type="text/javascript" src="js/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="js/Client/register.js"></script>
<script language="javascript"> 
		
		function loadimage(){ 
		document.getElementById("randImage").src = "insure/image?"+Math.random(); 
		
		} 
</script> 
<style>
			.container-small {
				max-width: 400px;
			}
			
			.modal-wrap p {
				font-size: xx-small;
			}
			
			.modal-wrap h3 {
				font-size: x-small;
				font-weight: 800;
			}
		</style>
</head>
<body>
			
			<div class="boxed_wrapper">

			<header class="top-bar">
				<div class="container">
					<div class="clearfix">

					</div>

				</div>
			</header>

		<section class="theme_menu stricky">
    <div class="container">
        <div class="row">
            <div class="col-md-3">
                <div class="main-logo">
                    <a href="index.html"><img src="images/logo/logo.png" alt=""></a>
                </div>
            </div>
            <div class="col-md-9 menu-column">
                <nav class="menuzord" id="main_menu">
                   <ul class="menuzord-menu">
                        <li><a href="<%=basePath%>insure/index" style="font-size:16px;">首页</a></li>
                        <li><a href="about.html" style="font-size:16px;">购买保险</a></li>
                        <li><a href="service.html" style="font-size:16px;">个人中心</a></li>
                        <li><a href="<%=basePath%>jsp/Client/contact.jsp"" style="font-size:16px;">服务大厅</a></li>
                    </ul><!-- End of .menuzord-menu -->
                </nav> <!-- End of #main_menu -->
            </div>
            <div class="right-column">
            	<div style="margin-top: 20px;">
					<iframe name="weather_inc" src="http://i.tianqi.com/index.php?c=code&id=9" width="800" height="60" frameborder="0" marginwidth="0" marginheight="0" scrolling="no"></iframe>
				</div>
            </div>
        </div>
                

   </div> <!-- End of .conatiner -->
</section>
			
			
			<br /><br />
			<div class="container container-small">
				<h2>注册&nbsp;
			<small style="font-size:medium;">已有账号?<a href="<%=basePath%>insure/login">登录</a></small>
		</h2>
				<br /><br />
				
					<div class="form-group">
						<label>手机号</label>
						<input type="text" class="form-control" id="tel" name="ins_tel" onblur="test1()"/><font id="f1"></font>
					</div>
					<div class="form-group">
						<label>密码</label>
						<input type="password" class="form-control" name="ins_pwd" id="pwd" onblur="test2()"/><font id="f3"></font>
					</div>
					<div class="form-group">
						<label>再次输入密码</label>
						<input type="password" class="form-control"  name="aga_ins_pwd" id="apwd" onblur="test3()"/><font id="f4"></font>
					</div>
					<div class="form-group">
					<div class="col-xs-5 row" >
					<input type="text" name="rand" size="15" id="rd" class="form-control" style="width: 150px;">
					</div >
					<div class="col-xs-3">
					<img alt="code..." name="randImage" id="randImage" src="insure/image" width="60" height="20" border="1" align="absmiddle">
					</div>
					<div class="col-xs-4">
					<a href="javascript:loadimage();"><font class=pt95>看不清点我</font></a>
					</div>
					</div>
					<br/><br/>
				
					<div class="agreement ">
						<label class="checkbox" style="margin-left:15px">
						<input type="checkbox" value="sw">
						<span  style="font-size:x-small; padding-top: 4px;">我已阅读并同意
						<span data-toggle="modal" data-target="#myModalInsure" style="color: #2870ba;cursor:pointer;">《中国知领财险用户注册保密协议》</span></span>
						</label>
					</div>
					<div id="myModalInsure" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" class="modal fade my-policy-detail-modal" style="display: none;">
						<div role="document" class="modal-dialog">
							<div class="modal-content clearfix">
								<div class="modal-header"><button type="button" data-dismiss="modal" aria-label="Close" class="close"><span aria-hidden="true" class="fontSize">×</span></button>
									<h1 class="modal-h1" style="font-size:medium;">中国知领财险（集团）股份有限公司电子商务平台个人注册客户服务条款</h1></div>
								<div class="modal-body col-sm-12">
									<div class="modal-wrap" ;>
										<h2 style="font-size: x-small;font-weight: 800;">中国知领财险（集团）股份有限公司电子商务平台个人注册客户服务条款（以下简称"本服务条款"）</h2>
										<p>中国知领财险（集团）股份有限公司个人注册客户各项服务的解释权归中国知领财险（集团）股份有限公司( 以下简称"本公司") 所有。本公司将完全按照本服务条款向注册会员提供优质、全面服务。</p>
										<p>拟申请知领财险保险（集团）股份有限公司电子商务平台网站个人注册客户服务的会员在注册时必须秉持善意、充分注意的态度，仔细阅读本服务条款。会员点击"同意"按钮，则表示完全理解和接受本服务条款，同意受其约束。会员只有在完全接受本服务条款并完成全部注册程序后，才能成为中国太平洋保险（集团）股份有限公司电子商务平台网站的注册用户并享受各项本公司电子商务平台网站服务。</p>
										<p>如无特殊说明，下列内容中所称"会员"指中国知领财险（集团）股份有限公司电子商务平台的注册用户。</p>
										<h3>一、服务条款的适用范围</h3>
										<p>本服务条款适用于中国知领财险（集团）股份有限公司电子商务平台网站提供的全部网上服务及产品，包括：中国知领财险（集团）股份有限公司电子商务平台网站当前提供的全部服务、全部产品和今后的任何新增服务、新增产品以及针对原服务、原产品的任何新增功能。</p>
										<h3>二、本服务条款的修改和服务内容的修订</h3>
										<p>本公司有权在必要时修改本服务条款，本服务条款一旦发生变动，将会在重要页面上提示修改内容。如果不同意所改动的内容，会员可以主动取消获得的网上注册用户服务；如果会员未取消该服务，则将被视为接受本服务条款的变动。 本公司保留随时修改服务内容或中断服务而不需通知会员的权利。本公司对该权利的行使不需对会员或第三方负责以及承担任何赔偿责任。</p>
										<h3>三、会员为使用本公司电子商务平台必须：</h3>
										<p>1、自行配备上网所需的设备，包括个人电脑、调制解调器或其他必备上网装置。</p>
										<p>2、自行负担个人上网所需支付的有关费用，包括但不限于电话费用、网络费用等。</p>
										<h3>四、遵守法律 </h3>
										<p>会员同意遵守《中华人民共和国保守国家保密法》、《计算机信息系统国际联网保密管理规定》、《中华人民共和国计算机信息系统安全保护条例》、《计算机信息网络国际联网安全保护管理办法》、《中华人民共和国计算机信息网络国际联网管理暂行规定》及其实施办法等相关法律法规的规定。会员对自己以任何方式使用中国太平洋保险（集团）股份有限公司个人注册客户服务的行为及其结果承担全部责任。在任何情况下，如果本公司合理地认为会员的任何行为，包括但不限于会员的言论或其他行为违反或可能违反上述法律和法规的规定，本公司可不经事先通知而终止向该会员提供服务。</p>
										<h3>五、会员注册义务 </h3>
										<p>为使用中国知领财险（集团）股份有限公司个人注册客户服务，会员同意以下事项∶</p>
										<p>1、提供详尽、准确的个人资料。</p>
										<p>2、不断更新注册资料，确保其为真实、正确、实时及完整。若会员提供任何错误、不实、过时或不完整的资料，或者本公司有合理的理由怀疑前述资料为错误、不实、过时或不完整，本公司有权暂停或终止该会员的注册用户资格，并拒绝该会员於现在和未来使用中国太平洋保险（集团）股份有限公司个人注册客户服务之全部或一部份。</p>
										<p>3、中国知领财险（集团）股份有限公司个人注册客户服务内容是否适合会员的未成年子女浏览或者使用，由会员加以判断并约束，如因相关服务内容不适合未成年人浏览、使用而导致任何影响或损失，本公司不承担任何责任。</p>
										<h3>六、用户名、密码和安全</h3>
										<p>注册成功后，本公司电子商务平台将给予每个会员一个用户名及相应的密码，该用户名和密码由会员负责保管， 会员应当维持该用户名和密码的机密安全，任何使用该用户名和密码的行为将被视为会员本人的行为（无论该使用行为是由会员本人所为或他人所为），会员对使用该用户名和密码所进行的一切活动以及因此所衍生的任何损失或损害负全部责任。用户名和密码遭到未授权的使用或发生其他任何安全问题，会员可以立即通知本公司。</p>
										<h3>七、隐私政策</h3>
										<p>尊重会员个人隐私是本公司的基本制度。</p>
										<p>本公司承诺不会在未经会员允许时透露其注册资料及保存在本公司电子商务平台中的其他非公开内容，除非：</p>
										<p>1、应国家相关法律法规的规定或政府部门的要求必须透露。</p>
										<p>2、为维护本公司的商标权、著作权或其他合法权益而必须透露。</p>
										<p>3、为维护会员利益或社会公共利益而必须透露。</p>
										<p>4、经会员授权同意而透露。</p>
										<h3>八、会员行为保证</h3>
										<p>1、会员必须遵循：</p>
										<p>(1) 使用网络服务不作非法用途。 </p>
										<p>(2) 不干扰或混乱网络服务。</p>
										<p>(3) 遵守所有使用网络服务的网络协议、规定、程序和惯例。</p>
										<p>2、会员同意不在本公司电子商务平台上发生下列行为∶ </p>
										<p>1）、通过上载、张贴、发送电子邮件或其他方式传送任何非法、有害、胁迫、滥用、骚扰、侵害、中伤、粗俗、猥亵、诽谤、侵害他人隐私、种族歧视的或道德上令人不快的内容。 </p>
										<p>2）、将依据法律法规或合约或法定关系（例如由于雇佣关系和依据保密合约所得知或揭露之内部资料、专属及机密资料）而无权传送之任何内容加以上载、张贴、发送电子邮件或以其他方式传送。</p>
										<p>3）、将可能涉及侵害任何人之任何专利、商标权、商业秘密、著作权或其他专属权利的资料加以上载、张贴、发送电子邮件或以其他方式传送。</p>
										<p>4）、将设计目的在于干扰、破坏或限制任何计算机软件、硬件或通讯设备功能之软件病毒或其他计算机代码、档案和程序之任何资料，加以上载、张贴、发送电子邮件或以其他方式传送</p>
										<h3>九、拒绝提供担保 </h3>
										<p>会员使用知领财险（集团）股份有限公司个人注册客户服务之风险由个人负担，本公司不保证以下事项∶</p>
										<p>1、网上个人注册客户服务将符合会员的要求。</p>
										<p>2、网上个人注册客户服务不受干扰、及时提供、安全可靠或免于出错。</p>
										<p>3、会员经由网上个人注册客户服务购买或取得之任何产品、服务、资讯或其他资料将符合会员的期望。</p>
										<p>4、经由网上个人注册客户服务之使用下载或取得任何资料不会造成会员电脑系统的任何损坏或资料流失。</p>
										<p>5、网上个人注册客户服务不会因下列原因而导致服务中断、延误、故障、错误、遗漏或丢失传送的资料： 电信部门的通讯线路故障、通讯技术问题；本公司电子商务平台络系统问题；停电、地震、火灾、电脑病毒、黑客入侵等不可抗力情形。 因发生上述事项所造成的一切损失，包括直接和间接损失，本公司将不承担任何赔偿责任。</p>
										<h3>十、对会员信息的存储和限制 </h3>
										<p>本公司不对会员所发布信息的删除或储存失败负责。本公司有判定会员的行为是否符合本服务条款的保留权利，如果会员违背了本服务条款的规定，本公司有终止或中断对其提供网络服务的权利。</p>
										<h3>十一、会员服务</h3>
										<p>会员同意以电子方式接受本公司的信息。本公司将用电子邮件或通过在本公司电子商务平台上发布通知的方式与您进行联系。本公司保留通过邮件和短信的形式，对本公司注册、购物用户发送订单信息、增值服务及促销活动等告知、关怀服务的权利。如果您在本公司注册，表明您已默示同意接受此项服务。</p>
										<p>会员知道并同意，本公司可随时根据实际情况，于通知或未通知会员的情况下终止、中断、移转、删除一项或多项网络服务，包括对用户名、密码、档案、其他服务的终止、删除、关闭等，并不需对会员、任何个人或第三方负责。会员若不希望接收本公司的广告邮件，请在您收到的广告邮件中点击“退订”按钮，自助完成退阅； 会员若不希望接收本公司的短信，请提供您的手机号码联系客服处理。会员若反对本服务条款或对本服务条款的任何修改有异议，或对本公司个人注册客户服务不满，享有以下的权利：</p>
										<p>1、不再使用中国太平洋保险（集团）股份有限公司个人注册客户服务。 </p>
										<p>2、申请结束注册用户资格。结束资格后，会员使用中国知领财险（集团）股份有限公司个人注册客户服务的权利马上终止。</p>
										<h3>十二、知识产权以及其他权利 </h3>
										<p>中国知领财险（集团）股份有限公司个人注册客户服务内容包括：文字、软件、声音、图片、录象、图表、广告中的全部内容；电子邮件的全部内容；中国知领财险（集团）股份有限公司个人注册客户为会员提供的其他信息。所有这些内容受有关版权著作权、商标权和其它财产所有权法律法规的保护,会员只能在本公司和广告商授权下才能使用这些内容，而不能擅自复制、编辑这些内容、或创造与内容有关的派生产品。中国太平洋保险（集团）股份有限公司个人注册客户所有的文章著作权由有关著作权人享有，任何人需要转载 或以其他形式使用中国太平洋保险（集团）股份有限公司个人注册客户的文章，必须征得著作权人同意。</p>
										<h3>十三、会员的损害赔偿责任</h3>
										<p>会员同意保障和维护本公司电子商务平台站及其他会员的利益，如因会员违反有关法律、法规或本服务条款的任何规定而给本公司电子商务平台站或任何其他第三人造成损失，会员同意承担由此造成的损害赔偿责任。</p>
										<h3>十四、法律适用和管辖 </h3>
										<p>本服务条款的订立、执行、解释及争议的解决均应适用中国法律（不包括香港、澳门、台湾地区法律）。本服务条款如因与中国现行法律（不包括香港、澳门、台湾地区法律）相抵触而导致部分无效，不影响其他部分的效力。会员和本公司均同意就本服务条款以及与此有关的一切争议提交上海仲裁委员会，按其有效仲裁规则进行仲裁，该裁决是终局的。</p>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="form-group" style="padding-top: 35px;">
						<font id="f5"></font>
						<input type="button" class="btn btn-warning btn-block" value="立即注册" id="bt" />
						
					</div>


			</div>

			<!-- Scroll Top Button -->
			<button class="scroll-top tran3s color2_bg">
		<span class="fa fa-angle-up"></span>
	</button>
			<!-- pre loader  -->
			<div class="preloader"></div>

			<!-- jQuery js -->
			<script src="js/Client/jquery.js"></script>
			<!-- bootstrap js -->
			<script src="js/Client/bootstrap.min.js"></script>
			<!-- jQuery ui js -->
			<script src="js/Client/jquery-ui.js"></script>
			<!-- owl carousel js -->
			<script src="js/Client/owl.carousel.min.js"></script>
			<!-- jQuery validation -->
			<script src="js/Client/jquery.validate.min.js"></script>
			<!-- google map -->
			<script src="http://ditu.google.cn/maps/api/js?key=AIzaSyCRvBPo3-t31YFk588DpMYS6EqKf-oGBSI"></script>
			<script src="js/Client/gmap.js"></script>
			<!-- mixit up -->
			<script src="js/Client/wow.js"></script>
			<script src="js/Client/jquery.mixitup.min.js"></script>
			<script src="js/Client/jquery.fitvids.js"></script>
			<script src="js/Client/bootstrap-select.min.js"></script>
			<script src="js/Client/menuzord.js"></script>

			<!-- revolution slider js -->
			<script src="assets/revolution/js/jquery.themepunch.tools.min.js"></script>
			<script src="assets/revolution/js/jquery.themepunch.revolution.min.js"></script>
			<script src="assets/revolution/js/extensions/revolution.extension.actions.min.js"></script>
			<script src="assets/revolution/js/extensions/revolution.extension.carousel.min.js"></script>
			<script src="assets/revolution/js/extensions/revolution.extension.kenburn.min.js"></script>
			<script src="assets/revolution/js/extensions/revolution.extension.layeranimation.min.js"></script>
			<script src="assets/revolution/js/extensions/revolution.extension.migration.min.js"></script>
			<script src="assets/revolution/js/extensions/revolution.extension.navigation.min.js"></script>
			<script src="assets/revolution/js/extensions/revolution.extension.parallax.min.js"></script>
			<script src="assets/revolution/js/extensions/revolution.extension.slideanims.min.js"></script>
			<script src="assets/revolution/js/extensions/revolution.extension.video.min.js"></script>

			<!-- fancy box -->
			<script src="js/Client/jquery.fancybox.pack.js"></script>
			<script src="js/Client/jquery.polyglot.language.switcher.js"></script>
			<script src="js/Client/nouislider.js"></script>
			<script src="js/Client/jquery.bootstrap-touchspin.js"></script>
			<script src="js/Client/SmoothScroll.js"></script>
			<script src="js/Client/jquery.appear.js"></script>
			<script src="js/Client/jquery.countTo.js"></script>
			<script src="js/Client/jquery.flexslider.js"></script>
			<script src="js/Client/imagezoom.js"></script>
			<script id="map-script" src="js/Client/default-map.js"></script>
			<script src="js/Client/custom.js"></script>

		</div>
</body>
</html>