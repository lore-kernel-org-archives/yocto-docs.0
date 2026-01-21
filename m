Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A82CC4453D
	for <webhook@archiver.kernel.org>; Wed, 21 Jan 2026 13:32:12 +0000 (UTC)
Received: from smtp-bc08.mail.infomaniak.ch (smtp-bc08.mail.infomaniak.ch [45.157.188.8])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11830.1769002321490402801
 for <docs@lists.yoctoproject.org>;
 Wed, 21 Jan 2026 05:32:02 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 45.157.188.8, mailfrom: foss+yocto@0leil.net)
Received: from smtp-3-0000.mail.infomaniak.ch (unknown [IPv6:2001:1600:4:17::246b])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4dx4qM5H5pz329;
	Wed, 21 Jan 2026 14:31:59 +0100 (CET)
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4dx4qM1vZYzx9y;
	Wed, 21 Jan 2026 14:31:59 +0100 (CET)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Wed, 21 Jan 2026 14:31:49 +0100
Subject: [PATCH v2 08/12] sdk-manual: replace sdk-environment PNG with SVG
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260121-code-block-misc-20260114-v2-8-fdd4bb5c2e68@cherry.de>
References: <20260121-code-block-misc-20260114-v2-0-fdd4bb5c2e68@cherry.de>
In-Reply-To: <20260121-code-block-misc-20260114-v2-0-fdd4bb5c2e68@cherry.de>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.3
X-Infomaniak-Routing: alpha
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 21 Jan 2026 13:32:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8620

From: Quentin Schulz <quentin.schulz@cherry.de>

This replaces the PNG figure with an SVG.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 .../sdk-manual/figures/sdk-environment.png         | Bin 42098 -> 0 bytes
 documentation/sdk-manual/intro.rst                 |   2 +-
 documentation/sdk-manual/svg/sdk-environment.svg   | 463 +++++++++++++++++++++
 3 files changed, 464 insertions(+), 1 deletion(-)

diff --git a/documentation/sdk-manual/figures/sdk-environment.png b/documentation/sdk-manual/figures/sdk-environment.png
deleted file mode 100644
index 78b8cad39e38e7cba2c25a9f035f0bbfcb022fee..0000000000000000000000000000000000000000
GIT binary patch
literal 0
HcmV?d00001

literal 42098
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

diff --git a/documentation/sdk-manual/intro.rst b/documentation/sdk-manual/intro.rst
index fbfc8c2ac..c96e58dd7 100644
--- a/documentation/sdk-manual/intro.rst
+++ b/documentation/sdk-manual/intro.rst
@@ -148,7 +148,7 @@ SDK Development Model
 
 Fundamentally, the SDK fits into the development process as follows:
 
-.. image:: figures/sdk-environment.png
+.. image:: svg/sdk-environment.*
    :width: 100%
 
 The SDK is installed on any machine and can be used to develop applications,
diff --git a/documentation/sdk-manual/svg/sdk-environment.svg b/documentation/sdk-manual/svg/sdk-environment.svg
new file mode 100644
index 000000000..ca9894029
--- /dev/null
+++ b/documentation/sdk-manual/svg/sdk-environment.svg
@@ -0,0 +1,463 @@
+<?xml version="1.0" encoding="UTF-8" standalone="no"?>
+<!-- Created with Inkscape (http://www.inkscape.org/) -->
+
+<svg
+   width="152.07843mm"
+   height="104.79381mm"
+   viewBox="0 0 152.07843 104.79381"
+   version="1.1"
+   id="svg1"
+   xml:space="preserve"
+   inkscape:version="1.4.3 (0d15f75042, 2025-12-25)"
+   sodipodi:docname="sdk-environment.svg"
+   xmlns:inkscape="http://www.inkscape.org/namespaces/inkscape"
+   xmlns:sodipodi="http://sodipodi.sourceforge.net/DTD/sodipodi-0.dtd"
+   xmlns="http://www.w3.org/2000/svg"
+   xmlns:svg="http://www.w3.org/2000/svg"><sodipodi:namedview
+     id="namedview1"
+     pagecolor="#ffffff"
+     bordercolor="#000000"
+     borderopacity="0.25"
+     inkscape:showpageshadow="2"
+     inkscape:pageopacity="0.0"
+     inkscape:pagecheckerboard="0"
+     inkscape:deskcolor="#d1d1d1"
+     inkscape:document-units="mm"
+     inkscape:zoom="1.7923962"
+     inkscape:cx="323.86813"
+     inkscape:cy="222.32808"
+     inkscape:window-width="2560"
+     inkscape:window-height="1440"
+     inkscape:window-x="0"
+     inkscape:window-y="0"
+     inkscape:window-maximized="0"
+     inkscape:current-layer="layer2" /><defs
+     id="defs1"><marker
+       style="overflow:visible"
+       id="marker27"
+       refX="0"
+       refY="0"
+       orient="auto-start-reverse"
+       inkscape:stockid="Triangle arrow"
+       markerWidth="1.5"
+       markerHeight="1"
+       viewBox="0 0 1 1"
+       inkscape:isstock="true"
+       inkscape:collect="always"
+       preserveAspectRatio="none"><path
+         transform="scale(0.5)"
+         style="fill:context-stroke;fill-rule:evenodd;stroke:context-stroke;stroke-width:1pt"
+         d="M 5.77,0 -2.88,5 V -5 Z"
+         id="path27" /></marker><marker
+       style="overflow:visible"
+       id="marker24"
+       refX="0"
+       refY="0"
+       orient="auto-start-reverse"
+       inkscape:stockid="Triangle arrow"
+       markerWidth="1.5"
+       markerHeight="1"
+       viewBox="0 0 1 1"
+       inkscape:isstock="true"
+       inkscape:collect="always"
+       preserveAspectRatio="none"><path
+         transform="scale(0.5)"
+         style="fill:context-stroke;fill-rule:evenodd;stroke:context-stroke;stroke-width:1pt"
+         d="M 5.77,0 -2.88,5 V -5 Z"
+         id="path24" /></marker><marker
+       style="overflow:visible"
+       id="Triangle"
+       refX="-1"
+       refY="0"
+       orient="auto-start-reverse"
+       inkscape:stockid="Triangle arrow"
+       markerWidth="0.25"
+       markerHeight="0.44999999"
+       viewBox="0 0 1 1"
+       inkscape:isstock="true"
+       inkscape:collect="always"
+       preserveAspectRatio="none"
+       markerUnits="strokeWidth"><path
+         transform="scale(0.5)"
+         style="fill:context-stroke;fill-rule:evenodd;stroke:context-stroke;stroke-width:1pt"
+         d="M 5.77,0 -2.88,5 V -5 Z"
+         id="path135" /></marker></defs><g
+     inkscape:groupmode="layer"
+     id="layer2"
+     inkscape:label="Layer 2"
+     style="display:inline"
+     transform="translate(-15.261151,-139.49913)"><g
+       id="g5"
+       inkscape:label="yp-machine"><rect
+         style="display:inline;fill:#7399cb;fill-opacity:1;stroke:#4d6fad;stroke-width:0.4;stroke-linecap:round;stroke-linejoin:round;stroke-dasharray:none;stroke-opacity:1"
+         id="rect1"
+         width="79.70993"
+         height="38.067791"
+         x="15.552484"
+         y="150.90607"
+         inkscape:label="yp-machine-rect" /><text
+         xml:space="preserve"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:3.52777px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;writing-mode:lr-tb;direction:ltr;display:inline;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:0;stroke-linecap:round;stroke-linejoin:round;stroke-dasharray:none;stroke-opacity:1"
+         x="19.153561"
+         y="161.57883"
+         id="text3"
+         inkscape:label="yp-machine-rect-hosts-yp-text"><tspan
+           sodipodi:role="line"
+           id="tspan3"
+           style="stroke-width:0"
+           x="19.153561"
+           y="161.57883">Hosts Yocto Project</tspan></text><text
+         xml:space="preserve"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:3.52777px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;writing-mode:lr-tb;direction:ltr;display:inline;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:0;stroke-linecap:round;stroke-linejoin:round;stroke-dasharray:none;stroke-opacity:1"
+         x="19.240089"
+         y="166.77032"
+         id="text3-0"
+         inkscape:label="yp-machine-rect-host-sdk-text"><tspan
+           sodipodi:role="line"
+           id="tspan3-5"
+           style="stroke-width:0"
+           x="19.240089"
+           y="166.77032">Can Host an SDK</tspan></text><text
+         xml:space="preserve"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:3.52777px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;writing-mode:lr-tb;direction:ltr;display:inline;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:0;stroke-linecap:round;stroke-linejoin:round;stroke-dasharray:none;stroke-opacity:1"
+         x="19.36305"
+         y="171.6631"
+         id="text3-0-3"
+         inkscape:label="yp-machine-rect-build-sdk-text"><tspan
+           sodipodi:role="line"
+           id="tspan3-5-3"
+           style="stroke-width:0"
+           x="19.36305"
+           y="171.6631">Can Build an SDK</tspan></text><text
+         xml:space="preserve"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:3.52777px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;writing-mode:lr-tb;direction:ltr;display:inline;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:0;stroke-linecap:round;stroke-linejoin:round;stroke-dasharray:none;stroke-opacity:1"
+         x="19.291393"
+         y="176.81357"
+         id="text3-0-3-3"
+         inkscape:label="yp-machine-rect-build-img-text"><tspan
+           sodipodi:role="line"
+           id="tspan3-5-3-4"
+           style="stroke-width:0"
+           x="19.291393"
+           y="176.81357">Can Build an Image</tspan></text><text
+         xml:space="preserve"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:3.52777px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;writing-mode:lr-tb;direction:ltr;display:inline;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:0;stroke-linecap:round;stroke-linejoin:round;stroke-dasharray:none;stroke-opacity:1"
+         x="19.267235"
+         y="181.81523"
+         id="text3-0-3-3-8"
+         inkscape:label="yp-machine-rect-build-app-text"><tspan
+           sodipodi:role="line"
+           id="tspan3-5-3-4-1"
+           style="stroke-width:0"
+           x="19.267235"
+           y="181.81523">Can Build an Application</tspan></text><text
+         xml:space="preserve"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:3.93636px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;writing-mode:lr-tb;direction:ltr;display:inline;fill:#000000;fill-opacity:1;stroke:#4d6fad;stroke-width:0;stroke-linecap:round;stroke-linejoin:round;stroke-dasharray:none;stroke-opacity:1"
+         x="15.660255"
+         y="155.1917"
+         id="text2"
+         inkscape:label="yp-machine-text"
+         transform="scale(1.0510998,0.95138443)"><tspan
+           id="tspan2"
+           style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:3.93636px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;fill:#000000;stroke:#000000;stroke-width:0;stroke-dasharray:none;stroke-opacity:1"
+           x="15.660255"
+           y="155.1917"
+           sodipodi:role="line">Yocto Project Machine</tspan></text></g><g
+       id="g7"
+       inkscape:label="target-hw"><rect
+         style="display:inline;fill:#ff8e98;fill-opacity:1;stroke:#4d6fad;stroke-width:0.4;stroke-linecap:round;stroke-linejoin:round;stroke-dasharray:none;stroke-opacity:1"
+         id="rect5"
+         width="54.540253"
+         height="21.210974"
+         x="15.461151"
+         y="222.88196"
+         inkscape:label="target-hw-rect" /><text
+         xml:space="preserve"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:3.52777px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;writing-mode:lr-tb;direction:ltr;display:inline;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:0;stroke-linecap:round;stroke-linejoin:round;stroke-dasharray:none;stroke-opacity:1"
+         x="19.230175"
+         y="229.96002"
+         id="text3-0-3-3-8-6"
+         inkscape:label="target-hw-rect-boot-run-app-text"><tspan
+           sodipodi:role="line"
+           id="tspan3-5-3-4-1-7"
+           style="stroke-width:0"
+           x="19.230175"
+           y="229.96002">Boots and Runs Images</tspan></text><text
+         xml:space="preserve"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:3.52777px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;writing-mode:lr-tb;direction:ltr;display:inline;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:0;stroke-linecap:round;stroke-linejoin:round;stroke-dasharray:none;stroke-opacity:1"
+         x="19.216074"
+         y="235.00998"
+         id="text3-0-3-3-8-6-3"
+         inkscape:label="target-hw-rect-rt-debug-text"><tspan
+           sodipodi:role="line"
+           id="tspan3-5-3-4-1-7-7"
+           style="stroke-width:0"
+           x="19.216074"
+           y="235.00998">Real Time Debugging</tspan></text><text
+         xml:space="preserve"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:3.52777px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;writing-mode:lr-tb;direction:ltr;display:inline;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:0;stroke-linecap:round;stroke-linejoin:round;stroke-dasharray:none;stroke-opacity:1"
+         x="19.318588"
+         y="239.95505"
+         id="text3-0-3-3-8-6-3-1"
+         inkscape:label="target-hw-rect-run-apps-text"><tspan
+           sodipodi:role="line"
+           id="tspan3-5-3-4-1-7-7-0"
+           style="stroke-width:0"
+           x="19.318588"
+           y="239.95505">Runs Applications</tspan></text><text
+         xml:space="preserve"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:3.85198px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;writing-mode:lr-tb;direction:ltr;display:inline;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:0;stroke-linecap:round;stroke-linejoin:round;stroke-dasharray:none;stroke-opacity:1"
+         x="15.431406"
+         y="240.36668"
+         id="text5"
+         transform="scale(1.0919034,0.9158319)"
+         inkscape:label="target-hw-text"><tspan
+           sodipodi:role="line"
+           id="tspan5"
+           style="stroke-width:0"
+           x="15.431406"
+           y="240.36668">Target Hardware</tspan></text></g><g
+       id="g22"
+       inkscape:label="sdk-machine-bot"
+       transform="translate(-0.02339256,71.952437)"
+       style="display:inline"><rect
+         style="display:inline;opacity:1;fill:#bcff75;fill-opacity:1;stroke:#4d6fad;stroke-width:0.4;stroke-linecap:round;stroke-linejoin:round;stroke-dasharray:none;stroke-opacity:1"
+         id="rect18"
+         width="35.780399"
+         height="24.143047"
+         x="131.34613"
+         y="144.82916"
+         inkscape:label="sdk-machine-rect" /><text
+         xml:space="preserve"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:3.52777px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;writing-mode:lr-tb;direction:ltr;display:inline;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:0;stroke-linecap:round;stroke-linejoin:round;stroke-dasharray:none;stroke-opacity:1"
+         x="135.18832"
+         y="163.78954"
+         id="text19"
+         inkscape:label="sdk-machine-rect-host-sdk-text"><tspan
+           sodipodi:role="line"
+           id="tspan19"
+           style="stroke-width:0"
+           x="135.18832"
+           y="163.78954">Hosts an SDK</tspan></text><text
+         xml:space="preserve"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:3.52777px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;writing-mode:lr-tb;direction:ltr;display:inline;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:0;stroke-linecap:round;stroke-linejoin:round;stroke-dasharray:none;stroke-opacity:1"
+         x="135.28667"
+         y="158.73506"
+         id="text20"
+         inkscape:label="sdk-machine-rect-dbg-text"><tspan
+           sodipodi:role="line"
+           id="tspan20"
+           style="stroke-width:0"
+           x="135.28667"
+           y="158.73506">Debug Code</tspan></text><text
+         xml:space="preserve"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:3.52777px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;writing-mode:lr-tb;direction:ltr;display:inline;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:0;stroke-linecap:round;stroke-linejoin:round;stroke-dasharray:none;stroke-opacity:1"
+         x="135.0829"
+         y="153.75328"
+         id="text21"
+         inkscape:label="sdk-machine-rect-compile-text"><tspan
+           sodipodi:role="line"
+           id="tspan21"
+           style="stroke-width:0"
+           x="135.0829"
+           y="153.75328">Compile Code</tspan></text><text
+         xml:space="preserve"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:3.8036px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;writing-mode:lr-tb;direction:ltr;display:inline;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:0;stroke-linecap:round;stroke-linejoin:round;stroke-dasharray:none;stroke-opacity:1"
+         x="123.12138"
+         y="153.16264"
+         id="text22"
+         transform="scale(1.0781897,0.92748058)"
+         inkscape:label="sdk-machine-text"><tspan
+           sodipodi:role="line"
+           id="tspan22"
+           style="stroke-width:0"
+           x="123.12138"
+           y="153.16264">SDK Machine</tspan></text></g><g
+       id="g11"
+       inkscape:label="sdk-machine-mid"
+       transform="translate(0.01304739,36.040971)"
+       style="display:inline"><rect
+         style="display:inline;opacity:1;fill:#bcff75;fill-opacity:1;stroke:#4d6fad;stroke-width:0.4;stroke-linecap:round;stroke-linejoin:round;stroke-dasharray:none;stroke-opacity:1"
+         id="rect8"
+         width="35.780399"
+         height="24.143047"
+         x="131.34613"
+         y="144.82916"
+         inkscape:label="sdk-machine-rect" /><text
+         xml:space="preserve"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:3.52777px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;writing-mode:lr-tb;direction:ltr;display:inline;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:0;stroke-linecap:round;stroke-linejoin:round;stroke-dasharray:none;stroke-opacity:1"
+         x="135.18832"
+         y="163.78954"
+         id="text8"
+         inkscape:label="sdk-machine-rect-host-sdk-text"><tspan
+           sodipodi:role="line"
+           id="tspan8"
+           style="stroke-width:0"
+           x="135.18832"
+           y="163.78954">Hosts an SDK</tspan></text><text
+         xml:space="preserve"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:3.52777px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;writing-mode:lr-tb;direction:ltr;display:inline;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:0;stroke-linecap:round;stroke-linejoin:round;stroke-dasharray:none;stroke-opacity:1"
+         x="135.28667"
+         y="158.73506"
+         id="text9"
+         inkscape:label="sdk-machine-rect-dbg-text"><tspan
+           sodipodi:role="line"
+           id="tspan9"
+           style="stroke-width:0"
+           x="135.28667"
+           y="158.73506">Debug Code</tspan></text><text
+         xml:space="preserve"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:3.52777px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;writing-mode:lr-tb;direction:ltr;display:inline;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:0;stroke-linecap:round;stroke-linejoin:round;stroke-dasharray:none;stroke-opacity:1"
+         x="135.0829"
+         y="153.75328"
+         id="text10"
+         inkscape:label="sdk-machine-rect-compile-text"><tspan
+           sodipodi:role="line"
+           id="tspan10"
+           style="stroke-width:0"
+           x="135.0829"
+           y="153.75328">Compile Code</tspan></text><text
+         xml:space="preserve"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:3.8036px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;writing-mode:lr-tb;direction:ltr;display:inline;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:0;stroke-linecap:round;stroke-linejoin:round;stroke-dasharray:none;stroke-opacity:1"
+         x="123.12138"
+         y="153.16264"
+         id="text11"
+         transform="scale(1.0781897,0.92748058)"
+         inkscape:label="sdk-machine-text"><tspan
+           sodipodi:role="line"
+           id="tspan11"
+           style="stroke-width:0"
+           x="123.12138"
+           y="153.16264">SDK Machine</tspan></text></g><g
+       id="g18"
+       inkscape:label="sdk-machine-top"
+       style="display:inline"><rect
+         style="display:inline;opacity:1;fill:#bcff75;fill-opacity:1;stroke:#4d6fad;stroke-width:0.4;stroke-linecap:round;stroke-linejoin:round;stroke-dasharray:none;stroke-opacity:1"
+         id="rect15"
+         width="35.780399"
+         height="24.143047"
+         x="131.34613"
+         y="144.82916"
+         inkscape:label="sdk-machine-rect" /><text
+         xml:space="preserve"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:3.52777px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;writing-mode:lr-tb;direction:ltr;display:inline;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:0;stroke-linecap:round;stroke-linejoin:round;stroke-dasharray:none;stroke-opacity:1"
+         x="135.18832"
+         y="163.78954"
+         id="text15"
+         inkscape:label="sdk-machine-rect-host-sdk-text"><tspan
+           sodipodi:role="line"
+           id="tspan15"
+           style="stroke-width:0"
+           x="135.18832"
+           y="163.78954">Hosts an SDK</tspan></text><text
+         xml:space="preserve"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:3.52777px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;writing-mode:lr-tb;direction:ltr;display:inline;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:0;stroke-linecap:round;stroke-linejoin:round;stroke-dasharray:none;stroke-opacity:1"
+         x="135.28667"
+         y="158.73506"
+         id="text16"
+         inkscape:label="sdk-machine-rect-dbg-text"><tspan
+           sodipodi:role="line"
+           id="tspan16"
+           style="stroke-width:0"
+           x="135.28667"
+           y="158.73506">Debug Code</tspan></text><text
+         xml:space="preserve"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:3.52777px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;writing-mode:lr-tb;direction:ltr;display:inline;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:0;stroke-linecap:round;stroke-linejoin:round;stroke-dasharray:none;stroke-opacity:1"
+         x="135.0829"
+         y="153.75328"
+         id="text17"
+         inkscape:label="sdk-machine-rect-compile-text"><tspan
+           sodipodi:role="line"
+           id="tspan17"
+           style="stroke-width:0"
+           x="135.0829"
+           y="153.75328">Compile Code</tspan></text><text
+         xml:space="preserve"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:3.8036px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;writing-mode:lr-tb;direction:ltr;display:inline;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:0;stroke-linecap:round;stroke-linejoin:round;stroke-dasharray:none;stroke-opacity:1"
+         x="123.12138"
+         y="153.16264"
+         id="text18"
+         transform="scale(1.0781897,0.92748058)"
+         inkscape:label="sdk-machine-text"><tspan
+           sodipodi:role="line"
+           id="tspan18"
+           style="stroke-width:0"
+           x="123.12138"
+           y="153.16264">SDK Machine</tspan></text></g><g
+       id="g24"
+       inkscape:label="deploy"><text
+         xml:space="preserve"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:3.52777px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;writing-mode:lr-tb;direction:ltr;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:0;stroke-linecap:round;stroke-linejoin:round;stroke-dasharray:none;stroke-opacity:1"
+         x="67.689835"
+         y="202.65199"
+         id="text4"
+         inkscape:label="deploy-text"><tspan
+           sodipodi:role="line"
+           id="tspan4"
+           style="stroke-width:0"
+           x="67.689835"
+           y="202.65199">Deploy</tspan></text><path
+         style="opacity:1;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:6;stroke-linecap:square;stroke-linejoin:round;stroke-dasharray:none;stroke-opacity:1;marker-end:url(#Triangle)"
+         d="m 61.112324,191.97241 -0.104376,23.8825"
+         id="path22"
+         sodipodi:nodetypes="cc"
+         inkscape:label="arrow-deploy" /></g><g
+       id="g27"
+       inkscape:label="objects-bot"
+       style="display:inline"><text
+         xml:space="preserve"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:3.55315px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;writing-mode:lr-tb;direction:ltr;display:inline;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:0;stroke-linecap:round;stroke-linejoin:round;stroke-dasharray:none;stroke-opacity:1"
+         x="112.58056"
+         y="228.37267"
+         id="text4-0-7-2"
+         inkscape:label="objects-text"
+         transform="scale(1.0071938,0.99285757)"><tspan
+           sodipodi:role="line"
+           id="tspan4-7-2-7"
+           style="stroke-width:0"
+           x="112.58056"
+           y="228.37267">Objects</tspan></text><path
+         style="opacity:1;fill:none;fill-opacity:1;stroke:#000000;stroke-width:0.799999;stroke-linecap:square;stroke-linejoin:round;stroke-dasharray:none;stroke-opacity:1;marker-end:url(#marker27)"
+         d="m 130.78047,228.73371 -20.13864,0.0652 0.10438,-43.68265 -10.933713,-0.10439"
+         id="path26"
+         sodipodi:nodetypes="cccc"
+         inkscape:label="arrow" /></g><g
+       id="g26"
+       style="display:inline"
+       inkscape:label="objects-mid"><text
+         xml:space="preserve"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:3.56577px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;writing-mode:lr-tb;direction:ltr;display:inline;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:0;stroke-linecap:round;stroke-linejoin:round;stroke-dasharray:none;stroke-opacity:1"
+         x="104.3705"
+         y="170.58327"
+         id="text4-0-7"
+         inkscape:label="objects-text"
+         transform="scale(1.0107715,0.98934328)"><tspan
+           sodipodi:role="line"
+           id="tspan4-7-2"
+           style="stroke-width:0"
+           x="104.3705"
+           y="170.58327">Objects</tspan></text><path
+         style="display:inline;opacity:1;fill:none;fill-opacity:1;stroke:#000000;stroke-width:0.8;stroke-linecap:square;stroke-linejoin:round;stroke-dasharray:none;stroke-opacity:1;marker-end:url(#marker24)"
+         d="m 130.9339,191.93551 -11.2556,-0.0369 0.18452,-21.88383 -20.038641,0.18453"
+         id="path25"
+         sodipodi:nodetypes="cccc"
+         inkscape:label="arrow" /></g><g
+       id="g25"
+       inkscape:label="objects-top"><text
+         xml:space="preserve"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:3.55676px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;writing-mode:lr-tb;direction:ltr;display:inline;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:0;stroke-linecap:round;stroke-linejoin:round;stroke-dasharray:none;stroke-opacity:1"
+         x="104.78993"
+         y="157.1425"
+         id="text4-0"
+         inkscape:label="objects-text"
+         transform="scale(1.0082173,0.99184966)"><tspan
+           sodipodi:role="line"
+           id="tspan4-7"
+           style="stroke-width:0"
+           x="104.78993"
+           y="157.1425">Objects</tspan></text><path
+         style="opacity:1;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:0.9;stroke-linecap:square;stroke-linejoin:round;stroke-dasharray:none;stroke-opacity:1;marker-end:url(#marker24)"
+         d="m 130.91375,157.65432 -30.64596,-0.24975"
+         id="path23"
+         sodipodi:nodetypes="cc"
+         inkscape:label="arrow" /></g></g></svg>

-- 
2.52.0


