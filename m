Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3CBBCD8C89
	for <webhook@archiver.kernel.org>; Fri,  5 Jun 2026 13:26:40 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8015.1780665990595100843
 for <docs@lists.yoctoproject.org>;
 Fri, 05 Jun 2026 06:26:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=kt/uwfIp;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id C6A52C5847A
	for <docs@lists.yoctoproject.org>; Fri,  5 Jun 2026 13:26:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1F9ED5FED1
	for <docs@lists.yoctoproject.org>; Fri,  5 Jun 2026 13:26:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0149A106A2450;
	Fri,  5 Jun 2026 15:26:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780665988; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=FDZ6ud9XwlcADxZTxztW4qJ55kDG2w5Pn4XzAhqElXs=;
	b=kt/uwfIpXIJqgFPwgqr9qdZ4pevlx1BP1Upc7jMyW0AdTzSv9Y7Z6qn0z88tbocWm9G6ax
	T4EFJuPlQU3JAA1nkGVhX1R9/kZphhk6tfH5lW01ruA7g2mgGVLRBYTQzrXW5ZBNjhyLjO
	EfIAeEeBLg3InLKVAmmHRVjYYh3hD6EK6mGXD9Sgspsf/2NHRqm8mNrx0Rs4OYyJjzeqx7
	cdbO76z+U4voxv0T5/cjpzv9qQ2gZ0z5d2dIiuNa1bA9U5bicdaxsq4eml+dgWBZQCXhDX
	tOikX0NDmP9NRhVJBef41NMKfgtNyGIPg+f/jH4DaTcyad2tQR9ZIzEcUGWlUA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 05 Jun 2026 15:26:14 +0200
Subject: [PATCH 10/10] overview-manual/svg: remove white backgrounds
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260605-udpate-outdated-graphics-v1-10-16f2c348222c@bootlin.com>
References: <20260605-udpate-outdated-graphics-v1-0-16f2c348222c@bootlin.com>
In-Reply-To: <20260605-udpate-outdated-graphics-v1-0-16f2c348222c@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=9165;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=zfa9ZgzVs/7wd2B87aXGm5RPyYmJixV88yR19NF9P0g=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqIs56K3V5tlIqhoCGYyh3AYRYuaNNj6+mHc1Z9
 bHo4QXWs8OJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaiLOegAKCRDRgEFAKaOo
 NnW9EADORVIvzymV58tn+WjBBknU6/qqKg7RTSBFbB6sCt/dJ8ijV0DeEkW4tw8Ljhwu98cowkY
 LUAjG3L7tLeQRjYSZqJ5uZ1+ASoOiDd6WUAUZhzUfamqeHQICWl8IoTQhRZDYJFWa3eCAS+TMUP
 Q9CNYql2wzoPStEMw+8Fj3vk/gVsXwY5etCaFFY2529rsYLpi2ePMqk3DjdRuctZJxigCm35OPN
 w/PPxrL+3JdUqp8cByBaNqu79zTAQHs1I0K9GQzzYFSgQaPVrOHrKhs9rYNAh06puBokews4w2z
 fTL/rto2g5LMhMAcm1CJxyzGJ/3Jncio3js2sH6AVapvWo1m4DBHJyY3PDQdqxfgFzJ0koOoiTd
 ckiORI3Z/QyAkvV0KWbjX117jc6wNaZhr+DjvBGa9Y8oXdTJpBbJP0VyprqWvP9+lcjlnWfxvTO
 xLs2qhZSX835lk3AUxEwh1l51YOMcAiLA6Ra87vcL44Xh3jhD/HIg2Rd1xy8W/6oiolQ3hawwIv
 cTo43ux9RhqZ0Kt980m969hSoAP0lWJ/R0m3XtsAQlMg64J9MtsWOSOoRreuZ0dCNjCDgClyB2k
 oP6x3F3B4MJkRYwb50mEcwoQTQ/9aimjHl8pjINag++3NvmJWyCi7EsUUJmngMjumdhfom+sfzq
 wJY+vOJNL8jWZMQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 05 Jun 2026 13:26:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9600

Remove the white backgrounds of SVG figures that had one. It isn't
necessary since we support transparent figures. That way the background
of the figure will be the background of the documentation.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 .../svg/analysis-for-package-splitting.svg          | 19 ++++++-------------
 .../svg/configuration-compile-autoreconf.svg        | 21 +++++++--------------
 documentation/overview-manual/svg/patching.svg      | 19 ++++++-------------
 .../overview-manual/svg/source-fetching.svg         | 21 +++++++--------------
 4 files changed, 26 insertions(+), 54 deletions(-)

diff --git a/documentation/overview-manual/svg/analysis-for-package-splitting.svg b/documentation/overview-manual/svg/analysis-for-package-splitting.svg
index 16e831d65..1dab70ce5 100644
--- a/documentation/overview-manual/svg/analysis-for-package-splitting.svg
+++ b/documentation/overview-manual/svg/analysis-for-package-splitting.svg
@@ -6,7 +6,7 @@
    height="801.00769"
    viewBox="0 0 734.86933 801.00756"
    sodipodi:docname="analysis-for-package-splitting.svg"
-   inkscape:version="1.4 (e7c3feb100, 2024-10-09)"
+   inkscape:version="1.4.4 (dcaf3e7d9e, 2026-05-05)"
    xmlns:inkscape="http://www.inkscape.org/namespaces/inkscape"
    xmlns:sodipodi="http://sodipodi.sourceforge.net/DTD/sodipodi-0.dtd"
    xmlns="http://www.w3.org/2000/svg"
@@ -23,15 +23,15 @@
      guidetolerance="10"
      inkscape:pageopacity="0"
      inkscape:pageshadow="2"
-     inkscape:window-width="2255"
-     inkscape:window-height="2059"
+     inkscape:window-width="3826"
+     inkscape:window-height="1718"
      id="namedview4"
      showgrid="false"
      inkscape:zoom="2.894409"
      inkscape:cx="417.01086"
-     inkscape:cy="503.72978"
-     inkscape:window-x="2271"
-     inkscape:window-y="55"
+     inkscape:cy="504.07527"
+     inkscape:window-x="0"
+     inkscape:window-y="0"
      inkscape:window-maximized="0"
      inkscape:current-layer="g10"
      inkscape:document-rotation="0"
@@ -1034,13 +1034,6 @@
      inkscape:label="Image"
      id="g10"
      transform="translate(45.24912,-7.4222032)">
-    <rect
-       style="fill:#ffffff;fill-opacity:1;stroke:#000000;stroke-width:3.83172;stroke-linejoin:bevel;stroke-miterlimit:0;stroke-opacity:0"
-       id="rect1"
-       width="731.0376"
-       height="797.17596"
-       x="-43.33326"
-       y="9.3380632" />
     <text
        xml:space="preserve"
        style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:14.423px;line-height:125%;font-family:'Nimbus Sans L';-inkscape-font-specification:'Nimbus Sans L, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:none;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
diff --git a/documentation/overview-manual/svg/configuration-compile-autoreconf.svg b/documentation/overview-manual/svg/configuration-compile-autoreconf.svg
index 3be08018c..4495f9347 100644
--- a/documentation/overview-manual/svg/configuration-compile-autoreconf.svg
+++ b/documentation/overview-manual/svg/configuration-compile-autoreconf.svg
@@ -6,7 +6,7 @@
    height="568.14496"
    viewBox="0 0 715.68933 568.14495"
    sodipodi:docname="configuration-compile-autoreconf.svg"
-   inkscape:version="1.4 (e7c3feb100, 2024-10-09)"
+   inkscape:version="1.4.4 (dcaf3e7d9e, 2026-05-05)"
    xmlns:inkscape="http://www.inkscape.org/namespaces/inkscape"
    xmlns:sodipodi="http://sodipodi.sourceforge.net/DTD/sodipodi-0.dtd"
    xmlns="http://www.w3.org/2000/svg"
@@ -23,15 +23,15 @@
      guidetolerance="10"
      inkscape:pageopacity="0"
      inkscape:pageshadow="2"
-     inkscape:window-width="2255"
-     inkscape:window-height="1999"
+     inkscape:window-width="3826"
+     inkscape:window-height="1718"
      id="namedview4"
      showgrid="false"
      inkscape:zoom="1.4472045"
-     inkscape:cx="219.38849"
-     inkscape:cy="537.58817"
-     inkscape:window-x="2271"
-     inkscape:window-y="115"
+     inkscape:cx="219.73398"
+     inkscape:cy="538.27914"
+     inkscape:window-x="0"
+     inkscape:window-y="0"
      inkscape:window-maximized="0"
      inkscape:current-layer="g10"
      inkscape:document-rotation="0"
@@ -815,13 +815,6 @@
      inkscape:label="Image"
      id="g10"
      transform="translate(56.164608,6.8220881)">
-    <rect
-       style="fill:#ffffff;fill-opacity:1;stroke:#000000;stroke-width:3.18457;stroke-linejoin:bevel;stroke-miterlimit:0;stroke-opacity:0"
-       id="rect1"
-       width="712.50476"
-       height="564.96039"
-       x="-54.572323"
-       y="-5.2298031" />
     <text
        xml:space="preserve"
        style="font-weight:bold;font-size:42.5884px;line-height:125%;font-family:'Nimbus Sans L';-inkscape-font-specification:'Nimbus Sans L, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:none;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
diff --git a/documentation/overview-manual/svg/patching.svg b/documentation/overview-manual/svg/patching.svg
index 5c56b5ac2..9597b0ea3 100644
--- a/documentation/overview-manual/svg/patching.svg
+++ b/documentation/overview-manual/svg/patching.svg
@@ -6,7 +6,7 @@
    height="533.2287"
    viewBox="0 0 722.07703 533.2286"
    sodipodi:docname="patching.svg"
-   inkscape:version="1.4 (e7c3feb100, 2024-10-09)"
+   inkscape:version="1.4.4 (dcaf3e7d9e, 2026-05-05)"
    xmlns:inkscape="http://www.inkscape.org/namespaces/inkscape"
    xmlns:sodipodi="http://sodipodi.sourceforge.net/DTD/sodipodi-0.dtd"
    xmlns="http://www.w3.org/2000/svg"
@@ -23,15 +23,15 @@
      guidetolerance="10"
      inkscape:pageopacity="0"
      inkscape:pageshadow="2"
-     inkscape:window-width="2255"
-     inkscape:window-height="2019"
+     inkscape:window-width="3826"
+     inkscape:window-height="1718"
      id="namedview4"
      showgrid="false"
      inkscape:zoom="1.4472045"
      inkscape:cx="441.88641"
-     inkscape:cy="475.3993"
-     inkscape:window-x="2271"
-     inkscape:window-y="95"
+     inkscape:cy="476.09028"
+     inkscape:window-x="0"
+     inkscape:window-y="0"
      inkscape:window-maximized="0"
      inkscape:current-layer="g10"
      inkscape:document-rotation="0"
@@ -651,13 +651,6 @@
      inkscape:label="Image"
      id="g10"
      transform="translate(69.846747,14.267592)">
-    <rect
-       style="fill:#ffffff;fill-opacity:1;stroke:#000000;stroke-width:3.09493;stroke-linejoin:bevel;stroke-miterlimit:0;stroke-opacity:0"
-       id="rect1"
-       width="718.9325"
-       height="528.83362"
-       x="-68.305695"
-       y="-11.621885" />
     <text
        xml:space="preserve"
        style="font-weight:bold;font-size:42.5884px;line-height:125%;font-family:'Nimbus Sans L';-inkscape-font-specification:'Nimbus Sans L, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:none;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
diff --git a/documentation/overview-manual/svg/source-fetching.svg b/documentation/overview-manual/svg/source-fetching.svg
index 39d7e0c2a..6495f4098 100644
--- a/documentation/overview-manual/svg/source-fetching.svg
+++ b/documentation/overview-manual/svg/source-fetching.svg
@@ -6,7 +6,7 @@
    height="532.90466"
    viewBox="0 0 737.63324 532.90456"
    sodipodi:docname="source-fetching.svg"
-   inkscape:version="1.4 (e7c3feb100, 2024-10-09)"
+   inkscape:version="1.4.4 (dcaf3e7d9e, 2026-05-05)"
    xmlns:inkscape="http://www.inkscape.org/namespaces/inkscape"
    xmlns:sodipodi="http://sodipodi.sourceforge.net/DTD/sodipodi-0.dtd"
    xmlns="http://www.w3.org/2000/svg"
@@ -23,17 +23,17 @@
      guidetolerance="10"
      inkscape:pageopacity="0"
      inkscape:pageshadow="2"
-     inkscape:window-width="2255"
-     inkscape:window-height="2039"
+     inkscape:window-width="3826"
+     inkscape:window-height="1718"
      id="namedview4"
      showgrid="false"
      inkscape:zoom="2.894409"
      inkscape:cx="424.78447"
      inkscape:cy="219.04299"
-     inkscape:window-x="2271"
-     inkscape:window-y="75"
-     inkscape:window-maximized="1"
-     inkscape:current-layer="g10"
+     inkscape:window-x="0"
+     inkscape:window-y="0"
+     inkscape:window-maximized="0"
+     inkscape:current-layer="svg2"
      inkscape:document-rotation="0"
      inkscape:snap-perpendicular="true"
      fit-margin-top="30"
@@ -604,13 +604,6 @@
          id="path5283-2-1-15" />
     </marker>
   </defs>
-  <rect
-     style="opacity:1;fill:#ffffff;fill-opacity:1;stroke:#000000;stroke-width:3.13104;stroke-linejoin:bevel;stroke-miterlimit:0;stroke-opacity:0"
-     id="rect1"
-     width="734.5022"
-     height="529.77362"
-     x="1.56552"
-     y="1.56552" />
   <g
      inkscape:groupmode="layer"
      inkscape:label="Image"

-- 
2.54.0


