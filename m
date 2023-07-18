Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA45AEB64DC
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 09:13:18 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.3776.1689671592730653644
 for <docs@lists.yoctoproject.org>;
 Tue, 18 Jul 2023 02:13:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=n7Wp48LN;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 39108C0003;
	Tue, 18 Jul 2023 09:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689671590;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=sF/Wj244uyRP51aLUDLugascMdbdcg5HmrO+cLedvwI=;
	b=n7Wp48LNndmeOKOgYK0Sd6PhXSMLiVGAFaHfzQyt6GLiOYDhtM8KxpEAVYjkGEZmnbKKTa
	wV76gIggAmLz2W+3VL3fJpifxMJm1SNSImoZzmfnZ2HNbClk+LAWWNNu0Nlapz6A0Or7x0
	koKMwdeRXIrTgyRsFD0meJVDtWVR1vRY3COceZM20f0o2OknoHfCLt8BENsC4UeAAWcHNQ
	/0M2vz8DY8rpz0V/CBcSGnYJKcaROvpVyMAwE7EXJaEmHYOmc8YJWmw3Y0s3jyNDLMBOgh
	4CMAxmT2jOFZBDrZMCOROyO5LeCzzhIiL8L/Oh/kW6Y81XDxH4VvDzfEGHGJTA==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] [mickledore] ref-manual: releases.svg: updates
Date: Tue, 18 Jul 2023 11:13:07 +0200
Message-Id: <20230718091307.178277-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 18 Jul 2023 09:13:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4055

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

- Kirkstone is now a 4 year LTS
- Add future Scarthgap LTS
- Update document metadata: license, title

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/svg/releases.svg | 677 +++++++++++++++++++---
 1 file changed, 585 insertions(+), 92 deletions(-)

diff --git a/documentation/ref-manual/svg/releases.svg b/documentation/ref-manual/svg/releases.svg
index d41edc1cb0..e7d5c6d502 100644
--- a/documentation/ref-manual/svg/releases.svg
+++ b/documentation/ref-manual/svg/releases.svg
@@ -2,9 +2,9 @@
 <svg
    version="1.1"
    id="svg2"
-   width="1175.0006"
-   height="568.85858"
-   viewBox="0 0 1175.0006 568.85856"
+   width="2040.0006"
+   height="624.30518"
+   viewBox="0 0 2040.0006 624.30515"
    sodipodi:docname="releases.svg"
    inkscape:version="1.1.2 (0a00cf5339, 2022-02-04)"
    xmlns:inkscape="http://www.inkscape.org/namespaces/inkscape"
@@ -14,6 +14,8 @@
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
    xmlns:cc="http://creativecommons.org/ns#"
    xmlns:dc="http://purl.org/dc/elements/1.1/">
+  <title
+     id="title8568">Yocto Project Release Timeline</title>
   <metadata
      id="metadata8">
     <rdf:RDF>
@@ -22,7 +24,30 @@
         <dc:format>image/svg+xml</dc:format>
         <dc:type
            rdf:resource="http://purl.org/dc/dcmitype/StillImage" />
+        <cc:license
+           rdf:resource="http://artlibre.org/licence/lal" />
+        <dc:title>Yocto Project Release Timeline</dc:title>
+        <dc:creator>
+          <cc:Agent>
+            <dc:title>The Yocto Project</dc:title>
+          </cc:Agent>
+        </dc:creator>
       </cc:Work>
+      <cc:License
+         rdf:about="http://creativecommons.org/licenses/by-sa/4.0/">
+        <cc:permits
+           rdf:resource="http://creativecommons.org/ns#Reproduction" />
+        <cc:permits
+           rdf:resource="http://creativecommons.org/ns#Distribution" />
+        <cc:requires
+           rdf:resource="http://creativecommons.org/ns#Notice" />
+        <cc:requires
+           rdf:resource="http://creativecommons.org/ns#Attribution" />
+        <cc:permits
+           rdf:resource="http://creativecommons.org/ns#DerivativeWorks" />
+        <cc:requires
+           rdf:resource="http://creativecommons.org/ns#ShareAlike" />
+      </cc:License>
     </rdf:RDF>
   </metadata>
   <defs
@@ -383,9 +408,9 @@
      inkscape:window-height="1016"
      id="namedview4"
      showgrid="true"
-     inkscape:zoom="2.0466562"
-     inkscape:cx="450.4909"
-     inkscape:cy="286.56498"
+     inkscape:zoom="0.51166405"
+     inkscape:cx="-43.974166"
+     inkscape:cy="311.72798"
      inkscape:window-x="1994"
      inkscape:window-y="27"
      inkscape:window-maximized="1"
@@ -401,29 +426,65 @@
     <inkscape:grid
        type="xygrid"
        id="grid1257"
-       originx="-289.99935"
-       originy="269.99997" />
+       originx="-289.99936"
+       originy="325" />
   </sodipodi:namedview>
   <g
      inkscape:groupmode="layer"
      inkscape:label="Image"
      id="g10"
-     transform="translate(-289.99935,270)">
+     transform="translate(-289.99936,325.00004)">
     <path
        style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:0.5;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
-       d="M 1080,220.00002 V -240 v 0 0"
+       d="m 1080,220.00003 v -515.00007 0 0"
        id="path207708" />
     <path
        style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:0.5;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
-       d="M 1200,220.00002 V -240 v 0 0"
+       d="m 1200,220.00003 v -515.00007 0 0"
        id="path207708-4" />
     <path
        style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:0.5;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
-       d="M 1320,220.00002 V -240 v 0 0"
+       d="m 1320,220.00003 v -515.00007 0 0"
        id="path207708-4-3" />
     <path
        style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:0.5;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
-       d="M 960,220.00002 V -240 v 0 0"
+       d="m 1440,219.99998 v -515.00002 0 0"
+       id="path207708-4-3-6" />
+    <path
+       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:0.5;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+       d="m 1560,219.99998 v -515.00001 0 0"
+       id="path207708-4-3-6-2" />
+    <path
+       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:0.5;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+       d="m 1680,219.99998 v -515.00002 0 0"
+       id="path207708-4-3-6-2-8" />
+    <path
+       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:0.5;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+       d="m 1800,219.99998 v -515.00002 0 0"
+       id="path207708-4-3-6-2-8-4" />
+    <path
+       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:0.5;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+       d="m 1920,219.99998 v -515.00002 0 0"
+       id="path207708-4-3-6-2-8-4-3" />
+    <path
+       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:0.5;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+       d="m 2040,219.99997 v -460.00002 0 0"
+       id="path207708-4-3-6-2-8-4-3-8" />
+    <path
+       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:0.5;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+       d="m 2040,219.99998 v -515.00002 0 0"
+       id="path207708-4-3-6-2-8-4-3-8-0" />
+    <path
+       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:0.5;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+       d="m 2159.954,219.99997 v -514.99999 0 0"
+       id="path207708-4-3-6-2-8-4-3-8-4" />
+    <path
+       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:0.5;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+       d="m 2280,219.99997 v -514.99999 0 0"
+       id="path207708-4-3-6-2-8-4-3-8-4-0" />
+    <path
+       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:0.5;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+       d="m 960,220.00003 v -515.00007 0 0"
        id="path207708-9" />
     <path
        style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:0.5;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
@@ -431,23 +492,23 @@
        id="path207708-9-6" />
     <path
        style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:0.5;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
-       d="M 840,220.00002 V -240 v 0 0"
+       d="m 840,220.00002 v -515.00004 0 0"
        id="path207708-9-6-2" />
     <path
        style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:0.5;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
-       d="M 720,220.00002 V -240 v 0 0"
+       d="m 720,220.00003 v -515.00007 0 0"
        id="path207708-9-6-2-5" />
     <path
        style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:0.5;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
-       d="M 600,220.00002 V -240 v 0 0"
+       d="m 600,220.00003 v -515.00007 0 0"
        id="path207708-9-6-2-5-9" />
     <path
        style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:0.5;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
-       d="M 480,220.00002 V -240 v 0 0"
+       d="m 480,220.00003 v -515.00007 0 0"
        id="path207708-9-6-2-5-9-0" />
     <path
        style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:0.5;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
-       d="M 360,220.00002 V -240 v 0 0"
+       d="m 360,220.00003 v -515.00007 0 0"
        id="path207708-9-6-2-5-9-0-5" />
     <text
        xml:space="preserve"
@@ -482,7 +543,7 @@
     <rect
        style="fill:#333333;fill-opacity:1;fill-rule:evenodd;stroke:none;stroke-width:2;stroke-opacity:1"
        id="rect917-0-0"
-       width="960.00006"
+       width="980"
        height="45.000004"
        x="360"
        y="154.99997"
@@ -524,7 +585,7 @@
          id="tspan957-2-8-6">Gatesgarth</tspan><tspan
          sodipodi:role="line"
          x="534.10651"
-         y="136.9464"
+         y="136.94638"
          style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans Bold';text-align:center;text-anchor:middle;fill:#fffefe;fill-opacity:1;stroke:none"
          id="tspan10317-2">3.2</tspan></text>
     <rect
@@ -586,7 +647,7 @@
     <rect
        style="opacity:1;fill:#333333;fill-opacity:1;fill-rule:evenodd;stroke:none;stroke-width:2;stroke-opacity:1"
        id="rect917-0-0-4-4-9-4-5"
-       width="140.00002"
+       width="140.00003"
        height="45.000004"
        x="1100"
        y="-175.00003"
@@ -607,36 +668,63 @@
          y="-137.50214"
          style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans Bold';text-align:center;text-anchor:middle;fill:#fffefe;fill-opacity:1;stroke:none"
          id="tspan10317-2-9-1-4">4.2</tspan></text>
+    <g
+       id="g32107">
+      <rect
+         style="opacity:0.75;fill:#333333;fill-opacity:1;fill-rule:evenodd;stroke:none;stroke-width:2;stroke-opacity:1"
+         id="rect917-0-0-4-4-9-4-5-3"
+         width="140.00014"
+         height="45.000004"
+         x="1199.9999"
+         y="-229.99998"
+         ry="2.2558987" />
+      <text
+         xml:space="preserve"
+         style="font-weight:bold;font-size:13.3333px;line-height:125%;font-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#fffefe;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+         x="1247.2329"
+         y="-210.32925"
+         id="text1185-3-55-4-0-0-0-1-1"><tspan
+           sodipodi:role="line"
+           x="1247.2329"
+           y="-210.32925"
+           style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans Bold';text-align:center;text-anchor:middle;fill:#fffefe;fill-opacity:1;stroke:none"
+           id="tspan957-2-8-6-3-9-7-4">Nanbield</tspan><tspan
+           sodipodi:role="line"
+           x="1247.2329"
+           y="-192.33258"
+           style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans Bold';text-align:center;text-anchor:middle;fill:#fffefe;fill-opacity:1;stroke:none"
+           id="tspan10317-2-9-1-4-6">4.3</tspan></text>
+    </g>
     <rect
        style="opacity:0.75;fill:#333333;fill-opacity:1;fill-rule:evenodd;stroke:none;stroke-width:2;stroke-opacity:1"
-       id="rect917-0-0-4-4-9-4-5-3"
-       width="140.00014"
+       id="rect917-0-0-4-4-9-4-5-3-9"
+       width="979.99994"
        height="45.000004"
-       x="1199.9999"
-       y="-229.99998"
+       x="1320"
+       y="-285.00003"
        ry="2.2558987" />
     <text
        xml:space="preserve"
        style="font-weight:bold;font-size:13.3333px;line-height:125%;font-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#fffefe;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
-       x="1247.2329"
-       y="-210.32925"
-       id="text1185-3-55-4-0-0-0-1-1"><tspan
+       x="1373.233"
+       y="-265.32928"
+       id="text1185-3-55-4-0-0-0-1-1-6"><tspan
          sodipodi:role="line"
-         x="1247.2329"
-         y="-210.32925"
+         x="1373.233"
+         y="-265.32928"
          style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans Bold';text-align:center;text-anchor:middle;fill:#fffefe;fill-opacity:1;stroke:none"
-         id="tspan957-2-8-6-3-9-7-4">Nanbield</tspan><tspan
+         id="tspan957-2-8-6-3-9-7-4-2">Scarthgap</tspan><tspan
          sodipodi:role="line"
-         x="1247.2329"
-         y="-192.33258"
+         x="1373.233"
+         y="-247.33261"
          style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans Bold';text-align:center;text-anchor:middle;fill:#fffefe;fill-opacity:1;stroke:none"
-         id="tspan10317-2-9-1-4-6">4.3</tspan></text>
+         id="tspan10317-2-9-1-4-6-5">4.4</tspan></text>
     <rect
        style="fill:#333333;fill-opacity:1;fill-rule:evenodd;stroke:none;stroke-width:2;stroke-opacity:1"
        id="rect917-0-0-4-4-9-9"
-       width="480.00006"
+       width="960.00012"
        height="45.000004"
-       x="860"
+       x="859.99994"
        y="-64.999992"
        ry="2.2558987" />
     <text
@@ -673,7 +761,7 @@
          id="tspan10317-2-9-8">3.3</tspan></text>
     <g
        id="g1125-0"
-       transform="matrix(0.42240595,0,0,0.41654472,354.16682,-355.15199)"
+       transform="matrix(0.42240595,0,0,0.41654472,354.53445,-399.96314)"
        style="stroke:none;stroke-width:2.38399">
       <rect
          style="opacity:1;fill:#333333;fill-opacity:1;fill-rule:evenodd;stroke:none;stroke-width:4.76797;stroke-opacity:1"
@@ -775,6 +863,38 @@
          y="268.20883"
          style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;stroke:none"
          id="tspan49906">2023</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-weight:bold;font-size:13.3333px;line-height:125%;font-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="1439.3904"
+       y="249.86044"
+       id="text1185-9-7-1-1-89"><tspan
+         sodipodi:role="line"
+         x="1439.3904"
+         y="249.86044"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;stroke:none"
+         id="tspan31345-7">Oct.</tspan><tspan
+         sodipodi:role="line"
+         x="1439.3904"
+         y="267.85712"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;stroke:none"
+         id="tspan49906-76">2024</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-weight:bold;font-size:13.3333px;line-height:125%;font-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="1679.3094"
+       y="250.58356"
+       id="text1185-9-7-1-1-89-6"><tspan
+         sodipodi:role="line"
+         x="1679.3094"
+         y="250.58356"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;stroke:none"
+         id="tspan31345-7-8">Oct.</tspan><tspan
+         sodipodi:role="line"
+         x="1679.3094"
+         y="268.58023"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;stroke:none"
+         id="tspan49906-76-0">2025</tspan></text>
     <text
        xml:space="preserve"
        style="font-weight:bold;font-size:6.66667px;line-height:125%;font-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
@@ -799,64 +919,64 @@
     <text
        xml:space="preserve"
        style="font-weight:bold;font-size:13.3333px;line-height:125%;font-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
-       x="972.71832"
-       y="260.21216"
+       x="959.52008"
+       y="250.67822"
        id="text1185-9-7-1-1-0-7"><tspan
          sodipodi:role="line"
-         x="972.71832"
-         y="260.21216"
+         x="959.52008"
+         y="250.67822"
          style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;stroke:none"
          id="tspan31345-42-7">Oct.</tspan><tspan
          sodipodi:role="line"
-         x="972.71832"
-         y="278.20883"
+         x="959.52008"
+         y="268.6749"
          style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;stroke:none"
          id="tspan49906-9-6">2022</tspan></text>
     <text
        xml:space="preserve"
        style="font-weight:bold;font-size:13.3333px;line-height:125%;font-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
-       x="721.13617"
+       x="719.13617"
        y="250.21216"
        id="text1185-9-7-1-1-2"><tspan
          sodipodi:role="line"
-         x="721.13617"
+         x="719.13617"
          y="250.21216"
          style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;stroke:none"
          id="tspan31345-1">Oct.</tspan><tspan
          sodipodi:role="line"
-         x="721.13617"
+         x="719.13617"
          y="268.20883"
          style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;stroke:none"
          id="tspan49906-5">2021</tspan></text>
     <text
        xml:space="preserve"
        style="font-weight:bold;font-size:13.3333px;line-height:125%;font-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
-       x="485.04486"
+       x="478.82367"
        y="250.21216"
        id="text1185-9-7-1-1-80"><tspan
          sodipodi:role="line"
-         x="485.04486"
+         x="478.82367"
          y="250.21216"
          style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;stroke:none"
          id="tspan31345-5">Oct.</tspan><tspan
          sodipodi:role="line"
-         x="485.04486"
+         x="478.82367"
          y="268.20883"
          style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;stroke:none"
          id="tspan49906-6">2020</tspan></text>
     <text
        xml:space="preserve"
        style="font-weight:bold;font-size:13.3333px;line-height:125%;font-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
-       x="360.96921"
+       x="361.81961"
        y="250.07544"
        id="text1185-9-7-1-1-8"><tspan
          sodipodi:role="line"
-         x="360.96921"
+         x="361.81961"
          y="250.07544"
          style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;stroke:none"
          id="tspan31345-4">Apr.</tspan><tspan
          sodipodi:role="line"
-         x="360.96921"
+         x="361.81961"
          y="268.07211"
          style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;stroke:none"
          id="tspan49906-7">2020</tspan></text>
@@ -879,19 +999,51 @@
     <text
        xml:space="preserve"
        style="font-weight:bold;font-size:13.3333px;line-height:125%;font-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
-       x="1317.4003"
+       x="1321.8608"
        y="250.07544"
        id="text1185-9-7-1-1-8-1-0"><tspan
          sodipodi:role="line"
-         x="1317.4003"
+         x="1321.8608"
          y="250.07544"
          style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;stroke:none"
          id="tspan31345-4-0-4">Apr.</tspan><tspan
          sodipodi:role="line"
-         x="1317.4003"
+         x="1321.8608"
          y="268.07211"
          style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;stroke:none"
          id="tspan49906-7-3-8">2024</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-weight:bold;font-size:13.3333px;line-height:125%;font-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="1561.8163"
+       y="249.66977"
+       id="text1185-9-7-1-1-8-1-0-4"><tspan
+         sodipodi:role="line"
+         x="1561.8163"
+         y="249.66977"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;stroke:none"
+         id="tspan31345-4-0-4-81">Apr.</tspan><tspan
+         sodipodi:role="line"
+         x="1561.8163"
+         y="267.66644"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;stroke:none"
+         id="tspan49906-7-3-8-2">2025</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-weight:bold;font-size:13.3333px;line-height:125%;font-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="1802.1477"
+       y="250.26334"
+       id="text1185-9-7-1-1-8-1-0-4-2"><tspan
+         sodipodi:role="line"
+         x="1802.1477"
+         y="250.26334"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;stroke:none"
+         id="tspan31345-4-0-4-81-5">Apr.</tspan><tspan
+         sodipodi:role="line"
+         x="1802.1477"
+         y="268.26001"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;stroke:none"
+         id="tspan49906-7-3-8-2-8">2026</tspan></text>
     <text
        xml:space="preserve"
        style="font-weight:bold;font-size:13.3333px;line-height:125%;font-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
@@ -911,16 +1063,16 @@
     <text
        xml:space="preserve"
        style="font-weight:bold;font-size:13.3333px;line-height:125%;font-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
-       x="604.18005"
+       x="602.51526"
        y="250.07544"
        id="text1185-9-7-1-1-8-1-7"><tspan
          sodipodi:role="line"
-         x="604.18005"
+         x="602.51526"
          y="250.07544"
          style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;stroke:none"
          id="tspan31345-4-0-5">Apr.</tspan><tspan
          sodipodi:role="line"
-         x="604.18005"
+         x="602.51526"
          y="268.07211"
          style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;stroke:none"
          id="tspan49906-7-3-6">2021</tspan></text>
@@ -937,7 +1089,7 @@
     <path
        id="path29430"
        style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:2;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
-       d="M 319.99935,219.99912 H 1435 Z" />
+       d="M 319.99936,219.99912 H 2300 Z" />
     <path
        style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:2;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
        d="m 360,219.99997 v 10.00004 0"
@@ -1176,44 +1328,203 @@
        id="path29548-8-5-0-6-4-6-2-9-0-8-1-3-1-9-6-9-3-4-0-4-6-2-2-7-6-1-9-9-1-4-9-7"
        inkscape:transform-center-x="-14.78205"
        inkscape:transform-center-y="-0.085282837" />
-    <path
-       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:2;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
-       d="m 1200,220.00002 v 9.99999 0"
-       id="path29548-5-1-3-6-3-1-0" />
     <path
        style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:2;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
        d="m 1320,219.99996 v 10 0"
        id="path29548-5-1-3-6-3-1-0-8" />
+    <g
+       id="g1267">
+      <path
+         style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:2;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+         d="m 1200,220.00002 v 9.99999 0"
+         id="path29548-5-1-3-6-3-1-0" />
+      <path
+         style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+         d="m 1220,219.99997 v 5.00004 0"
+         id="path29548-8-5-0-6-4-6-2-9-0-8-1-3-1-9-6-9-3-4-0-4-6-2-2-7-6-1-9-0-5"
+         inkscape:transform-center-x="14.782001"
+         inkscape:transform-center-y="-0.085282837" />
+      <path
+         style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+         d="m 1240,219.99997 v 5.00004 0"
+         id="path29548-8-5-0-6-4-6-2-9-0-8-1-3-1-9-6-9-3-4-0-4-6-2-2-7-6-1-9-9-7-5"
+         inkscape:transform-center-x="14.782001"
+         inkscape:transform-center-y="-0.085282837" />
+      <path
+         style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+         d="m 1260,219.99997 v 5.00004 0"
+         id="path29548-8-5-0-6-4-6-2-9-0-8-1-3-1-9-6-9-3-4-0-4-6-2-2-7-6-1-9-9-1-5-2"
+         inkscape:transform-center-x="14.782001"
+         inkscape:transform-center-y="-0.085282837" />
+      <path
+         style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+         d="m 1280,219.99997 v 5.00004 0"
+         id="path29548-8-5-0-6-4-6-2-9-0-8-1-3-1-9-6-9-3-4-0-4-6-2-2-7-6-1-9-9-1-4-8-9"
+         inkscape:transform-center-x="14.782001"
+         inkscape:transform-center-y="-0.085282837" />
+      <path
+         style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+         d="m 1299.7216,219.99997 v 5.00004 0"
+         id="path29548-8-5-0-6-4-6-2-9-0-8-1-3-1-9-6-9-3-4-0-4-6-2-2-7-6-1-9-9-1-4-9-7-0"
+         inkscape:transform-center-x="-14.78205"
+         inkscape:transform-center-y="-0.085282837" />
+    </g>
+    <g
+       id="g1267-4"
+       transform="translate(240,-4e-5)">
+      <path
+         style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:2;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+         d="m 1200,220.00002 v 9.99999 0"
+         id="path29548-5-1-3-6-3-1-0-3" />
+      <path
+         style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+         d="m 1220,219.99997 v 5.00004 0"
+         id="path29548-8-5-0-6-4-6-2-9-0-8-1-3-1-9-6-9-3-4-0-4-6-2-2-7-6-1-9-0-5-0"
+         inkscape:transform-center-x="14.782001"
+         inkscape:transform-center-y="-0.085282837" />
+      <path
+         style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+         d="m 1240,219.99997 v 5.00004 0"
+         id="path29548-8-5-0-6-4-6-2-9-0-8-1-3-1-9-6-9-3-4-0-4-6-2-2-7-6-1-9-9-7-5-3"
+         inkscape:transform-center-x="14.782001"
+         inkscape:transform-center-y="-0.085282837" />
+      <path
+         style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+         d="m 1260,219.99997 v 5.00004 0"
+         id="path29548-8-5-0-6-4-6-2-9-0-8-1-3-1-9-6-9-3-4-0-4-6-2-2-7-6-1-9-9-1-5-2-0"
+         inkscape:transform-center-x="14.782001"
+         inkscape:transform-center-y="-0.085282837" />
+      <path
+         style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+         d="m 1280,219.99997 v 5.00004 0"
+         id="path29548-8-5-0-6-4-6-2-9-0-8-1-3-1-9-6-9-3-4-0-4-6-2-2-7-6-1-9-9-1-4-8-9-9"
+         inkscape:transform-center-x="14.782001"
+         inkscape:transform-center-y="-0.085282837" />
+      <path
+         style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+         d="m 1299.7216,219.99997 v 5.00004 0"
+         id="path29548-8-5-0-6-4-6-2-9-0-8-1-3-1-9-6-9-3-4-0-4-6-2-2-7-6-1-9-9-1-4-9-7-0-2"
+         inkscape:transform-center-x="-14.78205"
+         inkscape:transform-center-y="-0.085282837" />
+    </g>
+    <g
+       id="g1267-4-5"
+       transform="translate(480,-5e-5)">
+      <path
+         style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:2;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+         d="m 1200,220.00002 v 9.99999 0"
+         id="path29548-5-1-3-6-3-1-0-3-4" />
+      <path
+         style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+         d="m 1220,219.99997 v 5.00004 0"
+         id="path29548-8-5-0-6-4-6-2-9-0-8-1-3-1-9-6-9-3-4-0-4-6-2-2-7-6-1-9-0-5-0-0"
+         inkscape:transform-center-x="14.782001"
+         inkscape:transform-center-y="-0.085282837" />
+      <path
+         style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+         d="m 1240,219.99997 v 5.00004 0"
+         id="path29548-8-5-0-6-4-6-2-9-0-8-1-3-1-9-6-9-3-4-0-4-6-2-2-7-6-1-9-9-7-5-3-5"
+         inkscape:transform-center-x="14.782001"
+         inkscape:transform-center-y="-0.085282837" />
+      <path
+         style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+         d="m 1260,219.99997 v 5.00004 0"
+         id="path29548-8-5-0-6-4-6-2-9-0-8-1-3-1-9-6-9-3-4-0-4-6-2-2-7-6-1-9-9-1-5-2-0-9"
+         inkscape:transform-center-x="14.782001"
+         inkscape:transform-center-y="-0.085282837" />
+      <path
+         style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+         d="m 1280,219.99997 v 5.00004 0"
+         id="path29548-8-5-0-6-4-6-2-9-0-8-1-3-1-9-6-9-3-4-0-4-6-2-2-7-6-1-9-9-1-4-8-9-9-4"
+         inkscape:transform-center-x="14.782001"
+         inkscape:transform-center-y="-0.085282837" />
+      <path
+         style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+         d="m 1299.7216,219.99997 v 5.00004 0"
+         id="path29548-8-5-0-6-4-6-2-9-0-8-1-3-1-9-6-9-3-4-0-4-6-2-2-7-6-1-9-9-1-4-9-7-0-2-6"
+         inkscape:transform-center-x="-14.78205"
+         inkscape:transform-center-y="-0.085282837" />
+    </g>
+    <g
+       id="g1267-4-5-22"
+       transform="translate(600,-4e-5)">
+      <path
+         style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:2;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+         d="m 1200,220.00002 v 9.99999 0"
+         id="path29548-5-1-3-6-3-1-0-3-4-0" />
+      <path
+         style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+         d="m 1220,219.99997 v 5.00004 0"
+         id="path29548-8-5-0-6-4-6-2-9-0-8-1-3-1-9-6-9-3-4-0-4-6-2-2-7-6-1-9-0-5-0-0-55"
+         inkscape:transform-center-x="14.782001"
+         inkscape:transform-center-y="-0.085282837" />
+      <path
+         style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+         d="m 1240,219.99997 v 5.00004 0"
+         id="path29548-8-5-0-6-4-6-2-9-0-8-1-3-1-9-6-9-3-4-0-4-6-2-2-7-6-1-9-9-7-5-3-5-2"
+         inkscape:transform-center-x="14.782001"
+         inkscape:transform-center-y="-0.085282837" />
+      <path
+         style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+         d="m 1260,219.99997 v 5.00004 0"
+         id="path29548-8-5-0-6-4-6-2-9-0-8-1-3-1-9-6-9-3-4-0-4-6-2-2-7-6-1-9-9-1-5-2-0-9-90"
+         inkscape:transform-center-x="14.782001"
+         inkscape:transform-center-y="-0.085282837" />
+      <path
+         style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+         d="m 1280,219.99997 v 5.00004 0"
+         id="path29548-8-5-0-6-4-6-2-9-0-8-1-3-1-9-6-9-3-4-0-4-6-2-2-7-6-1-9-9-1-4-8-9-9-4-2"
+         inkscape:transform-center-x="14.782001"
+         inkscape:transform-center-y="-0.085282837" />
+      <path
+         style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+         d="m 1299.7216,219.99997 v 5.00004 0"
+         id="path29548-8-5-0-6-4-6-2-9-0-8-1-3-1-9-6-9-3-4-0-4-6-2-2-7-6-1-9-9-1-4-9-7-0-2-6-8"
+         inkscape:transform-center-x="-14.78205"
+         inkscape:transform-center-y="-0.085282837" />
+    </g>
+    <g
+       id="g1267-4-5-9"
+       transform="translate(360,-4e-5)">
+      <path
+         style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:2;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+         d="m 1200,220.00002 v 9.99999 0"
+         id="path29548-5-1-3-6-3-1-0-3-4-2" />
+      <path
+         style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+         d="m 1220,219.99997 v 5.00004 0"
+         id="path29548-8-5-0-6-4-6-2-9-0-8-1-3-1-9-6-9-3-4-0-4-6-2-2-7-6-1-9-0-5-0-0-2"
+         inkscape:transform-center-x="14.782001"
+         inkscape:transform-center-y="-0.085282837" />
+      <path
+         style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+         d="m 1240,219.99997 v 5.00004 0"
+         id="path29548-8-5-0-6-4-6-2-9-0-8-1-3-1-9-6-9-3-4-0-4-6-2-2-7-6-1-9-9-7-5-3-5-4"
+         inkscape:transform-center-x="14.782001"
+         inkscape:transform-center-y="-0.085282837" />
+      <path
+         style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+         d="m 1260,219.99997 v 5.00004 0"
+         id="path29548-8-5-0-6-4-6-2-9-0-8-1-3-1-9-6-9-3-4-0-4-6-2-2-7-6-1-9-9-1-5-2-0-9-7"
+         inkscape:transform-center-x="14.782001"
+         inkscape:transform-center-y="-0.085282837" />
+      <path
+         style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+         d="m 1280,219.99997 v 5.00004 0"
+         id="path29548-8-5-0-6-4-6-2-9-0-8-1-3-1-9-6-9-3-4-0-4-6-2-2-7-6-1-9-9-1-4-8-9-9-4-7"
+         inkscape:transform-center-x="14.782001"
+         inkscape:transform-center-y="-0.085282837" />
+      <path
+         style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+         d="m 1299.7216,219.99997 v 5.00004 0"
+         id="path29548-8-5-0-6-4-6-2-9-0-8-1-3-1-9-6-9-3-4-0-4-6-2-2-7-6-1-9-9-1-4-9-7-0-2-6-5"
+         inkscape:transform-center-x="-14.78205"
+         inkscape:transform-center-y="-0.085282837" />
+    </g>
     <path
-       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
-       d="m 1220,219.99997 v 5.00004 0"
-       id="path29548-8-5-0-6-4-6-2-9-0-8-1-3-1-9-6-9-3-4-0-4-6-2-2-7-6-1-9-0-5"
-       inkscape:transform-center-x="14.782001"
-       inkscape:transform-center-y="-0.085282837" />
-    <path
-       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
-       d="m 1240,219.99997 v 5.00004 0"
-       id="path29548-8-5-0-6-4-6-2-9-0-8-1-3-1-9-6-9-3-4-0-4-6-2-2-7-6-1-9-9-7-5"
-       inkscape:transform-center-x="14.782001"
-       inkscape:transform-center-y="-0.085282837" />
-    <path
-       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
-       d="m 1260,219.99997 v 5.00004 0"
-       id="path29548-8-5-0-6-4-6-2-9-0-8-1-3-1-9-6-9-3-4-0-4-6-2-2-7-6-1-9-9-1-5-2"
-       inkscape:transform-center-x="14.782001"
-       inkscape:transform-center-y="-0.085282837" />
-    <path
-       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
-       d="m 1280,219.99997 v 5.00004 0"
-       id="path29548-8-5-0-6-4-6-2-9-0-8-1-3-1-9-6-9-3-4-0-4-6-2-2-7-6-1-9-9-1-4-8-9"
-       inkscape:transform-center-x="14.782001"
-       inkscape:transform-center-y="-0.085282837" />
-    <path
-       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
-       d="m 1299.7216,219.99997 v 5.00004 0"
-       id="path29548-8-5-0-6-4-6-2-9-0-8-1-3-1-9-6-9-3-4-0-4-6-2-2-7-6-1-9-9-1-4-9-7-0"
-       inkscape:transform-center-x="-14.78205"
-       inkscape:transform-center-y="-0.085282837" />
+       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:2;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+       d="m 1800,219.99997 v 9.99999 0"
+       id="path29548-5-1-3-6-3-1-0-3-4-2-0" />
     <path
        style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
        d="m 1340,219.99997 v 5.00004 0"
@@ -1244,6 +1555,188 @@
        id="path29548-8-5-0-6-4-6-2-9-0-8-1-3-1-9-6-9-3-4-0-4-6-2-2-7-6-1-9-9-1-4-9-7-0-9"
        inkscape:transform-center-x="-14.78205"
        inkscape:transform-center-y="-0.085282837" />
+    <text
+       xml:space="preserve"
+       style="font-weight:bold;font-size:13.3333px;line-height:125%;font-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="1919.3904"
+       y="249.86044"
+       id="text1185-9-7-1-1-89-62"><tspan
+         sodipodi:role="line"
+         x="1919.3904"
+         y="249.86044"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;stroke:none"
+         id="tspan31345-7-6">Oct.</tspan><tspan
+         sodipodi:role="line"
+         x="1919.3904"
+         y="267.85712"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;stroke:none"
+         id="tspan49906-76-7">2026</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-weight:bold;font-size:13.3333px;line-height:125%;font-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="2159.3093"
+       y="250.58356"
+       id="text1185-9-7-1-1-89-6-5"><tspan
+         sodipodi:role="line"
+         x="2159.3093"
+         y="250.58356"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;stroke:none"
+         id="tspan31345-7-8-6">Oct.</tspan><tspan
+         sodipodi:role="line"
+         x="2159.3093"
+         y="268.58023"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;stroke:none"
+         id="tspan49906-76-0-9">2027</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-weight:bold;font-size:13.3333px;line-height:125%;font-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="2041.8163"
+       y="249.66977"
+       id="text1185-9-7-1-1-8-1-0-4-8"><tspan
+         sodipodi:role="line"
+         x="2041.8163"
+         y="249.66977"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;stroke:none"
+         id="tspan31345-4-0-4-81-7">Apr.</tspan><tspan
+         sodipodi:role="line"
+         x="2041.8163"
+         y="267.66644"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;stroke:none"
+         id="tspan49906-7-3-8-2-2">2027</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-weight:bold;font-size:13.3333px;line-height:125%;font-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="2282.1477"
+       y="250.26334"
+       id="text1185-9-7-1-1-8-1-0-4-2-8"><tspan
+         sodipodi:role="line"
+         x="2282.1477"
+         y="250.26334"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;stroke:none"
+         id="tspan31345-4-0-4-81-5-2">Apr.</tspan><tspan
+         sodipodi:role="line"
+         x="2282.1477"
+         y="268.26001"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;stroke:none"
+         id="tspan49906-7-3-8-2-8-9">2028</tspan></text>
+    <g
+       id="g1267-4-9"
+       transform="translate(720,-3e-5)">
+      <path
+         style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:2;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+         d="m 1200,220.00002 v 9.99999 0"
+         id="path29548-5-1-3-6-3-1-0-3-6" />
+      <path
+         style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+         d="m 1220,219.99997 v 5.00004 0"
+         id="path29548-8-5-0-6-4-6-2-9-0-8-1-3-1-9-6-9-3-4-0-4-6-2-2-7-6-1-9-0-5-0-02"
+         inkscape:transform-center-x="14.782001"
+         inkscape:transform-center-y="-0.085282837" />
+      <path
+         style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+         d="m 1240,219.99997 v 5.00004 0"
+         id="path29548-8-5-0-6-4-6-2-9-0-8-1-3-1-9-6-9-3-4-0-4-6-2-2-7-6-1-9-9-7-5-3-7"
+         inkscape:transform-center-x="14.782001"
+         inkscape:transform-center-y="-0.085282837" />
+      <path
+         style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+         d="m 1260,219.99997 v 5.00004 0"
+         id="path29548-8-5-0-6-4-6-2-9-0-8-1-3-1-9-6-9-3-4-0-4-6-2-2-7-6-1-9-9-1-5-2-0-6"
+         inkscape:transform-center-x="14.782001"
+         inkscape:transform-center-y="-0.085282837" />
+      <path
+         style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+         d="m 1280,219.99997 v 5.00004 0"
+         id="path29548-8-5-0-6-4-6-2-9-0-8-1-3-1-9-6-9-3-4-0-4-6-2-2-7-6-1-9-9-1-4-8-9-9-1"
+         inkscape:transform-center-x="14.782001"
+         inkscape:transform-center-y="-0.085282837" />
+      <path
+         style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+         d="m 1299.7216,219.99997 v 5.00004 0"
+         id="path29548-8-5-0-6-4-6-2-9-0-8-1-3-1-9-6-9-3-4-0-4-6-2-2-7-6-1-9-9-1-4-9-7-0-2-3"
+         inkscape:transform-center-x="-14.78205"
+         inkscape:transform-center-y="-0.085282837" />
+    </g>
+    <g
+       id="g1267-4-5-2"
+       transform="translate(960,-4e-5)">
+      <path
+         style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:2;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+         d="m 1200,220.00002 v 9.99999 0"
+         id="path29548-5-1-3-6-3-1-0-3-4-1" />
+      <path
+         style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+         d="m 1220,219.99997 v 5.00004 0"
+         id="path29548-8-5-0-6-4-6-2-9-0-8-1-3-1-9-6-9-3-4-0-4-6-2-2-7-6-1-9-0-5-0-0-5"
+         inkscape:transform-center-x="14.782001"
+         inkscape:transform-center-y="-0.085282837" />
+      <path
+         style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+         d="m 1240,219.99997 v 5.00004 0"
+         id="path29548-8-5-0-6-4-6-2-9-0-8-1-3-1-9-6-9-3-4-0-4-6-2-2-7-6-1-9-9-7-5-3-5-9"
+         inkscape:transform-center-x="14.782001"
+         inkscape:transform-center-y="-0.085282837" />
+      <path
+         style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+         d="m 1260,219.99997 v 5.00004 0"
+         id="path29548-8-5-0-6-4-6-2-9-0-8-1-3-1-9-6-9-3-4-0-4-6-2-2-7-6-1-9-9-1-5-2-0-9-9"
+         inkscape:transform-center-x="14.782001"
+         inkscape:transform-center-y="-0.085282837" />
+      <path
+         style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+         d="m 1280,219.99997 v 5.00004 0"
+         id="path29548-8-5-0-6-4-6-2-9-0-8-1-3-1-9-6-9-3-4-0-4-6-2-2-7-6-1-9-9-1-4-8-9-9-4-1"
+         inkscape:transform-center-x="14.782001"
+         inkscape:transform-center-y="-0.085282837" />
+      <path
+         style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+         d="m 1299.7216,219.99997 v 5.00004 0"
+         id="path29548-8-5-0-6-4-6-2-9-0-8-1-3-1-9-6-9-3-4-0-4-6-2-2-7-6-1-9-9-1-4-9-7-0-2-6-4"
+         inkscape:transform-center-x="-14.78205"
+         inkscape:transform-center-y="-0.085282837" />
+    </g>
+    <g
+       id="g1267-4-5-9-9"
+       transform="translate(840,-3e-5)">
+      <path
+         style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:2;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+         d="m 1200,220.00002 v 9.99999 0"
+         id="path29548-5-1-3-6-3-1-0-3-4-2-1" />
+      <path
+         style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+         d="m 1220,219.99997 v 5.00004 0"
+         id="path29548-8-5-0-6-4-6-2-9-0-8-1-3-1-9-6-9-3-4-0-4-6-2-2-7-6-1-9-0-5-0-0-2-0"
+         inkscape:transform-center-x="14.782001"
+         inkscape:transform-center-y="-0.085282837" />
+      <path
+         style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+         d="m 1240,219.99997 v 5.00004 0"
+         id="path29548-8-5-0-6-4-6-2-9-0-8-1-3-1-9-6-9-3-4-0-4-6-2-2-7-6-1-9-9-7-5-3-5-4-7"
+         inkscape:transform-center-x="14.782001"
+         inkscape:transform-center-y="-0.085282837" />
+      <path
+         style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+         d="m 1260,219.99997 v 5.00004 0"
+         id="path29548-8-5-0-6-4-6-2-9-0-8-1-3-1-9-6-9-3-4-0-4-6-2-2-7-6-1-9-9-1-5-2-0-9-7-5"
+         inkscape:transform-center-x="14.782001"
+         inkscape:transform-center-y="-0.085282837" />
+      <path
+         style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+         d="m 1280,219.99997 v 5.00004 0"
+         id="path29548-8-5-0-6-4-6-2-9-0-8-1-3-1-9-6-9-3-4-0-4-6-2-2-7-6-1-9-9-1-4-8-9-9-4-7-8"
+         inkscape:transform-center-x="14.782001"
+         inkscape:transform-center-y="-0.085282837" />
+      <path
+         style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+         d="m 1299.7216,219.99997 v 5.00004 0"
+         id="path29548-8-5-0-6-4-6-2-9-0-8-1-3-1-9-6-9-3-4-0-4-6-2-2-7-6-1-9-9-1-4-9-7-0-2-6-5-7"
+         inkscape:transform-center-x="-14.78205"
+         inkscape:transform-center-y="-0.085282837" />
+    </g>
+    <path
+       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:2;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+       d="m 2280,219.99998 v 9.99999 0"
+       id="path29548-5-1-3-6-3-1-0-3-4-2-0-0" />
   </g>
   <style
      type="text/css"
-- 
2.34.1


