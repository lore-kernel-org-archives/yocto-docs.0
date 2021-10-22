Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16C16C433EF
	for <webhook@archiver.kernel.org>; Fri, 22 Oct 2021 16:28:19 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web09.10698.1634920096824271841
 for <docs@lists.yoctoproject.org>;
 Fri, 22 Oct 2021 09:28:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 9DEC1FF808;
	Fri, 22 Oct 2021 16:28:02 +0000 (UTC)
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] Start of documentation standards document
Date: Fri, 22 Oct 2021 18:28:00 +0200
Message-Id: <20211022162800.34264-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <16B066E2318ACB13.32124@lists.yoctoproject.org>
References: <16B066E2318ACB13.32124@lists.yoctoproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 22 Oct 2021 16:28:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2044

This first version specifies how to create consistent SGV graphics

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 README                              |    6 +
 documentation/README                |   13 +-
 documentation/standards.md          |  103 +++
 documentation/template/template.svg | 1160 +++++++++++++++++++++++++++
 4 files changed, 1279 insertions(+), 3 deletions(-)
 create mode 100644 documentation/standards.md
 create mode 100644 documentation/template/template.svg

diff --git a/README b/README
index b3836baba0..4f95342042 100644
--- a/README
+++ b/README
@@ -7,6 +7,12 @@ Project components. In particular see the README under doc=
umentation/.
 An online version of the documentation can be found at:
     https://docs.yoctoproject.org
=20
+Contributing
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+Read the documentation/standards.md file which specifies some rules
+to follow when contributing to the documentation.
+
 Where to Send Patches
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
diff --git a/documentation/README b/documentation/README
index 2d9eb887b2..fccece0c9e 100644
--- a/documentation/README
+++ b/documentation/README
@@ -56,9 +56,16 @@ poky.yaml
 This file defines variables used for documentation production.  The variab=
les
 are used to define release pathnames, URLs for the published manuals, etc.
=20
-template
-=3D=3D=3D=3D=3D=3D=3D=3D
-Contains various templates, fonts, and some old PNG files.
+standards.md
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+This file specifies some rules to follow when contributing to the document=
ation.
+
+template/
+=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+Contains a template.svg, to make it easier to create consistent
+SVG diagrams.
=20
 Sphinx
 =3D=3D=3D=3D=3D=3D
diff --git a/documentation/standards.md b/documentation/standards.md
new file mode 100644
index 0000000000..a2274f6d6e
--- /dev/null
+++ b/documentation/standards.md
@@ -0,0 +1,103 @@
+# Standards for contributing to Yocto Project documentation
+
+This document attemps to standardize the way the Yocto Project
+documentation is created.
+
+It is currently a work in progress.
+
+## Text standards
+
+This section has not been filled yet
+
+## ReStructured Text Syntax standards
+
+This section has not been filled yet
+
+## Adding screenshots
+
+The preferred format for adding screenshots is
+[Portable Network Graphics (PNG)](https://en.wikipedia.org/wiki/Portable_N=
etwork_Graphics).
+Compared to the JPEG format, PNG is lossless and compresses screenshots be=
tter.
+
+Screenshots are stored in a `figures/` subdirectory.
+
+To include a screenshot in PNG format:
+
+    .. image:: figures/user-configuration.png
+       :align: center
+
+Depending on the size of the image, you may also shrink it
+to prevent it from filling the whole page width:
+
+       :scale: 50%
+
+For some types of screenshots, for example showing
+programs displaying photographs or playing video, the JPEG
+format may be more appropriate, because it is better at
+compressing real-life images:
+
+    .. image:: figures/vlc.jpg
+       :align: center
+       :scale: 75%
+
+## Adding new diagrams
+
+New diagrams should be added in
+[Scalable Vector Graphics (SVG) format](https://en.wikipedia.org/wiki/Scal=
able_Vector_Graphics).
+Thanks to this, diagrams render nicely at any zoom level on generated docu=
mentation,
+instead of being pixelated.
+
+The recommended tool for creating SVG diagrams for the Yocto Project
+documentation is [Inkscape](https://inkscape.org/).
+
+### Colors
+
+The "GNOME HIG Colors" palette is used in our diagrams
+(get it from <https://gitlab.gnome.org/Teams/Design/HIG-app-icons/-/blob/m=
aster/GNOME%20HIG.gpl>
+if you don't get it from Inkscape).
+
+It's easier to use than the default one in Inkscape,
+as it has fewer but sufficient colors. This is a way
+to guarantee that we use consistent colors across the
+diagrams used in our documentation.
+
+See <https://inkscape-manuals.readthedocs.io/en/latest/palette.html>
+for details about working with color palettes in Inkscape.
+
+### Template diagram
+
+The `template/` directory contains a `template.svg` file
+to make it easier to create diagrams.
+In particular, you can use it to copy standard text, shapes,
+arrows and clipart to the new SVG document.
+
+### Fonts
+
+The recommended font for description text and labels is `Nimbus Roman`, si=
ze 10.
+Labels are in bold.
+
+`template.svg` contains ready-to-copy labels.
+
+### Text boxes
+
+Text boxes are rectangle boxes, with rounded corners, and contain centered=
 text
+or labels. Their stroke color is slightly darker than their fill color.
+
+See `template.svg` for example boxes with different colors, which are ready
+to be reused.
+
+### Clipart
+
+Only [Public Domain](https://en.wikipedia.org/wiki/Public_domain)
+files are accepted for clipart. [Openclipart](https://openclipart.org)
+is the best known and recommended source of such clipart.
+
+It is also required to state the source of each new clipart in the commit =
log,
+to make it possible to check its origin.
+
+For the sake of consistency across diagrams, we recommend
+to use existing cliparts, whenever possible.
+
+If cliparts in `template.svg` do not satisfy your requirements, you can
+add to said file new cliparts, from e.g. Openclipart. Newly added
+cliparts shall stay consistent in style and color with existing ones.
diff --git a/documentation/template/template.svg b/documentation/template/t=
emplate.svg
new file mode 100644
index 0000000000..43043e3afb
--- /dev/null
+++ b/documentation/template/template.svg
@@ -0,0 +1,1160 @@
+<?xml version=3D"1.0" encoding=3D"UTF-8" standalone=3D"no"?>
+<svg
+   version=3D"1.1"
+   id=3D"svg2"
+   width=3D"607.31354"
+   height=3D"968.48285"
+   viewBox=3D"0 0 607.31353 968.48285"
+   sodipodi:docname=3D"template.svg"
+   inkscape:version=3D"1.1 (ce6663b3b7, 2021-05-25)"
+   xmlns:inkscape=3D"http://www.inkscape.org/namespaces/inkscape"
+   xmlns:sodipodi=3D"http://sodipodi.sourceforge.net/DTD/sodipodi-0.dtd"
+   xmlns:xlink=3D"http://www.w3.org/1999/xlink"
+   xmlns=3D"http://www.w3.org/2000/svg"
+   xmlns:svg=3D"http://www.w3.org/2000/svg"
+   xmlns:rdf=3D"http://www.w3.org/1999/02/22-rdf-syntax-ns#"
+   xmlns:cc=3D"http://creativecommons.org/ns#"
+   xmlns:dc=3D"http://purl.org/dc/elements/1.1/">
+  <metadata
+     id=3D"metadata8">
+    <rdf:RDF>
+      <cc:Work
+         rdf:about=3D"">
+        <dc:format>image/svg+xml</dc:format>
+        <dc:type
+           rdf:resource=3D"http://purl.org/dc/dcmitype/StillImage" />
+      </cc:Work>
+    </rdf:RDF>
+  </metadata>
+  <defs
+     id=3D"defs6">
+    <inkscape:path-effect
+       effect=3D"powerstroke"
+       id=3D"path-effect6121"
+       is_visible=3D"true"
+       lpeversion=3D"1"
+       offset_points=3D"0,0.5"
+       sort_points=3D"true"
+       interpolator_type=3D"CubicBezierJohan"
+       interpolator_beta=3D"0.2"
+       start_linecap_type=3D"zerowidth"
+       linejoin_type=3D"extrp_arc"
+       miter_limit=3D"4"
+       scale_width=3D"1"
+       end_linecap_type=3D"zerowidth"
+       not_jump=3D"false" />
+    <marker
+       style=3D"overflow:visible"
+       id=3D"marker5783"
+       refX=3D"0"
+       refY=3D"0"
+       orient=3D"auto"
+       inkscape:stockid=3D"Arrow2Mend"
+       inkscape:isstock=3D"true">
+      <path
+         transform=3D"scale(-0.6)"
+         d=3D"M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.001=
7078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style=3D"fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#00=
0000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id=3D"path5781" />
+    </marker>
+    <marker
+       style=3D"overflow:visible"
+       id=3D"marker5623"
+       refX=3D"0"
+       refY=3D"0"
+       orient=3D"auto"
+       inkscape:stockid=3D"Arrow2Mend"
+       inkscape:isstock=3D"true">
+      <path
+         transform=3D"scale(-0.6)"
+         d=3D"M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.001=
7078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style=3D"fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#00=
0000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id=3D"path5621" />
+    </marker>
+    <marker
+       style=3D"overflow:visible"
+       id=3D"marker5487"
+       refX=3D"0"
+       refY=3D"0"
+       orient=3D"auto"
+       inkscape:stockid=3D"Arrow2Mend"
+       inkscape:isstock=3D"true">
+      <path
+         transform=3D"scale(-0.6)"
+         d=3D"M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.001=
7078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style=3D"fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#00=
0000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id=3D"path5485" />
+    </marker>
+    <marker
+       style=3D"overflow:visible"
+       id=3D"marker5285"
+       refX=3D"0"
+       refY=3D"0"
+       orient=3D"auto"
+       inkscape:stockid=3D"Arrow2Mstart"
+       inkscape:isstock=3D"true">
+      <path
+         transform=3D"scale(0.6)"
+         d=3D"M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.001=
7078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style=3D"fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#00=
0000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id=3D"path5283" />
+    </marker>
+    <marker
+       style=3D"overflow:visible"
+       id=3D"marker5161"
+       refX=3D"0"
+       refY=3D"0"
+       orient=3D"auto"
+       inkscape:stockid=3D"Arrow2Mend"
+       inkscape:isstock=3D"true">
+      <path
+         transform=3D"scale(-0.6)"
+         d=3D"M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.001=
7078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style=3D"fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#00=
0000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id=3D"path5159" />
+    </marker>
+    <marker
+       style=3D"overflow:visible"
+       id=3D"marker4860"
+       refX=3D"0"
+       refY=3D"0"
+       orient=3D"auto"
+       inkscape:stockid=3D"Arrow2Mend"
+       inkscape:isstock=3D"true">
+      <path
+         transform=3D"scale(-0.6)"
+         d=3D"M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.001=
7078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style=3D"fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#00=
0000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id=3D"path4858" />
+    </marker>
+    <marker
+       style=3D"overflow:visible"
+       id=3D"marker4504"
+       refX=3D"0"
+       refY=3D"0"
+       orient=3D"auto"
+       inkscape:stockid=3D"Arrow2Mend"
+       inkscape:isstock=3D"true">
+      <path
+         transform=3D"scale(-0.6)"
+         d=3D"M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.001=
7078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style=3D"fill:#ffa348;fill-opacity:1;fill-rule:evenodd;stroke:#ff=
a348;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id=3D"path4502" />
+    </marker>
+    <marker
+       style=3D"overflow:visible"
+       id=3D"marker4286"
+       refX=3D"0"
+       refY=3D"0"
+       orient=3D"auto"
+       inkscape:stockid=3D"Arrow2Mend"
+       inkscape:isstock=3D"true"
+       inkscape:collect=3D"always">
+      <path
+         transform=3D"scale(-0.6)"
+         d=3D"M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.001=
7078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style=3D"fill:#62a0ea;fill-opacity:1;fill-rule:evenodd;stroke:#62=
a0ea;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id=3D"path4284" />
+    </marker>
+    <marker
+       style=3D"overflow:visible"
+       id=3D"Arrow1Mend"
+       refX=3D"0"
+       refY=3D"0"
+       orient=3D"auto"
+       inkscape:stockid=3D"Arrow1Mend"
+       inkscape:isstock=3D"true">
+      <path
+         transform=3D"matrix(-0.4,0,0,-0.4,-4,0)"
+         style=3D"fill:#62a0ea;fill-opacity:1;fill-rule:evenodd;stroke:#62=
a0ea;stroke-width:1pt;stroke-opacity:1"
+         d=3D"M 0,0 5,-5 -12.5,0 5,5 Z"
+         id=3D"path3318" />
+    </marker>
+    <marker
+       style=3D"overflow:visible"
+       id=3D"marker4174"
+       refX=3D"0"
+       refY=3D"0"
+       orient=3D"auto"
+       inkscape:stockid=3D"Arrow2Mstart"
+       inkscape:isstock=3D"true">
+      <path
+         transform=3D"scale(0.6)"
+         d=3D"M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.001=
7078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style=3D"fill:#62a0ea;fill-opacity:1;fill-rule:evenodd;stroke:#62=
a0ea;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id=3D"path4172" />
+    </marker>
+    <marker
+       style=3D"overflow:visible"
+       id=3D"Arrow2Mend"
+       refX=3D"0"
+       refY=3D"0"
+       orient=3D"auto"
+       inkscape:stockid=3D"Arrow2Mend"
+       inkscape:isstock=3D"true">
+      <path
+         transform=3D"scale(-0.6)"
+         d=3D"M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.001=
7078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style=3D"fill:#ffa348;fill-opacity:1;fill-rule:evenodd;stroke:#ff=
a348;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id=3D"path3336" />
+    </marker>
+    <marker
+       style=3D"overflow:visible"
+       id=3D"Arrow1Mstart"
+       refX=3D"0"
+       refY=3D"0"
+       orient=3D"auto"
+       inkscape:stockid=3D"Arrow1Mstart"
+       inkscape:isstock=3D"true">
+      <path
+         transform=3D"matrix(0.4,0,0,0.4,4,0)"
+         style=3D"fill:#ff7800;fill-opacity:1;fill-rule:evenodd;stroke:#ff=
a348;stroke-width:1pt;stroke-opacity:1"
+         d=3D"M 0,0 5,-5 -12.5,0 5,5 Z"
+         id=3D"path3315" />
+    </marker>
+    <marker
+       style=3D"overflow:visible"
+       id=3D"Arrow2Lstart"
+       refX=3D"0"
+       refY=3D"0"
+       orient=3D"auto"
+       inkscape:stockid=3D"Arrow2Lstart"
+       inkscape:isstock=3D"true">
+      <path
+         transform=3D"matrix(1.1,0,0,1.1,1.1,0)"
+         d=3D"M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.001=
7078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style=3D"fill:#ff7800;fill-opacity:1;fill-rule:evenodd;stroke:#ff=
a348;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id=3D"path3327" />
+    </marker>
+    <marker
+       style=3D"overflow:visible"
+       id=3D"Arrow1Lstart"
+       refX=3D"0"
+       refY=3D"0"
+       orient=3D"auto"
+       inkscape:stockid=3D"Arrow1Lstart"
+       inkscape:isstock=3D"true">
+      <path
+         transform=3D"matrix(0.8,0,0,0.8,10,0)"
+         style=3D"fill:#ff7800;fill-opacity:1;fill-rule:evenodd;stroke:#ff=
a348;stroke-width:1pt;stroke-opacity:1"
+         d=3D"M 0,0 5,-5 -12.5,0 5,5 Z"
+         id=3D"path3309" />
+    </marker>
+    <linearGradient
+       id=3D"linearGradient921"
+       inkscape:swatch=3D"solid">
+      <stop
+         style=3D"stop-color:#deddda;stop-opacity:1;"
+         offset=3D"0"
+         id=3D"stop919" />
+    </linearGradient>
+    <linearGradient
+       id=3D"linearGradient6035-4">
+      <stop
+         id=3D"stop6037-2"
+         style=3D"stop-color:#ffffff"
+         offset=3D"0" />
+      <stop
+         id=3D"stop6039-9"
+         style=3D"stop-color:#ffffff;stop-opacity:0"
+         offset=3D"1" />
+    </linearGradient>
+    <linearGradient
+       id=3D"linearGradient11801"
+       y2=3D"511.97"
+       spreadMethod=3D"reflect"
+       gradientUnits=3D"userSpaceOnUse"
+       x2=3D"286.63"
+       gradientTransform=3D"matrix(4.9627,0,0,4.9627,278.63,-3355.4)"
+       y1=3D"511.97"
+       x1=3D"269.97"
+       inkscape:collect=3D"always">
+      <stop
+         id=3D"stop5497-7"
+         style=3D"stop-color:#497bb3"
+         offset=3D"0" />
+      <stop
+         id=3D"stop5501-5"
+         style=3D"stop-color:#a5c4e6"
+         offset=3D".20485" />
+      <stop
+         id=3D"stop5499-8"
+         style=3D"stop-color:#3b5d8b"
+         offset=3D"1" />
+    </linearGradient>
+    <linearGradient
+       id=3D"linearGradient11803"
+       y2=3D"527.34003"
+       gradientUnits=3D"userSpaceOnUse"
+       x2=3D"286.63"
+       y1=3D"518.56"
+       x1=3D"282.35999"
+       inkscape:collect=3D"always">
+      <stop
+         id=3D"stop5468-4"
+         style=3D"stop-color:#a5c4e6"
+         offset=3D"0" />
+      <stop
+         id=3D"stop5470-8"
+         style=3D"stop-color:#497bb3"
+         offset=3D"1" />
+    </linearGradient>
+    <linearGradient
+       id=3D"linearGradient11805"
+       y2=3D"520.33002"
+       xlink:href=3D"#linearGradient6035-4"
+       spreadMethod=3D"reflect"
+       gradientUnits=3D"userSpaceOnUse"
+       x2=3D"327.78"
+       gradientTransform=3D"matrix(4.1992,0,0,4.1992,407.33,-3062.9)"
+       y1=3D"522.60999"
+       x1=3D"308.5"
+       inkscape:collect=3D"always" />
+    <linearGradient
+       id=3D"linearGradient11807"
+       y2=3D"520.33002"
+       xlink:href=3D"#linearGradient6035-4"
+       spreadMethod=3D"reflect"
+       gradientUnits=3D"userSpaceOnUse"
+       x2=3D"327.78"
+       gradientTransform=3D"matrix(4.1992,0,0,4.1992,407.33,-3015.8)"
+       y1=3D"522.60999"
+       x1=3D"308.5"
+       inkscape:collect=3D"always" />
+    <linearGradient
+       id=3D"linearGradient11809"
+       y2=3D"520.33002"
+       xlink:href=3D"#linearGradient6035-4"
+       spreadMethod=3D"reflect"
+       gradientUnits=3D"userSpaceOnUse"
+       x2=3D"327.78"
+       gradientTransform=3D"matrix(4.1992,0,0,4.1992,407.33,-2971.6)"
+       y1=3D"522.60999"
+       x1=3D"308.5"
+       inkscape:collect=3D"always" />
+    <marker
+       style=3D"overflow:visible"
+       id=3D"Arrow2Mstart-4"
+       refX=3D"0"
+       refY=3D"0"
+       orient=3D"auto"
+       inkscape:stockid=3D"Arrow2Mstart"
+       inkscape:isstock=3D"true">
+      <path
+         transform=3D"scale(0.6)"
+         d=3D"M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.001=
7078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style=3D"fill:#ffa348;fill-opacity:1;fill-rule:evenodd;stroke:#ff=
a348;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id=3D"path3333-2" />
+    </marker>
+    <marker
+       style=3D"overflow:visible"
+       id=3D"Arrow2Mend-2"
+       refX=3D"0"
+       refY=3D"0"
+       orient=3D"auto"
+       inkscape:stockid=3D"Arrow2Mend"
+       inkscape:isstock=3D"true">
+      <path
+         transform=3D"scale(-0.6)"
+         d=3D"M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.001=
7078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style=3D"fill:#ffa348;fill-opacity:1;fill-rule:evenodd;stroke:#ff=
a348;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id=3D"path3336-7" />
+    </marker>
+    <marker
+       style=3D"overflow:visible"
+       id=3D"marker5623-2"
+       refX=3D"0"
+       refY=3D"0"
+       orient=3D"auto"
+       inkscape:stockid=3D"Arrow2Mend"
+       inkscape:isstock=3D"true">
+      <path
+         transform=3D"scale(-0.6)"
+         d=3D"M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.001=
7078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style=3D"fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#00=
0000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id=3D"path5621-3" />
+    </marker>
+    <marker
+       style=3D"overflow:visible"
+       id=3D"Arrow2Mend-4"
+       refX=3D"0"
+       refY=3D"0"
+       orient=3D"auto"
+       inkscape:stockid=3D"Arrow2Mend"
+       inkscape:isstock=3D"true">
+      <path
+         transform=3D"scale(-0.6)"
+         d=3D"M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.001=
7078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style=3D"fill:#ffa348;fill-opacity:1;fill-rule:evenodd;stroke:#ff=
a348;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id=3D"path3336-3" />
+    </marker>
+    <marker
+       style=3D"overflow:visible"
+       id=3D"marker5285-1"
+       refX=3D"0"
+       refY=3D"0"
+       orient=3D"auto"
+       inkscape:stockid=3D"Arrow2Mstart"
+       inkscape:isstock=3D"true">
+      <path
+         transform=3D"scale(0.6)"
+         d=3D"M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.001=
7078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style=3D"fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#00=
0000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id=3D"path5283-7" />
+    </marker>
+    <marker
+       style=3D"overflow:visible"
+       id=3D"marker5161-4"
+       refX=3D"0"
+       refY=3D"0"
+       orient=3D"auto"
+       inkscape:stockid=3D"Arrow2Mend"
+       inkscape:isstock=3D"true">
+      <path
+         transform=3D"scale(-0.6)"
+         d=3D"M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.001=
7078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style=3D"fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#00=
0000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id=3D"path5159-3" />
+    </marker>
+    <marker
+       style=3D"overflow:visible"
+       id=3D"marker5285-1-4"
+       refX=3D"0"
+       refY=3D"0"
+       orient=3D"auto"
+       inkscape:stockid=3D"Arrow2Mstart"
+       inkscape:isstock=3D"true">
+      <path
+         transform=3D"scale(0.6)"
+         d=3D"M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.001=
7078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style=3D"fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#00=
0000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id=3D"path5283-7-6" />
+    </marker>
+    <marker
+       style=3D"overflow:visible"
+       id=3D"marker5161-4-9"
+       refX=3D"0"
+       refY=3D"0"
+       orient=3D"auto"
+       inkscape:stockid=3D"Arrow2Mend"
+       inkscape:isstock=3D"true">
+      <path
+         transform=3D"scale(-0.6)"
+         d=3D"M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.001=
7078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style=3D"fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#00=
0000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id=3D"path5159-3-4" />
+    </marker>
+    <marker
+       style=3D"overflow:visible"
+       id=3D"marker4174-8"
+       refX=3D"0"
+       refY=3D"0"
+       orient=3D"auto"
+       inkscape:stockid=3D"Arrow2Mstart"
+       inkscape:isstock=3D"true">
+      <path
+         transform=3D"scale(0.6)"
+         d=3D"M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.001=
7078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style=3D"fill:#62a0ea;fill-opacity:1;fill-rule:evenodd;stroke:#62=
a0ea;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id=3D"path4172-8" />
+    </marker>
+    <marker
+       style=3D"overflow:visible"
+       id=3D"marker4286-6"
+       refX=3D"0"
+       refY=3D"0"
+       orient=3D"auto"
+       inkscape:stockid=3D"Arrow2Mend"
+       inkscape:isstock=3D"true"
+       inkscape:collect=3D"always">
+      <path
+         transform=3D"scale(-0.6)"
+         d=3D"M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.001=
7078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style=3D"fill:#62a0ea;fill-opacity:1;fill-rule:evenodd;stroke:#62=
a0ea;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id=3D"path4284-8" />
+    </marker>
+  </defs>
+  <sodipodi:namedview
+     pagecolor=3D"#ffffff"
+     bordercolor=3D"#666666"
+     borderopacity=3D"1"
+     objecttolerance=3D"10"
+     gridtolerance=3D"10"
+     guidetolerance=3D"10"
+     inkscape:pageopacity=3D"0"
+     inkscape:pageshadow=3D"2"
+     inkscape:window-width=3D"1848"
+     inkscape:window-height=3D"983"
+     id=3D"namedview4"
+     showgrid=3D"false"
+     inkscape:zoom=3D"1.0233281"
+     inkscape:cx=3D"454.88832"
+     inkscape:cy=3D"692.83742"
+     inkscape:window-x=3D"1992"
+     inkscape:window-y=3D"27"
+     inkscape:window-maximized=3D"1"
+     inkscape:current-layer=3D"g10"
+     inkscape:document-rotation=3D"0"
+     inkscape:snap-perpendicular=3D"true"
+     fit-margin-top=3D"30"
+     lock-margins=3D"true"
+     fit-margin-left=3D"30"
+     fit-margin-right=3D"30"
+     fit-margin-bottom=3D"30"
+     inkscape:pagecheckerboard=3D"0">
+    <inkscape:grid
+       type=3D"xygrid"
+       id=3D"grid1257"
+       originx=3D"82.778013"
+       originy=3D"165.84269" />
+  </sodipodi:namedview>
+  <g
+     inkscape:groupmode=3D"layer"
+     inkscape:label=3D"Image"
+     id=3D"g10"
+     transform=3D"translate(82.778014,165.84268)">
+    <g
+       id=3D"g3925"
+       transform=3D"matrix(0.4122756,0,0,0.4122756,-156.60748,374.96076)"
+       style=3D"stroke-width:2.42556">
+      <g
+         id=3D"layer1-3-5-2"
+         inkscape:label=3D"Capa 1"
+         transform=3D"matrix(1.1196,0,0,1.1196,-122.82057,267.39056)"
+         style=3D"stroke-width:2.42556">
+        <g
+           id=3D"g10-5-2"
+           transform=3D"matrix(0.0423,0,0,0.0423,319.39,59.128)"
+           class=3D"Graphic"
+           style=3D"stroke-width:2.42556">
+          <g
+             id=3D"g12-4-2"
+             style=3D"stroke-width:2.42556">
+            <g
+               id=3D"g14-64-0"
+               style=3D"fill:#c7c7c7;stroke-width:2.42556">
+              <path
+                 id=3D"path16-1-5"
+                 inkscape:connector-curvature=3D"0"
+                 d=3D"m 5903,2361 c 50,82 34,3995 -31,4149 -51,122 -1703,1=
495 -1789,1531 -1117,-7 -1870,-414 -1995,-629 -48,-270 -7,-4433 38,-4520 40=
,-76 2153,-833 2227,-851 67,-15 1493,229 1550,320 z"
+                 style=3D"stroke-width:2.42556" />
+            </g>
+            <g
+               id=3D"g18-6-5"
+               style=3D"fill:#000000;stroke-width:2.42556">
+              <path
+                 id=3D"path20-8-2"
+                 inkscape:connector-curvature=3D"0"
+                 d=3D"m 5881,2374 2,-1 -2,2 c 0,-1 -1,-1 -1,-1 v -2 l 7,-3=
 -2,2 -5,1 5,-1 -2,2 z m 2,-1 2,-2 2,-2 5,-2 -5,4 5,-4 h 1 l -6,3 v 1 -1 z =
m 10,-6 h -1 1 -1 l 11,-6 -10,5 z m 11,-4 -11,4 v -1 z m 20,-15 c -2,-3 -4,=
-6 -7,-9 -2,-3 -5,-5 -8,-7 -5,-4 -12,-8 -20,-12 -7,-4 -15,-7 -24,-11 -9,-4 =
-19,-7 -30,-11 -21,-8 -47,-16 -75,-24 -29,-8 -61,-16 -95,-25 -136,-34 -313,=
-72 -494,-106 -181,-35 -364,-66 -511,-90 -73,-11 -138,-21 -189,-27 -25,-3 -=
47,-6 -65,-8 -9,-1 -17,-1 -24,-2 -4,0 -7,0 -10,-1 h -9 c -3,0 -5,0 -7,1 h -=
4 c -2,0 -3,0 -4,1 -2,0 -4,1 -7,2 -2,0 -5,1 -8,2 -3,1 -7,2 -11,3 -4,2 -8,3 =
-13,5 -10,3 -22,7 -35,12 -13,4 -28,9 -44,15 -33,11 -71,25 -115,40 -43,15 -9=
1,32 -144,51 -209,75 -481,173 -753,274 -271,101 -542,203 -747,285 -51,21 -9=
8,40 -140,57 -43,18 -80,34 -111,48 -16,7 -30,14 -42,20 -13,6 -24,12 -33,17 =
-5,2 -9,5 -13,7 -4,3 -8,5 -10,7 -4,3 -7,5 -9,7 -5,4 -7,8 -9,11 -1,2 -2,5 -4=
,9 0,3 -1,6 -1,9 -1,3 -1,7 -2,11 -1,4 -1,8 -2,13 0,9 -1,20 -3,32 0,13 -1,27=
 -2,42 -2,31 -4,69 -6,111 -2,43 -4,91 -5,144 -7,213 -14,504 -19,835 -11,662=
 -19,1482 -19,2144 0,308 2,583 5,791 1,52 2,100 3,143 1,43 3,82 4,115 1,34 =
3,62 4,85 1,12 2,22 3,30 1,5 1,9 1,13 1,3 2,7 2,10 l 1,4 2,4 c 9,15 20,30 3=
3,46 14,16 30,32 48,49 35,32 80,66 135,101 107,70 249,142 423,207 173,65 37=
7,124 608,167 231,43 489,70 769,72 h 6 l 5,-2 8,-4 c 2,-2 5,-3 8,-6 3,-2 6,=
-4 10,-6 l 12,-9 c 9,-6 19,-13 30,-22 11,-8 23,-17 37,-28 27,-20 58,-45 93,=
-73 35,-28 74,-59 116,-93 169,-136 385,-315 600,-497 215,-181 430,-366 593,=
-512 41,-37 79,-71 113,-103 34,-31 64,-59 89,-84 13,-13 24,-24 34,-35 11,-1=
1 20,-20 28,-29 8,-9 14,-17 19,-23 3,-4 5,-8 7,-10 2,-4 4,-8 6,-11 0,-2 1,-=
5 2,-8 1,-3 2,-5 3,-9 1,-6 2,-13 3,-22 2,-8 3,-17 4,-28 1,-11 2,-22 3,-35 2=
,-25 4,-55 7,-89 1,-34 3,-72 5,-113 8,-166 14,-391 19,-648 10,-516 16,-1164=
 16,-1743 0,-389 -3,-747 -8,-1012 -1,-66 -2,-127 -4,-181 -1,-53 -3,-100 -5,=
-139 -1,-20 -2,-38 -3,-53 -1,-16 -2,-30 -3,-41 -1,-6 -1,-11 -2,-16 -1,-5 -1=
,-10 -2,-13 -1,-4 -1,-8 -2,-11 -1,-2 -1,-4 -2,-5 -1,-3 -2,-5 -3,-6 z m -37,=
21 12,-12 z m -6,9 c 1,3 1,7 2,11 0,4 1,9 1,15 1,11 3,24 4,39 0,15 1,33 2,5=
2 2,39 4,86 6,139 1,53 2,114 4,180 5,264 7,622 7,1011 0,578 -5,1227 -15,174=
2 -6,257 -12,481 -19,646 -2,42 -4,79 -6,113 -2,33 -4,63 -6,88 -1,12 -2,24 -=
4,34 0,10 -2,18 -3,26 -1,7 -2,14 -3,18 0,3 -1,4 -1,6 0,1 -1,2 -1,2 0,1 -1,2=
 -2,4 -1,1 -3,4 -4,6 -5,6 -10,13 -17,21 -7,7 -16,17 -26,27 l -34,34 c -25,2=
4 -54,52 -88,83 -33,31 -71,66 -112,102 -163,146 -377,330 -592,512 -215,181 =
-431,360 -598,495 -42,34 -81,65 -116,93 -35,28 -66,52 -93,73 -13,10 -26,20 =
-37,28 -10,8 -20,15 -28,21 -4,3 -8,6 -12,8 -3,2 -6,4 -8,6 -2,1 -4,2 -5,3 -2=
76,-2 -528,-29 -755,-71 -228,-42 -429,-100 -600,-164 -169,-64 -308,-134 -41=
3,-202 -51,-33 -94,-66 -128,-97 -17,-15 -31,-30 -43,-44 -10,-12 -19,-23 -26=
,-34 v -4 c -1,-3 -1,-7 -1,-11 -1,-8 -2,-18 -3,-28 -2,-23 -3,-51 -5,-84 -1,=
-33 -2,-71 -3,-115 -1,-42 -2,-90 -3,-142 -3,-208 -5,-482 -5,-790 0,-662 7,-=
1481 18,-2143 6,-330 12,-622 19,-834 2,-53 4,-101 6,-144 2,-42 3,-79 5,-109=
 1,-16 2,-30 3,-42 1,-12 2,-22 3,-31 0,-4 1,-8 1,-11 1,-4 1,-6 2,-9 v -2 c =
0,-1 1,-1 2,-2 2,-1 4,-3 7,-5 4,-1 7,-4 11,-6 9,-5 19,-10 31,-16 12,-6 26,-=
12 41,-19 31,-14 67,-29 109,-47 42,-17 89,-37 140,-57 205,-82 475,-184 746,=
-284 271,-101 543,-200 752,-274 52,-19 101,-36 144,-51 43,-16 82,-29 114,-4=
0 17,-6 31,-11 44,-16 13,-4 25,-8 35,-11 4,-2 9,-3 13,-4 4,-2 7,-3 10,-4 3,=
-1 5,-1 8,-2 l 3,-1 -2,-8 1,8 h 1 4 7 c 2,0 5,0 8,1 7,0 14,1 23,2 17,1 39,4=
 64,7 50,6 114,16 187,27 147,23 329,55 509,89 180,35 357,72 492,106 34,9 65=
,17 92,25 28,8 53,15 73,23 10,3 20,7 28,10 7,3 15,6 20,9 5,3 10,5 13,8 0,0 =
1,0 1,1 0,1 1,3 1,4 z M 4075,8017 c 1,0 1,-1 2,-1 h 6 v 14 l -8,-13 8,13 v =
11 l -10,-23 c 0,0 1,-1 2,-1 z M 2110,7400 c 1,1 1,3 2,4 1,1 1,3 1,4 l -25,=
4 21,-11 1,-1 -1,1 1,-1 h 2 z m 39,-4498 v 3 c -1,0 -1,1 -2,1 l -5,-6 -17,-=
4 17,4 -2,-1 4,2 z m -7,-2 2,1 z m -16,-8 14,7 z m 14,7 -10,-11 z m 2217,-8=
41 -2,-17 z m -4,-17 4,17 v 1 z"
+                 style=3D"stroke-width:2.42556" />
+            </g>
+            <g
+               id=3D"g22-8-9"
+               style=3D"fill:#ffffff;fill-opacity:0.54118;stroke:#ffffff;s=
troke-width:2.42556;stroke-opacity:0.54118">
+              <path
+                 id=3D"path24-1-0"
+                 inkscape:connector-curvature=3D"0"
+                 d=3D"m 5822,2442 -52,22 -52,23 -52,23 -53,25 -53,25 -53,2=
6 -53,26 -54,27 -54,27 -54,28 -55,28 -54,29 -55,29 -55,29 -111,60 -112,60 -=
112,60 -113,61 -114,60 -114,60 -114,59 -57,29 -57,29 -58,28 -57,28 -27,-6 -=
28,-7 -56,-13 -58,-14 -59,-13 -60,-14 -61,-14 -61,-14 -63,-14 -62,-14 -63,-=
15 -127,-28 -127,-28 -64,-14 -63,-14 -62,-13 -62,-13 -61,-13 -60,-13 -60,-1=
3 -58,-12 -57,-12 -28,-5 -28,-6 -27,-5 -27,-6 -27,-5 -26,-5 -26,-5 -25,-6 -=
25,-4 -24,-5 -24,-5 -24,-4 -23,-4 -22,-5 -22,-4 -21,-3 -21,-4 -20,-4 52,16 =
52,16 53,16 54,15 55,16 55,15 57,16 56,15 57,16 58,15 116,31 117,30 118,31 =
118,31 117,30 116,31 58,15 57,16 57,15 56,16 55,15 55,16 54,15 53,16 52,16 =
52,16 1,60 2,61 1,61 1,63 1,64 2,64 1,65 1,66 1,67 1,67 1,68 v 69 l 1,69 1,=
70 1,70 v 71 l 1,71 v 72 l 1,72 1,73 1,146 1,147 v 149 l 1,149 2,299 1,300 =
1,149 1,148 1,147 1,146 1,73 v 72 l 1,72 1,71 v 71 l 1,71 1,69 1,70 v 68 l =
1,68 1,67 1,67 1,66 1,65 1,65 2,63 1,63 1,62 2,61 1,60 1,-61 1,-61 v -63 l =
1,-63 1,-64 1,-65 1,-66 1,-67 1,-67 1,-68 1,-69 2,-69 1,-70 1,-71 1,-71 1,-=
72 1,-72 2,-73 1,-73 1,-73 3,-148 3,-149 2,-151 3,-151 6,-303 5,-303 3,-151=
 3,-150 2,-149 3,-149 1,-73 2,-73 1,-73 1,-72 1,-71 1,-72 1,-70 2,-70 1,-70=
 1,-68 1,-68 1,-68 1,-66 1,-66 1,-65 1,-64 1,-64 v -62 l 1,-62 1,-60 110,-5=
9 109,-59 109,-57 109,-58 108,-57 107,-58 107,-57 107,-58 105,-58 105,-58 1=
04,-60 103,-60 51,-30 50,-31 51,-31 50,-31 50,-31 50,-32 49,-32 z"
+                 style=3D"stroke-width:2.42556" />
+            </g>
+            <g
+               id=3D"g28-1-8"
+               style=3D"fill:none;stroke-width:2.42556">
+              <path
+                 id=3D"path30-7-3"
+                 inkscape:connector-curvature=3D"0"
+                 d=3D"m 5822,2442 c -549,232 -1156,606 -1768,901 -580,-138=
 -1417,-322 -1839,-396 543,169 1257,327 1800,496 32,1271 16,3196 48,4467 16=
,-1282 59,-3238 75,-4519 586,-317 1161,-601 1684,-949 z"
+                 style=3D"stroke-width:2.42556" />
+            </g>
+            <g
+               id=3D"g32-7-8"
+               style=3D"fill:#000000;fill-opacity:0.16078;stroke:#ffffff;s=
troke-width:2.42556;stroke-opacity:0.16078">
+              <path
+                 id=3D"path34-1-0"
+                 inkscape:connector-curvature=3D"0"
+                 d=3D"m 2420,6628 10,14 10,13 11,13 12,13 12,12 12,12 14,1=
2 13,12 14,12 15,11 15,11 16,11 15,11 17,10 16,10 17,11 18,9 18,10 18,9 18,=
8 19,9 19,8 19,8 19,8 40,15 40,14 41,12 41,11 42,10 41,9 42,8 41,6 41,6 41,=
3 21,2 20,1 19,1 h 20 20 19 l 19,-1 19,-1 18,-1 19,-1 17,-2 18,-3 17,-2 17,=
-3 17,-4 16,-4 15,-4 15,-4 15,-5 15,-5 -2,-1 h -1 l -5,-2 -6,-1 -7,-2 -8,-2=
 -10,-3 -10,-3 -12,-3 -13,-4 -14,-3 -15,-4 -16,-5 -16,-4 -18,-5 -18,-5 -19,=
-5 -20,-6 -20,-5 -21,-6 -22,-6 -22,-6 -22,-6 -23,-7 -24,-6 -48,-13 -49,-14 =
-50,-14 -50,-13 -50,-15 -50,-13 -49,-14 -49,-13 -23,-7 -24,-6 -23,-7 -22,-6=
 -22,-6 -21,-6 -21,-6 -20,-5 -19,-6 -19,-5 -18,-5 -17,-5 -16,-4 -15,-5 -15,=
-4 -13,-4 -12,-3 -12,-3 -10,-3 -9,-3 -7,-2 -7,-2 -5,-2 h -2 z"
+                 style=3D"stroke-width:2.42556" />
+            </g>
+            <g
+               id=3D"g38-5-0"
+               style=3D"fill:none;stroke-width:2.42556">
+              <path
+                 id=3D"path40-7-9"
+                 inkscape:connector-curvature=3D"0"
+                 d=3D"m 2420,6628 c 201,289 833,431 1133,315 -53,-14 -1066=
,-293 -1133,-315 z"
+                 style=3D"stroke-width:2.42556" />
+            </g>
+            <g
+               id=3D"g42-6-1"
+               style=3D"fill:#ffffff;fill-opacity:0.38824;stroke:#ffffff;s=
troke-width:2.42556;stroke-opacity:0.38824">
+              <path
+                 id=3D"path44-7-9"
+                 inkscape:connector-curvature=3D"0"
+                 d=3D"m 3454,6093 -936,-361 -9,4 -8,4 -8,4 -6,5 -6,6 -6,6 =
-5,7 -5,6 -4,7 -4,7 -3,7 -3,8 -3,8 -2,7 -3,15 -2,15 -2,14 v 6 7 5 6 5 4 4 l=
 1,4 v 2 2 1 1 l 146,51 1,1 1,1 1,1 1,2 2,2 1,3 3,3 2,3 3,4 3,4 3,4 4,5 4,4=
 4,6 5,4 10,12 10,11 13,12 13,12 14,13 15,12 17,13 17,12 19,12 19,11 21,11 =
22,10 11,4 11,5 12,4 12,4 13,3 12,3 13,3 13,3 13,2 13,1 14,2 14,1 h 14 15 1=
5 l 15,-1 15,-2 15,-2 16,-2 16,-3 16,-4 16,-4 17,-5 17,-6 h 1 l 2,1 h 3 l 6=
,1 6,1 7,1 8,1 9,1 10,1 11,1 12,1 12,1 h 12 l 13,1 h 26 l 14,-1 13,-1 14,-1=
 13,-2 13,-2 12,-3 12,-3 12,-3 10,-5 11,-5 9,-6 8,-6 8,-8 3,-4 3,-4 3,-4 2,=
-4 2,-5 z"
+                 style=3D"stroke-width:2.42556" />
+            </g>
+            <g
+               id=3D"g48-57-2"
+               style=3D"fill:none;stroke-width:2.42556">
+              <path
+                 id=3D"path50-0-5"
+                 inkscape:connector-curvature=3D"0"
+                 d=3D"m 3454,6093 -936,-361 c -97,34 -78,177 -78,177 l 146=
,51 c 0,0 204,319 566,194 0,0 269,48 302,-61 z"
+                 style=3D"stroke-width:2.42556" />
+            </g>
+            <g
+               id=3D"g52-5-4"
+               style=3D"fill:#606060;stroke-width:2.42556">
+              <path
+                 id=3D"path54-7-4"
+                 inkscape:connector-curvature=3D"0"
+                 d=3D"m 3446,5971 c -311,-81 -622,-161 -933,-242 -12,44 -1=
3,107 6,140 47,23 142,41 189,64 136,131 255,142 472,124 84,17 168,31 251,48=
 26,-51 33,-72 15,-134 z"
+                 style=3D"stroke-width:2.42556" />
+            </g>
+            <g
+               id=3D"g56-7-9"
+               style=3D"fill:none;stroke-width:2.42556">
+              <path
+                 id=3D"path58-8-9"
+                 inkscape:connector-curvature=3D"0"
+                 d=3D"m 3446,5971 c -311,-81 -622,-161 -933,-242 -12,44 -1=
3,107 6,140 47,23 142,41 189,64 136,131 255,142 472,124 84,17 168,31 251,48=
 26,-51 33,-72 15,-134 z"
+                 style=3D"stroke-width:2.42556" />
+            </g>
+            <g
+               id=3D"g60-5-3"
+               style=3D"fill:#ffffff;fill-opacity:0.4;stroke:#ffffff;strok=
e-width:2.42556;stroke-opacity:0.4">
+              <path
+                 id=3D"path62-2-6"
+                 inkscape:connector-curvature=3D"0"
+                 d=3D"m 5856,2414 -1813,1017 7,4549 1775,-1494 z"
+                 style=3D"stroke-width:2.42556" />
+            </g>
+            <g
+               id=3D"g66-2-5"
+               style=3D"fill:none;stroke-width:2.42556">
+              <path
+                 id=3D"path68-9-0"
+                 inkscape:connector-curvature=3D"0"
+                 d=3D"m 5856,2414 -1813,1017 7,4549 1775,-1494 z"
+                 style=3D"stroke-width:2.42556" />
+            </g>
+            <g
+               id=3D"g70-9-2"
+               style=3D"fill:#000000;fill-opacity:0.16078;stroke:#ffffff;s=
troke-width:2.42556;stroke-opacity:0.16078">
+              <path
+                 id=3D"path72-9-9"
+                 inkscape:connector-curvature=3D"0"
+                 d=3D"m 2525,6916 10,13 11,12 10,13 11,11 11,12 11,11 12,1=
1 12,10 12,10 12,10 13,10 12,9 13,9 13,8 27,17 28,15 28,14 28,13 29,11 29,1=
1 30,9 30,8 29,8 30,6 30,5 30,4 30,3 30,2 29,2 h 29 l 29,-1 27,-2 28,-2 27,=
-3 26,-5 25,-5 24,-6 24,-6 22,-8 -2,-1 h -4 l -4,-2 -5,-1 -6,-2 -8,-2 -8,-2=
 -9,-2 -10,-3 -10,-3 -11,-3 -12,-3 -13,-4 -13,-3 -14,-4 -15,-4 -15,-4 -15,-=
5 -16,-4 -16,-5 -17,-4 -18,-5 -35,-10 -36,-10 -38,-10 -38,-10 -38,-11 -76,-=
21 -37,-10 -37,-11 -36,-10 -17,-4 -17,-5 -17,-5 -16,-4 -16,-5 -15,-4 -15,-4=
 -14,-4 -14,-4 -13,-4 -12,-3 -11,-3 -12,-3 -10,-3 -9,-3 -8,-2 -8,-3 -7,-1 -=
6,-2 -5,-2 -4,-1 z"
+                 style=3D"stroke-width:2.42556" />
+            </g>
+            <g
+               id=3D"g76-2-3"
+               style=3D"fill:none;stroke-width:2.42556">
+              <path
+                 id=3D"path78-7-5"
+                 inkscape:connector-curvature=3D"0"
+                 d=3D"m 2525,6916 c 209,276 627,323 861,239 -39,-10 -810,-=
222 -861,-239 z"
+                 style=3D"stroke-width:2.42556" />
+            </g>
+            <g
+               id=3D"g80-6-1"
+               style=3D"fill:#000000;fill-opacity:0.16078;stroke:#ffffff;s=
troke-width:2.42556;stroke-opacity:0.16078">
+              <path
+                 id=3D"path82-0-7"
+                 inkscape:connector-curvature=3D"0"
+                 d=3D"m 2680,7199 12,15 12,14 13,14 14,12 14,13 14,11 15,1=
1 16,11 15,9 17,9 16,9 17,7 18,7 17,7 18,5 18,5 18,5 19,3 18,4 19,2 18,2 19=
,1 h 19 19 l 18,-1 19,-2 18,-2 19,-3 18,-4 18,-4 18,-5 17,-6 h -1 l -2,-1 h=
 -3 l -4,-1 -3,-1 -5,-2 -5,-1 -6,-2 -6,-1 -6,-2 -7,-2 -8,-2 -8,-2 -8,-3 -9,=
-2 -9,-2 -19,-6 -20,-5 -22,-6 -22,-6 -23,-6 -23,-7 -48,-13 -48,-13 -23,-7 -=
23,-6 -23,-6 -21,-6 -21,-6 -19,-6 -9,-2 -9,-3 -9,-2 -8,-2 -8,-2 -7,-2 -7,-2=
 -6,-2 -6,-2 -5,-2 -5,-1 -5,-1 -3,-1 -3,-1 -3,-1 z"
+                 style=3D"stroke-width:2.42556" />
+            </g>
+            <g
+               id=3D"g86-0-3"
+               style=3D"fill:none;stroke-width:2.42556">
+              <path
+                 id=3D"path88-3-1"
+                 inkscape:connector-curvature=3D"0"
+                 d=3D"m 2680,7199 c 121,163 355,213 540,149 -25,-6 -507,-1=
39 -540,-149 z"
+                 style=3D"stroke-width:2.42556" />
+            </g>
+            <g
+               id=3D"g90-5-4"
+               style=3D"fill:#fcfcfc;fill-opacity:0.43922;stroke:#ffffff;s=
troke-width:2.42556;stroke-opacity:0.43922">
+              <path
+                 id=3D"path92-9-6"
+                 inkscape:connector-curvature=3D"0"
+                 d=3D"m 2356,3259 -92,13 -17,2173 1425,399 35,-116 -1369,-=
365 z"
+                 style=3D"stroke-width:2.42556" />
+            </g>
+            <g
+               id=3D"g96-7-4"
+               style=3D"fill:none;stroke-width:2.42556">
+              <path
+                 id=3D"path98-7-2"
+                 inkscape:connector-curvature=3D"0"
+                 d=3D"m 2356,3259 -92,13 -17,2173 1425,399 35,-116 -1369,-=
365 z"
+                 style=3D"stroke-width:2.42556" />
+            </g>
+            <g
+               id=3D"g100-1-2"
+               style=3D"fill:#000000;fill-opacity:0.23137;stroke:#ffffff;s=
troke-width:2.42556;stroke-opacity:0.23137">
+              <path
+                 id=3D"path102-64-6"
+                 inkscape:connector-curvature=3D"0"
+                 d=3D"m 3700,4065 -2,61 -1340,-386 z"
+                 style=3D"stroke-width:2.42556" />
+            </g>
+            <g
+               id=3D"g106-1-1"
+               style=3D"fill:#000000;fill-opacity:0.23137;stroke:#ffffff;s=
troke-width:2.42556;stroke-opacity:0.23137">
+              <path
+                 id=3D"path108-3-2"
+                 inkscape:connector-curvature=3D"0"
+                 d=3D"m 3720,4507 -3,61 -1339,-386 z"
+                 style=3D"stroke-width:2.42556" />
+            </g>
+            <g
+               id=3D"g112-9-8"
+               style=3D"fill:#000000;fill-opacity:0.23137;stroke:#ffffff;s=
troke-width:2.42556;stroke-opacity:0.23137">
+              <path
+                 id=3D"path114-09-9"
+                 inkscape:connector-curvature=3D"0"
+                 d=3D"m 3700,4916 -2,61 -1340,-386 z"
+                 style=3D"stroke-width:2.42556" />
+            </g>
+            <g
+               id=3D"g118-8-8"
+               style=3D"fill:#000000;fill-opacity:0.23137;stroke:#ffffff;s=
troke-width:2.42556;stroke-opacity:0.23137">
+              <path
+                 id=3D"path120-3-8"
+                 inkscape:connector-curvature=3D"0"
+                 d=3D"m 3700,5318 -2,61 -1340,-387 z"
+                 style=3D"stroke-width:2.42556" />
+            </g>
+            <g
+               id=3D"g124-5-6"
+               style=3D"fill:#9e9e9e;stroke-width:2.42556">
+              <path
+                 id=3D"path126-3-8"
+                 inkscape:connector-curvature=3D"0"
+                 d=3D"m 2361,3309 1332,333 -11,2197 h 11 11 l 11,-2205 v -=
9 l -8,-2 -1341,-335 -2,11 z m 1340,335 -8,-2 v -8 h 11 z"
+                 style=3D"stroke-width:2.42556" />
+            </g>
+          </g>
+        </g>
+      </g>
+      <g
+         id=3D"g16724-3"
+         transform=3D"matrix(0.52218647,0,0,0.42933357,-400.52138,1028.821=
4)"
+         style=3D"stroke-width:2.42556">
+        <path
+           id=3D"path5488-8"
+           d=3D"m 1618.4,-890.85 v 126.36 h 0.5249 c -0.3385,1.0131 -0.524=
9,1.975 -0.5249,3.0182 0,15.228 36.989,27.557 82.672,27.557 45.683,0 82.672=
,-12.33 82.672,-27.557 0,-1.0447 -0.1856,-2.0037 -0.5249,-3.0182 h 0.5249 v=
 -126.36 h -165.34 z"
+           sodipodi:nodetypes=3D"cccssscccc"
+           style=3D"fill:url(#linearGradient11801);stroke-width:2.42556"
+           inkscape:connector-curvature=3D"0" />
+        <ellipse
+           id=3D"path5460-3"
+           style=3D"fill:url(#linearGradient11803);stroke-width:2.42556"
+           transform=3D"matrix(4.9627,0,0,4.9627,278.63,-3481.3)"
+           cx=3D"286.6308"
+           cy=3D"521.77954"
+           rx=3D"16.667517"
+           ry=3D"5.5558391" />
+        <path
+           id=3D"path6026-3"
+           d=3D"m 1618.3,-800.18 c 0.6187,15.05 37.507,27.164 82.804,27.16=
4 45.168,0 81.851,-12.042 82.672,-27.033 -14.494,12.328 -46.02,20.865 -82.6=
72,20.865 -36.727,0 -68.35,-8.6271 -82.804,-20.996 z"
+           style=3D"fill:#3b5d8b;stroke-width:2.42556"
+           inkscape:connector-curvature=3D"0" />
+        <path
+           id=3D"path6030-3"
+           d=3D"m 1618.3,-891.51 c 0.6187,15.05 37.507,27.164 82.804,27.16=
4 45.168,0 81.851,-12.042 82.672,-27.033 -0.9058,0.77052 -1.8509,1.4911 -2.=
8869,2.2308 -0.038,0.0491 -0.091,0.0823 -0.131,0.13101 -9.6253,11.663 -41.5=
87,20.209 -79.654,20.209 -38.306,0 -70.487,-8.6955 -79.917,-20.471 -0.1046,=
-0.0752 -0.1596,-0.18729 -0.2625,-0.26245 -0.9185,-0.67058 -1.8123,-1.2733 =
-2.6245,-1.9684 z"
+           style=3D"fill:url(#linearGradient11805);stroke-width:2.42556"
+           inkscape:connector-curvature=3D"0" />
+        <path
+           id=3D"path6022-8"
+           style=3D"fill:#3b5d8b;stroke-width:2.42556"
+           inkscape:connector-curvature=3D"0"
+           d=3D"m 1618.3,-844.36 c 0.6187,15.05 37.507,27.164 82.804,27.16=
4 45.168,0 81.851,-12.042 82.672,-27.033 -14.494,12.328 -46.02,20.865 -82.6=
72,20.865 -36.727,0 -68.35,-8.6271 -82.804,-20.996 z" />
+        <path
+           id=3D"path6043-0"
+           d=3D"m 1618.3,-844.36 c 0.6187,15.05 37.507,27.164 82.804,27.16=
4 45.168,0 81.851,-12.042 82.672,-27.033 -0.2087,0.17721 -0.4427,0.3519 -0.=
6561,0.52491 -5.2161,13.55 -39.937,24.014 -82.016,24.014 -42.466,0 -77.55,-=
10.545 -82.279,-24.277 -0.1684,-0.13312 -0.3624,-0.2549 -0.5249,-0.39347 z"
+           style=3D"fill:url(#linearGradient11807);stroke-width:2.42556"
+           inkscape:connector-curvature=3D"0" />
+        <path
+           id=3D"path6054-4"
+           style=3D"fill:url(#linearGradient11809);stroke-width:2.42556"
+           inkscape:connector-curvature=3D"0"
+           d=3D"m 1618.3,-800.18 c 0.6187,15.05 37.507,27.164 82.804,27.16=
4 45.168,0 81.851,-12.042 82.672,-27.033 -0.2087,0.17721 -0.4427,0.3519 -0.=
6561,0.52491 -5.2161,13.55 -39.937,24.014 -82.016,24.014 -42.466,0 -77.55,-=
10.545 -82.279,-24.277 -0.1684,-0.13312 -0.3624,-0.2549 -0.5249,-0.39347 z"=
 />
+        <path
+           id=3D"path6060-7"
+           d=3D"m 1618.8,-754.64 c 4.7284,13.732 39.813,24.277 82.279,24.2=
77 42.079,0 76.8,-10.464 82.016,-24.014 -14.766,12.043 -45.892,20.34 -82.01=
6,20.34 -36.314,0 -67.608,-8.4562 -82.279,-20.602 z"
+           style=3D"fill:#3b5d8b;stroke-width:2.42556"
+           inkscape:connector-curvature=3D"0" />
+      </g>
+    </g>
+    <text
+       xml:space=3D"preserve"
+       style=3D"font-weight:bold;font-size:13.3333px;line-height:125%;font=
-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';le=
tter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opac=
ity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:m=
iter;stroke-opacity:1"
+       x=3D"-40.600285"
+       y=3D"693.29376"
+       id=3D"text1185"><tspan
+         sodipodi:role=3D"line"
+         id=3D"tspan1183"
+         x=3D"-40.600285"
+         y=3D"693.29376"
+         style=3D"font-style:normal;font-variant:normal;font-weight:bold;f=
ont-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inksc=
ape-font-specification:'Liberation Sans Bold';stroke:none">Server / compute=
r</tspan></text>
+    <text
+       xml:space=3D"preserve"
+       style=3D"font-weight:bold;font-size:13.3333px;line-height:125%;font=
-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';le=
tter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opac=
ity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:m=
iter;stroke-opacity:1"
+       x=3D"-43.34169"
+       y=3D"769.37323"
+       id=3D"text1185-2"><tspan
+         sodipodi:role=3D"line"
+         id=3D"tspan1183-6"
+         x=3D"-43.34169"
+         y=3D"769.37323"
+         style=3D"font-style:normal;font-variant:normal;font-weight:normal=
;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-ink=
scape-font-specification:'Liberation Sans, Normal';font-variant-ligatures:n=
ormal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-eas=
t-asian:normal;stroke:none">Note: Public domain graphics from https://openc=
lipart.org/</tspan></text>
+    <text
+       xml:space=3D"preserve"
+       style=3D"font-weight:bold;font-size:42.5884px;line-height:125%;font=
-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';le=
tter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:none;stroke:#0000=
00;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacit=
y:1"
+       x=3D"142.22464"
+       y=3D"565.10297"
+       id=3D"text907"><tspan
+         sodipodi:role=3D"line"
+         id=3D"tspan905"
+         x=3D"142.22464"
+         y=3D"565.10297" /></text>
+    <text
+       xml:space=3D"preserve"
+       style=3D"font-weight:bold;font-size:42.5884px;line-height:125%;font=
-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';le=
tter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:none;stroke:#0000=
00;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacit=
y:1"
+       x=3D"98.363503"
+       y=3D"637.8432"
+       id=3D"text911"><tspan
+         sodipodi:role=3D"line"
+         id=3D"tspan909"
+         x=3D"98.363503"
+         y=3D"637.8432" /></text>
+    <text
+       xml:space=3D"preserve"
+       style=3D"font-weight:bold;font-size:42.5884px;line-height:125%;font=
-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';le=
tter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:none;stroke:#0000=
00;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacit=
y:1"
+       x=3D"-59.575905"
+       y=3D"580.05695"
+       id=3D"text915"><tspan
+         sodipodi:role=3D"line"
+         id=3D"tspan913"
+         x=3D"-59.575905"
+         y=3D"580.05695" /></text>
+    <rect
+       style=3D"fill:#deddda;fill-opacity:1;fill-rule:evenodd;stroke:#9a99=
96;stroke-width:2;stroke-opacity:1"
+       id=3D"rect917-0"
+       width=3D"120.00001"
+       height=3D"69.017166"
+       x=3D"240"
+       y=3D"120.98283"
+       ry=3D"3.4599047" />
+    <text
+       xml:space=3D"preserve"
+       style=3D"font-weight:bold;font-size:13.3333px;line-height:125%;font=
-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';le=
tter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opac=
ity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:m=
iter;stroke-opacity:1"
+       x=3D"301.85687"
+       y=3D"147.99857"
+       id=3D"text1185-3-55"><tspan
+         sodipodi:role=3D"line"
+         id=3D"tspan1183-8-2"
+         x=3D"301.85687"
+         y=3D"147.99857"
+         style=3D"font-style:normal;font-variant:normal;font-weight:bold;f=
ont-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inksc=
ape-font-specification:'Liberation Sans Bold';text-align:center;text-anchor=
:middle;stroke:none">Light 3</tspan><tspan
+         sodipodi:role=3D"line"
+         x=3D"303.70908"
+         y=3D"165.99524"
+         style=3D"font-style:normal;font-variant:normal;font-weight:bold;f=
ont-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inksc=
ape-font-specification:'Liberation Sans Bold';stroke:none"
+         id=3D"tspan957-2"><tspan
+   id=3D"tspan65063"
+   style=3D"font-style:normal;font-variant:normal;font-weight:bold;font-st=
retch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-fo=
nt-specification:'Liberation Sans Bold';text-align:center;text-anchor:middl=
e;stroke:none">box</tspan> </tspan></text>
+    <g
+       id=3D"g1125-0"
+       transform=3D"matrix(0.42240595,0,0,0.41654472,-55.833175,-195.15195=
)"
+       style=3D"stroke:none;stroke-width:2.38399">
+      <rect
+         style=3D"opacity:1;fill:#333333;fill-opacity:1;fill-rule:evenodd;=
stroke:none;stroke-width:4.76797;stroke-opacity:1"
+         id=3D"rect1061-9"
+         width=3D"452.00439"
+         height=3D"192.0562"
+         x=3D"11.609296"
+         y=3D"276.44562"
+         ry=3D"4.0176301" />
+      <g
+         id=3D"g1109-1"
+         transform=3D"translate(-2.7615661,-1.7576335)"
+         style=3D"stroke:none;stroke-width:2.38399">
+        <path
+           id=3D"path14-9"
+           class=3D"st0"
+           d=3D"m 439.74452,358.11274 c 0,4.22 -3.41,7.64 -7.64,7.64 -4.22=
,0 -7.63,-3.42 -7.63,-7.64 0,-4.22 3.41,-7.64 7.63,-7.64 4.23,0 7.64,3.42 7=
.64,7.64 v 0"
+           style=3D"fill:#4a97d2;fill-opacity:1;stroke:none;stroke-width:0=
.238399;stroke-opacity:1" />
+        <path
+           id=3D"path16-6"
+           class=3D"st1"
+           d=3D"m 114.56452,324.94274 -11.13,-6.3 -22.409996,45.41 -23.9,-=
45.41 -11.27,6.3 28.41,53.38 c -0.21,0.51 -0.86,1.9 -1.95,4.22 -1.11,2.21 -=
2.25,4.41 -3.46,6.62 -2.11,3.81 -4.26,6.91 -6.46,9.32 -2.21,2.51 -4.46,4.51=
 -6.78,6.02 -2.3,1.51 -4.7,2.65 -7.21,3.46 -2.41,0.8 -4.87,1.45 -7.38,1.95 =
l 5.12,10.68 c 1.6,-0.21 3.75,-0.71 6.46,-1.51 2.81,-0.7 5.86,-2.06 9.17,-4=
.06 3.3,-2 6.67,-4.86 10.07,-8.57 3.52,-3.71 6.78,-8.62 9.78,-14.73 l 32.93=
9996,-66.78"
+           style=3D"fill:#ffffff;stroke:none;stroke-width:0.238399;stroke-=
opacity:1" />
+        <path
+           id=3D"path18-2"
+           class=3D"st1"
+           d=3D"m 175.39452,358.18274 c 0,3.51 -0.6,6.76 -1.81,9.78 -1.21,=
3 -2.86,5.62 -4.95,7.81 -2.01,2.11 -4.41,3.81 -7.22,5.12 -2.71,1.19 -5.67,1=
.8 -8.87,1.8 -3.21,0 -6.22,-0.6 -9.02,-1.8 -2.81,-1.31 -5.27,-3.01 -7.38,-5=
.12 -2,-2.19 -3.6,-4.81 -4.81,-7.81 -1.21,-3.01 -1.81,-6.27 -1.81,-9.78 0,-=
3.51 0.6,-6.76 1.81,-9.77 1.21,-3 2.81,-5.61 4.81,-7.82 2.11,-2.21 4.57,-3.=
92 7.38,-5.11 2.8,-1.32 5.81,-1.97 9.02,-1.97 3.21,0 6.16,0.65 8.87,1.97 2.=
81,1.19 5.21,2.9 7.22,5.11 2.1,2.21 3.75,4.81 4.95,7.82 1.2,3.01 1.81,6.26 =
1.81,9.77 m 13.98,0 c 0,-5.21 -0.95,-10.08 -2.86,-14.59 -1.81,-4.51 -4.36,-=
8.42 -7.67,-11.73 -3.32,-3.3 -7.22,-5.86 -11.73,-7.67 -4.51,-1.9 -9.38,-2.8=
6 -14.59,-2.86 -5.21,0 -10.08,0.95 -14.59,2.86 -4.51,1.81 -8.43,4.36 -11.73=
,7.67 -3.3,3.31 -5.92,7.22 -7.82,11.73 -1.9,4.51 -2.86,9.38 -2.86,14.59 0,5=
.21 0.95,10.08 2.86,14.59 1.9,4.41 4.52,8.27 7.82,11.57 3.3,3.32 7.22,5.92 =
11.73,7.82 4.51,1.81 9.38,2.71 14.59,2.71 5.21,0 10.08,-0.9 14.59,-2.71 4.5=
1,-1.91 8.41,-4.51 11.73,-7.82 3.3,-3.3 5.86,-7.16 7.67,-11.57 1.91,-4.51 2=
.86,-9.38 2.86,-14.59"
+           style=3D"fill:#ffffff;stroke:none;stroke-width:0.238399;stroke-=
opacity:1" />
+        <path
+           id=3D"path20-5"
+           class=3D"st1"
+           d=3D"m 373.22452,358.18274 c 0,3.51 -0.6,6.76 -1.81,9.78 -1.21,=
3 -2.86,5.62 -4.97,7.81 -2,2.11 -4.4,3.81 -7.21,5.12 -2.71,1.19 -5.67,1.8 -=
8.87,1.8 -3.21,0 -6.22,-0.6 -9.03,-1.8 -2.8,-1.31 -5.26,-3.01 -7.37,-5.12 -=
2,-2.19 -3.61,-4.81 -4.81,-7.81 -1.21,-3.01 -1.81,-6.27 -1.81,-9.78 0,-3.51=
 0.6,-6.76 1.81,-9.77 1.21,-3 2.81,-5.61 4.81,-7.82 2.11,-2.21 4.57,-3.92 7=
.37,-5.11 2.81,-1.32 5.82,-1.97 9.03,-1.97 3.21,0 6.16,0.65 8.87,1.97 2.81,=
1.19 5.21,2.9 7.21,5.11 2.11,2.21 3.76,4.81 4.97,7.82 1.21,3.01 1.81,6.26 1=
.81,9.77 m 13.98,0 c 0,-5.21 -0.95,-10.08 -2.86,-14.59 -1.81,-4.51 -4.36,-8=
.42 -7.67,-11.73 -3.32,-3.3 -7.22,-5.86 -11.73,-7.67 -4.51,-1.9 -9.38,-2.86=
 -14.59,-2.86 -5.22,0 -10.08,0.95 -14.59,2.86 -4.51,1.81 -8.43,4.36 -11.73,=
7.67 -3.3,3.31 -5.92,7.22 -7.82,11.73 -1.9,4.51 -2.86,9.38 -2.86,14.59 0,5.=
21 0.95,10.08 2.86,14.59 1.9,4.41 4.52,8.27 7.82,11.57 3.3,3.32 7.22,5.92 1=
1.73,7.82 4.51,1.81 9.37,2.71 14.59,2.71 5.21,0 10.08,-0.9 14.59,-2.71 4.51=
,-1.91 8.41,-4.51 11.73,-7.82 3.3,-3.3 5.86,-7.16 7.67,-11.57 1.91,-4.51 2.=
86,-9.38 2.86,-14.59"
+           style=3D"fill:#ffffff;stroke:none;stroke-width:0.238399;stroke-=
opacity:1" />
+        <path
+           id=3D"path22-4"
+           class=3D"st1"
+           d=3D"m 288.05452,298.59274 -13.39,7.52 v 16.45 h -36.21 c -26.1=
5,0 -41.9,12.74 -41.9,35.95 0,36.04 37.55,42.84 64.25,29.96 l -5.63,-10.92 =
c -21.13,9.23 -44.53,5.3 -44.53,-19.28 0,-15.86 8.26,-24.54 27.49,-24.54 h =
36.54 v 43.82 c 0,19.37 22.19,19.81 35.95,11.86 l -5.29,-10.45 c -8.85,4.48=
 -17.26,5.06 -17.26,-3.53 v -41.7 h 18.32 v -11.17 h -18.32 l -0.02,-23.97 =
v 0"
+           style=3D"fill:#ffffff;stroke:none;stroke-width:0.238399;stroke-=
opacity:1" />
+        <path
+           id=3D"path24-4"
+           class=3D"st1"
+           d=3D"m 136.79452,428.30274 h 3.35 c 1.69,-0.01 3.34,1.19 3.34,2=
.9 0,2.87 -3.23,3.3 -3.23,3.3 l -3.46,0.02 z m -4.84,-4.1 v 25.3 h 4.83 l 0=
.06,-10.67 c 8.62,0.54 11.84,-2.46 11.84,-7.75 0,-4.75 -4.26,-6.88 -8.34,-6=
.88 h -8.39 v 0"
+           style=3D"fill:#ffffff;stroke:none;stroke-width:0.238399;stroke-=
opacity:1" />
+        <path
+           id=3D"path26-9"
+           class=3D"st1"
+           d=3D"m 224.38452,436.87274 c 0,1.23 -0.23,2.39 -0.69,3.46 -0.42=
,1.04 -1.02,1.95 -1.81,2.74 -0.78,0.78 -1.7,1.4 -2.75,1.86 -1.04,0.42 -2.17=
,0.64 -3.38,0.64 -1.22,0 -2.35,-0.22 -3.39,-0.64 -1.05,-0.46 -1.96,-1.07 -2=
.75,-1.86 -0.76,-0.78 -1.36,-1.7 -1.81,-2.74 -0.46,-1.07 -0.69,-2.23 -0.69,=
-3.46 0,-1.23 0.23,-2.37 0.69,-3.42 0.45,-1.06 1.05,-1.99 1.81,-2.77 0.78,-=
0.78 1.7,-1.39 2.75,-1.82 1.04,-0.45 2.17,-0.67 3.39,-0.67 1.21,0 2.34,0.23=
 3.38,0.67 1.05,0.43 1.96,1.04 2.75,1.82 0.78,0.78 1.39,1.71 1.81,2.77 0.46=
,1.05 0.69,2.19 0.69,3.42 m 4.9,0 c 0,-1.81 -0.35,-3.5 -1.06,-5.06 -0.69,-1=
.59 -1.65,-2.97 -2.89,-4.12 -1.21,-1.17 -2.64,-2.09 -4.3,-2.75 -1.64,-0.69 =
-3.41,-1.04 -5.3,-1.04 -1.9,0 -3.69,0.35 -5.35,1.04 -1.64,0.66 -3.06,1.58 -=
4.27,2.75 -1.22,1.16 -2.17,2.53 -2.89,4.12 -0.69,1.57 -1.03,3.25 -1.03,5.06=
 0,1.83 0.34,3.53 1.03,5.1 0.72,1.57 1.68,2.94 2.89,4.12 1.21,1.17 2.63,2.0=
9 4.27,2.75 1.66,0.66 3.45,1 5.35,1 1.89,0 3.67,-0.34 5.3,-1 1.66,-0.66 3.1=
,-1.58 4.3,-2.75 1.24,-1.18 2.21,-2.55 2.89,-4.12 0.71,-1.56 1.06,-3.26 1.0=
6,-5.1"
+           style=3D"fill:#ffffff;stroke:none;stroke-width:0.238399;stroke-=
opacity:1" />
+        <path
+           id=3D"path28-9"
+           class=3D"st1"
+           d=3D"m 249.02452,424.25274 v 19.18 c 0,0.77 -0.57,1.63 -1.51,1.=
65 l -1.51,0.06 0.08,4.7 1.41,0.02 c 4.73,0.07 6.36,-4.37 6.36,-6.45 v -19.=
13"
+           style=3D"fill:#ffffff;stroke:none;stroke-width:0.238399;stroke-=
opacity:1" />
+        <path
+           id=3D"path30-3"
+           class=3D"st1"
+           d=3D"m 290.20452,424.19274 h -16.13 v 25.22 h 16.2 l -0.07,-4.0=
6 h -11.28 v -6.58 h 9.44 v -4.06 h -9.44 v -6.38 h 11.21 l 0.07,-4.14"
+           style=3D"fill:#ffffff;stroke:none;stroke-width:0.238399;stroke-=
opacity:1" />
+        <path
+           id=3D"path32-6"
+           class=3D"st1"
+           d=3D"m 327.39452,430.24274 c -8.26,-4.53 -16.39,-1.78 -16.39,6.=
52 0,6.69 6.43,11.84 17,6.31 l 1.53,4.13 c -10.15,5.58 -23.51,1.6 -23.51,-1=
0.44 0,-10.91 11.85,-16.59 23.36,-10.61 l -1.99,4.09"
+           style=3D"fill:#ffffff;stroke:none;stroke-width:0.238399;stroke-=
opacity:1" />
+        <path
+           id=3D"path34-0"
+           class=3D"st1"
+           d=3D"m 366.07452,424.19274 0.01,4.13 h -8.05 v 21.16 h -4.85 v =
-21.15 h -7.73 l 0.11,-4.13 h 20.51"
+           style=3D"fill:#ffffff;stroke:none;stroke-width:0.238399;stroke-=
opacity:1" />
+        <path
+           id=3D"path36-5"
+           class=3D"st1"
+           d=3D"m 172.67452,428.30274 h 3.35 c 1.69,-0.01 3.34,1.19 3.34,2=
.9 0,2.87 -3.23,3.3 -3.23,3.3 l -3.46,0.02 z m -4.82,-4.1 v 25.3 h 4.82 v -=
10.89 h 3.2 l 5.59,10.89 h 5.5 l -6.67,-12.2 c 2.64,-1.18 4.01,-3.26 4.01,-=
6.22 0,-4.94 -4.33,-6.88 -9.09,-6.88 h -7.36 v 0"
+           style=3D"fill:#ffffff;stroke:none;stroke-width:0.238399;stroke-=
opacity:1" />
+      </g>
+    </g>
+    <g
+       id=3D"g72820">
+      <rect
+         style=3D"fill:#99c1f1;fill-opacity:1;fill-rule:evenodd;stroke:#62=
a0ea;stroke-width:2;stroke-opacity:1"
+         id=3D"rect917-2-4-5"
+         width=3D"120"
+         height=3D"69.017166"
+         x=3D"100"
+         y=3D"120.00001"
+         ry=3D"3.4599047" />
+      <text
+         xml:space=3D"preserve"
+         style=3D"font-weight:bold;font-size:13.5687px;line-height:125%;fo=
nt-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';=
letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-op=
acity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin=
:miter;stroke-opacity:1"
+         x=3D"155.10774"
+         y=3D"150.4942"
+         id=3D"text1185-3-5-5-9"
+         transform=3D"scale(1.0176559,0.98265042)"><tspan
+           sodipodi:role=3D"line"
+           x=3D"155.10774"
+           y=3D"150.4942"
+           style=3D"font-style:normal;font-variant:normal;font-weight:bold=
;font-stretch:normal;font-size:13.5687px;font-family:'Liberation Sans';-ink=
scape-font-specification:'Liberation Sans Bold';text-align:center;text-anch=
or:middle;stroke:none;stroke-width:1px"
+           id=3D"tspan957-6-5-9">Blue 1</tspan><tspan
+           sodipodi:role=3D"line"
+           x=3D"155.10774"
+           y=3D"168.80861"
+           style=3D"font-style:normal;font-variant:normal;font-weight:bold=
;font-stretch:normal;font-size:13.5687px;font-family:'Liberation Sans';-ink=
scape-font-specification:'Liberation Sans Bold';text-align:center;text-anch=
or:middle;stroke:none;stroke-width:1px"
+           id=3D"tspan60047">box</tspan></text>
+    </g>
+    <rect
+       style=3D"fill:#ffbe6f;fill-opacity:1;fill-rule:evenodd;stroke:#ffa3=
48;stroke-width:2;stroke-opacity:1"
+       id=3D"rect917-2-9"
+       width=3D"120.00001"
+       height=3D"69.017166"
+       x=3D"-40"
+       y=3D"120.00001"
+       ry=3D"3.4599047" />
+    <text
+       xml:space=3D"preserve"
+       style=3D"font-weight:bold;font-size:13.5687px;line-height:125%;font=
-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';le=
tter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opac=
ity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:m=
iter;stroke-opacity:1"
+       x=3D"20.119326"
+       y=3D"149.15712"
+       id=3D"text1185-3-5-5-9-4"
+       transform=3D"scale(1.0176559,0.98265042)"><tspan
+         sodipodi:role=3D"line"
+         x=3D"20.119326"
+         y=3D"149.15712"
+         style=3D"font-style:normal;font-variant:normal;font-weight:bold;f=
ont-stretch:normal;font-size:13.5687px;font-family:'Liberation Sans';-inksc=
ape-font-specification:'Liberation Sans Bold';text-align:center;text-anchor=
:middle;stroke:none;stroke-width:1px"
+         id=3D"tspan957-6-5-9-2">Orange 1</tspan><tspan
+         sodipodi:role=3D"line"
+         x=3D"20.119326"
+         y=3D"167.47153"
+         style=3D"font-style:normal;font-variant:normal;font-weight:bold;f=
ont-stretch:normal;font-size:13.5687px;font-family:'Liberation Sans';-inksc=
ape-font-specification:'Liberation Sans Bold';text-align:center;text-anchor=
:middle;stroke:none;stroke-width:1px"
+         id=3D"tspan60047-2">box</tspan></text>
+    <text
+       xml:space=3D"preserve"
+       style=3D"font-weight:bold;font-size:42.5884px;line-height:125%;font=
-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';le=
tter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:none;stroke:#0000=
00;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacit=
y:1"
+       x=3D"313.46567"
+       y=3D"412.9321"
+       id=3D"text3781"><tspan
+         sodipodi:role=3D"line"
+         id=3D"tspan3779"
+         x=3D"313.46567"
+         y=3D"412.9321" /></text>
+    <text
+       xml:space=3D"preserve"
+       style=3D"font-weight:bold;font-size:13.3333px;line-height:125%;font=
-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';le=
tter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opac=
ity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:m=
iter;stroke-opacity:1"
+       x=3D"-52.348656"
+       y=3D"518.42615"
+       id=3D"text1185-9-2"><tspan
+         sodipodi:role=3D"line"
+         id=3D"tspan1183-1-8"
+         x=3D"-52.348656"
+         y=3D"518.42615"
+         style=3D"font-style:normal;font-variant:normal;font-weight:bold;f=
ont-stretch:normal;font-size:37.3333px;font-family:'Liberation Sans';-inksc=
ape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:norma=
l;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-as=
ian:normal;stroke:none">Objets</tspan></text>
+    <text
+       xml:space=3D"preserve"
+       style=3D"font-weight:bold;font-size:13.3333px;line-height:125%;font=
-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';le=
tter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opac=
ity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:m=
iter;stroke-opacity:1"
+       x=3D"-52.87841"
+       y=3D"89.660812"
+       id=3D"text1185-9-2-7"><tspan
+         sodipodi:role=3D"line"
+         id=3D"tspan1183-1-8-2"
+         x=3D"-52.87841"
+         y=3D"89.660812"
+         style=3D"font-style:normal;font-variant:normal;font-weight:bold;f=
ont-stretch:normal;font-size:37.3333px;font-family:'Liberation Sans';-inksc=
ape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:norma=
l;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-as=
ian:normal;stroke:none">Shapes</tspan></text>
+    <text
+       xml:space=3D"preserve"
+       style=3D"font-style:normal;font-variant:normal;font-weight:bold;fon=
t-stretch:normal;font-size:37.3333px;line-height:125%;font-family:'Nimbus R=
oman';-inkscape-font-specification:'Nimbus Roman, Bold';font-variant-ligatu=
res:normal;font-variant-caps:normal;font-variant-numeric:normal;font-varian=
t-east-asian:normal;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;=
fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:=
butt;stroke-linejoin:miter;stroke-opacity:1"
+       x=3D"-52.994568"
+       y=3D"-109.65781"
+       id=3D"text1185-9-2-7-0"><tspan
+         sodipodi:role=3D"line"
+         id=3D"tspan1183-1-8-2-4"
+         x=3D"-52.994568"
+         y=3D"-109.65781"
+         style=3D"font-style:normal;font-variant:normal;font-weight:bold;f=
ont-stretch:normal;font-size:37.3333px;font-family:'Liberation Sans';-inksc=
ape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:norma=
l;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-as=
ian:normal;stroke:none">Logos</tspan></text>
+    <text
+       xml:space=3D"preserve"
+       style=3D"font-weight:bold;font-size:13.3333px;line-height:125%;font=
-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';le=
tter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opac=
ity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:m=
iter;stroke-opacity:1"
+       x=3D"-51.052338"
+       y=3D"248.86438"
+       id=3D"text1185-9-2-7-3"><tspan
+         sodipodi:role=3D"line"
+         id=3D"tspan1183-1-8-2-8"
+         x=3D"-51.052338"
+         y=3D"248.86438"
+         style=3D"font-style:normal;font-variant:normal;font-weight:bold;f=
ont-stretch:normal;font-size:37.3333px;font-family:'Liberation Sans';-inksc=
ape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:norma=
l;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-as=
ian:normal;stroke:none">Arrows</tspan></text>
+    <text
+       xml:space=3D"preserve"
+       style=3D"font-weight:bold;font-size:13.3333px;line-height:125%;font=
-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';le=
tter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opac=
ity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:m=
iter;stroke-opacity:1"
+       x=3D"-52.697285"
+       y=3D"373.75641"
+       id=3D"text1185-9-2-7-3-6"><tspan
+         sodipodi:role=3D"line"
+         id=3D"tspan1183-1-8-2-8-4"
+         x=3D"-52.697285"
+         y=3D"373.75641"
+         style=3D"font-style:normal;font-variant:normal;font-weight:bold;f=
ont-stretch:normal;font-size:37.3333px;font-family:'Liberation Sans';-inksc=
ape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:norma=
l;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-as=
ian:normal;stroke:none">Text</tspan></text>
+    <path
+       style=3D"fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:3;=
stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dashar=
ray:none;stroke-opacity:1;marker-start:url(#marker5285);marker-end:url(#mar=
ker5161)"
+       d=3D"M -40,290.00001 H 70.803508"
+       id=3D"path5151"
+       inkscape:connector-type=3D"polyline"
+       inkscape:connector-curvature=3D"0" />
+    <path
+       style=3D"fill:#ffa348;fill-rule:evenodd;stroke:#ffa348;stroke-width=
:3;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-das=
harray:none;stroke-opacity:1;marker-start:url(#Arrow2Mstart-4);marker-end:u=
rl(#Arrow2Mend-4)"
+       d=3D"M 99.19649,290.00001 H 210"
+       id=3D"path5151-1"
+       inkscape:connector-type=3D"polyline"
+       inkscape:connector-curvature=3D"0" />
+    <path
+       style=3D"fill:#c0bfbc;fill-rule:evenodd;stroke:#c0bfbc;stroke-width=
:3;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-das=
harray:none;stroke-opacity:1;marker-start:url(#marker5285);marker-end:url(#=
marker5161)"
+       d=3D"M 379.19649,290.00001 H 490"
+       id=3D"path5151-1-2"
+       inkscape:connector-type=3D"polyline"
+       inkscape:connector-curvature=3D"0" />
+    <text
+       xml:space=3D"preserve"
+       style=3D"font-weight:bold;font-size:13.3333px;line-height:125%;font=
-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';le=
tter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opac=
ity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:m=
iter;stroke-opacity:1"
+       x=3D"-38.034531"
+       y=3D"429.09885"
+       id=3D"text1185-9-7"><tspan
+         sodipodi:role=3D"line"
+         id=3D"tspan1183-1-2"
+         x=3D"-38.034531"
+         y=3D"429.09885"
+         style=3D"font-style:normal;font-variant:normal;font-weight:normal=
;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-ink=
scape-font-specification:'Liberation Sans';stroke:none">Normal text</tspan>=
</text>
+    <text
+       xml:space=3D"preserve"
+       style=3D"font-weight:bold;font-size:13.3333px;line-height:125%;font=
-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';le=
tter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opac=
ity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:m=
iter;stroke-opacity:1"
+       x=3D"105.28938"
+       y=3D"324.79022"
+       id=3D"text1185-9-7-8"><tspan
+         sodipodi:role=3D"line"
+         id=3D"tspan1183-1-2-9"
+         x=3D"105.28938"
+         y=3D"324.79022"
+         style=3D"font-style:normal;font-variant:normal;font-weight:normal=
;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-ink=
scape-font-specification:'Liberation Sans';stroke:none">Orange 1 arrow</tsp=
an></text>
+    <text
+       xml:space=3D"preserve"
+       style=3D"font-weight:bold;font-size:13.3333px;line-height:125%;font=
-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';le=
tter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opac=
ity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:m=
iter;stroke-opacity:1"
+       x=3D"255.85823"
+       y=3D"324.95401"
+       id=3D"text1185-9-7-8-2"><tspan
+         sodipodi:role=3D"line"
+         id=3D"tspan1183-1-2-9-8"
+         x=3D"255.85823"
+         y=3D"324.95401"
+         style=3D"font-style:normal;font-variant:normal;font-weight:normal=
;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-ink=
scape-font-specification:'Liberation Sans';stroke:none">Blue 1 arrow</tspan=
></text>
+    <path
+       style=3D"fill:#99c1f1;fill-rule:evenodd;stroke:#99c1f1;stroke-width=
:3;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-das=
harray:none;stroke-opacity:1;marker-start:url(#marker4174-8);marker-end:url=
(#marker4286-6)"
+       d=3D"M 239.19649,290.00001 H 350"
+       id=3D"path5151-1-2-3"
+       inkscape:connector-type=3D"polyline"
+       inkscape:connector-curvature=3D"0" />
+    <text
+       xml:space=3D"preserve"
+       style=3D"font-weight:bold;font-size:13.3333px;line-height:125%;font=
-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';le=
tter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opac=
ity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:m=
iter;stroke-opacity:1"
+       x=3D"395.33353"
+       y=3D"324.16251"
+       id=3D"text1185-9-7-8-2-8"><tspan
+         sodipodi:role=3D"line"
+         id=3D"tspan1183-1-2-9-8-3"
+         x=3D"395.33353"
+         y=3D"324.16251"
+         style=3D"font-style:normal;font-variant:normal;font-weight:normal=
;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-ink=
scape-font-specification:'Liberation Sans';stroke:none">Light 3 arrow</tspa=
n></text>
+    <text
+       xml:space=3D"preserve"
+       style=3D"font-weight:bold;font-size:13.3333px;line-height:125%;font=
-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';le=
tter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opac=
ity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:m=
iter;stroke-opacity:1"
+       x=3D"57.50481"
+       y=3D"428.73474"
+       id=3D"text1185-9-7-1"><tspan
+         sodipodi:role=3D"line"
+         id=3D"tspan1183-1-2-2"
+         x=3D"57.50481"
+         y=3D"428.73474"
+         style=3D"font-style:normal;font-variant:normal;font-weight:bold;f=
ont-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inksc=
ape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:norma=
l;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-as=
ian:normal;stroke:none">Label text (bold)</tspan></text>
+    <text
+       xml:space=3D"preserve"
+       style=3D"font-weight:bold;font-size:42.5884px;line-height:125%;font=
-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';le=
tter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:none;stroke:#0000=
00;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacit=
y:1"
+       x=3D"-16.290483"
+       y=3D"345.7359"
+       id=3D"text3116"><tspan
+         sodipodi:role=3D"line"
+         id=3D"tspan3114"
+         x=3D"-16.290483"
+         y=3D"345.7359" /></text>
+  </g>
+  <style
+     type=3D"text/css"
+     id=3D"style1021"> .st0{fill:#4A97D2;} .st1{fill:#333333;} </style>
+</svg>
--=20
2.25.1


