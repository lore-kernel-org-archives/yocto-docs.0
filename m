Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9A7FCCF9EE
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 17:07:19 +0000 (UTC)
Received: from smtp-190a.mail.infomaniak.ch (smtp-190a.mail.infomaniak.ch [185.125.25.10])
 by mx.groups.io with SMTP id smtpd.web11.10449.1761757635628362059
 for <docs@lists.yoctoproject.org>;
 Wed, 29 Oct 2025 10:07:16 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 185.125.25.10, mailfrom: foss+yocto@0leil.net)
Received: from smtp-3-0000.mail.infomaniak.ch (smtp-3-0000.mail.infomaniak.ch [10.4.36.107])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4cxYZV1RcbzxkN;
	Wed, 29 Oct 2025 18:07:14 +0100 (CET)
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4cxYZT3Zt0zJWM;
	Wed, 29 Oct 2025 18:07:13 +0100 (CET)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Wed, 29 Oct 2025 18:07:01 +0100
Subject: [PATCH] overview-manual: migrate to SVG + fix typo
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-overview-typo-v1-1-e7d3c6bd9cf8@cherry.de>
X-B4-Tracking: v=1; b=H4sIALRJAmkC/x3MQQqAIBBA0avErBPUCrKrRIvSqWajomGFePek5
 Vv8nyFiIIwwNRkCJorkbIVoG9Dnag9kZKpBcjkILhVzCUMivNn1eseQm1F32vSb0lAbH3Cn5//
 NSykfF2dFFl8AAAA=
X-Change-ID: 20251029-overview-typo-e0d8c3cd4b9c
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>, 
 "Robert P. J. Day" <rpjday@crashcourse.ca>
X-Mailer: b4 0.14.3
X-Infomaniak-Routing: alpha
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 29 Oct 2025 17:07:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7902

From: Quentin Schulz <quentin.schulz@cherry.de>

The original PNG had a typo (YP-Comptible instead of YP-Compatible).

Instead of patching a PNG, let's migrate to an SVG with the typo already
fixed.

Reported-by: Robert P. J. Day <rpjday@crashcourse.ca>
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 .../overview-manual/figures/key-dev-elements.png   | Bin 20424 -> 0 bytes
 .../overview-manual/svg/key-dev-elements.svg       | 172 +++++++++++++++++++++
 documentation/overview-manual/yp-intro.rst         |   2 +-
 3 files changed, 173 insertions(+), 1 deletion(-)

diff --git a/documentation/overview-manual/figures/key-dev-elements.png b/documentation/overview-manual/figures/key-dev-elements.png
deleted file mode 100644
index 76c44050fddc0aa462fff47990529521f6bdc710..0000000000000000000000000000000000000000
GIT binary patch
literal 0
HcmV?d00001

literal 20424
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

diff --git a/documentation/overview-manual/svg/key-dev-elements.svg b/documentation/overview-manual/svg/key-dev-elements.svg
new file mode 100644
index 000000000..d9fa0e49d
--- /dev/null
+++ b/documentation/overview-manual/svg/key-dev-elements.svg
@@ -0,0 +1,172 @@
+<?xml version="1.0" encoding="UTF-8" standalone="no"?>
+<!-- Created with Inkscape (http://www.inkscape.org/) -->
+
+<svg
+   width="164.765mm"
+   height="72.988113mm"
+   viewBox="0 0 164.765 72.988114"
+   version="1.1"
+   id="svg1"
+   xml:space="preserve"
+   inkscape:version="1.4.2 (ebf0e940d0, 2025-05-08)"
+   sodipodi:docname="key-dev-elements.svg"
+   xmlns:inkscape="http://www.inkscape.org/namespaces/inkscape"
+   xmlns:sodipodi="http://sodipodi.sourceforge.net/DTD/sodipodi-0.dtd"
+   xmlns="http://www.w3.org/2000/svg"
+   xmlns:svg="http://www.w3.org/2000/svg"><sodipodi:namedview
+     id="namedview1"
+     pagecolor="#ffffff"
+     bordercolor="#000000"
+     borderopacity="0.25"
+     inkscape:showpageshadow="false"
+     inkscape:pageopacity="0.0"
+     inkscape:pagecheckerboard="0"
+     inkscape:deskcolor="#d1d1d1"
+     inkscape:document-units="mm"
+     inkscape:zoom="1"
+     inkscape:cx="341.5"
+     inkscape:cy="-31.5"
+     inkscape:window-width="2560"
+     inkscape:window-height="1440"
+     inkscape:window-x="0"
+     inkscape:window-y="0"
+     inkscape:window-maximized="0"
+     inkscape:current-layer="layer2"
+     showborder="false"
+     borderlayer="false"
+     inkscape:antialias-rendering="true"
+     showguides="true" /><defs
+     id="defs1" /><g
+     inkscape:groupmode="layer"
+     id="layer2"
+     inkscape:label="Layer "
+     style="display:inline"
+     transform="translate(-20.664242,-129.6793)"><rect
+       style="display:inline;fill:#f1e9cc;fill-opacity:1;stroke:#6d8eb4;stroke-width:0.653;stroke-linecap:butt;stroke-linejoin:round;stroke-miterlimit:7.4;stroke-opacity:1;paint-order:fill markers stroke"
+       id="rect1"
+       width="164.112"
+       height="54.273098"
+       x="20.990742"
+       y="130.0058"
+       ry="0"
+       inkscape:label="yp-rect" /><rect
+       style="display:inline;fill:#f3d770;fill-opacity:1;stroke:#6d8eb4;stroke-width:0.653;stroke-linecap:butt;stroke-linejoin:round;stroke-miterlimit:7.4;stroke-opacity:1;paint-order:fill markers stroke"
+       id="rect2"
+       width="101.45864"
+       height="41.151588"
+       x="28.1292"
+       y="137.10953"
+       inkscape:label="poky-rect" /><rect
+       style="display:inline;fill:#c0ebf5;fill-opacity:1;stroke:#6d8eb4;stroke-width:0.653;stroke-linecap:butt;stroke-linejoin:round;stroke-miterlimit:7.4;stroke-opacity:1;paint-order:fill markers stroke"
+       id="rect3"
+       width="50.652737"
+       height="53.04562"
+       x="35.516178"
+       y="149.29529"
+       inkscape:label="oe-rect" /><text
+       xml:space="preserve"
+       style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:4.23333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;writing-mode:lr-tb;direction:ltr;text-anchor:start;white-space:pre;inline-size:46.7487;display:inline;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:0;stroke-linecap:butt;stroke-linejoin:round;stroke-miterlimit:7.4;stroke-dasharray:none;stroke-opacity:1;paint-order:fill markers stroke"
+       x="136.38763"
+       y="137.69727"
+       id="text3"
+       inkscape:label="poky-title"
+       transform="matrix(0.90889596,0,0,0.81399719,-26.072941,39.399474)"><tspan
+         x="136.38763"
+         y="137.69727"
+         id="tspan2">Poky</tspan></text><text
+       xml:space="preserve"
+       style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:4.23333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;writing-mode:lr-tb;direction:ltr;text-anchor:start;white-space:pre;inline-size:46.7487;display:inline;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:0;stroke-linecap:butt;stroke-linejoin:round;stroke-miterlimit:7.4;stroke-dasharray:none;stroke-opacity:1;paint-order:fill markers stroke"
+       x="136.38763"
+       y="137.69727"
+       id="text3-8"
+       inkscape:label="oe-title"
+       transform="matrix(0.90889596,0,0,0.81399719,-78.327995,83.175189)"><tspan
+         x="136.38763"
+         y="137.69727"
+         id="tspan4">OpenEmbedded</tspan></text><text
+       xml:space="preserve"
+       style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:4.23333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;writing-mode:lr-tb;direction:ltr;text-anchor:start;white-space:pre;inline-size:46.7487;display:inline;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:0;stroke-linecap:butt;stroke-linejoin:round;stroke-miterlimit:7.4;stroke-dasharray:none;stroke-opacity:1;paint-order:fill markers stroke"
+       x="136.38763"
+       y="137.69727"
+       id="text3-0"
+       inkscape:label="yp-title"
+       transform="matrix(0.8469291,0,0,0.81399719,21.497595,28.033837)"><tspan
+         x="136.38763"
+         y="137.69727"
+         id="tspan5">YOCTO PROJECT (YP)</tspan></text><text
+       xml:space="preserve"
+       style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:2.98347px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;writing-mode:lr-tb;direction:ltr;text-anchor:start;display:inline;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:0;stroke-linecap:butt;stroke-linejoin:round;stroke-miterlimit:7.4;stroke-dasharray:none;stroke-opacity:1;paint-order:fill markers stroke"
+       x="137.19444"
+       y="150.50006"
+       id="text4"
+       transform="scale(1.0050579,0.9949676)"
+       inkscape:label="yp-text"><tspan
+         sodipodi:role="line"
+         id="tspan3"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:2.98347px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;stroke-width:0"
+         x="137.19444"
+         y="150.50006">Umbrella Open Source Project</tspan><tspan
+         sodipodi:role="line"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:2.98347px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;stroke-width:0"
+         x="137.19444"
+         y="154.2294"
+         id="tspan6">that Builds and Maintains</tspan><tspan
+         sodipodi:role="line"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:2.98347px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;stroke-width:0"
+         x="137.19444"
+         y="157.95874"
+         id="tspan7">Validated Open Source Tools and</tspan><tspan
+         sodipodi:role="line"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:2.98347px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;stroke-width:0"
+         x="137.19444"
+         y="161.68808"
+         id="tspan8">Components Associated with</tspan><tspan
+         sodipodi:role="line"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:2.98347px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;stroke-width:0"
+         x="137.19444"
+         y="165.4174"
+         id="tspan9">Embedded Linux</tspan></text><text
+       xml:space="preserve"
+       style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:2.97078px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;writing-mode:lr-tb;direction:ltr;text-anchor:start;display:inline;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:0;stroke-linecap:butt;stroke-linejoin:round;stroke-miterlimit:7.4;stroke-dasharray:none;stroke-opacity:1;paint-order:fill markers stroke"
+       x="90.582634"
+       y="159.10139"
+       id="text10"
+       transform="scale(1.0018079,0.9981954)"
+       inkscape:label="poky-text"><tspan
+         sodipodi:role="line"
+         id="tspan10"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:2.97078px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;stroke-width:0"
+         x="90.582634"
+         y="159.10139">Yocto Project Open</tspan><tspan
+         sodipodi:role="line"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:2.97078px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;stroke-width:0"
+         x="90.582634"
+         y="162.81487"
+         id="tspan11">Source Reference</tspan><tspan
+         sodipodi:role="line"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:2.97078px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;stroke-width:0"
+         x="90.582634"
+         y="166.52835"
+         id="tspan12">Embedded Distribution</tspan></text><text
+       xml:space="preserve"
+       style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:3.01677px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;writing-mode:lr-tb;direction:ltr;text-anchor:start;display:inline;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:0;stroke-linecap:butt;stroke-linejoin:round;stroke-miterlimit:7.4;stroke-dasharray:none;stroke-opacity:1;paint-order:fill markers stroke"
+       x="40.36692"
+       y="160.98824"
+       id="text13"
+       transform="scale(0.99784993,1.0021547)"
+       inkscape:label="oe-text"><tspan
+         sodipodi:role="line"
+         id="tspan13"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:3.01677px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;stroke-width:0"
+         x="40.36692"
+         y="160.98824">Open Source Build Engine</tspan><tspan
+         sodipodi:role="line"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:3.01677px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;stroke-width:0"
+         x="40.36692"
+         y="164.7592"
+         id="tspan14">and YP-Compatible Metadata</tspan><tspan
+         sodipodi:role="line"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:3.01677px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;stroke-width:0"
+         x="40.36692"
+         y="168.53017"
+         id="tspan15">for Embedded Linux</tspan></text></g></svg>
diff --git a/documentation/overview-manual/yp-intro.rst b/documentation/overview-manual/yp-intro.rst
index 8fa17b191..9e79ccf24 100644
--- a/documentation/overview-manual/yp-intro.rst
+++ b/documentation/overview-manual/yp-intro.rst
@@ -23,7 +23,7 @@ comes to delivering embedded software stacks. The project allows
 software customizations and build interchange for multiple hardware
 platforms as well as software stacks that can be maintained and scaled.
 
-.. image:: figures/key-dev-elements.png
+.. image:: svg/key-dev-elements.*
     :width: 100%
 
 For further introductory information on the Yocto Project, you might be

---
base-commit: 8b85245490ae0b19a9c3880ec31e55b42e19d094
change-id: 20251029-overview-typo-e0d8c3cd4b9c

Best regards,
-- 
Quentin Schulz <quentin.schulz@cherry.de>


