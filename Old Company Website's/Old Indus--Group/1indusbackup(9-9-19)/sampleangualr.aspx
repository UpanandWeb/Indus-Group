<%@ Page Language="C#" AutoEventWireup="true" CodeFile="sampleangualr.aspx.cs" Inherits="sampleangualr" %>

<!DOCTYPE html>

<html ng-app>
  <head>
   <title>Learn AngularJS - Switchable Grid</title>

		<%--<link href="http://fonts.googleapis.com/css?family=Cookie|Open+Sans:400,700" rel="stylesheet" />--%>

		<!-- The main CSS file -->
		<link href="sam/style.css" rel="stylesheet" />

		<!--[if lt IE 9]>
			<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.3.3/angular.min.js"></script>
  </head>
      
 <%-- <body>
      <form runat="server">
    <div>
      <label>Name:</label>
      <input type="text" ng-model="yourName" placeholder="Enter a name here">
        <asp:TextBox ID="txt1" runat="server" ng-model="my"></asp:TextBox>
      <hr>
      <h1>Hello {{yourName}}!</h1>

      <h1>Hello {{my}}!</h1>

    </div>
           </form>
       </body>--%>
         
 <body ng-app="switchableGrid" ng-controller="SwitchableGridController">

		<div class="bar">

			<!-- These two buttons switch the layout varaible,
				 which causes the correct UL to be shown. -->

			<a href="#" class="list-icon" ng-class="{active: layout == 'list'}" ng-click="layout = 'list'"></a>
			<a href="#" class="grid-icon" ng-class="{active: layout == 'grid'}" ng-click="layout = 'grid'"></a>
		</div>

		<!-- We have two layouts. We choose which one to show depending on the "layout" binding -->

		<ul ng-show="layout == 'grid'" class="grid">
			<!-- A view with big photos and no text -->
			<li ng-repeat="p in pics">
				<a href="{{p.link}}" target="_blank"><img ng-src="{{p.images.low_resolution.url}}" /></a>
			</li>
		</ul>

		<ul ng-show="layout == 'list'" class="list">
			<!-- A compact view smaller photos and titles -->
			<li ng-repeat="p in pics">
				<a href="{{p.link}}" target="_blank"><img ng-src="{{p.images.thumbnail.url}}" /></a>
				<p>{{p.caption.text}}</p>

			</li>
		</ul>

		<!-- Include AngularJS from Google's CDN and the resource module -->
		<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.0.7/angular.min.js"></script>
		<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.0.7/angular-resource.min.js"></script>
		<script src="sam/script.js"></script>
	</body>
</html>
