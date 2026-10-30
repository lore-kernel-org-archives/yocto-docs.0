Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10817.1793365132746331893
 for <docs@lists.yoctoproject.org>;
 Fri, 30 Oct 2026 05:58:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=XLfSPtac;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 0F4401A13C1
	for <docs@lists.yoctoproject.org>; Fri, 30 Oct 2026 12:58:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D2341603C2
	for <docs@lists.yoctoproject.org>; Fri, 30 Oct 2026 12:58:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2DA46103290F8;
	Fri, 30 Oct 2026 13:58:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793365126; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=TIGTO6jli2UTW5iG5TpSX/DGJ5UZrXhBJ44mhacZnPE=;
	b=XLfSPtaccvIZWdqgTolFwMG0V4Z9TQIiblJmYJ1NX/REtyKfRnAEwory3BG4amyaRlpekD
	YpLcUlPt1/+JZjMs5kn1LZRhetbEkrY+g0HgdZ6YyiTOldQ2WxRIRqzuR3DGu8egqCQBJC
	TzDBqzyiQVNckr2SmEBqPgt1r8g4yo3YQYBwklak99IVKPGFP3Wv71lTCRXZOStUqFPqxt
	4V4tm/ni+g40DXryYHLqyZWmPXo/bu1JOQPbrn1bjdTDzjnigN36Y1RKu5Tn37UoMaMUeI
	cm6MN2ttGmYU0rFSjCODCd5lp6zYXJZZCAzVLbE5fldn0cBN6jTAxq/lr3HVMw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 30 Oct 2026 13:58:39 +0100
Subject: [PATCH 2/2] docs-wide: convert diagrams that use Nimbus Roman to
 use Nimbus Sans
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261030-nimbus-standards-v1-2-119ec9b3c918@bootlin.com>
References: <20261030-nimbus-standards-v1-0-119ec9b3c918@bootlin.com>
In-Reply-To: <20261030-nimbus-standards-v1-0-119ec9b3c918@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=32416;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=qqoxZLGl2Lng/505R/rxHnTpE2IO8ZW5uTaBujTebf4=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBq5JR/9VAS1t/hkptJ5jOD8B+DJLhO16q4YD//X
 7iy6oI4k0OJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCauSUfwAKCRDRgEFAKaOo
 Nn5LD/46QW3Dol4SLF+ef2JLDJF7TMD5OSQUidccqa8hquTG6KIM3hddG/kQuneOE4nCx2QyBa6
 6Sp5E8LwQdrDBpqSRxiPVs27bJNFaexGYymyALx10P+7b/vsSxSj8inybOqRFLsGbjXJAoPM5+5
 CWSUExpsWIkePX+56bRCMPDMNgfrtF90VvJaedXqrDjFbMG7XmXU5EcVgyTBVWUPukCRsWgwt6f
 Wm3whzMOEovp3F2aENqOmCbBmLy2oWsSBIQTdxrmzkW+6xVbA6APsQpcZbQN1NXAJRShzx08rXR
 ofnTQkj9MkLEIgO8x4T7OXiU9p1BStfvehxvGzYkS3ADQqyeFMHJ55FPESC1xfl0YyFbogw9tV+
 WXvVKjhf8r9fZop5ZAoRAGj2w2KKk5ATCWPql14mMIgUHcu73jpE476eOy2tx0KL1cnpVhC3D8i
 khNtl8gOGtu5glnPWZCrbeaWEZSOyEhJyOy7PHepKiyrRaXX6JaTNEiVUHPszlAMYsm7xPLJ+23
 BlxU60Q/T2so9uT7dRbJ0bxhPNvjrRjp0Nv/OmtoR+yHkLFQTviOOYogRAKE3hfXm1zrlfCSoE1
 WzNoVZkaRW+DgltMDdrEYqOh5zSe/WAx0ttC9vYt9iLlZH8x/Sm7Omp3IM4WP2FrUZtZDMnsDNk
 dyZBztoqBwfC2/w==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Fri, 30 Oct 2026 12:58:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10745

The standards.md now recommends Nimbus Sans for diagrams, so convert
diagrams using Nimbus Roman to use Nimbus Sans.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/overview-manual/svg/git-workflow.svg | 30 ++++++++--------
 documentation/template/template.svg                | 40 +++++++++++-----------
 2 files changed, 35 insertions(+), 35 deletions(-)

diff --git a/documentation/overview-manual/svg/git-workflow.svg b/documentation/overview-manual/svg/git-workflow.svg
index 7747e35d9..8e1d9292d 100644
--- a/documentation/overview-manual/svg/git-workflow.svg
+++ b/documentation/overview-manual/svg/git-workflow.svg
@@ -771,7 +771,7 @@
       </g>
       <text
          xml:space="preserve"
-         style="font-weight:bold;font-size:13.3333px;line-height:125%;font-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+         style="font-weight:bold;font-size:13.3333px;line-height:125%;font-family:'Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
          x="-15.501629"
          y="651.78131"
          id="text1185"><tspan
@@ -783,7 +783,7 @@
     </g>
     <text
        xml:space="preserve"
-       style="font-weight:bold;font-size:42.5884px;line-height:125%;font-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:none;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       style="font-weight:bold;font-size:42.5884px;line-height:125%;font-family:'Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:none;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
        x="142.22464"
        y="565.10297"
        id="text907"><tspan
@@ -793,7 +793,7 @@
          y="565.10297" /></text>
     <text
        xml:space="preserve"
-       style="font-weight:bold;font-size:42.5884px;line-height:125%;font-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:none;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       style="font-weight:bold;font-size:42.5884px;line-height:125%;font-family:'Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:none;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
        x="98.363503"
        y="637.8432"
        id="text911"><tspan
@@ -803,7 +803,7 @@
          y="637.8432" /></text>
     <text
        xml:space="preserve"
-       style="font-weight:bold;font-size:42.5884px;line-height:125%;font-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:none;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       style="font-weight:bold;font-size:42.5884px;line-height:125%;font-family:'Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:none;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
        x="-59.575905"
        y="580.05695"
        id="text915"><tspan
@@ -824,7 +824,7 @@
          ry="3.4599047" />
       <text
          xml:space="preserve"
-         style="font-weight:bold;font-size:13.3333px;line-height:125%;font-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+         style="font-weight:bold;font-size:13.3333px;line-height:125%;font-family:'Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
          x="259.14236"
          y="523.42725"
          id="text1185-3"><tspan
@@ -937,7 +937,7 @@
          ry="3.4599047" />
       <text
          xml:space="preserve"
-         style="font-weight:bold;font-size:13.3333px;line-height:125%;font-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+         style="font-weight:bold;font-size:13.3333px;line-height:125%;font-family:'Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
          x="463.47824"
          y="522.11536"
          id="text1185-3-5"><tspan
@@ -972,7 +972,7 @@
          ry="3.4599047" />
       <text
          xml:space="preserve"
-         style="font-weight:bold;font-size:13.3333px;line-height:125%;font-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+         style="font-weight:bold;font-size:13.3333px;line-height:125%;font-family:'Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
          x="463.47824"
          y="522.11536"
          id="text1185-3-5-0"><tspan
@@ -1007,7 +1007,7 @@
          ry="3.4599047" />
       <text
          xml:space="preserve"
-         style="font-weight:bold;font-size:13.3333px;line-height:125%;font-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+         style="font-weight:bold;font-size:13.3333px;line-height:125%;font-family:'Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
          x="462.51175"
          y="650.07056"
          id="text1185-3-5-5"><tspan
@@ -1042,7 +1042,7 @@
          ry="3.4599047" />
       <text
          xml:space="preserve"
-         style="font-weight:bold;font-size:13.3333px;line-height:125%;font-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+         style="font-weight:bold;font-size:13.3333px;line-height:125%;font-family:'Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
          x="462.51175"
          y="650.07056"
          id="text1185-3-5-5-6"><tspan
@@ -1074,7 +1074,7 @@
        inkscape:connection-end="#g1211-2" />
     <text
        xml:space="preserve"
-       style="font-weight:bold;font-size:42.5884px;line-height:125%;font-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:none;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       style="font-weight:bold;font-size:42.5884px;line-height:125%;font-family:'Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:none;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
        x="313.46567"
        y="412.9321"
        id="text3781"><tspan
@@ -1084,7 +1084,7 @@
          y="412.9321" /></text>
     <text
        xml:space="preserve"
-       style="font-weight:bold;font-size:13.3333px;line-height:125%;font-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       style="font-weight:bold;font-size:13.3333px;line-height:125%;font-family:'Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
        x="580.85419"
        y="524.23517"
        id="text1185-9"><tspan
@@ -1103,7 +1103,7 @@
        inkscape:connection-end="#g1315-2" />
     <text
        xml:space="preserve"
-       style="font-weight:bold;font-size:13.3333px;line-height:125%;font-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       style="font-weight:bold;font-size:13.3333px;line-height:125%;font-family:'Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
        x="580.85419"
        y="647.90686"
        id="text1185-9-4"><tspan
@@ -1138,7 +1138,7 @@
        inkscape:connection-end="#g1153" />
     <text
        xml:space="preserve"
-       style="font-weight:bold;font-size:13.3333px;line-height:125%;font-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       style="font-weight:bold;font-size:13.3333px;line-height:125%;font-family:'Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
        x="377.95239"
        y="595.54547"
        id="text1185-9-0"><tspan
@@ -1168,7 +1168,7 @@
        inkscape:connector-curvature="0" />
     <text
        xml:space="preserve"
-       style="font-weight:bold;font-size:13.3333px;line-height:125%;font-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       style="font-weight:bold;font-size:13.3333px;line-height:125%;font-family:'Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
        x="266.03806"
        y="439.90387"
        id="text1185-9-7"><tspan
@@ -1189,7 +1189,7 @@
        sodipodi:nodetypes="cccc" />
     <text
        xml:space="preserve"
-       style="font-weight:bold;font-size:13.3333px;line-height:125%;font-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       style="font-weight:bold;font-size:13.3333px;line-height:125%;font-family:'Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
        x="266.03806"
        y="720.30841"
        id="text1185-9-7-7"><tspan
diff --git a/documentation/template/template.svg b/documentation/template/template.svg
index 50715c08b..c83a4f32d 100644
--- a/documentation/template/template.svg
+++ b/documentation/template/template.svg
@@ -792,7 +792,7 @@
     </g>
     <text
        xml:space="preserve"
-       style="font-weight:bold;font-size:13.3333px;line-height:125%;font-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       style="font-weight:bold;font-size:13.3333px;line-height:125%;font-family:'Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
        x="-40.600285"
        y="693.29376"
        id="text1185"><tspan
@@ -803,7 +803,7 @@
          style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans Bold';stroke:none">Server / computer</tspan></text>
     <text
        xml:space="preserve"
-       style="font-weight:bold;font-size:13.3333px;line-height:125%;font-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       style="font-weight:bold;font-size:13.3333px;line-height:125%;font-family:'Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
        x="-43.34169"
        y="769.37323"
        id="text1185-2"><tspan
@@ -814,7 +814,7 @@
          style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;stroke:none">Note: Public domain graphics from https://openclipart.org/</tspan></text>
     <text
        xml:space="preserve"
-       style="font-weight:bold;font-size:42.5884px;line-height:125%;font-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:none;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       style="font-weight:bold;font-size:42.5884px;line-height:125%;font-family:'Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:none;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
        x="142.22464"
        y="565.10297"
        id="text907"><tspan
@@ -824,7 +824,7 @@
          y="565.10297" /></text>
     <text
        xml:space="preserve"
-       style="font-weight:bold;font-size:42.5884px;line-height:125%;font-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:none;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       style="font-weight:bold;font-size:42.5884px;line-height:125%;font-family:'Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:none;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
        x="98.363503"
        y="637.8432"
        id="text911"><tspan
@@ -834,7 +834,7 @@
          y="637.8432" /></text>
     <text
        xml:space="preserve"
-       style="font-weight:bold;font-size:42.5884px;line-height:125%;font-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:none;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       style="font-weight:bold;font-size:42.5884px;line-height:125%;font-family:'Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:none;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
        x="-59.575905"
        y="580.05695"
        id="text915"><tspan
@@ -852,7 +852,7 @@
        ry="3.4599047" />
     <text
        xml:space="preserve"
-       style="font-weight:bold;font-size:13.3333px;line-height:125%;font-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       style="font-weight:bold;font-size:13.3333px;line-height:125%;font-family:'Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
        x="301.85687"
        y="147.99857"
        id="text1185-3-55"><tspan
@@ -958,7 +958,7 @@
          ry="3.4599047" />
       <text
          xml:space="preserve"
-         style="font-weight:bold;font-size:13.5687px;line-height:125%;font-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+         style="font-weight:bold;font-size:13.5687px;line-height:125%;font-family:'Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
          x="155.10774"
          y="150.4942"
          id="text1185-3-5-5-9"
@@ -984,7 +984,7 @@
        ry="3.4599047" />
     <text
        xml:space="preserve"
-       style="font-weight:bold;font-size:13.5687px;line-height:125%;font-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       style="font-weight:bold;font-size:13.5687px;line-height:125%;font-family:'Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
        x="20.119326"
        y="149.15712"
        id="text1185-3-5-5-9-4"
@@ -1001,7 +1001,7 @@
          id="tspan60047-2">box</tspan></text>
     <text
        xml:space="preserve"
-       style="font-weight:bold;font-size:42.5884px;line-height:125%;font-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:none;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       style="font-weight:bold;font-size:42.5884px;line-height:125%;font-family:'Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:none;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
        x="313.46567"
        y="412.9321"
        id="text3781"><tspan
@@ -1011,7 +1011,7 @@
          y="412.9321" /></text>
     <text
        xml:space="preserve"
-       style="font-weight:bold;font-size:13.3333px;line-height:125%;font-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       style="font-weight:bold;font-size:13.3333px;line-height:125%;font-family:'Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
        x="-52.348656"
        y="518.42615"
        id="text1185-9-2"><tspan
@@ -1022,7 +1022,7 @@
          style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:37.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;stroke:none">Objects</tspan></text>
     <text
        xml:space="preserve"
-       style="font-weight:bold;font-size:13.3333px;line-height:125%;font-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       style="font-weight:bold;font-size:13.3333px;line-height:125%;font-family:'Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
        x="-52.87841"
        y="89.660812"
        id="text1185-9-2-7"><tspan
@@ -1033,7 +1033,7 @@
          style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:37.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;stroke:none">Shapes</tspan></text>
     <text
        xml:space="preserve"
-       style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:37.3333px;line-height:125%;font-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:37.3333px;line-height:125%;font-family:'Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
        x="-52.994568"
        y="-109.65781"
        id="text1185-9-2-7-0"><tspan
@@ -1044,7 +1044,7 @@
          style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:37.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;stroke:none">Logos</tspan></text>
     <text
        xml:space="preserve"
-       style="font-weight:bold;font-size:13.3333px;line-height:125%;font-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       style="font-weight:bold;font-size:13.3333px;line-height:125%;font-family:'Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
        x="-51.052338"
        y="248.86438"
        id="text1185-9-2-7-3"><tspan
@@ -1055,7 +1055,7 @@
          style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:37.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;stroke:none">Arrows</tspan></text>
     <text
        xml:space="preserve"
-       style="font-weight:bold;font-size:13.3333px;line-height:125%;font-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       style="font-weight:bold;font-size:13.3333px;line-height:125%;font-family:'Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
        x="-52.697285"
        y="373.75641"
        id="text1185-9-2-7-3-6"><tspan
@@ -1084,7 +1084,7 @@
        inkscape:connector-curvature="0" />
     <text
        xml:space="preserve"
-       style="font-weight:bold;font-size:13.3333px;line-height:125%;font-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       style="font-weight:bold;font-size:13.3333px;line-height:125%;font-family:'Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
        x="-38.034531"
        y="429.09885"
        id="text1185-9-7"><tspan
@@ -1095,7 +1095,7 @@
          style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';stroke:none">Normal text</tspan></text>
     <text
        xml:space="preserve"
-       style="font-weight:bold;font-size:13.3333px;line-height:125%;font-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       style="font-weight:bold;font-size:13.3333px;line-height:125%;font-family:'Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
        x="105.28938"
        y="324.79022"
        id="text1185-9-7-8"><tspan
@@ -1106,7 +1106,7 @@
          style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';stroke:none">Orange 1 arrow</tspan></text>
     <text
        xml:space="preserve"
-       style="font-weight:bold;font-size:13.3333px;line-height:125%;font-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       style="font-weight:bold;font-size:13.3333px;line-height:125%;font-family:'Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
        x="255.85823"
        y="324.95401"
        id="text1185-9-7-8-2"><tspan
@@ -1123,7 +1123,7 @@
        inkscape:connector-curvature="0" />
     <text
        xml:space="preserve"
-       style="font-weight:bold;font-size:13.3333px;line-height:125%;font-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       style="font-weight:bold;font-size:13.3333px;line-height:125%;font-family:'Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
        x="395.33353"
        y="324.16251"
        id="text1185-9-7-8-2-8"><tspan
@@ -1134,7 +1134,7 @@
          style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';stroke:none">Light 3 arrow</tspan></text>
     <text
        xml:space="preserve"
-       style="font-weight:bold;font-size:13.3333px;line-height:125%;font-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       style="font-weight:bold;font-size:13.3333px;line-height:125%;font-family:'Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
        x="57.50481"
        y="428.73474"
        id="text1185-9-7-1"><tspan
@@ -1145,7 +1145,7 @@
          style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;stroke:none">Label text (bold)</tspan></text>
     <text
        xml:space="preserve"
-       style="font-weight:bold;font-size:42.5884px;line-height:125%;font-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:none;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       style="font-weight:bold;font-size:42.5884px;line-height:125%;font-family:'Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:none;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
        x="-16.290483"
        y="345.7359"
        id="text3116"><tspan

-- 
2.55.0

