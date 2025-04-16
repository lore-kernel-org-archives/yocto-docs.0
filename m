Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79060C369B1
	for <webhook@archiver.kernel.org>; Wed, 16 Apr 2025 08:02:42 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.13789.1744790557989615086
 for <docs@lists.yoctoproject.org>;
 Wed, 16 Apr 2025 01:02:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=emZZUjYa;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id ACD0A1FCF0;
	Wed, 16 Apr 2025 08:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744790556;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=XOxUZNfxPLBSY44Fm9WRxEcl8TKXDymPek4xGZjYXN4=;
	b=emZZUjYa0oWWXLEM2BpaMS+pfR6xjImS+wtUbs51ndelOc+ookhuRSemW1vKFTwG1zP5SM
	Fh3tMSLAsOxgZZQ5oSbOfC5NcQmKuTaJJLQZg6gQU4ETYkEAM0br+y7zUqT3++b2QCbFSm
	y5cHWq8bsPK/TVXg4RhzmrO3I2i8GMgdwi0Wfl3cNj9vUtyN+8dPrB9ZzIFVw9jrGs1QNW
	Qj+PH6kSuU0650hbV1VYAV/aUY0SmcSB7mYA4XHtOOSjGzXztn/jqi4ANKJa5DoHZWetct
	bOzmOcNH4vQ096kEztNf40pyEVkflXFjZ2Hm0y4UzmjbsYcPHFloCy2wPsvItA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 16 Apr 2025 10:02:26 +0200
Subject: [PATCH] ref-manual/release-process: update releases.svg
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250416-update-release-svg-v1-1-1a57dddf99bd@bootlin.com>
X-B4-Tracking: v=1; b=H4sIABFk/2cC/x3MQQqEMAxG4atI1gaitCBeRVzU9h8nMKg0KoJ4d
 8ssv8V7Nxmywqivbso41XRdCpq6ovgNywzWVEyttF5c4/nYUtjBGT8EA9s5s3iJnZM0dcFRCbe
 Mj17/6TA+zwvTuLwQZAAAAA==
X-Change-ID: 20250415-update-release-svg-050c840db8a4
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=46505;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=QJLH58i3zLEgqQRmQHlbhDka5UnPtYs0ctQrjvy+b34=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBn/2QbiCwAD03/M7nIXLqsEClhV/aN6yRO4IHZ1
 pPgGT11aE2JAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ/9kGwAKCRDRgEFAKaOo
 NnyED/9TQwKESlJmUE9QTjd5aXJK9OX4eIhRavTjafqN0zaRp0v2MFsF9u24zbKqcAiL89oP8Dv
 PsXfj8yI5f/BW1G4Fo5BSnOpQNm7nyAqzftYiZtzb+ROaCS9XgHeGMGA/tRaRGj2MhhVP9mViQo
 tvWb0Jymr0JPOMFQc6fAIkSObNULUooT4HtnhErSHlIF7jU6HXmaXnMVTwTEEJiIWNya5aq6xBn
 wfqP328wMFVtk6FdMY2WW1wUaX5RbGNkprtAR1hdqt/HXSQwbSJ2Orx5rQGXX00oZ8+TJNvk+Uh
 cjXeTwExHWSHleKPIOA4aMbjY8RlijRm9CAlkdfwi7MLdcpwll2/GZAUDfiF6SgEnvyQUWwrymJ
 xBwiqvgQvIeipK/0TAeMzSV+yDmf2Ym7eMU8UJz0AbFndZg2pcvxLAdB6eMAlKs33dzAvOCTd+a
 T9Zy4tIbAV5OCvIg1gmXDItA/QCX9qGEzSMYc2lQMjlIMH2TpUeIWQl/EYK+/OsjNnbV2ayrAtC
 YkU8NihP1uvWBNe56gQXRr3zzZSfnJPCS+/Fz/nyqsekp6sELNE2IABdvTX3e4FawjIqcweYbP7
 ro4A5rEgyt/y9pGmG0ubwHMkHOowQo6ZFrMjJN+ofidkqP20bC/VJaoTOdkgeUOTHR6vvHXQUq0
 mmqk+8cnIPDuE4A==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvdehkeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkvfevofesthejredtredtjeenucfhrhhomheptehnthhonhhinhcuifhouggrrhguuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffgedvleffvdeiheefudduleegjeefkefftdehgeejieefuddtieefleehhfelfeenucffohhmrghinhepsghoohhtlhhinhdrtghomhdphihotghtohhprhhojhgvtghtrdhorhhgnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemiegsleelmegvfhehgeemvddtrgefmeeifhegvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemiegsleelmegvfhehgeemvddtrgefmeeifhegvddphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtoheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegso
 hhothhlihhnrdgtohhmpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrgh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 16 Apr 2025 08:02:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6754

- Add the future "Whinlatter" (5.3) and "Wrynose" (6.0) releases.
- Make the "Walnascar" release a current release.
- Update the month in Current.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Preview: https://lufi.bootlin.com/r/Kn2VpuYVPN#J+LBdmNXNOiwuzDIGX3gDyRHC2chdGqhGMqvx3YxdFw=
Note: Styhead is not deprecated yet (will be 1 month after walnascar is released).
Source: https://wiki.yoctoproject.org/wiki/Releases
---
 documentation/ref-manual/svg/releases.svg | 518 +++++++++++++++++++++++++-----
 1 file changed, 432 insertions(+), 86 deletions(-)

diff --git a/documentation/ref-manual/svg/releases.svg b/documentation/ref-manual/svg/releases.svg
index aad50cf59..3a379078b 100644
--- a/documentation/ref-manual/svg/releases.svg
+++ b/documentation/ref-manual/svg/releases.svg
@@ -2,11 +2,11 @@
 <svg
    version="1.1"
    id="svg2"
-   width="1523.001"
-   height="504.30499"
-   viewBox="0 0 1523.001 504.30497"
+   width="1992.7236"
+   height="613.35602"
+   viewBox="0 0 1992.7236 613.35599"
    sodipodi:docname="releases.svg"
-   inkscape:version="1.3.2 (091e20ef0f, 2023-11-25, custom)"
+   inkscape:version="1.4.1 (93de688d07, 2025-03-30)"
    inkscape:export-filename="../../../../../../../../tmp/releases.png"
    inkscape:export-xdpi="96"
    inkscape:export-ydpi="96"
@@ -70,7 +70,7 @@
        scale_width="1"
        end_linecap_type="zerowidth"
        not_jump="false"
-       message="&lt;b&gt;Ctrl + click&lt;/b&gt; on existing node and move it" />
+       message="" />
     <marker
        style="overflow:visible"
        id="marker5783"
@@ -412,9 +412,9 @@
      inkscape:window-height="2069"
      id="namedview4"
      showgrid="true"
-     inkscape:zoom="2.1971372"
-     inkscape:cx="1068.2082"
-     inkscape:cy="287.87461"
+     inkscape:zoom="1.5536106"
+     inkscape:cx="1158.2696"
+     inkscape:cy="273.55632"
      inkscape:window-x="2256"
      inkscape:window-y="60"
      inkscape:window-maximized="1"
@@ -433,8 +433,8 @@
     <inkscape:grid
        type="xygrid"
        id="grid1257"
-       originx="-289.99936"
-       originy="369.99997"
+       originx="-289.06071"
+       originy="478.43017"
        spacingy="1"
        spacingx="1"
        units="px"
@@ -444,66 +444,90 @@
      inkscape:groupmode="layer"
      inkscape:label="Image"
      id="g10"
-     transform="translate(-289.99936,370.00003)">
+     transform="translate(-289.06072,478.43022)">
+    <rect
+       style="fill:#333333;fill-opacity:0;stroke:#000000;stroke-width:0.713896;stroke-linejoin:bevel;stroke-miterlimit:0;stroke-opacity:0"
+       id="rect1"
+       width="1992.0098"
+       height="612.64215"
+       x="289.41766"
+       y="-478.07327"
+       ry="24.97636" />
     <path
-       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:0.449183;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
-       d="m 563.40434,64.000628 v -415.635938 0 0"
+       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:0.50455;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+       d="m 563.40434,64.000628 v -524.414808 0 0"
        id="path207708" />
     <path
-       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:0.449183;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
-       d="m 683.40434,64.000628 v -415.635938 0 0"
+       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:0.50455;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+       d="m 683.40434,64.000628 v -524.414808 0 0"
        id="path207708-4" />
     <path
-       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:0.449183;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
-       d="m 803.40434,64.000628 v -415.635938 0 0"
+       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:0.50455;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+       d="m 803.40434,64.000628 v -524.414808 0 0"
        id="path207708-4-3" />
     <path
-       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:0.449183;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
-       d="m 923.40434,64.000588 v -415.635898 0 0"
+       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:0.50455;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+       d="m 923.40434,64.000577 v -524.414757 0 0"
        id="path207708-4-3-6" />
     <path
-       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:0.449183;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
-       d="m 1043.4043,64.000588 v -415.635898 0 0"
+       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:0.50455;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+       d="m 1043.4043,64.000577 v -524.414757 0 0"
        id="path207708-4-3-6-2" />
     <path
-       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:0.449183;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
-       d="m 1163.4043,64.000588 v -415.635898 0 0"
+       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:0.50455;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+       d="m 1163.4043,64.000577 v -524.414757 0 0"
        id="path207708-4-3-6-2-8" />
     <path
-       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:0.449183;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
-       d="m 1283.4043,64.000588 v -415.635898 0 0"
+       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:0.50455;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+       d="m 1283.4043,64.000577 v -524.414757 0 0"
        id="path207708-4-3-6-2-8-4" />
     <path
-       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:0.449183;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
-       d="m 1403.4043,64.000588 v -415.635898 0 0"
+       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:0.50455;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+       d="m 1403.4043,64.000577 v -524.414757 0 0"
        id="path207708-4-3-6-2-8-4-3" />
     <path
        style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:0.475347;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
        d="m 1523.4043,64.000568 v -415.757648 0 0"
        id="path207708-4-3-6-2-8-4-3-8" />
     <path
-       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:0.449183;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
-       d="m 1523.4043,64.000588 v -415.635898 0 0"
+       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:0.50455;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+       d="m 1523.4043,64.000577 v -524.414757 0 0"
        id="path207708-4-3-6-2-8-4-3-8-0" />
     <path
-       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:0.449183;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
-       d="m 1643.3583,64.000578 v -415.635868 0 0"
+       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:0.50455;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+       d="m 1643.3583,64.000565 v -524.414715 0 0"
        id="path207708-4-3-6-2-8-4-3-8-4" />
     <path
-       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:0.449183;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
-       d="m 1763.4043,64.000578 v -415.635868 0 0"
+       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:0.50455;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+       d="m 1763.4043,64.000565 v -524.414715 0 0"
        id="path207708-4-3-6-2-8-4-3-8-4-0" />
     <path
-       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:0.449183;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
-       d="m 443.40434,64.000628 v -415.635938 0 0"
+       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:0.50455;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+       d="m 1883.7877,64.878769 v -524.414709 0 0"
+       id="path207708-4-3-6-2-8-4-3-8-4-0-8" />
+    <path
+       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:0.50455;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+       d="m 2002.9599,64.984489 v -524.414709 0 0"
+       id="path207708-4-3-6-2-8-4-3-8-4-0-8-8" />
+    <path
+       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:0.50455;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+       d="m 2123.2232,62.984489 v -524.414709 0 0"
+       id="path207708-4-3-6-2-8-4-3-8-4-0-8-8-1" />
+    <path
+       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:0.50455;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+       d="m 2243.313,63.984489 v -524.414709 0 0"
+       id="path207708-4-3-6-2-8-4-3-8-4-0-8-8-1-9" />
+    <path
+       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:0.50455;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+       d="m 443.40434,64.000628 v -524.414808 0 0"
        id="path207708-9" />
     <path
        style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:0.5;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
        d="m 323.40434,64.000608 v -375.000008 0 0"
        id="path207708-9-6" />
     <path
-       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:0.449183;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
-       d="m 323.40434,64.000618 v -415.635908 0 0"
+       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:0.50455;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+       d="m 323.40434,64.000616 v -524.414766 0 0"
        id="path207708-9-6-2" />
     <text
        xml:space="preserve"
@@ -536,7 +560,7 @@
          x="-59.575905"
          y="580.05695" /></text>
     <rect
-       style="fill:#333333;fill-opacity:1;fill-rule:evenodd;stroke:none;stroke-width:2;stroke-opacity:1;opacity:0.5"
+       style="opacity:0.5;fill:#333333;fill-opacity:1;fill-rule:evenodd;stroke:none;stroke-width:2;stroke-opacity:1"
        id="rect917-0-0-4-4-9-4"
        width="160.00002"
        height="45.000004"
@@ -583,14 +607,6 @@
          y="-73.501534"
          style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans Bold';text-align:center;text-anchor:middle;fill:#fffefe;fill-opacity:1;stroke:none"
          id="tspan10317-2-9-1-4">4.2</tspan></text>
-    <rect
-       style="opacity:0.75;fill:#251f32;fill-opacity:1;fill-rule:evenodd;stroke:none;stroke-width:2;stroke-opacity:1"
-       id="rect917-0-0-4-4-9-4-5-3-9-2-3"
-       width="140"
-       height="45.000004"
-       x="1043.132"
-       y="-328.2114"
-       ry="2.2558987" />
     <rect
        style="opacity:1;fill:#333333;fill-opacity:1;fill-rule:evenodd;stroke:none;stroke-width:2;stroke-opacity:1"
        id="rect917-0-0-4-4-9-4-5-3-9-2-3-6"
@@ -615,22 +631,78 @@
          y="-238.332"
          style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans Bold';text-align:center;text-anchor:middle;fill:#fffefe;fill-opacity:1;stroke:none"
          id="tspan10317-2-9-1-4-6-5-6">5.1</tspan></text>
+    <rect
+       style="fill:#333333;fill-opacity:1;fill-rule:evenodd;stroke:none;stroke-width:2;stroke-opacity:1"
+       id="rect917-0-0-4-4-9-4-5-3-9-2-3-6-2"
+       width="140"
+       height="45.000004"
+       x="1043.4697"
+       y="-328.48172"
+       ry="2.2558987" />
+    <text
+       xml:space="preserve"
+       style="font-weight:bold;font-size:13.3333px;line-height:125%;font-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#fffefe;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="1090.4542"
+       y="-309.61823"
+       id="text1185-3-55-4-0-0-0-1-1-6-4-7"><tspan
+         sodipodi:role="line"
+         x="1090.4542"
+         y="-309.61823"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans Bold';text-align:center;text-anchor:middle;fill:#fffefe;fill-opacity:1;stroke:none"
+         id="tspan957-2-8-6-3-9-7-4-2-0-0">Walnascar</tspan><tspan
+         sodipodi:role="line"
+         x="1090.4542"
+         y="-291.62155"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans Bold';text-align:center;text-anchor:middle;fill:#fffefe;fill-opacity:1;stroke:none"
+         id="tspan10317-2-9-1-4-6-5-6-9">5.2</tspan></text>
+    <rect
+       style="opacity:0.75;fill:#251f32;fill-opacity:1;fill-rule:evenodd;stroke:none;stroke-width:2;stroke-opacity:1"
+       id="rect917-0-0-4-4-9-4-5-3-9-2-3-67"
+       width="140"
+       height="45.000004"
+       x="1163.6425"
+       y="-382.27469"
+       ry="2.2558987" />
     <text
        xml:space="preserve"
        style="font-weight:bold;font-size:13.3333px;line-height:125%;font-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#fffefe;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
-       x="1094.2197"
-       y="-309.83084"
-       id="text1185-3-55-4-0-0-0-1-1-6-4-3"><tspan
+       x="1214.9716"
+       y="-363.89413"
+       id="text1185-3-55-4-0-0-0-1-1-6-4-3-53"><tspan
          sodipodi:role="line"
-         x="1094.2197"
-         y="-309.83084"
+         x="1214.9716"
+         y="-363.89413"
          style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans Bold';text-align:center;text-anchor:middle;fill:#fffefe;fill-opacity:1;stroke:none"
-         id="tspan957-2-8-6-3-9-7-4-2-0-5">Walnascar</tspan><tspan
+         id="tspan957-2-8-6-3-9-7-4-2-0-5-5">Whinlatter</tspan><tspan
          sodipodi:role="line"
-         x="1094.2197"
-         y="-291.83417"
+         x="1214.9716"
+         y="-345.89746"
          style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans Bold';text-align:center;text-anchor:middle;fill:#fffefe;fill-opacity:1;stroke:none"
-         id="tspan10317-2-9-1-4-6-5-6-6">5.2</tspan></text>
+         id="tspan10317-2-9-1-4-6-5-6-6-6">5.3</tspan></text>
+    <rect
+       style="opacity:0.75;fill:#251f32;fill-opacity:1;fill-rule:evenodd;stroke:none;stroke-width:5.29752;stroke-opacity:1"
+       id="rect917-0-0-4-4-9-4-5-3-9-2-3-67-6"
+       width="982.23163"
+       height="45.000004"
+       x="1283.7023"
+       y="-436.77539"
+       ry="2.2558987" />
+    <text
+       xml:space="preserve"
+       style="font-weight:bold;font-size:13.3333px;line-height:125%;font-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#fffefe;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="1335.1118"
+       y="-418.39484"
+       id="text1185-3-55-4-0-0-0-1-1-6-4-3-53-0"><tspan
+         sodipodi:role="line"
+         x="1335.1118"
+         y="-418.39484"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans Bold';text-align:center;text-anchor:middle;fill:#fffefe;fill-opacity:1;stroke:none"
+         id="tspan957-2-8-6-3-9-7-4-2-0-5-5-6">Wrynose</tspan><tspan
+         sodipodi:role="line"
+         x="1335.1118"
+         y="-400.39816"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans Bold';text-align:center;text-anchor:middle;fill:#fffefe;fill-opacity:1;stroke:none"
+         id="tspan10317-2-9-1-4-6-5-6-6-6-2">6.0</tspan></text>
     <g
        id="g1591"
        transform="translate(-516.59566,64.000598)">
@@ -681,7 +753,7 @@
          id="tspan10317-2-9-0-1">5.0</tspan></text>
     <g
        id="g1125-0"
-       transform="matrix(0.42240595,0,0,0.41654472,330.77064,-441.11721)"
+       transform="matrix(0.42240595,0,0,0.41654472,330.77064,-497.11721)"
        style="stroke:none;stroke-width:2.38399">
       <rect
          style="opacity:1;fill:#333333;fill-opacity:1;fill-rule:evenodd;stroke:none;stroke-width:4.76797;stroke-opacity:1"
@@ -923,8 +995,8 @@
          y="345.7359" /></text>
     <path
        id="path29430"
-       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1.72671;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
-       d="M 307.54809,63.999718 H 1783.4043 Z" />
+       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1.99503;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+       d="M 307.54809,63.999718 H 2277.72 Z" />
     <path
        style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:2;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
        d="m 323.40434,64.000618 v 9.99995 0"
@@ -1437,50 +1509,324 @@
        style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:2;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
        d="m 1763.4043,64.000578 v 9.99999 0"
        id="path29548-5-1-3-6-3-1-0-3-4-2-0-0" />
+    <text
+       xml:space="preserve"
+       style="font-weight:bold;font-size:13.3333px;line-height:125%;font-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="1885.6029"
+       y="94.285194"
+       id="text1185-9-7-1-1-8-1-0-4-2-8-2"><tspan
+         sodipodi:role="line"
+         x="1885.6029"
+         y="94.285194"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;stroke:none"
+         id="tspan31345-4-0-4-81-5-2-8">Oct.</tspan><tspan
+         sodipodi:role="line"
+         x="1885.6029"
+         y="112.28188"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;stroke:none"
+         id="tspan49906-7-3-8-2-8-9-9">2028</tspan></text>
+    <g
+       id="g1267-4-5-2-7"
+       transform="translate(563.45518,-155.9782)">
+      <path
+         style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:2;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+         d="m 1200,220.00002 v 9.99999 0"
+         id="path29548-5-1-3-6-3-1-0-3-4-1-3" />
+      <path
+         style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+         d="m 1220,219.99997 v 5.00004 0"
+         id="path29548-8-5-0-6-4-6-2-9-0-8-1-3-1-9-6-9-3-4-0-4-6-2-2-7-6-1-9-0-5-0-0-5-6"
+         inkscape:transform-center-x="14.782001"
+         inkscape:transform-center-y="-0.085282837" />
+      <path
+         style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+         d="m 1240,219.99997 v 5.00004 0"
+         id="path29548-8-5-0-6-4-6-2-9-0-8-1-3-1-9-6-9-3-4-0-4-6-2-2-7-6-1-9-9-7-5-3-5-9-1"
+         inkscape:transform-center-x="14.782001"
+         inkscape:transform-center-y="-0.085282837" />
+      <path
+         style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+         d="m 1260,219.99997 v 5.00004 0"
+         id="path29548-8-5-0-6-4-6-2-9-0-8-1-3-1-9-6-9-3-4-0-4-6-2-2-7-6-1-9-9-1-5-2-0-9-9-2"
+         inkscape:transform-center-x="14.782001"
+         inkscape:transform-center-y="-0.085282837" />
+      <path
+         style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+         d="m 1280,219.99997 v 5.00004 0"
+         id="path29548-8-5-0-6-4-6-2-9-0-8-1-3-1-9-6-9-3-4-0-4-6-2-2-7-6-1-9-9-1-4-8-9-9-4-1-9"
+         inkscape:transform-center-x="14.782001"
+         inkscape:transform-center-y="-0.085282837" />
+      <path
+         style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+         d="m 1299.7216,219.99997 v 5.00004 0"
+         id="path29548-8-5-0-6-4-6-2-9-0-8-1-3-1-9-6-9-3-4-0-4-6-2-2-7-6-1-9-9-1-4-9-7-0-2-6-4-3"
+         inkscape:transform-center-x="-14.78205"
+         inkscape:transform-center-y="-0.085282837" />
+    </g>
+    <path
+       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:2;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+       d="m 1883.4551,64.021829 v 9.99999 0"
+       id="path29548-5-1-3-6-3-1-0-3-4-2-0-0-1" />
+    <text
+       xml:space="preserve"
+       style="font-weight:bold;font-size:13.3333px;line-height:125%;font-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="2005.5908"
+       y="94.339828"
+       id="text1185-9-7-1-1-8-1-0-4-2-8-2-4"><tspan
+         sodipodi:role="line"
+         x="2005.5908"
+         y="94.339828"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;stroke:none"
+         id="tspan31345-4-0-4-81-5-2-8-7">Apr.</tspan><tspan
+         sodipodi:role="line"
+         x="2005.5908"
+         y="112.33651"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;stroke:none"
+         id="tspan49906-7-3-8-2-8-9-9-8">2029</tspan></text>
+    <g
+       id="g1267-4-5-2-7-4"
+       transform="translate(683.44312,-155.92356)">
+      <path
+         style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:2;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+         d="m 1200,220.00002 v 9.99999 0"
+         id="path29548-5-1-3-6-3-1-0-3-4-1-3-5" />
+      <path
+         style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+         d="m 1220,219.99997 v 5.00004 0"
+         id="path29548-8-5-0-6-4-6-2-9-0-8-1-3-1-9-6-9-3-4-0-4-6-2-2-7-6-1-9-0-5-0-0-5-6-0"
+         inkscape:transform-center-x="14.782001"
+         inkscape:transform-center-y="-0.085282837" />
+      <path
+         style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+         d="m 1240,219.99997 v 5.00004 0"
+         id="path29548-8-5-0-6-4-6-2-9-0-8-1-3-1-9-6-9-3-4-0-4-6-2-2-7-6-1-9-9-7-5-3-5-9-1-3"
+         inkscape:transform-center-x="14.782001"
+         inkscape:transform-center-y="-0.085282837" />
+      <path
+         style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+         d="m 1260,219.99997 v 5.00004 0"
+         id="path29548-8-5-0-6-4-6-2-9-0-8-1-3-1-9-6-9-3-4-0-4-6-2-2-7-6-1-9-9-1-5-2-0-9-9-2-6"
+         inkscape:transform-center-x="14.782001"
+         inkscape:transform-center-y="-0.085282837" />
+      <path
+         style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+         d="m 1280,219.99997 v 5.00004 0"
+         id="path29548-8-5-0-6-4-6-2-9-0-8-1-3-1-9-6-9-3-4-0-4-6-2-2-7-6-1-9-9-1-4-8-9-9-4-1-9-1"
+         inkscape:transform-center-x="14.782001"
+         inkscape:transform-center-y="-0.085282837" />
+      <path
+         style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+         d="m 1299.7216,219.99997 v 5.00004 0"
+         id="path29548-8-5-0-6-4-6-2-9-0-8-1-3-1-9-6-9-3-4-0-4-6-2-2-7-6-1-9-9-1-4-9-7-0-2-6-4-3-0"
+         inkscape:transform-center-x="-14.78205"
+         inkscape:transform-center-y="-0.085282837" />
+    </g>
+    <path
+       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:2;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+       d="m 2003.443,64.076464 v 9.99999 0"
+       id="path29548-5-1-3-6-3-1-0-3-4-2-0-0-1-6" />
+    <text
+       xml:space="preserve"
+       style="font-weight:bold;font-size:13.3333px;line-height:125%;font-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="2125.6079"
+       y="94.692207"
+       id="text1185-9-7-1-1-8-1-0-4-2-8-2-4-2"><tspan
+         sodipodi:role="line"
+         x="2125.6079"
+         y="94.692207"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;stroke:none"
+         id="tspan31345-4-0-4-81-5-2-8-7-0">Oct.</tspan><tspan
+         sodipodi:role="line"
+         x="2125.6079"
+         y="112.68889"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;stroke:none"
+         id="tspan49906-7-3-8-2-8-9-9-8-6">2029</tspan></text>
+    <g
+       id="g1267-4-5-2-7-4-1"
+       transform="translate(803.46019,-155.57118)">
+      <path
+         style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:2;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+         d="m 1200,220.00002 v 9.99999 0"
+         id="path29548-5-1-3-6-3-1-0-3-4-1-3-5-5" />
+      <path
+         style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+         d="m 1220,219.99997 v 5.00004 0"
+         id="path29548-8-5-0-6-4-6-2-9-0-8-1-3-1-9-6-9-3-4-0-4-6-2-2-7-6-1-9-0-5-0-0-5-6-0-5"
+         inkscape:transform-center-x="14.782001"
+         inkscape:transform-center-y="-0.085282837" />
+      <path
+         style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+         d="m 1240,219.99997 v 5.00004 0"
+         id="path29548-8-5-0-6-4-6-2-9-0-8-1-3-1-9-6-9-3-4-0-4-6-2-2-7-6-1-9-9-7-5-3-5-9-1-3-4"
+         inkscape:transform-center-x="14.782001"
+         inkscape:transform-center-y="-0.085282837" />
+      <path
+         style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+         d="m 1260,219.99997 v 5.00004 0"
+         id="path29548-8-5-0-6-4-6-2-9-0-8-1-3-1-9-6-9-3-4-0-4-6-2-2-7-6-1-9-9-1-5-2-0-9-9-2-6-7"
+         inkscape:transform-center-x="14.782001"
+         inkscape:transform-center-y="-0.085282837" />
+      <path
+         style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+         d="m 1280,219.99997 v 5.00004 0"
+         id="path29548-8-5-0-6-4-6-2-9-0-8-1-3-1-9-6-9-3-4-0-4-6-2-2-7-6-1-9-9-1-4-8-9-9-4-1-9-1-6"
+         inkscape:transform-center-x="14.782001"
+         inkscape:transform-center-y="-0.085282837" />
+      <path
+         style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+         d="m 1299.7216,219.99997 v 5.00004 0"
+         id="path29548-8-5-0-6-4-6-2-9-0-8-1-3-1-9-6-9-3-4-0-4-6-2-2-7-6-1-9-9-1-4-9-7-0-2-6-4-3-0-5"
+         inkscape:transform-center-x="-14.78205"
+         inkscape:transform-center-y="-0.085282837" />
+    </g>
+    <path
+       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:2;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+       d="m 2123.4601,64.428843 v 9.99999 0"
+       id="path29548-5-1-3-6-3-1-0-3-4-2-0-0-1-6-6" />
+    <path
+       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:2;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+       d="m 2123.3825,64.223284 v 9.99999 0"
+       id="path29548-5-1-3-6-3-1-0-3-4-2-0-0-1-6-3" />
+    <text
+       xml:space="preserve"
+       style="font-weight:bold;font-size:13.3333px;line-height:125%;font-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="2245.5474"
+       y="94.839027"
+       id="text1185-9-7-1-1-8-1-0-4-2-8-2-4-2-7"><tspan
+         sodipodi:role="line"
+         x="2245.5474"
+         y="94.839027"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;stroke:none"
+         id="tspan31345-4-0-4-81-5-2-8-7-0-4">Apr.</tspan><tspan
+         sodipodi:role="line"
+         x="2245.5474"
+         y="112.83571"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;stroke:none"
+         id="tspan49906-7-3-8-2-8-9-9-8-6-5">2030</tspan></text>
+    <g
+       id="g1267-4-5-2-7-4-1-2"
+       transform="translate(923.39972,-155.42436)">
+      <path
+         style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:2;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+         d="m 1200,220.00002 v 9.99999 0"
+         id="path29548-5-1-3-6-3-1-0-3-4-1-3-5-5-5" />
+      <path
+         style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+         d="m 1220,219.99997 v 5.00004 0"
+         id="path29548-8-5-0-6-4-6-2-9-0-8-1-3-1-9-6-9-3-4-0-4-6-2-2-7-6-1-9-0-5-0-0-5-6-0-5-4"
+         inkscape:transform-center-x="14.782001"
+         inkscape:transform-center-y="-0.085282837" />
+      <path
+         style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+         d="m 1240,219.99997 v 5.00004 0"
+         id="path29548-8-5-0-6-4-6-2-9-0-8-1-3-1-9-6-9-3-4-0-4-6-2-2-7-6-1-9-9-7-5-3-5-9-1-3-4-7"
+         inkscape:transform-center-x="14.782001"
+         inkscape:transform-center-y="-0.085282837" />
+      <path
+         style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+         d="m 1260,219.99997 v 5.00004 0"
+         id="path29548-8-5-0-6-4-6-2-9-0-8-1-3-1-9-6-9-3-4-0-4-6-2-2-7-6-1-9-9-1-5-2-0-9-9-2-6-7-4"
+         inkscape:transform-center-x="14.782001"
+         inkscape:transform-center-y="-0.085282837" />
+      <path
+         style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+         d="m 1280,219.99997 v 5.00004 0"
+         id="path29548-8-5-0-6-4-6-2-9-0-8-1-3-1-9-6-9-3-4-0-4-6-2-2-7-6-1-9-9-1-4-8-9-9-4-1-9-1-6-4"
+         inkscape:transform-center-x="14.782001"
+         inkscape:transform-center-y="-0.085282837" />
+      <path
+         style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+         d="m 1299.7216,219.99997 v 5.00004 0"
+         id="path29548-8-5-0-6-4-6-2-9-0-8-1-3-1-9-6-9-3-4-0-4-6-2-2-7-6-1-9-9-1-4-9-7-0-2-6-4-3-0-5-3"
+         inkscape:transform-center-x="-14.78205"
+         inkscape:transform-center-y="-0.085282837" />
+    </g>
+    <g
+       id="g1267-4-5-2-7-4-1-2-0"
+       transform="translate(1043.3579,-155.33829)">
+      <path
+         style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:2;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+         d="m 1200,220.00002 v 9.99999 0"
+         id="path29548-5-1-3-6-3-1-0-3-4-1-3-5-5-5-6" />
+      <path
+         style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+         d="m 1220,219.99997 v 5.00004 0"
+         id="path29548-8-5-0-6-4-6-2-9-0-8-1-3-1-9-6-9-3-4-0-4-6-2-2-7-6-1-9-0-5-0-0-5-6-0-5-4-8"
+         inkscape:transform-center-x="14.782001"
+         inkscape:transform-center-y="-0.085282837" />
+      <path
+         style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+         d="m 1240,219.99997 v 5.00004 0"
+         id="path29548-8-5-0-6-4-6-2-9-0-8-1-3-1-9-6-9-3-4-0-4-6-2-2-7-6-1-9-9-7-5-3-5-9-1-3-4-7-9"
+         inkscape:transform-center-x="14.782001"
+         inkscape:transform-center-y="-0.085282837" />
+      <path
+         style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+         d="m 1260,219.99997 v 5.00004 0"
+         id="path29548-8-5-0-6-4-6-2-9-0-8-1-3-1-9-6-9-3-4-0-4-6-2-2-7-6-1-9-9-1-5-2-0-9-9-2-6-7-4-2"
+         inkscape:transform-center-x="14.782001"
+         inkscape:transform-center-y="-0.085282837" />
+      <path
+         style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+         d="m 1280,219.99997 v 5.00004 0"
+         id="path29548-8-5-0-6-4-6-2-9-0-8-1-3-1-9-6-9-3-4-0-4-6-2-2-7-6-1-9-9-1-4-8-9-9-4-1-9-1-6-4-6"
+         inkscape:transform-center-x="14.782001"
+         inkscape:transform-center-y="-0.085282837" />
+      <path
+         style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+         d="m 1299.7216,219.99997 v 5.00004 0"
+         id="path29548-8-5-0-6-4-6-2-9-0-8-1-3-1-9-6-9-3-4-0-4-6-2-2-7-6-1-9-9-1-4-9-7-0-2-6-4-3-0-5-3-6"
+         inkscape:transform-center-x="-14.78205"
+         inkscape:transform-center-y="-0.085282837" />
+    </g>
+    <path
+       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:2;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+       d="m 2243.3996,64.575663 v 9.99999 0"
+       id="path29548-5-1-3-6-3-1-0-3-4-2-0-0-1-6-6-0" />
     <rect
        style="opacity:0.75;fill:#241f31;fill-opacity:1;fill-rule:evenodd;stroke:none;stroke-width:0.751473;stroke-opacity:1"
        id="rect917-0-0-4-4-9-4-5-3-9-2-36"
        width="38.418175"
        height="23.151052"
-       x="1605.6135"
-       y="-41.172161"
+       x="2047.6135"
+       y="-45.172161"
        ry="1.1605872" />
     <rect
        style="opacity:1;fill:#ffffff;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:1.98878;stroke-dasharray:none;stroke-opacity:1"
        id="rect917-0-0-4-4-9-4-5-3-9-2-36-7"
        width="186.42949"
        height="110.40546"
-       x="1594.5294"
-       y="-73.753708"
+       x="2036.5294"
+       y="-77.753708"
        ry="5.5347452" />
     <rect
        style="opacity:0.75;fill:#241f31;fill-opacity:1;fill-rule:evenodd;stroke:none;stroke-width:0.50949;stroke-opacity:1"
        id="rect917-0-0-4-4-9-4-5-3-9-2-6"
        width="21.197233"
        height="19.28739"
-       x="1611.8163"
-       y="-41.883858"
+       x="2053.8164"
+       y="-45.883858"
        ry="0.96689767" />
     <text
        xml:space="preserve"
        style="font-weight:bold;font-size:13.3333px;line-height:125%;font-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#fffefe;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
-       x="1690.4917"
-       y="-53.687912"
+       x="2132.4917"
+       y="-57.687912"
        id="text1185-3-55-4-0-0-0-1-1-6-4-3-5"><tspan
          sodipodi:role="line"
-         x="1690.4917"
-         y="-53.687912"
+         x="2132.4917"
+         y="-57.687912"
          style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans Bold';text-align:center;text-anchor:middle;fill:#000000;fill-opacity:1;stroke:none"
          id="tspan10317-2-9-1-4-6-5-6-6-5">Legend</tspan></text>
     <text
        xml:space="preserve"
        style="font-weight:bold;font-size:13.3333px;line-height:125%;font-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#fffefe;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
-       x="1656.0988"
-       y="-27.899874"
+       x="2098.0986"
+       y="-31.899874"
        id="text1185-3-55-4-0-0-0-1-1-6-4-3-5-2"><tspan
          sodipodi:role="line"
-         x="1656.0988"
-         y="-27.899874"
+         x="2098.0986"
+         y="-31.899874"
          style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';text-align:center;text-anchor:middle;fill:#000000;fill-opacity:1;stroke:none"
          id="tspan10317-2-9-1-4-6-5-6-6-5-9">Future</tspan></text>
     <rect
@@ -1488,38 +1834,38 @@
        id="rect917-0-0-4-4-9-4-5-3-9-2-6-1"
        width="21.197233"
        height="19.28739"
-       x="1611.8671"
-       y="-17.756365"
+       x="2053.8672"
+       y="-21.756365"
        ry="0.96689767" />
     <text
        xml:space="preserve"
        style="font-weight:bold;font-size:13.3333px;line-height:125%;font-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#fffefe;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
-       x="1686.7159"
-       y="-3.6722763"
+       x="2128.7158"
+       y="-7.6722765"
        id="text1185-3-55-4-0-0-0-1-1-6-4-3-5-2-2"><tspan
          sodipodi:role="line"
-         x="1686.7159"
-         y="-3.6722763"
+         x="2128.7158"
+         y="-7.6722765"
          style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';text-align:center;text-anchor:middle;fill:#000000;fill-opacity:1;stroke:none"
-         id="tspan10317-2-9-1-4-6-5-6-6-5-9-7">Current (Oct. 24)</tspan></text>
+         id="tspan10317-2-9-1-4-6-5-6-6-5-9-7">Current (Apr. 25)</tspan></text>
     <text
        xml:space="preserve"
        style="font-weight:bold;font-size:13.3333px;line-height:125%;font-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#fffefe;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
-       x="1667.363"
-       y="20.03771"
+       x="2109.363"
+       y="16.03771"
        id="text1185-3-55-4-0-0-0-1-1-6-4-3-5-2-2-9"><tspan
          sodipodi:role="line"
-         x="1667.363"
-         y="20.03771"
+         x="2109.363"
+         y="16.03771"
          style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';text-align:center;text-anchor:middle;fill:#000000;fill-opacity:1;stroke:none"
          id="tspan10317-2-9-1-4-6-5-6-6-5-9-7-3">End-of-life</tspan></text>
     <rect
-       style="fill:#333333;fill-opacity:1;fill-rule:evenodd;stroke:none;stroke-width:0.50949;stroke-opacity:1;opacity:0.5"
+       style="opacity:0.5;fill:#333333;fill-opacity:1;fill-rule:evenodd;stroke:none;stroke-width:0.50949;stroke-opacity:1"
        id="rect917-0-0-4-4-9-4-5-3-9-2-6-1-0"
        width="21.197233"
        height="19.28739"
-       x="1612.0239"
-       y="5.9667883"
+       x="2054.0239"
+       y="1.9667883"
        ry="0.96689767" />
     <rect
        style="opacity:0.5;fill:#333333;fill-opacity:1;fill-rule:evenodd;stroke:none;stroke-width:1.85786;stroke-opacity:1"

---
base-commit: 3b50193fa0c9acf4a601aeae6e1c78d0e4a05aef
change-id: 20250415-update-release-svg-050c840db8a4

Best regards,
--
Antonin Godard <antonin.godard@bootlin.com>


