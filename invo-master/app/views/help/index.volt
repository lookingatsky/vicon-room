<!-- <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>帮助中心</title> -->
{{ stylesheet_link('new/bootstrap.min.css') }}
{{ javascript_include('new/jquery.min.js') }}
{{ javascript_include('new/bootstrap.min.js') }}

<style type="text/css">
    /* Custom Styles */
    ul.nav-tabs{
        width: 140px;
        margin-top: 20px;
        border-radius: 4px;
        /*border: 1px solid #ddd;
        box-shadow: 0 1px 4px rgba(0, 0, 0, 0.067);*/
    }
    ul.nav-tabs li{
        margin: 0;
        /*border-top: 1px solid #ddd;*/
    }
    ul.nav-tabs li:first-child{
        border-top: none;
    }
    ul.nav-tabs li a{
        margin: 0;
        padding: 8px 16px;
        border-radius: 0;
    }
	ul.nav-tabs li a{
		color:#ccc;
	}
    ul.nav-tabs li.active a, ul.nav-tabs li.active a:hover{
        color:#aaa;
		font-weight:bold;
		background-color:#fff;
    }
    ul.nav-tabs li:first-child a{
        border-radius: 4px 4px 0 0;
    }
    ul.nav-tabs li:last-child a{
        border-radius: 0 0 4px 4px;
    }
    ul.nav-tabs.affix{
        top: 30px; /* Set the top position of pinned element */
    }
	.nav-tabs.nav-stacked > li > a {
		border:0px solid #000;
	}
	
article, aside, details, figcaption, figure, footer, header, hgroup, main, nav, section, summary {
    display: block;
}
audio, canvas, video {
    display: inline-block;
}
audio:not([controls]) {
    display: none;
    height: 0;
}
[hidden], template {
    display: none;
}
html {
    font-family: sans-serif;
}
body {
    margin: 0;
}
a {
    background: transparent none repeat scroll 0 0;
}
a:focus {
    outline: thin dotted;
}
a:active, a:hover {
    outline: 0 none;
}
h1 {
    font-size: 2em;
    margin: 0.67em 0;
}
abbr[title] {
    border-bottom: 1px dotted;
}
b, strong {
    font-weight: bold;
}
dfn {
    font-style: italic;
}
hr {
    box-sizing: content-box;
    height: 0;
}
mark {
    background: #ff0 none repeat scroll 0 0;
    color: #000;
}
code, kbd, pre, samp {
    font-family: monospace,serif;
    font-size: 1em;
}
pre {
    white-space: pre-wrap;
}
q {
    quotes: "“" "”" "‘" "’";
}
small {
    font-size: 80%;
}
sub, sup {
    font-size: 75%;
    line-height: 0;
    position: relative;
    vertical-align: baseline;
}
sup {
    top: -0.5em;
}
sub {
    bottom: -0.25em;
}
img {
    border: 0 none;
}
svg:not(:root) {
    overflow: hidden;
}
figure {
    margin: 0;
}
fieldset {
    border: 1px solid #c0c0c0;
    margin: 0 2px;
    padding: 0.35em 0.625em 0.75em;
}
legend {
    border: 0 none;
    padding: 0;
}
button, input, select, textarea {
    font-family: inherit;
    font-size: 100%;
    margin: 0;
}
button, input {
    line-height: normal;
}
button, select {
    text-transform: none;
}
button, html input[type="button"], input[type="reset"], input[type="submit"] {
    cursor: pointer;
}
button[disabled], html input[disabled] {
    cursor: default;
}
input[type="checkbox"], input[type="radio"] {
    box-sizing: border-box;
    padding: 0;
}
input[type="search"] {
    box-sizing: content-box;
}
button::-moz-focus-inner, input::-moz-focus-inner {
    border: 0 none;
    padding: 0;
}
textarea {
    overflow: auto;
    vertical-align: top;
}
table {
    border-collapse: collapse;
    border-spacing: 0;
}
@media print {
* {
    background: transparent none repeat scroll 0 0 !important;
    box-shadow: none !important;
    color: #000 !important;
    text-shadow: none !important;
}
a, a:visited {
    text-decoration: underline;
}
a[href]::after {
    content: " (" attr(href) ")";
}
abbr[title]::after {
    content: " (" attr(title) ")";
}
a[href^="javascript:"]::after, a[href^="#"]::after {
    content: "";
}
pre, blockquote {
    border: 1px solid #999;
    page-break-inside: avoid;
}
thead {
    display: table-header-group;
}
tr, img {
    page-break-inside: avoid;
}
img {
    max-width: 100% !important;
}
@page {
    margin: 2cm 0.5cm;
}
p, h2, h3 {
    orphans: 3;
    widows: 3;
}
h2, h3 {
    page-break-after: avoid;
}
select {
    background: #fff none repeat scroll 0 0 !important;
}
.navbar {
    display: none;
}
.table td, .table th {
    background-color: #fff !important;
}
.btn > .caret, .dropup > .btn > .caret {
    border-top-color: #000 !important;
}
.label {
    border: 1px solid #000;
}
.table {
    border-collapse: collapse !important;
}
.table-bordered th, .table-bordered td {
    border: 1px solid #ddd !important;
}
}
*, *::before, *::after {
    box-sizing: border-box;
}
html {
    font-size: 62.5%;
}
body {
    background-color: #fff;
    color: #333;
    font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;
    font-size: 14px;
    line-height: 1.42857;
}
input, button, select, textarea {
    font-family: inherit;
    font-size: inherit;
    line-height: inherit;
}
a {
    color: #428bca;
    text-decoration: none;
}
a:hover, a:focus {
    color: #2a6496;
    text-decoration: underline;
}
a:focus {
    outline: thin dotted;
    outline-offset: -2px;
}
img {
    vertical-align: middle;
}
.img-responsive {
    display: block;
    height: auto;
    max-width: 100%;
}
.img-rounded {
    border-radius: 6px;
}
.img-thumbnail {
    background-color: #fff;
    border: 1px solid #ddd;
    border-radius: 4px;
    display: inline-block;
    height: auto;
    line-height: 1.42857;
    max-width: 100%;
    padding: 4px;
    transition: all 0.2s ease-in-out 0s;
}
.img-circle {
    border-radius: 50%;
}
hr {
    -moz-border-bottom-colors: none;
    -moz-border-left-colors: none;
    -moz-border-right-colors: none;
    -moz-border-top-colors: none;
    border-color: #eee -moz-use-text-color -moz-use-text-color;
    border-image: none;
    border-style: solid none none;
    border-width: 1px 0 0;
    margin-bottom: 20px;
    margin-top: 20px;
}
.sr-only {
    border: 0 none;
    clip: rect(0px, 0px, 0px, 0px);
    height: 1px;
    margin: -1px;
    overflow: hidden;
    padding: 0;
    position: absolute;
    width: 1px;
}
h1, h2, h3, h4, h5, h6, .h1, .h2, .h3, .h4, .h5, .h6 {
    color: inherit;
    font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;
    font-weight: 500;
    line-height: 1.1;
}
h1 small, h2 small, h3 small, h4 small, h5 small, h6 small, .h1 small, .h2 small, .h3 small, .h4 small, .h5 small, .h6 small, h1 .small, h2 .small, h3 .small, h4 .small, h5 .small, h6 .small, .h1 .small, .h2 .small, .h3 .small, .h4 .small, .h5 .small, .h6 .small {
    color: #999;
    font-weight: normal;
    line-height: 1;
}
h1, h2, h3 {
    margin-bottom: 10px;
    margin-top: 20px;
}
h1 small, h2 small, h3 small, h1 .small, h2 .small, h3 .small {
    font-size: 65%;
}
h4, h5, h6 {
    margin-bottom: 10px;
    margin-top: 10px;
}
h4 small, h5 small, h6 small, h4 .small, h5 .small, h6 .small {
    font-size: 75%;
}
h1, .h1 {
    font-size: 36px;
}
h2, .h2 {
    font-size: 30px;
}
h3, .h3 {
    font-size: 24px;
}
h4, .h4 {
    font-size: 18px;
}
h5, .h5 {
    font-size: 14px;
}
h6, .h6 {
    font-size: 12px;
}
p {
    margin: 0 0 10px;
}
.lead {
    font-size: 16px;
    font-weight: 200;
    line-height: 1.4;
    margin-bottom: 20px;
}
@media (min-width: 768px) {
.lead {
    font-size: 21px;
}
}
small, .small {
    font-size: 85%;
}
cite {
    font-style: normal;
}
.text-muted {
    color: #999;
}
.text-primary {
    color: #428bca;
}
.text-primary:hover {
    color: #3071a9;
}
.text-warning {
    color: #8a6d3b;
}
.text-warning:hover {
    color: #66512c;
}
.text-danger {
    color: #a94442;
}
.text-danger:hover {
    color: #843534;
}
.text-success {
    color: #3c763d;
}
.text-success:hover {
    color: #2b542c;
}
.text-info {
    color: #31708f;
}
.text-info:hover {
    color: #245269;
}
.text-left {
    text-align: left;
}
.text-right {
    text-align: right;
}
.text-center {
    text-align: center;
}
.page-header {
    border-bottom: 1px solid #eee;
    margin: 40px 0 20px;
    padding-bottom: 9px;
}
ul, ol {
    margin-bottom: 10px;
    margin-top: 0;
}
ul ul, ol ul, ul ol, ol ol {
    margin-bottom: 0;
}
.list-unstyled {
    list-style: outside none none;
    padding-left: 0;
}
.list-inline {
    list-style: outside none none;
    padding-left: 0;
}
.list-inline > li {
    display: inline-block;
    padding-left: 5px;
    padding-right: 5px;
}
.list-inline > li:first-child {
    padding-left: 0;
}
dl {
    margin-bottom: 20px;
    margin-top: 0;
}
dt, dd {
    line-height: 1.42857;
}
dt {
    font-weight: bold;
}
dd {
    margin-left: 0;
}
@media (min-width: 768px) {
.dl-horizontal dt {
    clear: left;
    float: left;
    overflow: hidden;
    text-align: right;
    text-overflow: ellipsis;
    white-space: nowrap;
    width: 160px;
}
.dl-horizontal dd {
    margin-left: 180px;
}
.dl-horizontal dd::before, .dl-horizontal dd::after {
    content: " ";
    display: table;
}
.dl-horizontal dd::after {
    clear: both;
}
.dl-horizontal dd::before, .dl-horizontal dd::after {
    content: " ";
    display: table;
}
.dl-horizontal dd::after {
    clear: both;
}
}
abbr[title], abbr[data-original-title] {
    border-bottom: 1px dotted #999;
    cursor: help;
}
.initialism {
    font-size: 90%;
    text-transform: uppercase;
}
blockquote {
    border-left: 5px solid #eee;
    margin: 0 0 20px;
    padding: 10px 20px;
}
blockquote p {
    font-size: 17.5px;
    font-weight: 300;
    line-height: 1.25;
}
blockquote p:last-child {
    margin-bottom: 0;
}
blockquote small, blockquote .small {
    color: #999;
    display: block;
    line-height: 1.42857;
}
blockquote small::before, blockquote .small::before {
    content: "— ";
}
blockquote.pull-right {
    border-left: 0 none;
    border-right: 5px solid #eee;
    padding-left: 0;
    padding-right: 15px;
}
blockquote.pull-right p, blockquote.pull-right small, blockquote.pull-right .small {
    text-align: right;
}
blockquote.pull-right small::before, blockquote.pull-right .small::before {
    content: "";
}
blockquote.pull-right small::after, blockquote.pull-right .small::after {
    content: " —";
}
blockquote::before, blockquote::after {
    content: "";
}
address {
    font-style: normal;
    line-height: 1.42857;
    margin-bottom: 20px;
}
code, kbd, pre, samp {
    font-family: Menlo,Monaco,Consolas,"Courier New",monospace;
}
code {
    background-color: #f9f2f4;
    border-radius: 4px;
    color: #c7254e;
    font-size: 90%;
    padding: 2px 4px;
    white-space: nowrap;
}
pre {
    background-color: #f5f5f5;
    border: 1px solid #ccc;
    border-radius: 4px;
    color: #333;
    display: block;
    font-size: 13px;
    line-height: 1.42857;
    margin: 0 0 10px;
    padding: 9.5px;
    word-break: break-all;
    word-wrap: break-word;
}
pre code {
    background-color: transparent;
    border-radius: 0;
    color: inherit;
    font-size: inherit;
    padding: 0;
    white-space: pre-wrap;
}
.pre-scrollable {
    max-height: 340px;
    overflow-y: scroll;
}
.container {
    margin-left: auto;
    margin-right: auto;
    padding-left: 15px;
    padding-right: 15px;
}
.container::before, .container::after {
    content: " ";
    display: table;
}
.container::after {
    clear: both;
}
.container::before, .container::after {
    content: " ";
    display: table;
}
.container::after {
    clear: both;
}
@media (min-width: 768px) {
.container {
    width: 750px;
}
}
@media (min-width: 992px) {
.container {
    width: 970px;
}
}
@media (min-width: 1200px) {
.container {
    width: 1170px;
}
}
.row {
    margin-left: -15px;
    margin-right: -15px;
}
.row::before, .row::after {
    content: " ";
    display: table;
}
.row::after {
    clear: both;
}
.row::before, .row::after {
    content: " ";
    display: table;
}
.row::after {
    clear: both;
}
.col-xs-1, .col-sm-1, .col-md-1, .col-lg-1, .col-xs-2, .col-sm-2, .col-md-2, .col-lg-2, .col-xs-3, .col-sm-3, .col-md-3, .col-lg-3, .col-xs-4, .col-sm-4, .col-md-4, .col-lg-4, .col-xs-5, .col-sm-5, .col-md-5, .col-lg-5, .col-xs-6, .col-sm-6, .col-md-6, .col-lg-6, .col-xs-7, .col-sm-7, .col-md-7, .col-lg-7, .col-xs-8, .col-sm-8, .col-md-8, .col-lg-8, .col-xs-9, .col-sm-9, .col-md-9, .col-lg-9, .col-xs-10, .col-sm-10, .col-md-10, .col-lg-10, .col-xs-11, .col-sm-11, .col-md-11, .col-lg-11, .col-xs-12, .col-sm-12, .col-md-12, .col-lg-12 {
    min-height: 1px;
    padding-left: 15px;
    padding-right: 15px;
    position: relative;
}
.col-xs-1, .col-xs-2, .col-xs-3, .col-xs-4, .col-xs-5, .col-xs-6, .col-xs-7, .col-xs-8, .col-xs-9, .col-xs-10, .col-xs-11, .col-xs-12 {
    float: left;
}
.col-xs-12 {
    width: 100%;
}
.col-xs-11 {
    width: 91.6667%;
}
.col-xs-10 {
    width: 83.3333%;
}
.col-xs-9 {
    width: 75%;
}
.col-xs-8 {
    width: 66.6667%;
}
.col-xs-7 {
    width: 58.3333%;
}
.col-xs-6 {
    width: 50%;
}
.col-xs-5 {
    width: 41.6667%;
}
.col-xs-4 {
    width: 33.3333%;
}
.col-xs-3 {
    width: 25%;
}
.col-xs-2 {
    width: 16.6667%;
}
.col-xs-1 {
    width: 8.33333%;
}
.col-xs-pull-12 {
    right: 100%;
}
.col-xs-pull-11 {
    right: 91.6667%;
}
.col-xs-pull-10 {
    right: 83.3333%;
}
.col-xs-pull-9 {
    right: 75%;
}
.col-xs-pull-8 {
    right: 66.6667%;
}
.col-xs-pull-7 {
    right: 58.3333%;
}
.col-xs-pull-6 {
    right: 50%;
}
.col-xs-pull-5 {
    right: 41.6667%;
}
.col-xs-pull-4 {
    right: 33.3333%;
}
.col-xs-pull-3 {
    right: 25%;
}
.col-xs-pull-2 {
    right: 16.6667%;
}
.col-xs-pull-1 {
    right: 8.33333%;
}
.col-xs-pull-0 {
    right: 0;
}
.col-xs-push-12 {
    left: 100%;
}
.col-xs-push-11 {
    left: 91.6667%;
}
.col-xs-push-10 {
    left: 83.3333%;
}
.col-xs-push-9 {
    left: 75%;
}
.col-xs-push-8 {
    left: 66.6667%;
}
.col-xs-push-7 {
    left: 58.3333%;
}
.col-xs-push-6 {
    left: 50%;
}
.col-xs-push-5 {
    left: 41.6667%;
}
.col-xs-push-4 {
    left: 33.3333%;
}
.col-xs-push-3 {
    left: 25%;
}
.col-xs-push-2 {
    left: 16.6667%;
}
.col-xs-push-1 {
    left: 8.33333%;
}
.col-xs-push-0 {
    left: 0;
}
.col-xs-offset-12 {
    margin-left: 100%;
}
.col-xs-offset-11 {
    margin-left: 91.6667%;
}
.col-xs-offset-10 {
    margin-left: 83.3333%;
}
.col-xs-offset-9 {
    margin-left: 75%;
}
.col-xs-offset-8 {
    margin-left: 66.6667%;
}
.col-xs-offset-7 {
    margin-left: 58.3333%;
}
.col-xs-offset-6 {
    margin-left: 50%;
}
.col-xs-offset-5 {
    margin-left: 41.6667%;
}
.col-xs-offset-4 {
    margin-left: 33.3333%;
}
.col-xs-offset-3 {
    margin-left: 25%;
}
.col-xs-offset-2 {
    margin-left: 16.6667%;
}
.col-xs-offset-1 {
    margin-left: 8.33333%;
}
.col-xs-offset-0 {
    margin-left: 0;
}
@media (min-width: 768px) {
.col-sm-1, .col-sm-2, .col-sm-3, .col-sm-4, .col-sm-5, .col-sm-6, .col-sm-7, .col-sm-8, .col-sm-9, .col-sm-10, .col-sm-11, .col-sm-12 {
    float: left;
}
.col-sm-12 {
    width: 100%;
}
.col-sm-11 {
    width: 91.6667%;
}
.col-sm-10 {
    width: 83.3333%;
}
.col-sm-9 {
    width: 75%;
}
.col-sm-8 {
    width: 66.6667%;
}
.col-sm-7 {
    width: 58.3333%;
}
.col-sm-6 {
    width: 50%;
}
.col-sm-5 {
    width: 41.6667%;
}
.col-sm-4 {
    width: 33.3333%;
}
.col-sm-3 {
    width: 25%;
}
.col-sm-2 {
    width: 16.6667%;
}
.col-sm-1 {
    width: 8.33333%;
}
.col-sm-pull-12 {
    right: 100%;
}
.col-sm-pull-11 {
    right: 91.6667%;
}
.col-sm-pull-10 {
    right: 83.3333%;
}
.col-sm-pull-9 {
    right: 75%;
}
.col-sm-pull-8 {
    right: 66.6667%;
}
.col-sm-pull-7 {
    right: 58.3333%;
}
.col-sm-pull-6 {
    right: 50%;
}
.col-sm-pull-5 {
    right: 41.6667%;
}
.col-sm-pull-4 {
    right: 33.3333%;
}
.col-sm-pull-3 {
    right: 25%;
}
.col-sm-pull-2 {
    right: 16.6667%;
}
.col-sm-pull-1 {
    right: 8.33333%;
}
.col-sm-pull-0 {
    right: 0;
}
.col-sm-push-12 {
    left: 100%;
}
.col-sm-push-11 {
    left: 91.6667%;
}
.col-sm-push-10 {
    left: 83.3333%;
}
.col-sm-push-9 {
    left: 75%;
}
.col-sm-push-8 {
    left: 66.6667%;
}
.col-sm-push-7 {
    left: 58.3333%;
}
.col-sm-push-6 {
    left: 50%;
}
.col-sm-push-5 {
    left: 41.6667%;
}
.col-sm-push-4 {
    left: 33.3333%;
}
.col-sm-push-3 {
    left: 25%;
}
.col-sm-push-2 {
    left: 16.6667%;
}
.col-sm-push-1 {
    left: 8.33333%;
}
.col-sm-push-0 {
    left: 0;
}
.col-sm-offset-12 {
    margin-left: 100%;
}
.col-sm-offset-11 {
    margin-left: 91.6667%;
}
.col-sm-offset-10 {
    margin-left: 83.3333%;
}
.col-sm-offset-9 {
    margin-left: 75%;
}
.col-sm-offset-8 {
    margin-left: 66.6667%;
}
.col-sm-offset-7 {
    margin-left: 58.3333%;
}
.col-sm-offset-6 {
    margin-left: 50%;
}
.col-sm-offset-5 {
    margin-left: 41.6667%;
}
.col-sm-offset-4 {
    margin-left: 33.3333%;
}
.col-sm-offset-3 {
    margin-left: 25%;
}
.col-sm-offset-2 {
    margin-left: 16.6667%;
}
.col-sm-offset-1 {
    margin-left: 8.33333%;
}
.col-sm-offset-0 {
    margin-left: 0;
}
}
@media (min-width: 992px) {
.col-md-1, .col-md-2, .col-md-3, .col-md-4, .col-md-5, .col-md-6, .col-md-7, .col-md-8, .col-md-9, .col-md-10, .col-md-11, .col-md-12 {
    float: left;
}
.col-md-12 {
    width: 100%;
}
.col-md-11 {
    width: 91.6667%;
}
.col-md-10 {
    width: 83.3333%;
}
.col-md-9 {
    width: 75%;
}
.col-md-8 {
    width: 66.6667%;
}
.col-md-7 {
    width: 58.3333%;
}
.col-md-6 {
    width: 50%;
}
.col-md-5 {
    width: 41.6667%;
}
.col-md-4 {
    width: 33.3333%;
}
.col-md-3 {
    width: 25%;
}
.col-md-2 {
    width: 16.6667%;
}
.col-md-1 {
    width: 8.33333%;
}
.col-md-pull-12 {
    right: 100%;
}
.col-md-pull-11 {
    right: 91.6667%;
}
.col-md-pull-10 {
    right: 83.3333%;
}
.col-md-pull-9 {
    right: 75%;
}
.col-md-pull-8 {
    right: 66.6667%;
}
.col-md-pull-7 {
    right: 58.3333%;
}
.col-md-pull-6 {
    right: 50%;
}
.col-md-pull-5 {
    right: 41.6667%;
}
.col-md-pull-4 {
    right: 33.3333%;
}
.col-md-pull-3 {
    right: 25%;
}
.col-md-pull-2 {
    right: 16.6667%;
}
.col-md-pull-1 {
    right: 8.33333%;
}
.col-md-pull-0 {
    right: 0;
}
.col-md-push-12 {
    left: 100%;
}
.col-md-push-11 {
    left: 91.6667%;
}
.col-md-push-10 {
    left: 83.3333%;
}
.col-md-push-9 {
    left: 75%;
}
.col-md-push-8 {
    left: 66.6667%;
}
.col-md-push-7 {
    left: 58.3333%;
}
.col-md-push-6 {
    left: 50%;
}
.col-md-push-5 {
    left: 41.6667%;
}
.col-md-push-4 {
    left: 33.3333%;
}
.col-md-push-3 {
    left: 25%;
}
.col-md-push-2 {
    left: 16.6667%;
}
.col-md-push-1 {
    left: 8.33333%;
}
.col-md-push-0 {
    left: 0;
}
.col-md-offset-12 {
    margin-left: 100%;
}
.col-md-offset-11 {
    margin-left: 91.6667%;
}
.col-md-offset-10 {
    margin-left: 83.3333%;
}
.col-md-offset-9 {
    margin-left: 75%;
}
.col-md-offset-8 {
    margin-left: 66.6667%;
}
.col-md-offset-7 {
    margin-left: 58.3333%;
}
.col-md-offset-6 {
    margin-left: 50%;
}
.col-md-offset-5 {
    margin-left: 41.6667%;
}
.col-md-offset-4 {
    margin-left: 33.3333%;
}
.col-md-offset-3 {
    margin-left: 25%;
}
.col-md-offset-2 {
    margin-left: 16.6667%;
}
.col-md-offset-1 {
    margin-left: 8.33333%;
}
.col-md-offset-0 {
    margin-left: 0;
}
}
@media (min-width: 1200px) {
.col-lg-1, .col-lg-2, .col-lg-3, .col-lg-4, .col-lg-5, .col-lg-6, .col-lg-7, .col-lg-8, .col-lg-9, .col-lg-10, .col-lg-11, .col-lg-12 {
    float: left;
}
.col-lg-12 {
    width: 100%;
}
.col-lg-11 {
    width: 91.6667%;
}
.col-lg-10 {
    width: 83.3333%;
}
.col-lg-9 {
    width: 75%;
}
.col-lg-8 {
    width: 66.6667%;
}
.col-lg-7 {
    width: 58.3333%;
}
.col-lg-6 {
    width: 50%;
}
.col-lg-5 {
    width: 41.6667%;
}
.col-lg-4 {
    width: 33.3333%;
}
.col-lg-3 {
    width: 25%;
}
.col-lg-2 {
    width: 16.6667%;
}
.col-lg-1 {
    width: 8.33333%;
}
.col-lg-pull-12 {
    right: 100%;
}
.col-lg-pull-11 {
    right: 91.6667%;
}
.col-lg-pull-10 {
    right: 83.3333%;
}
.col-lg-pull-9 {
    right: 75%;
}
.col-lg-pull-8 {
    right: 66.6667%;
}
.col-lg-pull-7 {
    right: 58.3333%;
}
.col-lg-pull-6 {
    right: 50%;
}
.col-lg-pull-5 {
    right: 41.6667%;
}
.col-lg-pull-4 {
    right: 33.3333%;
}
.col-lg-pull-3 {
    right: 25%;
}
.col-lg-pull-2 {
    right: 16.6667%;
}
.col-lg-pull-1 {
    right: 8.33333%;
}
.col-lg-pull-0 {
    right: 0;
}
.col-lg-push-12 {
    left: 100%;
}
.col-lg-push-11 {
    left: 91.6667%;
}
.col-lg-push-10 {
    left: 83.3333%;
}
.col-lg-push-9 {
    left: 75%;
}
.col-lg-push-8 {
    left: 66.6667%;
}
.col-lg-push-7 {
    left: 58.3333%;
}
.col-lg-push-6 {
    left: 50%;
}
.col-lg-push-5 {
    left: 41.6667%;
}
.col-lg-push-4 {
    left: 33.3333%;
}
.col-lg-push-3 {
    left: 25%;
}
.col-lg-push-2 {
    left: 16.6667%;
}
.col-lg-push-1 {
    left: 8.33333%;
}
.col-lg-push-0 {
    left: 0;
}
.col-lg-offset-12 {
    margin-left: 100%;
}
.col-lg-offset-11 {
    margin-left: 91.6667%;
}
.col-lg-offset-10 {
    margin-left: 83.3333%;
}
.col-lg-offset-9 {
    margin-left: 75%;
}
.col-lg-offset-8 {
    margin-left: 66.6667%;
}
.col-lg-offset-7 {
    margin-left: 58.3333%;
}
.col-lg-offset-6 {
    margin-left: 50%;
}
.col-lg-offset-5 {
    margin-left: 41.6667%;
}
.col-lg-offset-4 {
    margin-left: 33.3333%;
}
.col-lg-offset-3 {
    margin-left: 25%;
}
.col-lg-offset-2 {
    margin-left: 16.6667%;
}
.col-lg-offset-1 {
    margin-left: 8.33333%;
}
.col-lg-offset-0 {
    margin-left: 0;
}
}
table {
    background-color: transparent;
    max-width: 100%;
}
th {
    text-align: left;
}
.table {
    margin-bottom: 20px;
    width: 100%;
}
.table > thead > tr > th, .table > tbody > tr > th, .table > tfoot > tr > th, .table > thead > tr > td, .table > tbody > tr > td, .table > tfoot > tr > td {
    border-top: 1px solid #ddd;
    line-height: 1.42857;
    padding: 8px;
    vertical-align: top;
}
.table > thead > tr > th {
    border-bottom: 2px solid #ddd;
    vertical-align: bottom;
}
.table > caption + thead > tr:first-child > th, .table > colgroup + thead > tr:first-child > th, .table > thead:first-child > tr:first-child > th, .table > caption + thead > tr:first-child > td, .table > colgroup + thead > tr:first-child > td, .table > thead:first-child > tr:first-child > td {
    border-top: 0 none;
}
.table > tbody + tbody {
    border-top: 2px solid #ddd;
}
.table .table {
    background-color: #fff;
}
.table-condensed > thead > tr > th, .table-condensed > tbody > tr > th, .table-condensed > tfoot > tr > th, .table-condensed > thead > tr > td, .table-condensed > tbody > tr > td, .table-condensed > tfoot > tr > td {
    padding: 5px;
}
.table-bordered {
    border: 1px solid #ddd;
}
.table-bordered > thead > tr > th, .table-bordered > tbody > tr > th, .table-bordered > tfoot > tr > th, .table-bordered > thead > tr > td, .table-bordered > tbody > tr > td, .table-bordered > tfoot > tr > td {
    border: 1px solid #ddd;
}
.table-bordered > thead > tr > th, .table-bordered > thead > tr > td {
    border-bottom-width: 2px;
}
.table-striped > tbody > tr:nth-child(2n+1) > td, .table-striped > tbody > tr:nth-child(2n+1) > th {
    background-color: #f9f9f9;
}
.table-hover > tbody > tr:hover > td, .table-hover > tbody > tr:hover > th {
    background-color: #f5f5f5;
}
table col[class*="col-"] {
    display: table-column;
    float: none;
    position: static;
}
table td[class*="col-"], table th[class*="col-"] {
    display: table-cell;
    float: none;
}
.table > thead > tr > .active, .table > tbody > tr > .active, .table > tfoot > tr > .active, .table > thead > .active > td, .table > tbody > .active > td, .table > tfoot > .active > td, .table > thead > .active > th, .table > tbody > .active > th, .table > tfoot > .active > th {
    background-color: #f5f5f5;
}
.table-hover > tbody > tr > .active:hover, .table-hover > tbody > .active:hover > td, .table-hover > tbody > .active:hover > th {
    background-color: #e8e8e8;
}
.table > thead > tr > .success, .table > tbody > tr > .success, .table > tfoot > tr > .success, .table > thead > .success > td, .table > tbody > .success > td, .table > tfoot > .success > td, .table > thead > .success > th, .table > tbody > .success > th, .table > tfoot > .success > th {
    background-color: #dff0d8;
}
.table-hover > tbody > tr > .success:hover, .table-hover > tbody > .success:hover > td, .table-hover > tbody > .success:hover > th {
    background-color: #d0e9c6;
}
.table > thead > tr > .danger, .table > tbody > tr > .danger, .table > tfoot > tr > .danger, .table > thead > .danger > td, .table > tbody > .danger > td, .table > tfoot > .danger > td, .table > thead > .danger > th, .table > tbody > .danger > th, .table > tfoot > .danger > th {
    background-color: #f2dede;
}
.table-hover > tbody > tr > .danger:hover, .table-hover > tbody > .danger:hover > td, .table-hover > tbody > .danger:hover > th {
    background-color: #ebcccc;
}
.table > thead > tr > .warning, .table > tbody > tr > .warning, .table > tfoot > tr > .warning, .table > thead > .warning > td, .table > tbody > .warning > td, .table > tfoot > .warning > td, .table > thead > .warning > th, .table > tbody > .warning > th, .table > tfoot > .warning > th {
    background-color: #fcf8e3;
}
.table-hover > tbody > tr > .warning:hover, .table-hover > tbody > .warning:hover > td, .table-hover > tbody > .warning:hover > th {
    background-color: #faf2cc;
}
@media (max-width: 767px) {
.table-responsive {
    border: 1px solid #ddd;
    margin-bottom: 15px;
    overflow-x: scroll;
    overflow-y: hidden;
    width: 100%;
}
.table-responsive > .table {
    margin-bottom: 0;
}
.table-responsive > .table > thead > tr > th, .table-responsive > .table > tbody > tr > th, .table-responsive > .table > tfoot > tr > th, .table-responsive > .table > thead > tr > td, .table-responsive > .table > tbody > tr > td, .table-responsive > .table > tfoot > tr > td {
    white-space: nowrap;
}
.table-responsive > .table-bordered {
    border: 0 none;
}
.table-responsive > .table-bordered > thead > tr > th:first-child, .table-responsive > .table-bordered > tbody > tr > th:first-child, .table-responsive > .table-bordered > tfoot > tr > th:first-child, .table-responsive > .table-bordered > thead > tr > td:first-child, .table-responsive > .table-bordered > tbody > tr > td:first-child, .table-responsive > .table-bordered > tfoot > tr > td:first-child {
    border-left: 0 none;
}
.table-responsive > .table-bordered > thead > tr > th:last-child, .table-responsive > .table-bordered > tbody > tr > th:last-child, .table-responsive > .table-bordered > tfoot > tr > th:last-child, .table-responsive > .table-bordered > thead > tr > td:last-child, .table-responsive > .table-bordered > tbody > tr > td:last-child, .table-responsive > .table-bordered > tfoot > tr > td:last-child {
    border-right: 0 none;
}
.table-responsive > .table-bordered > tbody > tr:last-child > th, .table-responsive > .table-bordered > tfoot > tr:last-child > th, .table-responsive > .table-bordered > tbody > tr:last-child > td, .table-responsive > .table-bordered > tfoot > tr:last-child > td {
    border-bottom: 0 none;
}
}
fieldset {
    border: 0 none;
    margin: 0;
    padding: 0;
}
legend {
    -moz-border-bottom-colors: none;
    -moz-border-left-colors: none;
    -moz-border-right-colors: none;
    -moz-border-top-colors: none;
    border-color: -moz-use-text-color -moz-use-text-color #e5e5e5;
    border-image: none;
    border-style: none none solid;
    border-width: 0 0 1px;
    color: #333;
    display: block;
    font-size: 21px;
    line-height: inherit;
    margin-bottom: 20px;
    padding: 0;
    width: 100%;
}
label {
    display: inline-block;
    font-weight: bold;
    margin-bottom: 5px;
}
input[type="search"] {
    box-sizing: border-box;
}
input[type="radio"], input[type="checkbox"] {
    line-height: normal;
    margin: 4px 0 0;
}
input[type="file"] {
    display: block;
}
select[multiple], select[size] {
    height: auto;
}
select optgroup {
    font-family: inherit;
    font-size: inherit;
    font-style: inherit;
}
input[type="file"]:focus, input[type="radio"]:focus, input[type="checkbox"]:focus {
    outline: thin dotted;
    outline-offset: -2px;
}
output {
    color: #555;
    display: block;
    font-size: 14px;
    line-height: 1.42857;
    padding-top: 7px;
    vertical-align: middle;
}
.form-control {
    background-color: #fff;
    background-image: none;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-shadow: 0 1px 1px rgba(0, 0, 0, 0.075) inset;
    color: #555;
    display: block;
    font-size: 14px;
    height: 34px;
    line-height: 1.42857;
    padding: 6px 12px;
    transition: border-color 0.15s ease-in-out 0s, box-shadow 0.15s ease-in-out 0s;
    vertical-align: middle;
    width: 100%;
}
.form-control:focus {
    border-color: #66afe9;
    box-shadow: 0 1px 1px rgba(0, 0, 0, 0.075) inset, 0 0 8px rgba(102, 175, 233, 0.6);
    outline: 0 none;
}
.form-control:-moz-placeholder {
    color: #999;
}
.form-control::-moz-placeholder {
    color: #999;
    opacity: 1;
}
.form-control[disabled], .form-control[readonly], fieldset[disabled] .form-control {
    background-color: #eee;
    cursor: not-allowed;
}
textarea.form-control {
    height: auto;
}
.form-group {
    margin-bottom: 15px;
}
.radio, .checkbox {
    display: block;
    margin-bottom: 10px;
    margin-top: 10px;
    min-height: 20px;
    padding-left: 20px;
    vertical-align: middle;
}
.radio label, .checkbox label {
    cursor: pointer;
    display: inline;
    font-weight: normal;
    margin-bottom: 0;
}
.radio input[type="radio"], .radio-inline input[type="radio"], .checkbox input[type="checkbox"], .checkbox-inline input[type="checkbox"] {
    float: left;
    margin-left: -20px;
}
.radio + .radio, .checkbox + .checkbox {
    margin-top: -5px;
}
.radio-inline, .checkbox-inline {
    cursor: pointer;
    display: inline-block;
    font-weight: normal;
    margin-bottom: 0;
    padding-left: 20px;
    vertical-align: middle;
}
.radio-inline + .radio-inline, .checkbox-inline + .checkbox-inline {
    margin-left: 10px;
    margin-top: 0;
}
input[type="radio"][disabled], input[type="checkbox"][disabled], .radio[disabled], .radio-inline[disabled], .checkbox[disabled], .checkbox-inline[disabled], fieldset[disabled] input[type="radio"], fieldset[disabled] input[type="checkbox"], fieldset[disabled] .radio, fieldset[disabled] .radio-inline, fieldset[disabled] .checkbox, fieldset[disabled] .checkbox-inline {
    cursor: not-allowed;
}
.input-sm {
    border-radius: 3px;
    font-size: 12px;
    height: 30px;
    line-height: 1.5;
    padding: 5px 10px;
}
select.input-sm {
    height: 30px;
    line-height: 30px;
}
textarea.input-sm {
    height: auto;
}
.input-lg {
    border-radius: 6px;
    font-size: 18px;
    height: 46px;
    line-height: 1.33;
    padding: 10px 16px;
}
select.input-lg {
    height: 46px;
    line-height: 46px;
}
textarea.input-lg {
    height: auto;
}
.has-warning .help-block, .has-warning .control-label, .has-warning .radio, .has-warning .checkbox, .has-warning .radio-inline, .has-warning .checkbox-inline {
    color: #8a6d3b;
}
.has-warning .form-control {
    border-color: #8a6d3b;
    box-shadow: 0 1px 1px rgba(0, 0, 0, 0.075) inset;
}
.has-warning .form-control:focus {
    border-color: #66512c;
    box-shadow: 0 1px 1px rgba(0, 0, 0, 0.075) inset, 0 0 6px #c0a16b;
}
.has-warning .input-group-addon {
    background-color: #fcf8e3;
    border-color: #8a6d3b;
    color: #8a6d3b;
}
.has-error .help-block, .has-error .control-label, .has-error .radio, .has-error .checkbox, .has-error .radio-inline, .has-error .checkbox-inline {
    color: #a94442;
}
.has-error .form-control {
    border-color: #a94442;
    box-shadow: 0 1px 1px rgba(0, 0, 0, 0.075) inset;
}
.has-error .form-control:focus {
    border-color: #843534;
    box-shadow: 0 1px 1px rgba(0, 0, 0, 0.075) inset, 0 0 6px #ce8483;
}
.has-error .input-group-addon {
    background-color: #f2dede;
    border-color: #a94442;
    color: #a94442;
}
.has-success .help-block, .has-success .control-label, .has-success .radio, .has-success .checkbox, .has-success .radio-inline, .has-success .checkbox-inline {
    color: #3c763d;
}
.has-success .form-control {
    border-color: #3c763d;
    box-shadow: 0 1px 1px rgba(0, 0, 0, 0.075) inset;
}
.has-success .form-control:focus {
    border-color: #2b542c;
    box-shadow: 0 1px 1px rgba(0, 0, 0, 0.075) inset, 0 0 6px #67b168;
}
.has-success .input-group-addon {
    background-color: #dff0d8;
    border-color: #3c763d;
    color: #3c763d;
}
.form-control-static {
    margin-bottom: 0;
}
.help-block {
    color: #737373;
    display: block;
    margin-bottom: 10px;
    margin-top: 5px;
}
@media (min-width: 768px) {
.form-inline .form-group {
    display: inline-block;
    margin-bottom: 0;
    vertical-align: middle;
}
.form-inline .form-control {
    display: inline-block;
}
.form-inline select.form-control {
    width: auto;
}
.form-inline .radio, .form-inline .checkbox {
    display: inline-block;
    margin-bottom: 0;
    margin-top: 0;
    padding-left: 0;
}
.form-inline .radio input[type="radio"], .form-inline .checkbox input[type="checkbox"] {
    float: none;
    margin-left: 0;
}
}
.form-horizontal .control-label, .form-horizontal .radio, .form-horizontal .checkbox, .form-horizontal .radio-inline, .form-horizontal .checkbox-inline {
    margin-bottom: 0;
    margin-top: 0;
    padding-top: 7px;
}
.form-horizontal .radio, .form-horizontal .checkbox {
    min-height: 27px;
}
.form-horizontal .form-group {
    margin-left: -15px;
    margin-right: -15px;
}
.form-horizontal .form-group::before, .form-horizontal .form-group::after {
    content: " ";
    display: table;
}
.form-horizontal .form-group::after {
    clear: both;
}
.form-horizontal .form-group::before, .form-horizontal .form-group::after {
    content: " ";
    display: table;
}
.form-horizontal .form-group::after {
    clear: both;
}
.form-horizontal .form-control-static {
    padding-top: 7px;
}
@media (min-width: 768px) {
.form-horizontal .control-label {
    text-align: right;
}
}
.btn {
    -moz-user-select: none;
    background-image: none;
    border: 1px solid transparent;
    border-radius: 4px;
    cursor: pointer;
    display: inline-block;
    font-size: 14px;
    font-weight: normal;
    line-height: 1.42857;
    margin-bottom: 0;
    padding: 6px 12px;
    text-align: center;
    vertical-align: middle;
    white-space: nowrap;
}
.btn:focus {
    outline: thin dotted;
    outline-offset: -2px;
}
.btn:hover, .btn:focus {
    color: #333;
    text-decoration: none;
}
.btn:active, .btn.active {
    background-image: none;
    box-shadow: 0 3px 5px rgba(0, 0, 0, 0.125) inset;
    outline: 0 none;
}
.btn.disabled, .btn[disabled], fieldset[disabled] .btn {
    box-shadow: none;
    cursor: not-allowed;
    opacity: 0.65;
    pointer-events: none;
}
.btn-default {
    background-color: #fff;
    border-color: #ccc;
    color: #333;
}
.btn-default:hover, .btn-default:focus, .btn-default:active, .btn-default.active, .open .dropdown-toggle.btn-default {
    background-color: #ebebeb;
    border-color: #adadad;
    color: #333;
}
.btn-default:active, .btn-default.active, .open .dropdown-toggle.btn-default {
    background-image: none;
}
.btn-default.disabled, .btn-default[disabled], fieldset[disabled] .btn-default, .btn-default.disabled:hover, .btn-default[disabled]:hover, fieldset[disabled] .btn-default:hover, .btn-default.disabled:focus, .btn-default[disabled]:focus, fieldset[disabled] .btn-default:focus, .btn-default.disabled:active, .btn-default[disabled]:active, fieldset[disabled] .btn-default:active, .btn-default.disabled.active, .btn-default.active[disabled], fieldset[disabled] .btn-default.active {
    background-color: #fff;
    border-color: #ccc;
}
.btn-default .badge {
    background-color: #fff;
    color: #fff;
}
.btn-primary {
    background-color: #428bca;
    border-color: #357ebd;
    color: #fff;
}
.btn-primary:hover, .btn-primary:focus, .btn-primary:active, .btn-primary.active, .open .dropdown-toggle.btn-primary {
    background-color: #3276b1;
    border-color: #285e8e;
    color: #fff;
}
.btn-primary:active, .btn-primary.active, .open .dropdown-toggle.btn-primary {
    background-image: none;
}
.btn-primary.disabled, .btn-primary[disabled], fieldset[disabled] .btn-primary, .btn-primary.disabled:hover, .btn-primary[disabled]:hover, fieldset[disabled] .btn-primary:hover, .btn-primary.disabled:focus, .btn-primary[disabled]:focus, fieldset[disabled] .btn-primary:focus, .btn-primary.disabled:active, .btn-primary[disabled]:active, fieldset[disabled] .btn-primary:active, .btn-primary.disabled.active, .btn-primary.active[disabled], fieldset[disabled] .btn-primary.active {
    background-color: #428bca;
    border-color: #357ebd;
}
.btn-primary .badge {
    background-color: #fff;
    color: #428bca;
}
.btn-warning {
    background-color: #f0ad4e;
    border-color: #eea236;
    color: #fff;
}
.btn-warning:hover, .btn-warning:focus, .btn-warning:active, .btn-warning.active, .open .dropdown-toggle.btn-warning {
    background-color: #ed9c28;
    border-color: #d58512;
    color: #fff;
}
.btn-warning:active, .btn-warning.active, .open .dropdown-toggle.btn-warning {
    background-image: none;
}
.btn-warning.disabled, .btn-warning[disabled], fieldset[disabled] .btn-warning, .btn-warning.disabled:hover, .btn-warning[disabled]:hover, fieldset[disabled] .btn-warning:hover, .btn-warning.disabled:focus, .btn-warning[disabled]:focus, fieldset[disabled] .btn-warning:focus, .btn-warning.disabled:active, .btn-warning[disabled]:active, fieldset[disabled] .btn-warning:active, .btn-warning.disabled.active, .btn-warning.active[disabled], fieldset[disabled] .btn-warning.active {
    background-color: #f0ad4e;
    border-color: #eea236;
}
.btn-warning .badge {
    background-color: #fff;
    color: #f0ad4e;
}
.btn-danger {
    background-color: #d9534f;
    border-color: #d43f3a;
    color: #fff;
}
.btn-danger:hover, .btn-danger:focus, .btn-danger:active, .btn-danger.active, .open .dropdown-toggle.btn-danger {
    background-color: #d2322d;
    border-color: #ac2925;
    color: #fff;
}
.btn-danger:active, .btn-danger.active, .open .dropdown-toggle.btn-danger {
    background-image: none;
}
.btn-danger.disabled, .btn-danger[disabled], fieldset[disabled] .btn-danger, .btn-danger.disabled:hover, .btn-danger[disabled]:hover, fieldset[disabled] .btn-danger:hover, .btn-danger.disabled:focus, .btn-danger[disabled]:focus, fieldset[disabled] .btn-danger:focus, .btn-danger.disabled:active, .btn-danger[disabled]:active, fieldset[disabled] .btn-danger:active, .btn-danger.disabled.active, .btn-danger.active[disabled], fieldset[disabled] .btn-danger.active {
    background-color: #d9534f;
    border-color: #d43f3a;
}
.btn-danger .badge {
    background-color: #fff;
    color: #d9534f;
}
.btn-success {
    background-color: #5cb85c;
    border-color: #4cae4c;
    color: #fff;
}
.btn-success:hover, .btn-success:focus, .btn-success:active, .btn-success.active, .open .dropdown-toggle.btn-success {
    background-color: #47a447;
    border-color: #398439;
    color: #fff;
}
.btn-success:active, .btn-success.active, .open .dropdown-toggle.btn-success {
    background-image: none;
}
.btn-success.disabled, .btn-success[disabled], fieldset[disabled] .btn-success, .btn-success.disabled:hover, .btn-success[disabled]:hover, fieldset[disabled] .btn-success:hover, .btn-success.disabled:focus, .btn-success[disabled]:focus, fieldset[disabled] .btn-success:focus, .btn-success.disabled:active, .btn-success[disabled]:active, fieldset[disabled] .btn-success:active, .btn-success.disabled.active, .btn-success.active[disabled], fieldset[disabled] .btn-success.active {
    background-color: #5cb85c;
    border-color: #4cae4c;
}
.btn-success .badge {
    background-color: #fff;
    color: #5cb85c;
}
.btn-info {
    background-color: #5bc0de;
    border-color: #46b8da;
    color: #fff;
}
.btn-info:hover, .btn-info:focus, .btn-info:active, .btn-info.active, .open .dropdown-toggle.btn-info {
    background-color: #39b3d7;
    border-color: #269abc;
    color: #fff;
}
.btn-info:active, .btn-info.active, .open .dropdown-toggle.btn-info {
    background-image: none;
}
.btn-info.disabled, .btn-info[disabled], fieldset[disabled] .btn-info, .btn-info.disabled:hover, .btn-info[disabled]:hover, fieldset[disabled] .btn-info:hover, .btn-info.disabled:focus, .btn-info[disabled]:focus, fieldset[disabled] .btn-info:focus, .btn-info.disabled:active, .btn-info[disabled]:active, fieldset[disabled] .btn-info:active, .btn-info.disabled.active, .btn-info.active[disabled], fieldset[disabled] .btn-info.active {
    background-color: #5bc0de;
    border-color: #46b8da;
}
.btn-info .badge {
    background-color: #fff;
    color: #5bc0de;
}
.btn-link {
    border-radius: 0;
    color: #428bca;
    cursor: pointer;
    font-weight: normal;
}
.btn-link, .btn-link:active, .btn-link[disabled], fieldset[disabled] .btn-link {
    background-color: transparent;
    box-shadow: none;
}
.btn-link, .btn-link:hover, .btn-link:focus, .btn-link:active {
    border-color: transparent;
}
.btn-link:hover, .btn-link:focus {
    background-color: transparent;
    color: #2a6496;
    text-decoration: underline;
}
.btn-link[disabled]:hover, fieldset[disabled] .btn-link:hover, .btn-link[disabled]:focus, fieldset[disabled] .btn-link:focus {
    color: #999;
    text-decoration: none;
}
.btn-lg {
    border-radius: 6px;
    font-size: 18px;
    line-height: 1.33;
    padding: 10px 16px;
}
.btn-sm {
    border-radius: 3px;
    font-size: 12px;
    line-height: 1.5;
    padding: 5px 10px;
}
.btn-xs {
    border-radius: 3px;
    font-size: 12px;
    line-height: 1.5;
    padding: 1px 5px;
}
.btn-block {
    display: block;
    padding-left: 0;
    padding-right: 0;
    width: 100%;
}
.btn-block + .btn-block {
    margin-top: 5px;
}
input.btn-block[type="submit"], input.btn-block[type="reset"], input.btn-block[type="button"] {
    width: 100%;
}
.fade {
    opacity: 0;
    transition: opacity 0.15s linear 0s;
}
.fade.in {
    opacity: 1;
}
.collapse {
    display: none;
}
.collapse.in {
    display: block;
}
.collapsing {
    height: 0;
    overflow: hidden;
    position: relative;
    transition: height 0.35s ease 0s;
}
@font-face {
    font-family: "Glyphicons Halflings";
    src: url("../fonts/glyphicons-halflings-regular.eot?#iefix") format("embedded-opentype"), url("../fonts/glyphicons-halflings-regular.woff") format("woff"), url("../fonts/glyphicons-halflings-regular.ttf") format("truetype"), url("../fonts/glyphicons-halflings-regular.svg#glyphicons-halflingsregular") format("svg");
}
.glyphicon {
    display: inline-block;
    font-family: "Glyphicons Halflings";
    font-style: normal;
    font-weight: normal;
    line-height: 1;
    position: relative;
    top: 1px;
}
.glyphicon:empty {
    width: 1em;
}
.glyphicon-asterisk::before {
    content: "*";
}
.glyphicon-plus::before {
    content: "+";
}
.glyphicon-euro::before {
    content: "€";
}
.glyphicon-minus::before {
    content: "−";
}
.glyphicon-cloud::before {
    content: "☁";
}
.glyphicon-envelope::before {
    content: "✉";
}
.glyphicon-pencil::before {
    content: "✏";
}
.glyphicon-glass::before {
    content: "";
}
.glyphicon-music::before {
    content: "";
}
.glyphicon-search::before {
    content: "";
}
.glyphicon-heart::before {
    content: "";
}
.glyphicon-star::before {
    content: "";
}
.glyphicon-star-empty::before {
    content: "";
}
.glyphicon-user::before {
    content: "";
}
.glyphicon-film::before {
    content: "";
}
.glyphicon-th-large::before {
    content: "";
}
.glyphicon-th::before {
    content: "";
}
.glyphicon-th-list::before {
    content: "";
}
.glyphicon-ok::before {
    content: "";
}
.glyphicon-remove::before {
    content: "";
}
.glyphicon-zoom-in::before {
    content: "";
}
.glyphicon-zoom-out::before {
    content: "";
}
.glyphicon-off::before {
    content: "";
}
.glyphicon-signal::before {
    content: "";
}
.glyphicon-cog::before {
    content: "";
}
.glyphicon-trash::before {
    content: "";
}
.glyphicon-home::before {
    content: "";
}
.glyphicon-file::before {
    content: "";
}
.glyphicon-time::before {
    content: "";
}
.glyphicon-road::before {
    content: "";
}
.glyphicon-download-alt::before {
    content: "";
}
.glyphicon-download::before {
    content: "";
}
.glyphicon-upload::before {
    content: "";
}
.glyphicon-inbox::before {
    content: "";
}
.glyphicon-play-circle::before {
    content: "";
}
.glyphicon-repeat::before {
    content: "";
}
.glyphicon-refresh::before {
    content: "";
}
.glyphicon-list-alt::before {
    content: "";
}
.glyphicon-lock::before {
    content: "";
}
.glyphicon-flag::before {
    content: "";
}
.glyphicon-headphones::before {
    content: "";
}
.glyphicon-volume-off::before {
    content: "";
}
.glyphicon-volume-down::before {
    content: "";
}
.glyphicon-volume-up::before {
    content: "";
}
.glyphicon-qrcode::before {
    content: "";
}
.glyphicon-barcode::before {
    content: "";
}
.glyphicon-tag::before {
    content: "";
}
.glyphicon-tags::before {
    content: "";
}
.glyphicon-book::before {
    content: "";
}
.glyphicon-bookmark::before {
    content: "";
}
.glyphicon-print::before {
    content: "";
}
.glyphicon-camera::before {
    content: "";
}
.glyphicon-font::before {
    content: "";
}
.glyphicon-bold::before {
    content: "";
}
.glyphicon-italic::before {
    content: "";
}
.glyphicon-text-height::before {
    content: "";
}
.glyphicon-text-width::before {
    content: "";
}
.glyphicon-align-left::before {
    content: "";
}
.glyphicon-align-center::before {
    content: "";
}
.glyphicon-align-right::before {
    content: "";
}
.glyphicon-align-justify::before {
    content: "";
}
.glyphicon-list::before {
    content: "";
}
.glyphicon-indent-left::before {
    content: "";
}
.glyphicon-indent-right::before {
    content: "";
}
.glyphicon-facetime-video::before {
    content: "";
}
.glyphicon-picture::before {
    content: "";
}
.glyphicon-map-marker::before {
    content: "";
}
.glyphicon-adjust::before {
    content: "";
}
.glyphicon-tint::before {
    content: "";
}
.glyphicon-edit::before {
    content: "";
}
.glyphicon-share::before {
    content: "";
}
.glyphicon-check::before {
    content: "";
}
.glyphicon-move::before {
    content: "";
}
.glyphicon-step-backward::before {
    content: "";
}
.glyphicon-fast-backward::before {
    content: "";
}
.glyphicon-backward::before {
    content: "";
}
.glyphicon-play::before {
    content: "";
}
.glyphicon-pause::before {
    content: "";
}
.glyphicon-stop::before {
    content: "";
}
.glyphicon-forward::before {
    content: "";
}
.glyphicon-fast-forward::before {
    content: "";
}
.glyphicon-step-forward::before {
    content: "";
}
.glyphicon-eject::before {
    content: "";
}
.glyphicon-chevron-left::before {
    content: "";
}
.glyphicon-chevron-right::before {
    content: "";
}
.glyphicon-plus-sign::before {
    content: "";
}
.glyphicon-minus-sign::before {
    content: "";
}
.glyphicon-remove-sign::before {
    content: "";
}
.glyphicon-ok-sign::before {
    content: "";
}
.glyphicon-question-sign::before {
    content: "";
}
.glyphicon-info-sign::before {
    content: "";
}
.glyphicon-screenshot::before {
    content: "";
}
.glyphicon-remove-circle::before {
    content: "";
}
.glyphicon-ok-circle::before {
    content: "";
}
.glyphicon-ban-circle::before {
    content: "";
}
.glyphicon-arrow-left::before {
    content: "";
}
.glyphicon-arrow-right::before {
    content: "";
}
.glyphicon-arrow-up::before {
    content: "";
}
.glyphicon-arrow-down::before {
    content: "";
}
.glyphicon-share-alt::before {
    content: "";
}
.glyphicon-resize-full::before {
    content: "";
}
.glyphicon-resize-small::before {
    content: "";
}
.glyphicon-exclamation-sign::before {
    content: "";
}
.glyphicon-gift::before {
    content: "";
}
.glyphicon-leaf::before {
    content: "";
}
.glyphicon-fire::before {
    content: "";
}
.glyphicon-eye-open::before {
    content: "";
}
.glyphicon-eye-close::before {
    content: "";
}
.glyphicon-warning-sign::before {
    content: "";
}
.glyphicon-plane::before {
    content: "";
}
.glyphicon-calendar::before {
    content: "";
}
.glyphicon-random::before {
    content: "";
}
.glyphicon-comment::before {
    content: "";
}
.glyphicon-magnet::before {
    content: "";
}
.glyphicon-chevron-up::before {
    content: "";
}
.glyphicon-chevron-down::before {
    content: "";
}
.glyphicon-retweet::before {
    content: "";
}
.glyphicon-shopping-cart::before {
    content: "";
}
.glyphicon-folder-close::before {
    content: "";
}
.glyphicon-folder-open::before {
    content: "";
}
.glyphicon-resize-vertical::before {
    content: "";
}
.glyphicon-resize-horizontal::before {
    content: "";
}
.glyphicon-hdd::before {
    content: "";
}
.glyphicon-bullhorn::before {
    content: "";
}
.glyphicon-bell::before {
    content: "";
}
.glyphicon-certificate::before {
    content: "";
}
.glyphicon-thumbs-up::before {
    content: "";
}
.glyphicon-thumbs-down::before {
    content: "";
}
.glyphicon-hand-right::before {
    content: "";
}
.glyphicon-hand-left::before {
    content: "";
}
.glyphicon-hand-up::before {
    content: "";
}
.glyphicon-hand-down::before {
    content: "";
}
.glyphicon-circle-arrow-right::before {
    content: "";
}
.glyphicon-circle-arrow-left::before {
    content: "";
}
.glyphicon-circle-arrow-up::before {
    content: "";
}
.glyphicon-circle-arrow-down::before {
    content: "";
}
.glyphicon-globe::before {
    content: "";
}
.glyphicon-wrench::before {
    content: "";
}
.glyphicon-tasks::before {
    content: "";
}
.glyphicon-filter::before {
    content: "";
}
.glyphicon-briefcase::before {
    content: "";
}
.glyphicon-fullscreen::before {
    content: "";
}
.glyphicon-dashboard::before {
    content: "";
}
.glyphicon-paperclip::before {
    content: "";
}
.glyphicon-heart-empty::before {
    content: "";
}
.glyphicon-link::before {
    content: "";
}
.glyphicon-phone::before {
    content: "";
}
.glyphicon-pushpin::before {
    content: "";
}
.glyphicon-usd::before {
    content: "";
}
.glyphicon-gbp::before {
    content: "";
}
.glyphicon-sort::before {
    content: "";
}
.glyphicon-sort-by-alphabet::before {
    content: "";
}
.glyphicon-sort-by-alphabet-alt::before {
    content: "";
}
.glyphicon-sort-by-order::before {
    content: "";
}
.glyphicon-sort-by-order-alt::before {
    content: "";
}
.glyphicon-sort-by-attributes::before {
    content: "";
}
.glyphicon-sort-by-attributes-alt::before {
    content: "";
}
.glyphicon-unchecked::before {
    content: "";
}
.glyphicon-expand::before {
    content: "";
}
.glyphicon-collapse-down::before {
    content: "";
}
.glyphicon-collapse-up::before {
    content: "";
}
.glyphicon-log-in::before {
    content: "";
}
.glyphicon-flash::before {
    content: "";
}
.glyphicon-log-out::before {
    content: "";
}
.glyphicon-new-window::before {
    content: "";
}
.glyphicon-record::before {
    content: "";
}
.glyphicon-save::before {
    content: "";
}
.glyphicon-open::before {
    content: "";
}
.glyphicon-saved::before {
    content: "";
}
.glyphicon-import::before {
    content: "";
}
.glyphicon-export::before {
    content: "";
}
.glyphicon-send::before {
    content: "";
}
.glyphicon-floppy-disk::before {
    content: "";
}
.glyphicon-floppy-saved::before {
    content: "";
}
.glyphicon-floppy-remove::before {
    content: "";
}
.glyphicon-floppy-save::before {
    content: "";
}
.glyphicon-floppy-open::before {
    content: "";
}
.glyphicon-credit-card::before {
    content: "";
}
.glyphicon-transfer::before {
    content: "";
}
.glyphicon-cutlery::before {
    content: "";
}
.glyphicon-header::before {
    content: "";
}
.glyphicon-compressed::before {
    content: "";
}
.glyphicon-earphone::before {
    content: "";
}
.glyphicon-phone-alt::before {
    content: "";
}
.glyphicon-tower::before {
    content: "";
}
.glyphicon-stats::before {
    content: "";
}
.glyphicon-sd-video::before {
    content: "";
}
.glyphicon-hd-video::before {
    content: "";
}
.glyphicon-subtitles::before {
    content: "";
}
.glyphicon-sound-stereo::before {
    content: "";
}
.glyphicon-sound-dolby::before {
    content: "";
}
.glyphicon-sound-5-1::before {
    content: "";
}
.glyphicon-sound-6-1::before {
    content: "";
}
.glyphicon-sound-7-1::before {
    content: "";
}
.glyphicon-copyright-mark::before {
    content: "";
}
.glyphicon-registration-mark::before {
    content: "";
}
.glyphicon-cloud-download::before {
    content: "";
}
.glyphicon-cloud-upload::before {
    content: "";
}
.glyphicon-tree-conifer::before {
    content: "";
}
.glyphicon-tree-deciduous::before {
    content: "";
}
.caret {
    border-left: 4px solid transparent;
    border-right: 4px solid transparent;
    border-top: 4px solid;
    display: inline-block;
    height: 0;
    margin-left: 2px;
    vertical-align: middle;
    width: 0;
}
.dropdown {
    position: relative;
}
.dropdown-toggle:focus {
    outline: 0 none;
}
.dropdown-menu {
    background-clip: padding-box;
    background-color: #fff;
    border: 1px solid rgba(0, 0, 0, 0.15);
    border-radius: 4px;
    box-shadow: 0 6px 12px rgba(0, 0, 0, 0.176);
    display: none;
    float: left;
    font-size: 14px;
    left: 0;
    list-style: outside none none;
    margin: 2px 0 0;
    min-width: 160px;
    padding: 5px 0;
    position: absolute;
    top: 100%;
    z-index: 1000;
}
.dropdown-menu.pull-right {
    left: auto;
    right: 0;
}
.dropdown-menu .divider {
    background-color: #e5e5e5;
    height: 1px;
    margin: 9px 0;
    overflow: hidden;
}
.dropdown-menu > li > a {
    clear: both;
    color: #333;
    display: block;
    font-weight: normal;
    line-height: 1.42857;
    padding: 3px 20px;
    white-space: nowrap;
}
.dropdown-menu > li > a:hover, .dropdown-menu > li > a:focus {
    background-color: #f5f5f5;
    color: #262626;
    text-decoration: none;
}
.dropdown-menu > .active > a, .dropdown-menu > .active > a:hover, .dropdown-menu > .active > a:focus {
    background-color: #428bca;
    color: #fff;
    outline: 0 none;
    text-decoration: none;
}
.dropdown-menu > .disabled > a, .dropdown-menu > .disabled > a:hover, .dropdown-menu > .disabled > a:focus {
    color: #999;
}
.dropdown-menu > .disabled > a:hover, .dropdown-menu > .disabled > a:focus {
    background-color: transparent;
    background-image: none;
    cursor: not-allowed;
    text-decoration: none;
}
.open > .dropdown-menu {
    display: block;
}
.open > a {
    outline: 0 none;
}
.dropdown-header {
    color: #999;
    display: block;
    font-size: 12px;
    line-height: 1.42857;
    padding: 3px 20px;
}
.dropdown-backdrop {
    bottom: 0;
    left: 0;
    position: fixed;
    right: 0;
    top: 0;
    z-index: 990;
}
.pull-right > .dropdown-menu {
    left: auto;
    right: 0;
}
.dropup .caret, .navbar-fixed-bottom .dropdown .caret {
    border-bottom: 4px solid;
    border-top: 0 none;
    content: "";
}
.dropup .dropdown-menu, .navbar-fixed-bottom .dropdown .dropdown-menu {
    bottom: 100%;
    margin-bottom: 1px;
    top: auto;
}
@media (min-width: 768px) {
.navbar-right .dropdown-menu {
    left: auto;
    right: 0;
}
}
.btn-group, .btn-group-vertical {
    display: inline-block;
    position: relative;
    vertical-align: middle;
}
.btn-group > .btn, .btn-group-vertical > .btn {
    float: left;
    position: relative;
}
.btn-group > .btn:hover, .btn-group-vertical > .btn:hover, .btn-group > .btn:focus, .btn-group-vertical > .btn:focus, .btn-group > .btn:active, .btn-group-vertical > .btn:active, .btn-group > .btn.active, .btn-group-vertical > .btn.active {
    z-index: 2;
}
.btn-group > .btn:focus, .btn-group-vertical > .btn:focus {
    outline: 0 none;
}
.btn-group .btn + .btn, .btn-group .btn + .btn-group, .btn-group .btn-group + .btn, .btn-group .btn-group + .btn-group {
    margin-left: -1px;
}
.btn-toolbar::before, .btn-toolbar::after {
    content: " ";
    display: table;
}
.btn-toolbar::after {
    clear: both;
}
.btn-toolbar::before, .btn-toolbar::after {
    content: " ";
    display: table;
}
.btn-toolbar::after {
    clear: both;
}
.btn-toolbar .btn-group {
    float: left;
}
.btn-toolbar > .btn + .btn, .btn-toolbar > .btn-group + .btn, .btn-toolbar > .btn + .btn-group, .btn-toolbar > .btn-group + .btn-group {
    margin-left: 5px;
}
.btn-group > .btn:not(:first-child):not(:last-child):not(.dropdown-toggle) {
    border-radius: 0;
}
.btn-group > .btn:first-child {
    margin-left: 0;
}
.btn-group > .btn:first-child:not(:last-child):not(.dropdown-toggle) {
    border-bottom-right-radius: 0;
    border-top-right-radius: 0;
}
.btn-group > .btn:last-child:not(:first-child), .btn-group > .dropdown-toggle:not(:first-child) {
    border-bottom-left-radius: 0;
    border-top-left-radius: 0;
}
.btn-group > .btn-group {
    float: left;
}
.btn-group > .btn-group:not(:first-child):not(:last-child) > .btn {
    border-radius: 0;
}
.btn-group > .btn-group:first-child > .btn:last-child, .btn-group > .btn-group:first-child > .dropdown-toggle {
    border-bottom-right-radius: 0;
    border-top-right-radius: 0;
}
.btn-group > .btn-group:last-child > .btn:first-child {
    border-bottom-left-radius: 0;
    border-top-left-radius: 0;
}
.btn-group .dropdown-toggle:active, .btn-group.open .dropdown-toggle {
    outline: 0 none;
}
.btn-group-xs > .btn {
    border-radius: 3px;
    font-size: 12px;
    line-height: 1.5;
    padding: 1px 5px;
}
.btn-group-sm > .btn {
    border-radius: 3px;
    font-size: 12px;
    line-height: 1.5;
    padding: 5px 10px;
}
.btn-group-lg > .btn {
    border-radius: 6px;
    font-size: 18px;
    line-height: 1.33;
    padding: 10px 16px;
}
.btn-group > .btn + .dropdown-toggle {
    padding-left: 8px;
    padding-right: 8px;
}
.btn-group > .btn-lg + .dropdown-toggle {
    padding-left: 12px;
    padding-right: 12px;
}
.btn-group.open .dropdown-toggle {
    box-shadow: 0 3px 5px rgba(0, 0, 0, 0.125) inset;
}
.btn-group.open .dropdown-toggle.btn-link {
    box-shadow: none;
}
.btn .caret {
    margin-left: 0;
}
.btn-lg .caret {
    border-width: 5px 5px 0;
}
.dropup .btn-lg .caret {
    border-width: 0 5px 5px;
}
.btn-group-vertical > .btn, .btn-group-vertical > .btn-group, .btn-group-vertical > .btn-group > .btn {
    display: block;
    float: none;
    max-width: 100%;
    width: 100%;
}
.btn-group-vertical > .btn-group::before, .btn-group-vertical > .btn-group::after {
    content: " ";
    display: table;
}
.btn-group-vertical > .btn-group::after {
    clear: both;
}
.btn-group-vertical > .btn-group::before, .btn-group-vertical > .btn-group::after {
    content: " ";
    display: table;
}
.btn-group-vertical > .btn-group::after {
    clear: both;
}
.btn-group-vertical > .btn-group > .btn {
    float: none;
}
.btn-group-vertical > .btn + .btn, .btn-group-vertical > .btn + .btn-group, .btn-group-vertical > .btn-group + .btn, .btn-group-vertical > .btn-group + .btn-group {
    margin-left: 0;
    margin-top: -1px;
}
.btn-group-vertical > .btn:not(:first-child):not(:last-child) {
    border-radius: 0;
}
.btn-group-vertical > .btn:first-child:not(:last-child) {
    border-bottom-left-radius: 0;
    border-bottom-right-radius: 0;
    border-top-right-radius: 4px;
}
.btn-group-vertical > .btn:last-child:not(:first-child) {
    border-bottom-left-radius: 4px;
    border-top-left-radius: 0;
    border-top-right-radius: 0;
}
.btn-group-vertical > .btn-group:not(:first-child):not(:last-child) > .btn {
    border-radius: 0;
}
.btn-group-vertical > .btn-group:first-child > .btn:last-child, .btn-group-vertical > .btn-group:first-child > .dropdown-toggle {
    border-bottom-left-radius: 0;
    border-bottom-right-radius: 0;
}
.btn-group-vertical > .btn-group:last-child > .btn:first-child {
    border-top-left-radius: 0;
    border-top-right-radius: 0;
}
.btn-group-justified {
    border-collapse: separate;
    display: table;
    table-layout: fixed;
    width: 100%;
}
.btn-group-justified > .btn, .btn-group-justified > .btn-group {
    display: table-cell;
    float: none;
    width: 1%;
}
.btn-group-justified > .btn-group .btn {
    width: 100%;
}
[data-toggle="buttons"] > .btn > input[type="radio"], [data-toggle="buttons"] > .btn > input[type="checkbox"] {
    display: none;
}
.input-group {
    border-collapse: separate;
    display: table;
    position: relative;
}
.input-group[class*="col-"] {
    float: none;
    padding-left: 0;
    padding-right: 0;
}
.input-group .form-control {
    margin-bottom: 0;
    width: 100%;
}
.input-group-lg > .form-control, .input-group-lg > .input-group-addon, .input-group-lg > .input-group-btn > .btn {
    border-radius: 6px;
    font-size: 18px;
    height: 46px;
    line-height: 1.33;
    padding: 10px 16px;
}
select.input-group-lg > .form-control, select.input-group-lg > .input-group-addon, select.input-group-lg > .input-group-btn > .btn {
    height: 46px;
    line-height: 46px;
}
textarea.input-group-lg > .form-control, textarea.input-group-lg > .input-group-addon, textarea.input-group-lg > .input-group-btn > .btn {
    height: auto;
}
.input-group-sm > .form-control, .input-group-sm > .input-group-addon, .input-group-sm > .input-group-btn > .btn {
    border-radius: 3px;
    font-size: 12px;
    height: 30px;
    line-height: 1.5;
    padding: 5px 10px;
}
select.input-group-sm > .form-control, select.input-group-sm > .input-group-addon, select.input-group-sm > .input-group-btn > .btn {
    height: 30px;
    line-height: 30px;
}
textarea.input-group-sm > .form-control, textarea.input-group-sm > .input-group-addon, textarea.input-group-sm > .input-group-btn > .btn {
    height: auto;
}
.input-group-addon, .input-group-btn, .input-group .form-control {
    display: table-cell;
}
.input-group-addon:not(:first-child):not(:last-child), .input-group-btn:not(:first-child):not(:last-child), .input-group .form-control:not(:first-child):not(:last-child) {
    border-radius: 0;
}
.input-group-addon, .input-group-btn {
    vertical-align: middle;
    white-space: nowrap;
    width: 1%;
}
.input-group-addon {
    background-color: #eee;
    border: 1px solid #ccc;
    border-radius: 4px;
    color: #555;
    font-size: 14px;
    font-weight: normal;
    line-height: 1;
    padding: 6px 12px;
    text-align: center;
}
.input-group-addon.input-sm {
    border-radius: 3px;
    font-size: 12px;
    padding: 5px 10px;
}
.input-group-addon.input-lg {
    border-radius: 6px;
    font-size: 18px;
    padding: 10px 16px;
}
.input-group-addon input[type="radio"], .input-group-addon input[type="checkbox"] {
    margin-top: 0;
}
.input-group .form-control:first-child, .input-group-addon:first-child, .input-group-btn:first-child > .btn, .input-group-btn:first-child > .dropdown-toggle, .input-group-btn:last-child > .btn:not(:last-child):not(.dropdown-toggle) {
    border-bottom-right-radius: 0;
    border-top-right-radius: 0;
}
.input-group-addon:first-child {
    border-right: 0 none;
}
.input-group .form-control:last-child, .input-group-addon:last-child, .input-group-btn:last-child > .btn, .input-group-btn:last-child > .dropdown-toggle, .input-group-btn:first-child > .btn:not(:first-child) {
    border-bottom-left-radius: 0;
    border-top-left-radius: 0;
}
.input-group-addon:last-child {
    border-left: 0 none;
}
.input-group-btn {
    position: relative;
    white-space: nowrap;
}
.input-group-btn:first-child > .btn {
    margin-right: -1px;
}
.input-group-btn:last-child > .btn {
    margin-left: -1px;
}
.input-group-btn > .btn {
    position: relative;
}
.input-group-btn > .btn + .btn {
    margin-left: -4px;
}
.input-group-btn > .btn:hover, .input-group-btn > .btn:active {
    z-index: 2;
}
.nav {
    list-style: outside none none;
    margin-bottom: 0;
    padding-left: 0;
}
.nav::before, .nav::after {
    content: " ";
    display: table;
}
.nav::after {
    clear: both;
}
.nav::before, .nav::after {
    content: " ";
    display: table;
}
.nav::after {
    clear: both;
}
.nav > li {
    display: block;
    position: relative;
}
.nav > li > a {
    display: block;
    padding: 10px 15px;
    position: relative;
}
.nav > li > a:hover, .nav > li > a:focus {
    background-color: #eee;
    text-decoration: none;
}
.nav > li.disabled > a {
    color: #999;
}
.nav > li.disabled > a:hover, .nav > li.disabled > a:focus {
    background-color: transparent;
    color: #999;
    cursor: not-allowed;
    text-decoration: none;
}
.nav .open > a, .nav .open > a:hover, .nav .open > a:focus {
    background-color: #eee;
    border-color: #428bca;
}
.nav .nav-divider {
    background-color: #e5e5e5;
    height: 1px;
    margin: 9px 0;
    overflow: hidden;
}
.nav > li > a > img {
    max-width: none;
}
.nav-tabs {
    border-bottom: 1px solid #ddd;
}
.nav-tabs > li {
    float: left;
    margin-bottom: -1px;
}
.nav-tabs > li > a {
    border: 1px solid transparent;
    border-radius: 4px 4px 0 0;
    line-height: 1.42857;
    margin-right: 2px;
}
.nav-tabs > li > a:hover {
    border-color: #eee #eee #ddd;
}
.nav-tabs > li.active > a, .nav-tabs > li.active > a:hover, .nav-tabs > li.active > a:focus {
	border-bottom:1px solid #ddd;
}
</style>
<script type="text/javascript">
$(document).ready(function(){
    $("#myNav").affix({
        offset: { 
            top: 145 
     	}
    });
});
</script>
<!-- </head> -->
<body data-spy="scroll" data-target="#myScrollspy">

<!-- <div class="navbar navbar-fixed-top">
    <div class="navbar-inner">
        <div class="container">
            <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </a>
            <a class="brand" href="/index">中合万邦</a>
            <div class="nav-collapse">
				<ul class="nav pull-left">
				<li><a href="/index/index">首 页</a></li>
							<li><a href="/invoices/index">系 统</a></li> 
				<li class="active"><a href="/help/index">帮助中心</a></li>
				</ul>
				<ul class="nav pull-right">
								<li><a href="/invoices/profile">欢迎您！ 钟某某</a></li> 
				<li><a href="/session/end">退 出</a></li>
				</ul>
			</div>        
		</div>
    </div>
</div> -->

<!-- <div class="container"> -->
<!-- 	<div class="jumbotron">
        <h1>帮助中心</h1>
    </div> -->
    <div class="row">
        <div class="col-xs-3" id="myScrollspy">
            <ul class="nav nav-tabs nav-stacked" id="myNav">
                <li class="active"><a href="#section-1">常见问题1</a></li>
                <li><a href="#section-2">常见问题2</a></li>
                <li><a href="#section-3">常见问题3</a></li>
                <li><a href="#section-4">常见问题4</a></li>
                <li><a href="#section-5">常见问题5</a></li>
            </ul>
        </div>
        <div class="col-xs-9">
            <h2 id="section-1">常见问题1</h2>
			<p>这是第一部分</p>
			<p>这是第一部分</p>
			<p>这是第一部分</p>
			<p>这是第一部分</p>
            <hr>
            <h2 id="section-2">常见问题2</h2>
			<p>这是第二部分</p>
			<p>这是第二部分</p>
			<p>这是第二部分</p>
			<p>这是第二部分</p>
            <hr>
            <h2 id="section-3">常见问题3</h2>
            <p>这是第三部分</p>
			<p>这是第三部分</p>
			<p>这是第三部分</p>
			<p>这是第三部分</p>
			<hr>
            <h2 id="section-4">常见问题4</h2>
			<p>这是第四部分</p>
			<p>这是第四部分</p>
			<p>这是第四部分</p>
			<p>这是第四部分</p>
			<hr>
            <h2 id="section-5">常见问题5</h2>
			<p>这是第五部分</p>
			<p>这是第五部分</p>
			<p>这是第五部分</p>
			<p>这是第五部分</p>
		</div>
    </div>
	<hr>
<!--     <footer>
        <p>&copy; Company 2012</p>
    </footer>	
</div>
</body>
</html>	 -->