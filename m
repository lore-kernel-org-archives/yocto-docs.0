Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E68BD2FFF7
	for <webhook@archiver.kernel.org>; Fri, 18 Oct 2024 11:38:48 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.20282.1729251527282407297
 for <docs@lists.yoctoproject.org>;
 Fri, 18 Oct 2024 04:38:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=iFXBt+o1;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 57999FF807;
	Fri, 18 Oct 2024 11:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1729251525;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Qj/UcBmUeMkS+EtISf54mqDt3bNCqyNhDGUnox+ly/A=;
	b=iFXBt+o1EUlo77e3crIduyFMvuIJk3KcwOlbytmXd7id3vK+fFZvCYRGZJTNSXvN51CG4X
	InEoZik4+3Fq1uK7X4QkqVCR6XHtGDGBAgMD6cPb/y3mK5sOBlUGeSq8sXpSz95o8pNBYB
	uolrJp9DYVC4/MELIknME81FkmVE2CpCCPCSoIeU0l+b7HXCy8uSulhg1A7lMuqYdwNEx1
	MgTklQ89wltwM56XFJbBHkaw4MtI/ZLEM+fdp8AhtEIKOUDBwSppvbDfYtCwlRdW4KyZ5G
	gmU6m6fdptx1/nJob1mFIRjtnAYqv1SvoVzu5z6m6tFtuvUmSDipddNzoX5rXg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 18 Oct 2024 13:38:39 +0200
Subject: [PATCH] ref-manual: update releases.svg
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241018-update-releases-svg-v1-1-502899b5d780@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAL5IEmcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDA0ML3dKClMSSVN2i1JzUxOLUYt3isnTdpFRTI2ML89Rki+RkJaDOgqL
 UtMwKsKnRsbW1AOCdJxllAAAA
X-Change-ID: 20241018-update-releases-svg-be52387ec8cc
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=82234;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=UqXpRgePM8it87yU1UknNMWciCCNgbiswGBhL1f8cY8=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnEkjEaFd8/bnZ5tkuD4Zk0fCLxW45HyKSk4Bwl
 XicKi865AGJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZxJIxAAKCRDRgEFAKaOo
 NsIpD/90xiOHRzCpuzD7ahVyu8d8NuCw+Z4qZ8FZOC+rj2236DrWmQBOo1eyk/8I6dDPOLpSK+H
 d2OfSSGbF1Z9rvUN9gygv+J0ejdWaAqX/MLY61d0Naz823LMziCpednUd2zN3qrUGUUDTnypwxD
 iM8lr8YV3GVz2ZxjpfuDzJ1Dao4XTXcN8FqJzAG80B7YuYO5vyFPiI8hzCi4z2Yf7bvD3dbayTB
 2gs5GhDCb/v6n/OwLt9EJ9X+i0rV6LCCQ7vgggTzZF7f6IXdwrcjkAyW1eBPnM5oRko4DlEoSzl
 e9cwb+ynKtP8cWKCGDJQnqmQx1ftTA5o+1+hnZhIVAe+M1KB8QlmhcC0O9qtpfYhVOBXA3Uxu0D
 dHZsEQY1sExhxwe/PnXAzKXDI4s3c4AWRTDXjHLOFuUfamhY6eM1GuypPnMiiduH+U2MbO0EOPj
 aZdt1CBCY5ZcEIL8v3LDPv0B36M4cRzjAeMdAS+R327teTqOf0X6/2n4DR9rLoZR92jbXUzCybw
 YHOyqAjl1spoYf/AHcru7XH/34IV5ykb/jo8LTswklr9DcVHLwJovLsBfvC1UhQNTnHpMk9ETzt
 cy4x8o9BpsegNfTUKbfOOkG8kB9oVkjsnYIp7UshICHJbxV35Oe+5dxMDcwl662WBMGxq0VKQ00
 BqsTLtSnU8ISmVw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 18 Oct 2024 11:38:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5535

* Add Walnascar release.
* Remove dunfell, gatesgarth, hardknott, honister: these release are not
  supported anymore. Start from kirkstone, which is still supported.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/svg/releases.svg | 765 +++++++++---------------------
 1 file changed, 233 insertions(+), 532 deletions(-)

diff --git a/documentation/ref-manual/svg/releases.svg b/documentation/ref-manual/svg/releases.svg
index 036aa467cc2e646e99bc407bbf0ea7ff8825f57b..6078c457ae36af5a89f532c1f175eea014f793e1 100644
--- a/documentation/ref-manual/svg/releases.svg
+++ b/documentation/ref-manual/svg/releases.svg
@@ -2,11 +2,11 @@
 <svg
    version="1.1"
    id="svg2"
-   width="2040.0006"
-   height="669.30511"
-   viewBox="0 0 2040.0006 669.30509"
+   width="1523.001"
+   height="504.30499"
+   viewBox="0 0 1523.001 504.30497"
    sodipodi:docname="releases.svg"
-   inkscape:version="1.1.2 (0a00cf5339, 2022-02-04)"
+   inkscape:version="1.3.2 (091e20ef0f, 2023-11-25, custom)"
    xmlns:inkscape="http://www.inkscape.org/namespaces/inkscape"
    xmlns:sodipodi="http://sodipodi.sourceforge.net/DTD/sodipodi-0.dtd"
    xmlns="http://www.w3.org/2000/svg"
@@ -24,29 +24,29 @@
         <dc:format>image/svg+xml</dc:format>
         <dc:type
            rdf:resource="http://purl.org/dc/dcmitype/StillImage" />
-        <cc:license
-           rdf:resource="http://artlibre.org/licence/lal" />
         <dc:title>Yocto Project Release Timeline</dc:title>
         <dc:creator>
           <cc:Agent>
             <dc:title>The Yocto Project</dc:title>
           </cc:Agent>
         </dc:creator>
+        <cc:license
+           rdf:resource="http://artlibre.org/licence/lal" />
       </cc:Work>
       <cc:License
-         rdf:about="http://creativecommons.org/licenses/by-sa/4.0/">
+         rdf:about="http://artlibre.org/licence/lal">
         <cc:permits
            rdf:resource="http://creativecommons.org/ns#Reproduction" />
         <cc:permits
            rdf:resource="http://creativecommons.org/ns#Distribution" />
-        <cc:requires
-           rdf:resource="http://creativecommons.org/ns#Notice" />
-        <cc:requires
-           rdf:resource="http://creativecommons.org/ns#Attribution" />
         <cc:permits
            rdf:resource="http://creativecommons.org/ns#DerivativeWorks" />
         <cc:requires
            rdf:resource="http://creativecommons.org/ns#ShareAlike" />
+        <cc:requires
+           rdf:resource="http://creativecommons.org/ns#Notice" />
+        <cc:requires
+           rdf:resource="http://creativecommons.org/ns#Attribution" />
       </cc:License>
     </rdf:RDF>
   </metadata>
@@ -66,7 +66,8 @@
        miter_limit="4"
        scale_width="1"
        end_linecap_type="zerowidth"
-       not_jump="false" />
+       not_jump="false"
+       message="&lt;b&gt;Ctrl + click&lt;/b&gt; on existing node and move it" />
     <marker
        style="overflow:visible"
        id="marker5783"
@@ -404,15 +405,15 @@
      guidetolerance="10"
      inkscape:pageopacity="0"
      inkscape:pageshadow="2"
-     inkscape:window-width="1920"
-     inkscape:window-height="1043"
+     inkscape:window-width="3826"
+     inkscape:window-height="2089"
      id="namedview4"
      showgrid="true"
-     inkscape:zoom="1.4472045"
-     inkscape:cx="987.76641"
-     inkscape:cy="357.93145"
-     inkscape:window-x="1728"
-     inkscape:window-y="0"
+     inkscape:zoom="1.0985686"
+     inkscape:cx="1241.1606"
+     inkscape:cy="248.05006"
+     inkscape:window-x="0"
+     inkscape:window-y="40"
      inkscape:window-maximized="1"
      inkscape:current-layer="g10"
      inkscape:document-rotation="0"
@@ -422,12 +423,18 @@
      fit-margin-left="30"
      fit-margin-right="30"
      fit-margin-bottom="30"
-     inkscape:pagecheckerboard="0">
+     inkscape:pagecheckerboard="0"
+     inkscape:showpageshadow="2"
+     inkscape:deskcolor="#d1d1d1">
     <inkscape:grid
        type="xygrid"
        id="grid1257"
        originx="-289.99936"
-       originy="369.99998" />
+       originy="369.99997"
+       spacingy="1"
+       spacingx="1"
+       units="px"
+       visible="true" />
   </sodipodi:namedview>
   <g
      inkscape:groupmode="layer"
@@ -435,81 +442,65 @@
      id="g10"
      transform="translate(-289.99936,370.00003)">
     <path
-       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:0.5;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
-       d="m 1080,220.00003 v -515.00007 0 0"
+       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:0.449183;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+       d="m 563.40434,64.000628 v -415.635938 0 0"
        id="path207708" />
     <path
-       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:0.5;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
-       d="m 1200,220.00003 v -515.00007 0 0"
+       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:0.449183;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+       d="m 683.40434,64.000628 v -415.635938 0 0"
        id="path207708-4" />
     <path
-       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:0.5;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
-       d="m 1320,220.00003 v -515.00007 0 0"
+       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:0.449183;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+       d="m 803.40434,64.000628 v -415.635938 0 0"
        id="path207708-4-3" />
     <path
-       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:0.5;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
-       d="m 1440,219.99998 v -515.00002 0 0"
+       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:0.449183;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+       d="m 923.40434,64.000588 v -415.635898 0 0"
        id="path207708-4-3-6" />
     <path
-       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:0.5;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
-       d="m 1560,219.99998 v -515.00001 0 0"
+       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:0.449183;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+       d="m 1043.4043,64.000588 v -415.635898 0 0"
        id="path207708-4-3-6-2" />
     <path
-       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:0.5;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
-       d="m 1680,219.99998 v -515.00002 0 0"
+       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:0.449183;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+       d="m 1163.4043,64.000588 v -415.635898 0 0"
        id="path207708-4-3-6-2-8" />
     <path
-       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:0.5;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
-       d="m 1800,219.99998 v -515.00002 0 0"
+       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:0.449183;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+       d="m 1283.4043,64.000588 v -415.635898 0 0"
        id="path207708-4-3-6-2-8-4" />
     <path
-       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:0.5;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
-       d="m 1920,219.99998 v -515.00002 0 0"
+       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:0.449183;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+       d="m 1403.4043,64.000588 v -415.635898 0 0"
        id="path207708-4-3-6-2-8-4-3" />
     <path
-       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:0.5;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
-       d="m 2040,219.99997 v -460.00002 0 0"
+       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:0.475347;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+       d="m 1523.4043,64.000568 v -415.757648 0 0"
        id="path207708-4-3-6-2-8-4-3-8" />
     <path
-       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:0.5;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
-       d="m 2040,219.99998 v -515.00002 0 0"
+       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:0.449183;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+       d="m 1523.4043,64.000588 v -415.635898 0 0"
        id="path207708-4-3-6-2-8-4-3-8-0" />
     <path
-       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:0.5;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
-       d="m 2159.954,219.99997 v -514.99999 0 0"
+       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:0.449183;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+       d="m 1643.3583,64.000578 v -415.635868 0 0"
        id="path207708-4-3-6-2-8-4-3-8-4" />
     <path
-       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:0.5;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
-       d="m 2280,219.99997 v -514.99999 0 0"
+       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:0.449183;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+       d="m 1763.4043,64.000578 v -415.635868 0 0"
        id="path207708-4-3-6-2-8-4-3-8-4-0" />
     <path
-       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:0.5;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
-       d="m 960,220.00003 v -515.00007 0 0"
+       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:0.449183;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+       d="m 443.40434,64.000628 v -415.635938 0 0"
        id="path207708-9" />
     <path
        style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:0.5;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
-       d="m 840,220.00001 v -375 0 0"
+       d="m 323.40434,64.000608 v -375.000008 0 0"
        id="path207708-9-6" />
     <path
-       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:0.5;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
-       d="m 840,220.00002 v -515.00004 0 0"
+       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:0.449183;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+       d="m 323.40434,64.000618 v -415.635908 0 0"
        id="path207708-9-6-2" />
-    <path
-       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:0.5;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
-       d="m 720,220.00003 v -515.00007 0 0"
-       id="path207708-9-6-2-5" />
-    <path
-       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:0.5;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
-       d="m 600,220.00003 v -515.00007 0 0"
-       id="path207708-9-6-2-5-9" />
-    <path
-       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:0.5;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
-       d="m 480,220.00003 v -515.00007 0 0"
-       id="path207708-9-6-2-5-9-0" />
-    <path
-       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:0.5;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
-       d="m 360,220.00003 v -515.00007 0 0"
-       id="path207708-9-6-2-5-9-0-5" />
     <text
        xml:space="preserve"
        style="font-weight:bold;font-size:42.5884px;line-height:125%;font-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:none;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
@@ -540,108 +531,28 @@
          id="tspan913"
          x="-59.575905"
          y="580.05695" /></text>
-    <rect
-       style="fill:#333333;fill-opacity:1;fill-rule:evenodd;stroke:none;stroke-width:2;stroke-opacity:1"
-       id="rect917-0-0"
-       width="980"
-       height="45.000004"
-       x="360"
-       y="154.99997"
-       ry="2.2558987" />
-    <text
-       xml:space="preserve"
-       style="font-weight:bold;font-size:13.3333px;line-height:125%;font-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#fffefe;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
-       x="420.52835"
-       y="174.12433"
-       id="text1185-3-55-4"><tspan
-         sodipodi:role="line"
-         x="420.52835"
-         y="174.12433"
-         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans Bold';text-align:center;text-anchor:middle;fill:#fffefe;fill-opacity:1;stroke:none"
-         id="tspan957-2-8">Dunfell (LTS)</tspan><tspan
-         sodipodi:role="line"
-         x="420.52835"
-         y="192.121"
-         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans Bold';text-align:center;text-anchor:middle;fill:#fffefe;fill-opacity:1;stroke:none"
-         id="tspan10317">3.1</tspan></text>
-    <rect
-       style="fill:#333333;fill-opacity:1;fill-rule:evenodd;stroke:none;stroke-width:2;stroke-opacity:1"
-       id="rect917-0-0-4"
-       width="140.00002"
-       height="45.000004"
-       x="480"
-       y="99.999969"
-       ry="2.2558987" />
-    <text
-       xml:space="preserve"
-       style="font-weight:bold;font-size:13.3333px;line-height:125%;font-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#fffefe;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
-       x="534.10651"
-       y="118.94971"
-       id="text1185-3-55-4-0"><tspan
-         sodipodi:role="line"
-         x="534.10651"
-         y="118.94971"
-         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans Bold';text-align:center;text-anchor:middle;fill:#fffefe;fill-opacity:1;stroke:none"
-         id="tspan957-2-8-6">Gatesgarth</tspan><tspan
-         sodipodi:role="line"
-         x="534.10651"
-         y="136.94638"
-         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans Bold';text-align:center;text-anchor:middle;fill:#fffefe;fill-opacity:1;stroke:none"
-         id="tspan10317-2">3.2</tspan></text>
-    <rect
-       style="fill:#333333;fill-opacity:1;fill-rule:evenodd;stroke:none;stroke-width:2;stroke-opacity:1"
-       id="rect917-0-0-4-4"
-       width="260"
-       height="45.000004"
-       x="599.99994"
-       y="45.000011"
-       ry="2.2558987" />
-    <rect
-       style="fill:#333333;fill-opacity:1;fill-rule:evenodd;stroke:none;stroke-width:2;stroke-opacity:1"
-       id="rect917-0-0-4-4-9"
-       width="160.00002"
-       height="45.000004"
-       x="720"
-       y="-9.9999905"
-       ry="2.2558987" />
-    <text
-       xml:space="preserve"
-       style="font-weight:bold;font-size:13.3333px;line-height:125%;font-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#fffefe;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
-       x="766.10297"
-       y="9.57586"
-       id="text1185-3-55-4-0-0"><tspan
-         sodipodi:role="line"
-         x="766.10297"
-         y="9.57586"
-         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans Bold';text-align:center;text-anchor:middle;fill:#fffefe;fill-opacity:1;stroke:none"
-         id="tspan957-2-8-6-3">Honister</tspan><tspan
-         sodipodi:role="line"
-         x="766.10297"
-         y="27.57254"
-         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans Bold';text-align:center;text-anchor:middle;fill:#fffefe;fill-opacity:1;stroke:none"
-         id="tspan10317-2-9">3.4</tspan></text>
     <rect
        style="fill:#333333;fill-opacity:1;fill-rule:evenodd;stroke:none;stroke-width:2;stroke-opacity:1"
        id="rect917-0-0-4-4-9-4"
        width="160.00002"
        height="45.000004"
-       x="959.99994"
-       y="-120"
+       x="443.40427"
+       y="-55.999405"
        ry="2.2558987" />
     <text
        xml:space="preserve"
        style="font-weight:bold;font-size:13.3333px;line-height:125%;font-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#fffefe;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
-       x="1008.4941"
-       y="-100.605"
+       x="491.89841"
+       y="-36.604408"
        id="text1185-3-55-4-0-0-0"><tspan
          sodipodi:role="line"
-         x="1008.4941"
-         y="-100.605"
+         x="491.89841"
+         y="-36.604408"
          style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans Bold';text-align:center;text-anchor:middle;fill:#fffefe;fill-opacity:1;stroke:none"
          id="tspan957-2-8-6-3-9">Langdale</tspan><tspan
          sodipodi:role="line"
-         x="1008.4941"
-         y="-82.608322"
+         x="491.89841"
+         y="-18.607729"
          style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans Bold';text-align:center;text-anchor:middle;fill:#fffefe;fill-opacity:1;stroke:none"
          id="tspan10317-2-9-1">4.1</tspan></text>
     <rect
@@ -649,27 +560,28 @@
        id="rect917-0-0-4-4-9-4-5"
        width="140.00003"
        height="45.000004"
-       x="1100"
-       y="-175.00003"
+       x="583.40436"
+       y="-110.99944"
        ry="2.2558987" />
     <text
        xml:space="preserve"
        style="font-weight:bold;font-size:13.3333px;line-height:125%;font-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#fffefe;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
-       x="1156.057"
-       y="-155.49881"
+       x="639.46136"
+       y="-91.498215"
        id="text1185-3-55-4-0-0-0-1"><tspan
          sodipodi:role="line"
-         x="1156.057"
-         y="-155.49881"
+         x="639.46136"
+         y="-91.498215"
          style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans Bold';text-align:center;text-anchor:middle;fill:#fffefe;fill-opacity:1;stroke:none"
          id="tspan957-2-8-6-3-9-7">Mickledore</tspan><tspan
          sodipodi:role="line"
-         x="1156.057"
-         y="-137.50214"
+         x="639.46136"
+         y="-73.501534"
          style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans Bold';text-align:center;text-anchor:middle;fill:#fffefe;fill-opacity:1;stroke:none"
          id="tspan10317-2-9-1-4">4.2</tspan></text>
     <g
-       id="g1258">
+       id="g1258"
+       transform="translate(-516.59566,64.000598)">
       <rect
          style="fill:#333333;fill-opacity:1;fill-rule:evenodd;stroke:none;stroke-width:2;stroke-opacity:1"
          id="rect917-0-0-4-4-9-4-5-38"
@@ -696,31 +608,56 @@
            id="tspan10317-2-9-1-4-6">4.3</tspan></text>
     </g>
     <rect
-       style="opacity:0.75;fill:#241f31;fill-opacity:1;fill-rule:evenodd;stroke:none;stroke-width:2;stroke-opacity:1"
+       style="opacity:1;fill:#333333;fill-opacity:1;fill-rule:evenodd;stroke:none;stroke-width:2;stroke-opacity:1"
        id="rect917-0-0-4-4-9-4-5-3-9-2"
        width="140"
        height="45.000004"
-       x="1440"
-       y="-340.00003"
+       x="923.40436"
+       y="-275.99945"
+       ry="2.2558987" />
+    <rect
+       style="opacity:1;fill:#333333;fill-opacity:1;fill-rule:evenodd;stroke:none;stroke-width:2;stroke-opacity:1"
+       id="rect917-0-0-4-4-9-4-5-3-9-2-3"
+       width="140"
+       height="45.000004"
+       x="1043.132"
+       y="-328.2114"
        ry="2.2558987" />
     <text
        xml:space="preserve"
        style="font-weight:bold;font-size:13.3333px;line-height:125%;font-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#fffefe;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
-       x="1487.233"
-       y="-320.32928"
+       x="970.63739"
+       y="-256.32867"
        id="text1185-3-55-4-0-0-0-1-1-6-4"><tspan
          sodipodi:role="line"
-         x="1487.233"
-         y="-320.32928"
+         x="970.63739"
+         y="-256.32867"
          style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans Bold';text-align:center;text-anchor:middle;fill:#fffefe;fill-opacity:1;stroke:none"
          id="tspan957-2-8-6-3-9-7-4-2-0">Styhead</tspan><tspan
          sodipodi:role="line"
-         x="1487.233"
-         y="-302.33261"
+         x="970.63739"
+         y="-238.332"
          style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans Bold';text-align:center;text-anchor:middle;fill:#fffefe;fill-opacity:1;stroke:none"
          id="tspan10317-2-9-1-4-6-5-6">5.1</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-weight:bold;font-size:13.3333px;line-height:125%;font-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#fffefe;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="1094.2197"
+       y="-309.83084"
+       id="text1185-3-55-4-0-0-0-1-1-6-4-3"><tspan
+         sodipodi:role="line"
+         x="1094.2197"
+         y="-309.83084"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans Bold';text-align:center;text-anchor:middle;fill:#fffefe;fill-opacity:1;stroke:none"
+         id="tspan957-2-8-6-3-9-7-4-2-0-5">Walnascar</tspan><tspan
+         sodipodi:role="line"
+         x="1094.2197"
+         y="-291.83417"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans Bold';text-align:center;text-anchor:middle;fill:#fffefe;fill-opacity:1;stroke:none"
+         id="tspan10317-2-9-1-4-6-5-6-6">5.2</tspan></text>
     <g
-       id="g1591">
+       id="g1591"
+       transform="translate(-516.59566,64.000598)">
       <rect
          style="fill:#333333;fill-opacity:1;fill-rule:evenodd;stroke:none;stroke-width:2;stroke-opacity:1"
          id="rect917-0-0-4-4-9-9"
@@ -749,42 +686,26 @@
     <path
        id="rect917-0-0-4-4-9-9-9"
        style="fill:#333333;fill-opacity:1;fill-rule:evenodd;stroke:none;stroke-width:2;stroke-opacity:1"
-       d="m 1322.3015,-285.00003 c -1.2753,0 -2.302,1.00609 -2.302,2.25586 v 40.48828 c 0,1.24977 1.0267,2.25586 2.302,2.25586 h 975.0412 c 1.2754,0 2.302,-1.00609 2.302,-2.25586 v -40.48828 c 0,-1.24977 -1.0266,-2.25586 -2.302,-2.25586 z" />
+       d="m 805.70584,-220.99944 c -1.2753,0 -2.302,1.00609 -2.302,2.25586 v 40.48828 c 0,1.24977 1.0267,2.25586 2.302,2.25586 H 1780.747 c 1.2754,0 2.302,-1.00609 2.302,-2.25586 v -40.48828 c 0,-1.24977 -1.0266,-2.25586 -2.302,-2.25586 z" />
     <text
        xml:space="preserve"
        style="font-weight:bold;font-size:13.3333px;line-height:125%;font-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#fffefe;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
-       x="1390.4988"
-       y="-265.64832"
+       x="873.90314"
+       y="-201.64772"
        id="text1185-3-55-4-0-0-9-0"><tspan
          sodipodi:role="line"
-         x="1390.4988"
-         y="-265.64832"
+         x="873.90314"
+         y="-201.64772"
          style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans Bold';text-align:center;text-anchor:middle;fill:#fffefe;fill-opacity:1;stroke:none"
          id="tspan957-2-8-6-3-6-8">Scarthgap (LTS)</tspan><tspan
          sodipodi:role="line"
-         x="1390.4988"
-         y="-247.65164"
+         x="873.90314"
+         y="-183.65105"
          style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans Bold';text-align:center;text-anchor:middle;fill:#fffefe;fill-opacity:1;stroke:none"
          id="tspan10317-2-9-0-1">5.0</tspan></text>
-    <text
-       xml:space="preserve"
-       style="font-weight:bold;font-size:13.3333px;line-height:125%;font-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#fffefe;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
-       x="653.72168"
-       y="64.866302"
-       id="text1185-3-55-4-0-0-7"><tspan
-         sodipodi:role="line"
-         x="653.72168"
-         y="64.866302"
-         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans Bold';text-align:center;text-anchor:middle;fill:#fffefe;fill-opacity:1;stroke:none"
-         id="tspan957-2-8-6-3-2">Hardknott </tspan><tspan
-         sodipodi:role="line"
-         x="653.72168"
-         y="82.862984"
-         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans Bold';text-align:center;text-anchor:middle;fill:#fffefe;fill-opacity:1;stroke:none"
-         id="tspan10317-2-9-8">3.3</tspan></text>
     <g
        id="g1125-0"
-       transform="matrix(0.42240595,0,0,0.41654472,354.53445,-399.96314)"
+       transform="matrix(0.42240595,0,0,0.41654472,330.77064,-441.11721)"
        style="stroke:none;stroke-width:2.38399">
       <rect
          style="opacity:1;fill:#333333;fill-opacity:1;fill-rule:evenodd;stroke:none;stroke-width:4.76797;stroke-opacity:1"
@@ -873,232 +794,147 @@
     <text
        xml:space="preserve"
        style="font-weight:bold;font-size:13.3333px;line-height:125%;font-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
-       x="1199.6055"
-       y="250.21216"
+       x="683.00983"
+       y="94.212761"
        id="text1185-9-7-1-1"><tspan
          sodipodi:role="line"
-         x="1199.6055"
-         y="250.21216"
+         x="683.00983"
+         y="94.212761"
          style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;stroke:none"
          id="tspan31345">Oct.</tspan><tspan
          sodipodi:role="line"
-         x="1199.6055"
-         y="268.20883"
+         x="683.00983"
+         y="112.20944"
          style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;stroke:none"
          id="tspan49906">2023</tspan></text>
     <text
        xml:space="preserve"
        style="font-weight:bold;font-size:13.3333px;line-height:125%;font-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
-       x="1439.3904"
-       y="249.86044"
+       x="922.79474"
+       y="93.861046"
        id="text1185-9-7-1-1-89"><tspan
          sodipodi:role="line"
-         x="1439.3904"
-         y="249.86044"
+         x="922.79474"
+         y="93.861046"
          style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;stroke:none"
          id="tspan31345-7">Oct.</tspan><tspan
          sodipodi:role="line"
-         x="1439.3904"
-         y="267.85712"
+         x="922.79474"
+         y="111.85773"
          style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;stroke:none"
          id="tspan49906-76">2024</tspan></text>
     <text
        xml:space="preserve"
        style="font-weight:bold;font-size:13.3333px;line-height:125%;font-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
-       x="1679.3094"
-       y="250.58356"
+       x="1162.7139"
+       y="94.58416"
        id="text1185-9-7-1-1-89-6"><tspan
          sodipodi:role="line"
-         x="1679.3094"
-         y="250.58356"
+         x="1162.7139"
+         y="94.58416"
          style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;stroke:none"
          id="tspan31345-7-8">Oct.</tspan><tspan
          sodipodi:role="line"
-         x="1679.3094"
-         y="268.58023"
+         x="1162.7139"
+         y="112.58084"
          style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;stroke:none"
          id="tspan49906-76-0">2025</tspan></text>
-    <text
-       xml:space="preserve"
-       style="font-weight:bold;font-size:6.66667px;line-height:125%;font-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
-       x="849.49744"
-       y="61.106953"
-       id="text1185-9-7-1-1-0"><tspan
-         sodipodi:role="line"
-         x="849.49744"
-         y="61.106953"
-         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:6.66667px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:end;text-anchor:end;fill:#fffefe;fill-opacity:1;stroke:none"
-         id="tspan46212">Support for this version was extended to leave</tspan><tspan
-         sodipodi:role="line"
-         x="849.49744"
-         y="70.105324"
-         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:6.66667px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:end;text-anchor:end;fill:#fffefe;fill-opacity:1;stroke:none"
-         id="tspan120364">users more time to adapt to override syntax</tspan><tspan
-         sodipodi:role="line"
-         x="849.49744"
-         y="79.103691"
-         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:6.66667px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:end;text-anchor:end;fill:#fffefe;fill-opacity:1;stroke:none"
-         id="tspan123280">changes in the 3.4 release.</tspan></text>
     <text
        xml:space="preserve"
        style="font-weight:bold;font-size:13.3333px;line-height:125%;font-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
-       x="959.52008"
-       y="250.67822"
+       x="442.92441"
+       y="94.678825"
        id="text1185-9-7-1-1-0-7"><tspan
          sodipodi:role="line"
-         x="959.52008"
-         y="250.67822"
+         x="442.92441"
+         y="94.678825"
          style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;stroke:none"
          id="tspan31345-42-7">Oct.</tspan><tspan
          sodipodi:role="line"
-         x="959.52008"
-         y="268.6749"
+         x="442.92441"
+         y="112.67551"
          style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;stroke:none"
          id="tspan49906-9-6">2022</tspan></text>
     <text
        xml:space="preserve"
        style="font-weight:bold;font-size:13.3333px;line-height:125%;font-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
-       x="719.13617"
-       y="250.21216"
-       id="text1185-9-7-1-1-2"><tspan
-         sodipodi:role="line"
-         x="719.13617"
-         y="250.21216"
-         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;stroke:none"
-         id="tspan31345-1">Oct.</tspan><tspan
-         sodipodi:role="line"
-         x="719.13617"
-         y="268.20883"
-         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;stroke:none"
-         id="tspan49906-5">2021</tspan></text>
-    <text
-       xml:space="preserve"
-       style="font-weight:bold;font-size:13.3333px;line-height:125%;font-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
-       x="478.82367"
-       y="250.21216"
-       id="text1185-9-7-1-1-80"><tspan
-         sodipodi:role="line"
-         x="478.82367"
-         y="250.21216"
-         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;stroke:none"
-         id="tspan31345-5">Oct.</tspan><tspan
-         sodipodi:role="line"
-         x="478.82367"
-         y="268.20883"
-         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;stroke:none"
-         id="tspan49906-6">2020</tspan></text>
-    <text
-       xml:space="preserve"
-       style="font-weight:bold;font-size:13.3333px;line-height:125%;font-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
-       x="361.81961"
-       y="250.07544"
-       id="text1185-9-7-1-1-8"><tspan
-         sodipodi:role="line"
-         x="361.81961"
-         y="250.07544"
-         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;stroke:none"
-         id="tspan31345-4">Apr.</tspan><tspan
-         sodipodi:role="line"
-         x="361.81961"
-         y="268.07211"
-         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;stroke:none"
-         id="tspan49906-7">2020</tspan></text>
-    <text
-       xml:space="preserve"
-       style="font-weight:bold;font-size:13.3333px;line-height:125%;font-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
-       x="840.9248"
-       y="250.07544"
+       x="324.32913"
+       y="94.076042"
        id="text1185-9-7-1-1-8-1"><tspan
          sodipodi:role="line"
-         x="840.9248"
-         y="250.07544"
+         x="324.32913"
+         y="94.076042"
          style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;stroke:none"
          id="tspan31345-4-0">Apr</tspan><tspan
          sodipodi:role="line"
-         x="840.9248"
-         y="268.07211"
+         x="324.32913"
+         y="112.07272"
          style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;stroke:none"
          id="tspan49906-7-3">2022</tspan></text>
     <text
        xml:space="preserve"
        style="font-weight:bold;font-size:13.3333px;line-height:125%;font-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
-       x="1321.8608"
-       y="250.07544"
+       x="805.2652"
+       y="94.076042"
        id="text1185-9-7-1-1-8-1-0"><tspan
          sodipodi:role="line"
-         x="1321.8608"
-         y="250.07544"
+         x="805.2652"
+         y="94.076042"
          style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;stroke:none"
          id="tspan31345-4-0-4">Apr.</tspan><tspan
          sodipodi:role="line"
-         x="1321.8608"
-         y="268.07211"
+         x="805.2652"
+         y="112.07272"
          style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;stroke:none"
          id="tspan49906-7-3-8">2024</tspan></text>
     <text
        xml:space="preserve"
        style="font-weight:bold;font-size:13.3333px;line-height:125%;font-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
-       x="1561.8163"
-       y="249.66977"
+       x="1045.2207"
+       y="93.670372"
        id="text1185-9-7-1-1-8-1-0-4"><tspan
          sodipodi:role="line"
-         x="1561.8163"
-         y="249.66977"
+         x="1045.2207"
+         y="93.670372"
          style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;stroke:none"
          id="tspan31345-4-0-4-81">Apr.</tspan><tspan
          sodipodi:role="line"
-         x="1561.8163"
-         y="267.66644"
+         x="1045.2207"
+         y="111.66705"
          style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;stroke:none"
          id="tspan49906-7-3-8-2">2025</tspan></text>
     <text
        xml:space="preserve"
        style="font-weight:bold;font-size:13.3333px;line-height:125%;font-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
-       x="1802.1477"
-       y="250.26334"
+       x="1285.5521"
+       y="94.263939"
        id="text1185-9-7-1-1-8-1-0-4-2"><tspan
          sodipodi:role="line"
-         x="1802.1477"
-         y="250.26334"
+         x="1285.5521"
+         y="94.263939"
          style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;stroke:none"
          id="tspan31345-4-0-4-81-5">Apr.</tspan><tspan
          sodipodi:role="line"
-         x="1802.1477"
-         y="268.26001"
+         x="1285.5521"
+         y="112.26062"
          style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;stroke:none"
          id="tspan49906-7-3-8-2-8">2026</tspan></text>
     <text
        xml:space="preserve"
        style="font-weight:bold;font-size:13.3333px;line-height:125%;font-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
-       x="1081.4458"
-       y="250.07544"
+       x="564.85016"
+       y="94.076042"
        id="text1185-9-7-1-1-8-1-0-2"><tspan
          sodipodi:role="line"
-         x="1081.4458"
-         y="250.07544"
+         x="564.85016"
+         y="94.076042"
          style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;stroke:none"
          id="tspan31345-4-0-4-8">Apr.</tspan><tspan
          sodipodi:role="line"
-         x="1081.4458"
-         y="268.07211"
+         x="564.85016"
+         y="112.07272"
          style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;stroke:none"
          id="tspan49906-7-3-8-3">2023</tspan></text>
-    <text
-       xml:space="preserve"
-       style="font-weight:bold;font-size:13.3333px;line-height:125%;font-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
-       x="602.51526"
-       y="250.07544"
-       id="text1185-9-7-1-1-8-1-7"><tspan
-         sodipodi:role="line"
-         x="602.51526"
-         y="250.07544"
-         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;stroke:none"
-         id="tspan31345-4-0-5">Apr.</tspan><tspan
-         sodipodi:role="line"
-         x="602.51526"
-         y="268.07211"
-         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;stroke:none"
-         id="tspan49906-7-3-6">2021</tspan></text>
     <text
        xml:space="preserve"
        style="font-weight:bold;font-size:42.5884px;line-height:125%;font-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:none;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
@@ -1111,252 +947,117 @@
          y="345.7359" /></text>
     <path
        id="path29430"
-       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:2;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
-       d="M 319.99936,219.99912 H 2300 Z" />
-    <path
-       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:2;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
-       d="m 360,219.99997 v 10.00004 0"
-       id="path29548" />
-    <path
-       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:2;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
-       d="m 480,219.99996 v 10 0"
-       id="path29548-5" />
+       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1.72671;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+       d="M 307.54809,63.999718 H 1783.4043 Z" />
     <path
        style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:2;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
-       d="m 600,219.99992 v 10.00005 0"
-       id="path29548-5-1" />
-    <path
-       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:2;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
-       d="m 720,220.00002 v 9.99999 0"
-       id="path29548-5-1-3" />
-    <path
-       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:2;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
-       d="m 840,220.00002 v 9.99995 0"
+       d="m 323.40434,64.000618 v 9.99995 0"
        id="path29548-5-1-3-6" />
     <path
        style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:2;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
-       d="m 960,220.00002 v 9.99999 0"
+       d="m 443.40434,64.000618 v 9.99999 0"
        id="path29548-5-1-3-6-3" />
     <path
        style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:2;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
-       d="m 1080,220.00002 v 9.99999 0"
+       d="m 563.40434,64.000618 v 9.99999 0"
        id="path29548-5-1-3-6-3-1" />
     <path
        style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
-       d="m 380,219.99997 v 5.00004 0"
-       id="path29548-8"
-       inkscape:transform-center-x="14.782001"
-       inkscape:transform-center-y="-0.085282837" />
-    <path
-       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
-       d="m 400,219.99997 v 5.00004 0"
-       id="path29548-8-5"
-       inkscape:transform-center-x="14.782001"
-       inkscape:transform-center-y="-0.085282837" />
-    <path
-       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:0.999997;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
-       d="m 420,219.99997 v 5 0"
-       id="path29548-8-5-0"
-       inkscape:transform-center-x="14.782001"
-       inkscape:transform-center-y="-0.085282155" />
-    <path
-       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:0.999997;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
-       d="m 440,219.99997 v 5 0"
-       id="path29548-8-5-0-6"
-       inkscape:transform-center-x="14.782001"
-       inkscape:transform-center-y="-0.085282155" />
-    <path
-       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
-       d="m 460,219.99997 v 5.00004 0"
-       id="path29548-8-5-0-6-4-6"
-       inkscape:transform-center-x="14.782001"
-       inkscape:transform-center-y="-0.085282837" />
-    <path
-       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
-       d="m 500,219.99997 v 5.00004 0"
-       id="path29548-8-5-0-6-4-6-2"
-       inkscape:transform-center-x="14.782001"
-       inkscape:transform-center-y="-0.085282837" />
-    <path
-       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:0.999997;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
-       d="m 520,219.99997 v 5 0"
-       id="path29548-8-5-0-6-4-6-2-9"
-       inkscape:transform-center-x="14.782001"
-       inkscape:transform-center-y="-0.085282155" />
-    <path
-       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
-       d="m 540,219.99997 v 5.00004 0"
-       id="path29548-8-5-0-6-4-6-2-9-0"
-       inkscape:transform-center-x="14.782001"
-       inkscape:transform-center-y="-0.085282837" />
-    <path
-       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
-       d="m 560,219.99997 v 5.00004 0"
-       id="path29548-8-5-0-6-4-6-2-9-0-8"
-       inkscape:transform-center-x="14.782001"
-       inkscape:transform-center-y="-0.085282837" />
-    <path
-       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
-       d="m 580,219.99997 v 5.00004 0"
-       id="path29548-8-5-0-6-4-6-2-9-0-8-1"
-       inkscape:transform-center-x="14.782001"
-       inkscape:transform-center-y="-0.085282837" />
-    <path
-       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
-       d="m 620.266,219.99997 v 5.00004 0"
-       id="path29548-8-5-0-6-4-6-2-9-0-8-1-3"
-       inkscape:transform-center-x="14.782001"
-       inkscape:transform-center-y="-0.085282837" />
-    <path
-       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
-       d="m 640,219.99997 v 5.00004 0"
-       id="path29548-8-5-0-6-4-6-2-9-0-8-1-3-1"
-       inkscape:transform-center-x="14.782001"
-       inkscape:transform-center-y="-0.085282837" />
-    <path
-       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
-       d="m 660,219.99997 v 5.00004 0"
-       id="path29548-8-5-0-6-4-6-2-9-0-8-1-3-1-9"
-       inkscape:transform-center-x="14.782001"
-       inkscape:transform-center-y="-0.085282837" />
-    <path
-       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
-       d="m 679.61073,219.99997 v 5.00004 0"
-       id="path29548-8-5-0-6-4-6-2-9-0-8-1-3-1-9-6"
-       inkscape:transform-center-x="14.782001"
-       inkscape:transform-center-y="-0.085282837" />
-    <path
-       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
-       d="m 700,219.99997 v 5.00004 0"
-       id="path29548-8-5-0-6-4-6-2-9-0-8-1-3-1-9-6-9"
-       inkscape:transform-center-x="14.782001"
-       inkscape:transform-center-y="-0.085282837" />
-    <path
-       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
-       d="m 740,219.99997 v 5.00004 0"
-       id="path29548-8-5-0-6-4-6-2-9-0-8-1-3-1-9-6-9-3"
-       inkscape:transform-center-x="14.782001"
-       inkscape:transform-center-y="-0.085282837" />
-    <path
-       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
-       d="m 760,219.99997 v 5.00004 0"
-       id="path29548-8-5-0-6-4-6-2-9-0-8-1-3-1-9-6-9-3-4"
-       inkscape:transform-center-x="14.782001"
-       inkscape:transform-center-y="-0.085282837" />
-    <path
-       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
-       d="m 780.36587,219.99997 v 5.00004 0"
-       id="path29548-8-5-0-6-4-6-2-9-0-8-1-3-1-9-6-9-3-4-0"
-       inkscape:transform-center-x="14.782001"
-       inkscape:transform-center-y="-0.085282837" />
-    <path
-       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
-       d="m 800,219.99997 v 5.00004 0"
-       id="path29548-8-5-0-6-4-6-2-9-0-8-1-3-1-9-6-9-3-4-0-4"
-       inkscape:transform-center-x="14.782001"
-       inkscape:transform-center-y="-0.085282837" />
-    <path
-       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
-       d="m 820,219.99997 v 5.00004 0"
-       id="path29548-8-5-0-6-4-6-2-9-0-8-1-3-1-9-6-9-3-4-0-4-6"
-       inkscape:transform-center-x="14.782001"
-       inkscape:transform-center-y="-0.085282837" />
-    <path
-       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
-       d="m 860,219.99997 v 5.00004 0"
+       d="m 343.40434,64.000568 v 5.00004 0"
        id="path29548-8-5-0-6-4-6-2-9-0-8-1-3-1-9-6-9-3-4-0-4-6-2"
        inkscape:transform-center-x="14.782001"
        inkscape:transform-center-y="-0.085282837" />
     <path
        style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
-       d="m 880,219.99997 v 5.00004 0"
+       d="m 363.40434,64.000568 v 5.00004 0"
        id="path29548-8-5-0-6-4-6-2-9-0-8-1-3-1-9-6-9-3-4-0-4-6-2-2"
        inkscape:transform-center-x="14.782001"
        inkscape:transform-center-y="-0.085282837" />
     <path
        style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
-       d="m 899.72384,219.99997 v 5.00004 0"
+       d="m 383.12818,64.000568 v 5.00004 0"
        id="path29548-8-5-0-6-4-6-2-9-0-8-1-3-1-9-6-9-3-4-0-4-6-2-2-7"
        inkscape:transform-center-x="14.782001"
        inkscape:transform-center-y="-0.085282837" />
     <path
        style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
-       d="m 920,219.99997 v 5.00004 0"
+       d="m 403.40434,64.000568 v 5.00004 0"
        id="path29548-8-5-0-6-4-6-2-9-0-8-1-3-1-9-6-9-3-4-0-4-6-2-2-7-6"
        inkscape:transform-center-x="14.782001"
        inkscape:transform-center-y="-0.085282837" />
     <path
        style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
-       d="m 940,219.99997 v 5.00004 0"
+       d="m 423.40434,64.000568 v 5.00004 0"
        id="path29548-8-5-0-6-4-6-2-9-0-8-1-3-1-9-6-9-3-4-0-4-6-2-2-7-6-1"
        inkscape:transform-center-x="14.782001"
        inkscape:transform-center-y="-0.085282837" />
     <path
        style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
-       d="m 980,219.99997 v 5.00004 0"
+       d="m 463.40434,64.000568 v 5.00004 0"
        id="path29548-8-5-0-6-4-6-2-9-0-8-1-3-1-9-6-9-3-4-0-4-6-2-2-7-6-1-9"
        inkscape:transform-center-x="14.782001"
        inkscape:transform-center-y="-0.085282837" />
     <path
        style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
-       d="m 1000,219.99997 v 5.00004 0"
+       d="m 483.40434,64.000568 v 5.00004 0"
        id="path29548-8-5-0-6-4-6-2-9-0-8-1-3-1-9-6-9-3-4-0-4-6-2-2-7-6-1-9-9"
        inkscape:transform-center-x="14.782001"
        inkscape:transform-center-y="-0.085282837" />
     <path
        style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
-       d="m 1020,219.99997 v 5.00004 0"
+       d="m 503.40434,64.000568 v 5.00004 0"
        id="path29548-8-5-0-6-4-6-2-9-0-8-1-3-1-9-6-9-3-4-0-4-6-2-2-7-6-1-9-9-1"
        inkscape:transform-center-x="14.782001"
        inkscape:transform-center-y="-0.085282837" />
     <path
        style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
-       d="m 1040,219.99997 v 5.00004 0"
+       d="m 523.40434,64.000568 v 5.00004 0"
        id="path29548-8-5-0-6-4-6-2-9-0-8-1-3-1-9-6-9-3-4-0-4-6-2-2-7-6-1-9-9-1-4"
        inkscape:transform-center-x="14.782001"
        inkscape:transform-center-y="-0.085282837" />
     <path
        style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
-       d="m 1059.7216,219.99997 v 5.00004 0"
+       d="m 543.12594,64.000568 v 5.00004 0"
        id="path29548-8-5-0-6-4-6-2-9-0-8-1-3-1-9-6-9-3-4-0-4-6-2-2-7-6-1-9-9-1-4-9"
        inkscape:transform-center-x="-14.78205"
        inkscape:transform-center-y="-0.085282837" />
     <path
        style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
-       d="m 1100,219.99997 v 5.00004 0"
+       d="m 583.40434,64.000568 v 5.00004 0"
        id="path29548-8-5-0-6-4-6-2-9-0-8-1-3-1-9-6-9-3-4-0-4-6-2-2-7-6-1-9-0"
        inkscape:transform-center-x="14.782001"
        inkscape:transform-center-y="-0.085282837" />
     <path
        style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
-       d="m 1120,219.99997 v 5.00004 0"
+       d="m 603.40434,64.000568 v 5.00004 0"
        id="path29548-8-5-0-6-4-6-2-9-0-8-1-3-1-9-6-9-3-4-0-4-6-2-2-7-6-1-9-9-7"
        inkscape:transform-center-x="14.782001"
        inkscape:transform-center-y="-0.085282837" />
     <path
        style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
-       d="m 1140,219.99997 v 5.00004 0"
+       d="m 623.40434,64.000568 v 5.00004 0"
        id="path29548-8-5-0-6-4-6-2-9-0-8-1-3-1-9-6-9-3-4-0-4-6-2-2-7-6-1-9-9-1-5"
        inkscape:transform-center-x="14.782001"
        inkscape:transform-center-y="-0.085282837" />
     <path
        style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
-       d="m 1160,219.99997 v 5.00004 0"
+       d="m 643.40434,64.000568 v 5.00004 0"
        id="path29548-8-5-0-6-4-6-2-9-0-8-1-3-1-9-6-9-3-4-0-4-6-2-2-7-6-1-9-9-1-4-8"
        inkscape:transform-center-x="14.782001"
        inkscape:transform-center-y="-0.085282837" />
     <path
        style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
-       d="m 1179.7216,219.99997 v 5.00004 0"
+       d="m 663.12594,64.000568 v 5.00004 0"
        id="path29548-8-5-0-6-4-6-2-9-0-8-1-3-1-9-6-9-3-4-0-4-6-2-2-7-6-1-9-9-1-4-9-7"
        inkscape:transform-center-x="-14.78205"
        inkscape:transform-center-y="-0.085282837" />
     <path
        style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:2;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
-       d="m 1320,219.99996 v 10 0"
+       d="m 803.40434,64.000558 v 10 0"
        id="path29548-5-1-3-6-3-1-0-8" />
     <g
-       id="g1267">
+       id="g1267"
+       transform="translate(-516.59566,-155.99941)">
       <path
          style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:2;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
          d="m 1200,220.00002 v 9.99999 0"
@@ -1394,7 +1095,7 @@
     </g>
     <g
        id="g1267-4"
-       transform="translate(240,-4e-5)">
+       transform="translate(-276.59566,-155.99945)">
       <path
          style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:2;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
          d="m 1200,220.00002 v 9.99999 0"
@@ -1432,7 +1133,7 @@
     </g>
     <g
        id="g1267-4-5"
-       transform="translate(480,-5e-5)">
+       transform="translate(-36.595659,-155.99946)">
       <path
          style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:2;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
          d="m 1200,220.00002 v 9.99999 0"
@@ -1470,7 +1171,7 @@
     </g>
     <g
        id="g1267-4-5-22"
-       transform="translate(600,-4e-5)">
+       transform="translate(83.404341,-155.99945)">
       <path
          style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:2;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
          d="m 1200,220.00002 v 9.99999 0"
@@ -1508,7 +1209,7 @@
     </g>
     <g
        id="g1267-4-5-9"
-       transform="translate(360,-4e-5)">
+       transform="translate(-156.59566,-155.99945)">
       <path
          style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:2;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
          d="m 1200,220.00002 v 9.99999 0"
@@ -1546,105 +1247,105 @@
     </g>
     <path
        style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:2;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
-       d="m 1800,219.99997 v 9.99999 0"
+       d="m 1283.4043,64.000568 v 9.99999 0"
        id="path29548-5-1-3-6-3-1-0-3-4-2-0" />
     <path
        style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
-       d="m 1340,219.99997 v 5.00004 0"
+       d="m 823.40434,64.000568 v 5.00004 0"
        id="path29548-8-5-0-6-4-6-2-9-0-8-1-3-1-9-6-9-3-4-0-4-6-2-2-7-6-1-9-0-5-3"
        inkscape:transform-center-x="14.782001"
        inkscape:transform-center-y="-0.085282837" />
     <path
        style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
-       d="m 1360,219.99997 v 5.00004 0"
+       d="m 843.40434,64.000568 v 5.00004 0"
        id="path29548-8-5-0-6-4-6-2-9-0-8-1-3-1-9-6-9-3-4-0-4-6-2-2-7-6-1-9-9-7-5-0"
        inkscape:transform-center-x="14.782001"
        inkscape:transform-center-y="-0.085282837" />
     <path
        style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
-       d="m 1380,219.99997 v 5.00004 0"
+       d="m 863.40434,64.000568 v 5.00004 0"
        id="path29548-8-5-0-6-4-6-2-9-0-8-1-3-1-9-6-9-3-4-0-4-6-2-2-7-6-1-9-9-1-5-2-3"
        inkscape:transform-center-x="14.782001"
        inkscape:transform-center-y="-0.085282837" />
     <path
        style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
-       d="m 1400,219.99997 v 5.00004 0"
+       d="m 883.40434,64.000568 v 5.00004 0"
        id="path29548-8-5-0-6-4-6-2-9-0-8-1-3-1-9-6-9-3-4-0-4-6-2-2-7-6-1-9-9-1-4-8-9-0"
        inkscape:transform-center-x="14.782001"
        inkscape:transform-center-y="-0.085282837" />
     <path
        style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
-       d="m 1419.7216,219.99997 v 5.00004 0"
+       d="m 903.12594,64.000568 v 5.00004 0"
        id="path29548-8-5-0-6-4-6-2-9-0-8-1-3-1-9-6-9-3-4-0-4-6-2-2-7-6-1-9-9-1-4-9-7-0-9"
        inkscape:transform-center-x="-14.78205"
        inkscape:transform-center-y="-0.085282837" />
     <text
        xml:space="preserve"
        style="font-weight:bold;font-size:13.3333px;line-height:125%;font-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
-       x="1919.3904"
-       y="249.86044"
+       x="1402.7948"
+       y="93.861046"
        id="text1185-9-7-1-1-89-62"><tspan
          sodipodi:role="line"
-         x="1919.3904"
-         y="249.86044"
+         x="1402.7948"
+         y="93.861046"
          style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;stroke:none"
          id="tspan31345-7-6">Oct.</tspan><tspan
          sodipodi:role="line"
-         x="1919.3904"
-         y="267.85712"
+         x="1402.7948"
+         y="111.85773"
          style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;stroke:none"
          id="tspan49906-76-7">2026</tspan></text>
     <text
        xml:space="preserve"
        style="font-weight:bold;font-size:13.3333px;line-height:125%;font-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
-       x="2159.3093"
-       y="250.58356"
+       x="1642.7137"
+       y="94.58416"
        id="text1185-9-7-1-1-89-6-5"><tspan
          sodipodi:role="line"
-         x="2159.3093"
-         y="250.58356"
+         x="1642.7137"
+         y="94.58416"
          style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;stroke:none"
          id="tspan31345-7-8-6">Oct.</tspan><tspan
          sodipodi:role="line"
-         x="2159.3093"
-         y="268.58023"
+         x="1642.7137"
+         y="112.58084"
          style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;stroke:none"
          id="tspan49906-76-0-9">2027</tspan></text>
     <text
        xml:space="preserve"
        style="font-weight:bold;font-size:13.3333px;line-height:125%;font-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
-       x="2041.8163"
-       y="249.66977"
+       x="1525.2207"
+       y="93.670372"
        id="text1185-9-7-1-1-8-1-0-4-8"><tspan
          sodipodi:role="line"
-         x="2041.8163"
-         y="249.66977"
+         x="1525.2207"
+         y="93.670372"
          style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;stroke:none"
          id="tspan31345-4-0-4-81-7">Apr.</tspan><tspan
          sodipodi:role="line"
-         x="2041.8163"
-         y="267.66644"
+         x="1525.2207"
+         y="111.66705"
          style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;stroke:none"
          id="tspan49906-7-3-8-2-2">2027</tspan></text>
     <text
        xml:space="preserve"
        style="font-weight:bold;font-size:13.3333px;line-height:125%;font-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
-       x="2282.1477"
-       y="250.26334"
+       x="1765.5521"
+       y="94.263939"
        id="text1185-9-7-1-1-8-1-0-4-2-8"><tspan
          sodipodi:role="line"
-         x="2282.1477"
-         y="250.26334"
+         x="1765.5521"
+         y="94.263939"
          style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;stroke:none"
          id="tspan31345-4-0-4-81-5-2">Apr.</tspan><tspan
          sodipodi:role="line"
-         x="2282.1477"
-         y="268.26001"
+         x="1765.5521"
+         y="112.26062"
          style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;stroke:none"
          id="tspan49906-7-3-8-2-8-9">2028</tspan></text>
     <g
        id="g1267-4-9"
-       transform="translate(720,-3e-5)">
+       transform="translate(203.40434,-155.99944)">
       <path
          style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:2;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
          d="m 1200,220.00002 v 9.99999 0"
@@ -1682,7 +1383,7 @@
     </g>
     <g
        id="g1267-4-5-2"
-       transform="translate(960,-4e-5)">
+       transform="translate(443.40434,-155.99945)">
       <path
          style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:2;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
          d="m 1200,220.00002 v 9.99999 0"
@@ -1720,7 +1421,7 @@
     </g>
     <g
        id="g1267-4-5-9-9"
-       transform="translate(840,-3e-5)">
+       transform="translate(323.40434,-155.99944)">
       <path
          style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:2;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
          d="m 1200,220.00002 v 9.99999 0"
@@ -1758,7 +1459,7 @@
     </g>
     <path
        style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:2;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
-       d="m 2280,219.99998 v 9.99999 0"
+       d="m 1763.4043,64.000578 v 9.99999 0"
        id="path29548-5-1-3-6-3-1-0-3-4-2-0-0" />
   </g>
   <style

---
base-commit: 372b5b4ca55819c294970b20aa8b8d8167144329
change-id: 20241018-update-releases-svg-be52387ec8cc

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>


