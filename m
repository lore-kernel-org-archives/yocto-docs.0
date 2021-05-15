Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.3401.1621062788353166779
 for <docs@lists.yoctoproject.org>;
 Sat, 15 May 2021 00:13:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 6127C60002;
	Sat, 15 May 2021 07:13:06 +0000 (UTC)
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [RFC 3/3] overview-manual: SVG diagram for the git workflow
Date: Sat, 15 May 2021 09:12:19 +0200
Message-Id: <20210515071219.307241-4-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210515071219.307241-1-michael.opdenacker@bootlin.com>
References: <20210515071219.307241-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Set in full-width mode to make it ready in PDF
and EPUB outputs.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 .../development-environment.rst               |    4 +-
 .../overview-manual/figures/git-workflow.png  |  Bin 26586 -> 0 bytes
 .../overview-manual/svg/git-workflow.svg      | 1205 +++++++++++++++++
 3 files changed, 1207 insertions(+), 2 deletions(-)
 delete mode 100644 documentation/overview-manual/figures/git-workflow.png
 create mode 100644 documentation/overview-manual/svg/git-workflow.svg

diff --git a/documentation/overview-manual/development-environment.rst b/do=
cumentation/overview-manual/development-environment.rst
index 1decf01e43..ba03f2d5b4 100644
--- a/documentation/overview-manual/development-environment.rst
+++ b/documentation/overview-manual/development-environment.rst
@@ -286,8 +286,8 @@ develop, test, and submit changes to "contrib" areas fo=
r the maintainer
 to examine. The maintainer then chooses which changes are going to
 become a permanent part of the project.
=20
-.. image:: figures/git-workflow.png
-   :align: center
+.. image:: svg/git-workflow.*
+   :width: 100%
=20
 While each development environment is unique, there are some best
 practices or methods that help development run smoothly. The following
diff --git a/documentation/overview-manual/figures/git-workflow.png b/docum=
entation/overview-manual/figures/git-workflow.png
deleted file mode 100644
index e401330a1217d4792a8007600442731fcb72d084..000000000000000000000000000=
0000000000000
GIT binary patch
literal 0
HcmV?d00001

literal 26586
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

diff --git a/documentation/overview-manual/svg/git-workflow.svg b/documenta=
tion/overview-manual/svg/git-workflow.svg
new file mode 100644
index 0000000000..7747e35d9c
--- /dev/null
+++ b/documentation/overview-manual/svg/git-workflow.svg
@@ -0,0 +1,1205 @@
+<?xml version=3D"1.0" encoding=3D"UTF-8" standalone=3D"no"?>
+<svg
+   xmlns:osb=3D"http://www.openswatchbook.org/uri/2009/osb"
+   xmlns:dc=3D"http://purl.org/dc/elements/1.1/"
+   xmlns:cc=3D"http://creativecommons.org/ns#"
+   xmlns:rdf=3D"http://www.w3.org/1999/02/22-rdf-syntax-ns#"
+   xmlns:svg=3D"http://www.w3.org/2000/svg"
+   xmlns=3D"http://www.w3.org/2000/svg"
+   xmlns:xlink=3D"http://www.w3.org/1999/xlink"
+   xmlns:sodipodi=3D"http://sodipodi.sourceforge.net/DTD/sodipodi-0.dtd"
+   xmlns:inkscape=3D"http://www.inkscape.org/namespaces/inkscape"
+   version=3D"1.1"
+   id=3D"svg2"
+   width=3D"914.0769"
+   height=3D"379.81961"
+   viewBox=3D"0 0 914.0769 379.81961"
+   sodipodi:docname=3D"git-workflow.svg"
+   inkscape:version=3D"1.0.2 (394de47547, 2021-03-26)">
+  <metadata
+     id=3D"metadata8">
+    <rdf:RDF>
+      <cc:Work
+         rdf:about=3D"">
+        <dc:format>image/svg+xml</dc:format>
+        <dc:type
+           rdf:resource=3D"http://purl.org/dc/dcmitype/StillImage" />
+        <dc:title></dc:title>
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
+       end_linecap_type=3D"zerowidth" />
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
+       id=3D"marker4978"
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
+         style=3D"fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#00=
0000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id=3D"path4976" />
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
+       id=3D"marker4712"
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
+         style=3D"fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#00=
0000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id=3D"path4710" />
+    </marker>
+    <marker
+       style=3D"overflow:visible"
+       id=3D"marker4604"
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
+         style=3D"fill:#ffa348;fill-opacity:1;fill-rule:evenodd;stroke:#ff=
a348;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id=3D"path4602" />
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
+       id=3D"marker4414"
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
+         id=3D"path4412" />
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
+       id=3D"Arrow2Mstart"
+       refX=3D"0"
+       refY=3D"0"
+       orient=3D"auto"
+       inkscape:stockid=3D"Arrow2Mstart"
+       inkscape:isstock=3D"true"
+       inkscape:collect=3D"always">
+      <path
+         transform=3D"scale(0.6)"
+         d=3D"M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.001=
7078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style=3D"fill:#ffa348;fill-opacity:1;fill-rule:evenodd;stroke:#ff=
a348;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id=3D"path3333" />
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
+       osb:paint=3D"solid">
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
+     inkscape:cx=3D"782.70306"
+     inkscape:cy=3D"243.82083"
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
+     fit-margin-bottom=3D"30">
+    <inkscape:grid
+       type=3D"xygrid"
+       id=3D"grid1257"
+       originx=3D"52.044543"
+       originy=3D"-399.74243" />
+  </sodipodi:namedview>
+  <g
+     inkscape:groupmode=3D"layer"
+     inkscape:label=3D"Image"
+     id=3D"g10"
+     transform=3D"translate(52.044543,-399.74244)">
+    <g
+       id=3D"g5149"
+       transform=3D"translate(-6.511663,12.941792)">
+      <g
+         id=3D"g3925"
+         transform=3D"matrix(0.4122756,0,0,0.4122756,-131.50883,333.4483)"
+         style=3D"stroke-width:2.42556">
+        <g
+           id=3D"layer1-3-5-2"
+           inkscape:label=3D"Capa 1"
+           transform=3D"matrix(1.1196,0,0,1.1196,-122.82057,267.39056)"
+           style=3D"stroke-width:2.42556">
+          <g
+             id=3D"g10-5-2"
+             transform=3D"matrix(0.0423,0,0,0.0423,319.39,59.128)"
+             class=3D"Graphic"
+             style=3D"stroke-width:2.42556">
+            <g
+               id=3D"g12-4-2"
+               style=3D"stroke-width:2.42556">
+              <g
+                 id=3D"g14-64-0"
+                 style=3D"fill:#c7c7c7;stroke-width:2.42556">
+                <path
+                   id=3D"path16-1-5"
+                   inkscape:connector-curvature=3D"0"
+                   d=3D"m 5903,2361 c 50,82 34,3995 -31,4149 -51,122 -1703=
,1495 -1789,1531 -1117,-7 -1870,-414 -1995,-629 -48,-270 -7,-4433 38,-4520 =
40,-76 2153,-833 2227,-851 67,-15 1493,229 1550,320 z"
+                   style=3D"stroke-width:2.42556" />
+              </g>
+              <g
+                 id=3D"g18-6-5"
+                 style=3D"fill:#000000;stroke-width:2.42556">
+                <path
+                   id=3D"path20-8-2"
+                   inkscape:connector-curvature=3D"0"
+                   d=3D"m 5881,2374 2,-1 -2,2 c 0,-1 -1,-1 -1,-1 v -2 l 7,=
-3 -2,2 -5,1 5,-1 -2,2 z m 2,-1 2,-2 2,-2 5,-2 -5,4 5,-4 h 1 l -6,3 v 1 -1 =
z m 10,-6 h -1 1 -1 l 11,-6 -10,5 z m 11,-4 -11,4 v -1 z m 20,-15 c -2,-3 -=
4,-6 -7,-9 -2,-3 -5,-5 -8,-7 -5,-4 -12,-8 -20,-12 -7,-4 -15,-7 -24,-11 -9,-=
4 -19,-7 -30,-11 -21,-8 -47,-16 -75,-24 -29,-8 -61,-16 -95,-25 -136,-34 -31=
3,-72 -494,-106 -181,-35 -364,-66 -511,-90 -73,-11 -138,-21 -189,-27 -25,-3=
 -47,-6 -65,-8 -9,-1 -17,-1 -24,-2 -4,0 -7,0 -10,-1 h -9 c -3,0 -5,0 -7,1 h=
 -4 c -2,0 -3,0 -4,1 -2,0 -4,1 -7,2 -2,0 -5,1 -8,2 -3,1 -7,2 -11,3 -4,2 -8,=
3 -13,5 -10,3 -22,7 -35,12 -13,4 -28,9 -44,15 -33,11 -71,25 -115,40 -43,15 =
-91,32 -144,51 -209,75 -481,173 -753,274 -271,101 -542,203 -747,285 -51,21 =
-98,40 -140,57 -43,18 -80,34 -111,48 -16,7 -30,14 -42,20 -13,6 -24,12 -33,1=
7 -5,2 -9,5 -13,7 -4,3 -8,5 -10,7 -4,3 -7,5 -9,7 -5,4 -7,8 -9,11 -1,2 -2,5 =
-4,9 0,3 -1,6 -1,9 -1,3 -1,7 -2,11 -1,4 -1,8 -2,13 0,9 -1,20 -3,32 0,13 -1,=
27 -2,42 -2,31 -4,69 -6,111 -2,43 -4,91 -5,144 -7,213 -14,504 -19,835 -11,6=
62 -19,1482 -19,2144 0,308 2,583 5,791 1,52 2,100 3,143 1,43 3,82 4,115 1,3=
4 3,62 4,85 1,12 2,22 3,30 1,5 1,9 1,13 1,3 2,7 2,10 l 1,4 2,4 c 9,15 20,30=
 33,46 14,16 30,32 48,49 35,32 80,66 135,101 107,70 249,142 423,207 173,65 =
377,124 608,167 231,43 489,70 769,72 h 6 l 5,-2 8,-4 c 2,-2 5,-3 8,-6 3,-2 =
6,-4 10,-6 l 12,-9 c 9,-6 19,-13 30,-22 11,-8 23,-17 37,-28 27,-20 58,-45 9=
3,-73 35,-28 74,-59 116,-93 169,-136 385,-315 600,-497 215,-181 430,-366 59=
3,-512 41,-37 79,-71 113,-103 34,-31 64,-59 89,-84 13,-13 24,-24 34,-35 11,=
-11 20,-20 28,-29 8,-9 14,-17 19,-23 3,-4 5,-8 7,-10 2,-4 4,-8 6,-11 0,-2 1=
,-5 2,-8 1,-3 2,-5 3,-9 1,-6 2,-13 3,-22 2,-8 3,-17 4,-28 1,-11 2,-22 3,-35=
 2,-25 4,-55 7,-89 1,-34 3,-72 5,-113 8,-166 14,-391 19,-648 10,-516 16,-11=
64 16,-1743 0,-389 -3,-747 -8,-1012 -1,-66 -2,-127 -4,-181 -1,-53 -3,-100 -=
5,-139 -1,-20 -2,-38 -3,-53 -1,-16 -2,-30 -3,-41 -1,-6 -1,-11 -2,-16 -1,-5 =
-1,-10 -2,-13 -1,-4 -1,-8 -2,-11 -1,-2 -1,-4 -2,-5 -1,-3 -2,-5 -3,-6 z m -3=
7,21 12,-12 z m -6,9 c 1,3 1,7 2,11 0,4 1,9 1,15 1,11 3,24 4,39 0,15 1,33 2=
,52 2,39 4,86 6,139 1,53 2,114 4,180 5,264 7,622 7,1011 0,578 -5,1227 -15,1=
742 -6,257 -12,481 -19,646 -2,42 -4,79 -6,113 -2,33 -4,63 -6,88 -1,12 -2,24=
 -4,34 0,10 -2,18 -3,26 -1,7 -2,14 -3,18 0,3 -1,4 -1,6 0,1 -1,2 -1,2 0,1 -1=
,2 -2,4 -1,1 -3,4 -4,6 -5,6 -10,13 -17,21 -7,7 -16,17 -26,27 l -34,34 c -25=
,24 -54,52 -88,83 -33,31 -71,66 -112,102 -163,146 -377,330 -592,512 -215,18=
1 -431,360 -598,495 -42,34 -81,65 -116,93 -35,28 -66,52 -93,73 -13,10 -26,2=
0 -37,28 -10,8 -20,15 -28,21 -4,3 -8,6 -12,8 -3,2 -6,4 -8,6 -2,1 -4,2 -5,3 =
-276,-2 -528,-29 -755,-71 -228,-42 -429,-100 -600,-164 -169,-64 -308,-134 -=
413,-202 -51,-33 -94,-66 -128,-97 -17,-15 -31,-30 -43,-44 -10,-12 -19,-23 -=
26,-34 v -4 c -1,-3 -1,-7 -1,-11 -1,-8 -2,-18 -3,-28 -2,-23 -3,-51 -5,-84 -=
1,-33 -2,-71 -3,-115 -1,-42 -2,-90 -3,-142 -3,-208 -5,-482 -5,-790 0,-662 7=
,-1481 18,-2143 6,-330 12,-622 19,-834 2,-53 4,-101 6,-144 2,-42 3,-79 5,-1=
09 1,-16 2,-30 3,-42 1,-12 2,-22 3,-31 0,-4 1,-8 1,-11 1,-4 1,-6 2,-9 v -2 =
c 0,-1 1,-1 2,-2 2,-1 4,-3 7,-5 4,-1 7,-4 11,-6 9,-5 19,-10 31,-16 12,-6 26=
,-12 41,-19 31,-14 67,-29 109,-47 42,-17 89,-37 140,-57 205,-82 475,-184 74=
6,-284 271,-101 543,-200 752,-274 52,-19 101,-36 144,-51 43,-16 82,-29 114,=
-40 17,-6 31,-11 44,-16 13,-4 25,-8 35,-11 4,-2 9,-3 13,-4 4,-2 7,-3 10,-4 =
3,-1 5,-1 8,-2 l 3,-1 -2,-8 1,8 h 1 4 7 c 2,0 5,0 8,1 7,0 14,1 23,2 17,1 39=
,4 64,7 50,6 114,16 187,27 147,23 329,55 509,89 180,35 357,72 492,106 34,9 =
65,17 92,25 28,8 53,15 73,23 10,3 20,7 28,10 7,3 15,6 20,9 5,3 10,5 13,8 0,=
0 1,0 1,1 0,1 1,3 1,4 z M 4075,8017 c 1,0 1,-1 2,-1 h 6 v 14 l -8,-13 8,13 =
v 11 l -10,-23 c 0,0 1,-1 2,-1 z M 2110,7400 c 1,1 1,3 2,4 1,1 1,3 1,4 l -2=
5,4 21,-11 1,-1 -1,1 1,-1 h 2 z m 39,-4498 v 3 c -1,0 -1,1 -2,1 l -5,-6 -17=
,-4 17,4 -2,-1 4,2 z m -7,-2 2,1 z m -16,-8 14,7 z m 14,7 -10,-11 z m 2217,=
-841 -2,-17 z m -4,-17 4,17 v 1 z"
+                   style=3D"stroke-width:2.42556" />
+              </g>
+              <g
+                 id=3D"g22-8-9"
+                 style=3D"fill:#ffffff;fill-opacity:0.54118;stroke:#ffffff=
;stroke-width:2.42556;stroke-opacity:0.54118">
+                <path
+                   id=3D"path24-1-0"
+                   inkscape:connector-curvature=3D"0"
+                   d=3D"m 5822,2442 -52,22 -52,23 -52,23 -53,25 -53,25 -53=
,26 -53,26 -54,27 -54,27 -54,28 -55,28 -54,29 -55,29 -55,29 -111,60 -112,60=
 -112,60 -113,61 -114,60 -114,60 -114,59 -57,29 -57,29 -58,28 -57,28 -27,-6=
 -28,-7 -56,-13 -58,-14 -59,-13 -60,-14 -61,-14 -61,-14 -63,-14 -62,-14 -63=
,-15 -127,-28 -127,-28 -64,-14 -63,-14 -62,-13 -62,-13 -61,-13 -60,-13 -60,=
-13 -58,-12 -57,-12 -28,-5 -28,-6 -27,-5 -27,-6 -27,-5 -26,-5 -26,-5 -25,-6=
 -25,-4 -24,-5 -24,-5 -24,-4 -23,-4 -22,-5 -22,-4 -21,-3 -21,-4 -20,-4 52,1=
6 52,16 53,16 54,15 55,16 55,15 57,16 56,15 57,16 58,15 116,31 117,30 118,3=
1 118,31 117,30 116,31 58,15 57,16 57,15 56,16 55,15 55,16 54,15 53,16 52,1=
6 52,16 1,60 2,61 1,61 1,63 1,64 2,64 1,65 1,66 1,67 1,67 1,68 v 69 l 1,69 =
1,70 1,70 v 71 l 1,71 v 72 l 1,72 1,73 1,146 1,147 v 149 l 1,149 2,299 1,30=
0 1,149 1,148 1,147 1,146 1,73 v 72 l 1,72 1,71 v 71 l 1,71 1,69 1,70 v 68 =
l 1,68 1,67 1,67 1,66 1,65 1,65 2,63 1,63 1,62 2,61 1,60 1,-61 1,-61 v -63 =
l 1,-63 1,-64 1,-65 1,-66 1,-67 1,-67 1,-68 1,-69 2,-69 1,-70 1,-71 1,-71 1=
,-72 1,-72 2,-73 1,-73 1,-73 3,-148 3,-149 2,-151 3,-151 6,-303 5,-303 3,-1=
51 3,-150 2,-149 3,-149 1,-73 2,-73 1,-73 1,-72 1,-71 1,-72 1,-70 2,-70 1,-=
70 1,-68 1,-68 1,-68 1,-66 1,-66 1,-65 1,-64 1,-64 v -62 l 1,-62 1,-60 110,=
-59 109,-59 109,-57 109,-58 108,-57 107,-58 107,-57 107,-58 105,-58 105,-58=
 104,-60 103,-60 51,-30 50,-31 51,-31 50,-31 50,-31 50,-32 49,-32 z"
+                   style=3D"stroke-width:2.42556" />
+              </g>
+              <g
+                 id=3D"g28-1-8"
+                 style=3D"fill:none;stroke-width:2.42556">
+                <path
+                   id=3D"path30-7-3"
+                   inkscape:connector-curvature=3D"0"
+                   d=3D"m 5822,2442 c -549,232 -1156,606 -1768,901 -580,-1=
38 -1417,-322 -1839,-396 543,169 1257,327 1800,496 32,1271 16,3196 48,4467 =
16,-1282 59,-3238 75,-4519 586,-317 1161,-601 1684,-949 z"
+                   style=3D"stroke-width:2.42556" />
+              </g>
+              <g
+                 id=3D"g32-7-8"
+                 style=3D"fill:#000000;fill-opacity:0.16078;stroke:#ffffff=
;stroke-width:2.42556;stroke-opacity:0.16078">
+                <path
+                   id=3D"path34-1-0"
+                   inkscape:connector-curvature=3D"0"
+                   d=3D"m 2420,6628 10,14 10,13 11,13 12,13 12,12 12,12 14=
,12 13,12 14,12 15,11 15,11 16,11 15,11 17,10 16,10 17,11 18,9 18,10 18,9 1=
8,8 19,9 19,8 19,8 19,8 40,15 40,14 41,12 41,11 42,10 41,9 42,8 41,6 41,6 4=
1,3 21,2 20,1 19,1 h 20 20 19 l 19,-1 19,-1 18,-1 19,-1 17,-2 18,-3 17,-2 1=
7,-3 17,-4 16,-4 15,-4 15,-4 15,-5 15,-5 -2,-1 h -1 l -5,-2 -6,-1 -7,-2 -8,=
-2 -10,-3 -10,-3 -12,-3 -13,-4 -14,-3 -15,-4 -16,-5 -16,-4 -18,-5 -18,-5 -1=
9,-5 -20,-6 -20,-5 -21,-6 -22,-6 -22,-6 -22,-6 -23,-7 -24,-6 -48,-13 -49,-1=
4 -50,-14 -50,-13 -50,-15 -50,-13 -49,-14 -49,-13 -23,-7 -24,-6 -23,-7 -22,=
-6 -22,-6 -21,-6 -21,-6 -20,-5 -19,-6 -19,-5 -18,-5 -17,-5 -16,-4 -15,-5 -1=
5,-4 -13,-4 -12,-3 -12,-3 -10,-3 -9,-3 -7,-2 -7,-2 -5,-2 h -2 z"
+                   style=3D"stroke-width:2.42556" />
+              </g>
+              <g
+                 id=3D"g38-5-0"
+                 style=3D"fill:none;stroke-width:2.42556">
+                <path
+                   id=3D"path40-7-9"
+                   inkscape:connector-curvature=3D"0"
+                   d=3D"m 2420,6628 c 201,289 833,431 1133,315 -53,-14 -10=
66,-293 -1133,-315 z"
+                   style=3D"stroke-width:2.42556" />
+              </g>
+              <g
+                 id=3D"g42-6-1"
+                 style=3D"fill:#ffffff;fill-opacity:0.38824;stroke:#ffffff=
;stroke-width:2.42556;stroke-opacity:0.38824">
+                <path
+                   id=3D"path44-7-9"
+                   inkscape:connector-curvature=3D"0"
+                   d=3D"m 3454,6093 -936,-361 -9,4 -8,4 -8,4 -6,5 -6,6 -6,=
6 -5,7 -5,6 -4,7 -4,7 -3,7 -3,8 -3,8 -2,7 -3,15 -2,15 -2,14 v 6 7 5 6 5 4 4=
 l 1,4 v 2 2 1 1 l 146,51 1,1 1,1 1,1 1,2 2,2 1,3 3,3 2,3 3,4 3,4 3,4 4,5 4=
,4 4,6 5,4 10,12 10,11 13,12 13,12 14,13 15,12 17,13 17,12 19,12 19,11 21,1=
1 22,10 11,4 11,5 12,4 12,4 13,3 12,3 13,3 13,3 13,2 13,1 14,2 14,1 h 14 15=
 15 l 15,-1 15,-2 15,-2 16,-2 16,-3 16,-4 16,-4 17,-5 17,-6 h 1 l 2,1 h 3 l=
 6,1 6,1 7,1 8,1 9,1 10,1 11,1 12,1 12,1 h 12 l 13,1 h 26 l 14,-1 13,-1 14,=
-1 13,-2 13,-2 12,-3 12,-3 12,-3 10,-5 11,-5 9,-6 8,-6 8,-8 3,-4 3,-4 3,-4 =
2,-4 2,-5 z"
+                   style=3D"stroke-width:2.42556" />
+              </g>
+              <g
+                 id=3D"g48-57-2"
+                 style=3D"fill:none;stroke-width:2.42556">
+                <path
+                   id=3D"path50-0-5"
+                   inkscape:connector-curvature=3D"0"
+                   d=3D"m 3454,6093 -936,-361 c -97,34 -78,177 -78,177 l 1=
46,51 c 0,0 204,319 566,194 0,0 269,48 302,-61 z"
+                   style=3D"stroke-width:2.42556" />
+              </g>
+              <g
+                 id=3D"g52-5-4"
+                 style=3D"fill:#606060;stroke-width:2.42556">
+                <path
+                   id=3D"path54-7-4"
+                   inkscape:connector-curvature=3D"0"
+                   d=3D"m 3446,5971 c -311,-81 -622,-161 -933,-242 -12,44 =
-13,107 6,140 47,23 142,41 189,64 136,131 255,142 472,124 84,17 168,31 251,=
48 26,-51 33,-72 15,-134 z"
+                   style=3D"stroke-width:2.42556" />
+              </g>
+              <g
+                 id=3D"g56-7-9"
+                 style=3D"fill:none;stroke-width:2.42556">
+                <path
+                   id=3D"path58-8-9"
+                   inkscape:connector-curvature=3D"0"
+                   d=3D"m 3446,5971 c -311,-81 -622,-161 -933,-242 -12,44 =
-13,107 6,140 47,23 142,41 189,64 136,131 255,142 472,124 84,17 168,31 251,=
48 26,-51 33,-72 15,-134 z"
+                   style=3D"stroke-width:2.42556" />
+              </g>
+              <g
+                 id=3D"g60-5-3"
+                 style=3D"fill:#ffffff;fill-opacity:0.4;stroke:#ffffff;str=
oke-width:2.42556;stroke-opacity:0.4">
+                <path
+                   id=3D"path62-2-6"
+                   inkscape:connector-curvature=3D"0"
+                   d=3D"m 5856,2414 -1813,1017 7,4549 1775,-1494 z"
+                   style=3D"stroke-width:2.42556" />
+              </g>
+              <g
+                 id=3D"g66-2-5"
+                 style=3D"fill:none;stroke-width:2.42556">
+                <path
+                   id=3D"path68-9-0"
+                   inkscape:connector-curvature=3D"0"
+                   d=3D"m 5856,2414 -1813,1017 7,4549 1775,-1494 z"
+                   style=3D"stroke-width:2.42556" />
+              </g>
+              <g
+                 id=3D"g70-9-2"
+                 style=3D"fill:#000000;fill-opacity:0.16078;stroke:#ffffff=
;stroke-width:2.42556;stroke-opacity:0.16078">
+                <path
+                   id=3D"path72-9-9"
+                   inkscape:connector-curvature=3D"0"
+                   d=3D"m 2525,6916 10,13 11,12 10,13 11,11 11,12 11,11 12=
,11 12,10 12,10 12,10 13,10 12,9 13,9 13,8 27,17 28,15 28,14 28,13 29,11 29=
,11 30,9 30,8 29,8 30,6 30,5 30,4 30,3 30,2 29,2 h 29 l 29,-1 27,-2 28,-2 2=
7,-3 26,-5 25,-5 24,-6 24,-6 22,-8 -2,-1 h -4 l -4,-2 -5,-1 -6,-2 -8,-2 -8,=
-2 -9,-2 -10,-3 -10,-3 -11,-3 -12,-3 -13,-4 -13,-3 -14,-4 -15,-4 -15,-4 -15=
,-5 -16,-4 -16,-5 -17,-4 -18,-5 -35,-10 -36,-10 -38,-10 -38,-10 -38,-11 -76=
,-21 -37,-10 -37,-11 -36,-10 -17,-4 -17,-5 -17,-5 -16,-4 -16,-5 -15,-4 -15,=
-4 -14,-4 -14,-4 -13,-4 -12,-3 -11,-3 -12,-3 -10,-3 -9,-3 -8,-2 -8,-3 -7,-1=
 -6,-2 -5,-2 -4,-1 z"
+                   style=3D"stroke-width:2.42556" />
+              </g>
+              <g
+                 id=3D"g76-2-3"
+                 style=3D"fill:none;stroke-width:2.42556">
+                <path
+                   id=3D"path78-7-5"
+                   inkscape:connector-curvature=3D"0"
+                   d=3D"m 2525,6916 c 209,276 627,323 861,239 -39,-10 -810=
,-222 -861,-239 z"
+                   style=3D"stroke-width:2.42556" />
+              </g>
+              <g
+                 id=3D"g80-6-1"
+                 style=3D"fill:#000000;fill-opacity:0.16078;stroke:#ffffff=
;stroke-width:2.42556;stroke-opacity:0.16078">
+                <path
+                   id=3D"path82-0-7"
+                   inkscape:connector-curvature=3D"0"
+                   d=3D"m 2680,7199 12,15 12,14 13,14 14,12 14,13 14,11 15=
,11 16,11 15,9 17,9 16,9 17,7 18,7 17,7 18,5 18,5 18,5 19,3 18,4 19,2 18,2 =
19,1 h 19 19 l 18,-1 19,-2 18,-2 19,-3 18,-4 18,-4 18,-5 17,-6 h -1 l -2,-1=
 h -3 l -4,-1 -3,-1 -5,-2 -5,-1 -6,-2 -6,-1 -6,-2 -7,-2 -8,-2 -8,-2 -8,-3 -=
9,-2 -9,-2 -19,-6 -20,-5 -22,-6 -22,-6 -23,-6 -23,-7 -48,-13 -48,-13 -23,-7=
 -23,-6 -23,-6 -21,-6 -21,-6 -19,-6 -9,-2 -9,-3 -9,-2 -8,-2 -8,-2 -7,-2 -7,=
-2 -6,-2 -6,-2 -5,-2 -5,-1 -5,-1 -3,-1 -3,-1 -3,-1 z"
+                   style=3D"stroke-width:2.42556" />
+              </g>
+              <g
+                 id=3D"g86-0-3"
+                 style=3D"fill:none;stroke-width:2.42556">
+                <path
+                   id=3D"path88-3-1"
+                   inkscape:connector-curvature=3D"0"
+                   d=3D"m 2680,7199 c 121,163 355,213 540,149 -25,-6 -507,=
-139 -540,-149 z"
+                   style=3D"stroke-width:2.42556" />
+              </g>
+              <g
+                 id=3D"g90-5-4"
+                 style=3D"fill:#fcfcfc;fill-opacity:0.43922;stroke:#ffffff=
;stroke-width:2.42556;stroke-opacity:0.43922">
+                <path
+                   id=3D"path92-9-6"
+                   inkscape:connector-curvature=3D"0"
+                   d=3D"m 2356,3259 -92,13 -17,2173 1425,399 35,-116 -1369=
,-365 z"
+                   style=3D"stroke-width:2.42556" />
+              </g>
+              <g
+                 id=3D"g96-7-4"
+                 style=3D"fill:none;stroke-width:2.42556">
+                <path
+                   id=3D"path98-7-2"
+                   inkscape:connector-curvature=3D"0"
+                   d=3D"m 2356,3259 -92,13 -17,2173 1425,399 35,-116 -1369=
,-365 z"
+                   style=3D"stroke-width:2.42556" />
+              </g>
+              <g
+                 id=3D"g100-1-2"
+                 style=3D"fill:#000000;fill-opacity:0.23137;stroke:#ffffff=
;stroke-width:2.42556;stroke-opacity:0.23137">
+                <path
+                   id=3D"path102-64-6"
+                   inkscape:connector-curvature=3D"0"
+                   d=3D"m 3700,4065 -2,61 -1340,-386 z"
+                   style=3D"stroke-width:2.42556" />
+              </g>
+              <g
+                 id=3D"g106-1-1"
+                 style=3D"fill:#000000;fill-opacity:0.23137;stroke:#ffffff=
;stroke-width:2.42556;stroke-opacity:0.23137">
+                <path
+                   id=3D"path108-3-2"
+                   inkscape:connector-curvature=3D"0"
+                   d=3D"m 3720,4507 -3,61 -1339,-386 z"
+                   style=3D"stroke-width:2.42556" />
+              </g>
+              <g
+                 id=3D"g112-9-8"
+                 style=3D"fill:#000000;fill-opacity:0.23137;stroke:#ffffff=
;stroke-width:2.42556;stroke-opacity:0.23137">
+                <path
+                   id=3D"path114-09-9"
+                   inkscape:connector-curvature=3D"0"
+                   d=3D"m 3700,4916 -2,61 -1340,-386 z"
+                   style=3D"stroke-width:2.42556" />
+              </g>
+              <g
+                 id=3D"g118-8-8"
+                 style=3D"fill:#000000;fill-opacity:0.23137;stroke:#ffffff=
;stroke-width:2.42556;stroke-opacity:0.23137">
+                <path
+                   id=3D"path120-3-8"
+                   inkscape:connector-curvature=3D"0"
+                   d=3D"m 3700,5318 -2,61 -1340,-387 z"
+                   style=3D"stroke-width:2.42556" />
+              </g>
+              <g
+                 id=3D"g124-5-6"
+                 style=3D"fill:#9e9e9e;stroke-width:2.42556">
+                <path
+                   id=3D"path126-3-8"
+                   inkscape:connector-curvature=3D"0"
+                   d=3D"m 2361,3309 1332,333 -11,2197 h 11 11 l 11,-2205 v=
 -9 l -8,-2 -1341,-335 -2,11 z m 1340,335 -8,-2 v -8 h 11 z"
+                   style=3D"stroke-width:2.42556" />
+              </g>
+            </g>
+          </g>
+        </g>
+        <g
+           id=3D"g16724-3"
+           transform=3D"matrix(0.52218647,0,0,0.42933357,-400.52138,1028.8=
214)"
+           style=3D"stroke-width:2.42556">
+          <path
+             id=3D"path5488-8"
+             d=3D"m 1618.4,-890.85 v 126.36 h 0.5249 c -0.3385,1.0131 -0.5=
249,1.975 -0.5249,3.0182 0,15.228 36.989,27.557 82.672,27.557 45.683,0 82.6=
72,-12.33 82.672,-27.557 0,-1.0447 -0.1856,-2.0037 -0.5249,-3.0182 h 0.5249=
 v -126.36 h -165.34 z"
+             sodipodi:nodetypes=3D"cccssscccc"
+             style=3D"fill:url(#linearGradient11801);stroke-width:2.42556"
+             inkscape:connector-curvature=3D"0" />
+          <ellipse
+             id=3D"path5460-3"
+             style=3D"fill:url(#linearGradient11803);stroke-width:2.42556"
+             transform=3D"matrix(4.9627,0,0,4.9627,278.63,-3481.3)"
+             cx=3D"286.6308"
+             cy=3D"521.77954"
+             rx=3D"16.667517"
+             ry=3D"5.5558391" />
+          <path
+             id=3D"path6026-3"
+             d=3D"m 1618.3,-800.18 c 0.6187,15.05 37.507,27.164 82.804,27.=
164 45.168,0 81.851,-12.042 82.672,-27.033 -14.494,12.328 -46.02,20.865 -82=
.672,20.865 -36.727,0 -68.35,-8.6271 -82.804,-20.996 z"
+             style=3D"fill:#3b5d8b;stroke-width:2.42556"
+             inkscape:connector-curvature=3D"0" />
+          <path
+             id=3D"path6030-3"
+             d=3D"m 1618.3,-891.51 c 0.6187,15.05 37.507,27.164 82.804,27.=
164 45.168,0 81.851,-12.042 82.672,-27.033 -0.9058,0.77052 -1.8509,1.4911 -=
2.8869,2.2308 -0.038,0.0491 -0.091,0.0823 -0.131,0.13101 -9.6253,11.663 -41=
.587,20.209 -79.654,20.209 -38.306,0 -70.487,-8.6955 -79.917,-20.471 -0.104=
6,-0.0752 -0.1596,-0.18729 -0.2625,-0.26245 -0.9185,-0.67058 -1.8123,-1.273=
3 -2.6245,-1.9684 z"
+             style=3D"fill:url(#linearGradient11805);stroke-width:2.42556"
+             inkscape:connector-curvature=3D"0" />
+          <path
+             id=3D"path6022-8"
+             style=3D"fill:#3b5d8b;stroke-width:2.42556"
+             inkscape:connector-curvature=3D"0"
+             d=3D"m 1618.3,-844.36 c 0.6187,15.05 37.507,27.164 82.804,27.=
164 45.168,0 81.851,-12.042 82.672,-27.033 -14.494,12.328 -46.02,20.865 -82=
.672,20.865 -36.727,0 -68.35,-8.6271 -82.804,-20.996 z" />
+          <path
+             id=3D"path6043-0"
+             d=3D"m 1618.3,-844.36 c 0.6187,15.05 37.507,27.164 82.804,27.=
164 45.168,0 81.851,-12.042 82.672,-27.033 -0.2087,0.17721 -0.4427,0.3519 -=
0.6561,0.52491 -5.2161,13.55 -39.937,24.014 -82.016,24.014 -42.466,0 -77.55=
,-10.545 -82.279,-24.277 -0.1684,-0.13312 -0.3624,-0.2549 -0.5249,-0.39347 =
z"
+             style=3D"fill:url(#linearGradient11807);stroke-width:2.42556"
+             inkscape:connector-curvature=3D"0" />
+          <path
+             id=3D"path6054-4"
+             style=3D"fill:url(#linearGradient11809);stroke-width:2.42556"
+             inkscape:connector-curvature=3D"0"
+             d=3D"m 1618.3,-800.18 c 0.6187,15.05 37.507,27.164 82.804,27.=
164 45.168,0 81.851,-12.042 82.672,-27.033 -0.2087,0.17721 -0.4427,0.3519 -=
0.6561,0.52491 -5.2161,13.55 -39.937,24.014 -82.016,24.014 -42.466,0 -77.55=
,-10.545 -82.279,-24.277 -0.1684,-0.13312 -0.3624,-0.2549 -0.5249,-0.39347 =
z" />
+          <path
+             id=3D"path6060-7"
+             d=3D"m 1618.8,-754.64 c 4.7284,13.732 39.813,24.277 82.279,24=
.277 42.079,0 76.8,-10.464 82.016,-24.014 -14.766,12.043 -45.892,20.34 -82.=
016,20.34 -36.314,0 -67.608,-8.4562 -82.279,-20.602 z"
+             style=3D"fill:#3b5d8b;stroke-width:2.42556"
+             inkscape:connector-curvature=3D"0" />
+        </g>
+      </g>
+      <text
+         xml:space=3D"preserve"
+         style=3D"font-weight:bold;font-size:13.3333px;line-height:125%;fo=
nt-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';=
letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-op=
acity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin=
:miter;stroke-opacity:1"
+         x=3D"-15.501629"
+         y=3D"651.78131"
+         id=3D"text1185"><tspan
+           sodipodi:role=3D"line"
+           id=3D"tspan1183"
+           x=3D"-15.501629"
+           y=3D"651.78131"
+           style=3D"font-style:normal;font-variant:normal;font-weight:bold=
;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-ink=
scape-font-specification:'Liberation Sans Bold';stroke:none">source reposit=
ories </tspan></text>
+    </g>
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
+    <g
+       id=3D"g1153"
+       transform=3D"translate(-10.813715,57.621063)">
+      <rect
+         style=3D"opacity:1;fill:#deddda;fill-opacity:1;fill-rule:evenodd;=
stroke:#9a9996;stroke-width:2;stroke-opacity:1"
+         id=3D"rect917"
+         width=3D"125.52824"
+         height=3D"69.017166"
+         x=3D"196.65169"
+         y=3D"503.49741"
+         ry=3D"3.4599047" />
+      <text
+         xml:space=3D"preserve"
+         style=3D"font-weight:bold;font-size:13.3333px;line-height:125%;fo=
nt-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';=
letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-op=
acity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin=
:miter;stroke-opacity:1"
+         x=3D"259.14236"
+         y=3D"523.42725"
+         id=3D"text1185-3"><tspan
+           sodipodi:role=3D"line"
+           id=3D"tspan1183-8"
+           x=3D"259.14236"
+           y=3D"523.42725"
+           style=3D"font-style:normal;font-variant:normal;font-weight:bold=
;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-ink=
scape-font-specification:'Liberation Sans Bold';text-align:center;text-anch=
or:middle;stroke:none">project</tspan><tspan
+           sodipodi:role=3D"line"
+           x=3D"259.14236"
+           y=3D"541.42395"
+           style=3D"font-style:normal;font-variant:normal;font-weight:bold=
;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-ink=
scape-font-specification:'Liberation Sans Bold';text-align:center;text-anch=
or:middle;stroke:none"
+           id=3D"tspan959">&quot;master&quot;</tspan><tspan
+           sodipodi:role=3D"line"
+           x=3D"260.99133"
+           y=3D"559.42059"
+           style=3D"font-style:normal;font-variant:normal;font-weight:bold=
;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-ink=
scape-font-specification:'Liberation Sans Bold';stroke:none"
+           id=3D"tspan957"><tspan
+   style=3D"text-align:center;text-anchor:middle"
+   id=3D"tspan961">git repository</tspan> </tspan></text>
+    </g>
+    <g
+       id=3D"g1125"
+       transform=3D"matrix(0.22552185,0,0,0.22090333,92.716864,465.68288)"
+       style=3D"stroke:none;stroke-width:4.48028">
+      <rect
+         style=3D"opacity:1;fill:#333333;fill-opacity:1;fill-rule:evenodd;=
stroke:none;stroke-width:8.96054;stroke-opacity:1"
+         id=3D"rect1061"
+         width=3D"452.00439"
+         height=3D"192.0562"
+         x=3D"11.609296"
+         y=3D"276.44562"
+         ry=3D"4.0176301" />
+      <g
+         id=3D"g1109"
+         transform=3D"translate(-2.7615661,-1.7576335)"
+         style=3D"stroke:none;stroke-width:4.48028">
+        <path
+           id=3D"path14"
+           class=3D"st0"
+           d=3D"m 439.74452,358.11274 c 0,4.22 -3.41,7.64 -7.64,7.64 -4.22=
,0 -7.63,-3.42 -7.63,-7.64 0,-4.22 3.41,-7.64 7.63,-7.64 4.23,0 7.64,3.42 7=
.64,7.64 v 0"
+           style=3D"fill:#4a97d2;fill-opacity:1;stroke:none;stroke-width:0=
.448028;stroke-opacity:1" />
+        <path
+           id=3D"path16"
+           class=3D"st1"
+           d=3D"m 114.56452,324.94274 -11.13,-6.3 -22.409996,45.41 -23.9,-=
45.41 -11.27,6.3 28.41,53.38 c -0.21,0.51 -0.86,1.9 -1.95,4.22 -1.11,2.21 -=
2.25,4.41 -3.46,6.62 -2.11,3.81 -4.26,6.91 -6.46,9.32 -2.21,2.51 -4.46,4.51=
 -6.78,6.02 -2.3,1.51 -4.7,2.65 -7.21,3.46 -2.41,0.8 -4.87,1.45 -7.38,1.95 =
l 5.12,10.68 c 1.6,-0.21 3.75,-0.71 6.46,-1.51 2.81,-0.7 5.86,-2.06 9.17,-4=
.06 3.3,-2 6.67,-4.86 10.07,-8.57 3.52,-3.71 6.78,-8.62 9.78,-14.73 l 32.93=
9996,-66.78"
+           style=3D"fill:#ffffff;stroke:none;stroke-width:0.448028;stroke-=
opacity:1" />
+        <path
+           id=3D"path18"
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
+           style=3D"fill:#ffffff;stroke:none;stroke-width:0.448028;stroke-=
opacity:1" />
+        <path
+           id=3D"path20"
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
+           style=3D"fill:#ffffff;stroke:none;stroke-width:0.448028;stroke-=
opacity:1" />
+        <path
+           id=3D"path22"
+           class=3D"st1"
+           d=3D"m 288.05452,298.59274 -13.39,7.52 v 16.45 h -36.21 c -26.1=
5,0 -41.9,12.74 -41.9,35.95 0,36.04 37.55,42.84 64.25,29.96 l -5.63,-10.92 =
c -21.13,9.23 -44.53,5.3 -44.53,-19.28 0,-15.86 8.26,-24.54 27.49,-24.54 h =
36.54 v 43.82 c 0,19.37 22.19,19.81 35.95,11.86 l -5.29,-10.45 c -8.85,4.48=
 -17.26,5.06 -17.26,-3.53 v -41.7 h 18.32 v -11.17 h -18.32 l -0.02,-23.97 =
v 0"
+           style=3D"fill:#ffffff;stroke:none;stroke-width:0.448028;stroke-=
opacity:1" />
+        <path
+           id=3D"path24"
+           class=3D"st1"
+           d=3D"m 136.79452,428.30274 h 3.35 c 1.69,-0.01 3.34,1.19 3.34,2=
.9 0,2.87 -3.23,3.3 -3.23,3.3 l -3.46,0.02 z m -4.84,-4.1 v 25.3 h 4.83 l 0=
.06,-10.67 c 8.62,0.54 11.84,-2.46 11.84,-7.75 0,-4.75 -4.26,-6.88 -8.34,-6=
.88 h -8.39 v 0"
+           style=3D"fill:#ffffff;stroke:none;stroke-width:0.448028;stroke-=
opacity:1" />
+        <path
+           id=3D"path26"
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
+           style=3D"fill:#ffffff;stroke:none;stroke-width:0.448028;stroke-=
opacity:1" />
+        <path
+           id=3D"path28"
+           class=3D"st1"
+           d=3D"m 249.02452,424.25274 v 19.18 c 0,0.77 -0.57,1.63 -1.51,1.=
65 l -1.51,0.06 0.08,4.7 1.41,0.02 c 4.73,0.07 6.36,-4.37 6.36,-6.45 v -19.=
13"
+           style=3D"fill:#ffffff;stroke:none;stroke-width:0.448028;stroke-=
opacity:1" />
+        <path
+           id=3D"path30"
+           class=3D"st1"
+           d=3D"m 290.20452,424.19274 h -16.13 v 25.22 h 16.2 l -0.07,-4.0=
6 h -11.28 v -6.58 h 9.44 v -4.06 h -9.44 v -6.38 h 11.21 l 0.07,-4.14"
+           style=3D"fill:#ffffff;stroke:none;stroke-width:0.448028;stroke-=
opacity:1" />
+        <path
+           id=3D"path32"
+           class=3D"st1"
+           d=3D"m 327.39452,430.24274 c -8.26,-4.53 -16.39,-1.78 -16.39,6.=
52 0,6.69 6.43,11.84 17,6.31 l 1.53,4.13 c -10.15,5.58 -23.51,1.6 -23.51,-1=
0.44 0,-10.91 11.85,-16.59 23.36,-10.61 l -1.99,4.09"
+           style=3D"fill:#ffffff;stroke:none;stroke-width:0.448028;stroke-=
opacity:1" />
+        <path
+           id=3D"path34"
+           class=3D"st1"
+           d=3D"m 366.07452,424.19274 0.01,4.13 h -8.05 v 21.16 h -4.85 v =
-21.15 h -7.73 l 0.11,-4.13 h 20.51"
+           style=3D"fill:#ffffff;stroke:none;stroke-width:0.448028;stroke-=
opacity:1" />
+        <path
+           id=3D"path36"
+           class=3D"st1"
+           d=3D"m 172.67452,428.30274 h 3.35 c 1.69,-0.01 3.34,1.19 3.34,2=
.9 0,2.87 -3.23,3.3 -3.23,3.3 l -3.46,0.02 z m -4.82,-4.1 v 25.3 h 4.82 v -=
10.89 h 3.2 l 5.59,10.89 h 5.5 l -6.67,-12.2 c 2.64,-1.18 4.01,-3.26 4.01,-=
6.22 0,-4.94 -4.33,-6.88 -9.09,-6.88 h -7.36 v 0"
+           style=3D"fill:#ffffff;stroke:none;stroke-width:0.448028;stroke-=
opacity:1" />
+      </g>
+    </g>
+    <g
+       id=3D"g1211"
+       transform=3D"translate(26)">
+      <rect
+         style=3D"fill:#ffbe6f;fill-opacity:1;fill-rule:evenodd;stroke:#ff=
a348;stroke-width:2;stroke-opacity:1"
+         id=3D"rect917-2"
+         width=3D"125.52824"
+         height=3D"69.017166"
+         x=3D"400.98758"
+         y=3D"502.18555"
+         ry=3D"3.4599047" />
+      <text
+         xml:space=3D"preserve"
+         style=3D"font-weight:bold;font-size:13.3333px;line-height:125%;fo=
nt-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';=
letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-op=
acity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin=
:miter;stroke-opacity:1"
+         x=3D"463.47824"
+         y=3D"522.11536"
+         id=3D"text1185-3-5"><tspan
+           sodipodi:role=3D"line"
+           id=3D"tspan1183-8-4"
+           x=3D"463.47824"
+           y=3D"522.11536"
+           style=3D"font-style:normal;font-variant:normal;font-weight:bold=
;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-ink=
scape-font-specification:'Liberation Sans Bold';text-align:center;text-anch=
or:middle;stroke:none">project</tspan><tspan
+           sodipodi:role=3D"line"
+           x=3D"463.47824"
+           y=3D"540.11206"
+           style=3D"font-style:normal;font-variant:normal;font-weight:bold=
;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-ink=
scape-font-specification:'Liberation Sans Bold';text-align:center;text-anch=
or:middle;stroke:none"
+           id=3D"tspan959-9">&quot;contrib&quot;</tspan><tspan
+           sodipodi:role=3D"line"
+           x=3D"465.32721"
+           y=3D"558.1087"
+           style=3D"font-style:normal;font-variant:normal;font-weight:bold=
;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-ink=
scape-font-specification:'Liberation Sans Bold';stroke:none"
+           id=3D"tspan957-6"><tspan
+   style=3D"text-align:center;text-anchor:middle"
+   id=3D"tspan961-2">git repository</tspan> </tspan></text>
+    </g>
+    <g
+       id=3D"g1211-2"
+       transform=3D"translate(301.39294,0.59191294)">
+      <rect
+         style=3D"fill:#ffbe6f;fill-opacity:1;fill-rule:evenodd;stroke:#ff=
a348;stroke-width:2;stroke-opacity:1"
+         id=3D"rect917-2-7"
+         width=3D"125.52824"
+         height=3D"69.017166"
+         x=3D"400.98758"
+         y=3D"502.18555"
+         ry=3D"3.4599047" />
+      <text
+         xml:space=3D"preserve"
+         style=3D"font-weight:bold;font-size:13.3333px;line-height:125%;fo=
nt-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';=
letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-op=
acity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin=
:miter;stroke-opacity:1"
+         x=3D"463.47824"
+         y=3D"522.11536"
+         id=3D"text1185-3-5-0"><tspan
+           sodipodi:role=3D"line"
+           id=3D"tspan1183-8-4-8"
+           x=3D"463.47824"
+           y=3D"522.11536"
+           style=3D"font-style:normal;font-variant:normal;font-weight:bold=
;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-ink=
scape-font-specification:'Liberation Sans Bold';text-align:center;text-anch=
or:middle;stroke:none">local</tspan><tspan
+           sodipodi:role=3D"line"
+           x=3D"463.47824"
+           y=3D"540.11206"
+           style=3D"font-style:normal;font-variant:normal;font-weight:bold=
;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-ink=
scape-font-specification:'Liberation Sans Bold';text-align:center;text-anch=
or:middle;stroke:none"
+           id=3D"tspan959-9-9">development</tspan><tspan
+           sodipodi:role=3D"line"
+           x=3D"465.32721"
+           y=3D"558.1087"
+           style=3D"font-style:normal;font-variant:normal;font-weight:bold=
;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-ink=
scape-font-specification:'Liberation Sans Bold';stroke:none"
+           id=3D"tspan957-6-3"><tspan
+   style=3D"text-align:center;text-anchor:middle"
+   id=3D"tspan961-2-4">git repository</tspan> </tspan></text>
+    </g>
+    <g
+       id=3D"g1315"
+       transform=3D"translate(26,-6.418026)">
+      <rect
+         style=3D"fill:#99c1f1;fill-opacity:1;fill-rule:evenodd;stroke:#62=
a0ea;stroke-width:2;stroke-opacity:1"
+         id=3D"rect917-2-4"
+         width=3D"125.52824"
+         height=3D"69.017166"
+         x=3D"400.02109"
+         y=3D"630.14075"
+         ry=3D"3.4599047" />
+      <text
+         xml:space=3D"preserve"
+         style=3D"font-weight:bold;font-size:13.3333px;line-height:125%;fo=
nt-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';=
letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-op=
acity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin=
:miter;stroke-opacity:1"
+         x=3D"462.51175"
+         y=3D"650.07056"
+         id=3D"text1185-3-5-5"><tspan
+           sodipodi:role=3D"line"
+           id=3D"tspan1183-8-4-4"
+           x=3D"462.51175"
+           y=3D"650.07056"
+           style=3D"font-style:normal;font-variant:normal;font-weight:bold=
;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-ink=
scape-font-specification:'Liberation Sans Bold';text-align:center;text-anch=
or:middle;stroke:none">project</tspan><tspan
+           sodipodi:role=3D"line"
+           x=3D"462.51175"
+           y=3D"668.06726"
+           style=3D"font-style:normal;font-variant:normal;font-weight:bold=
;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-ink=
scape-font-specification:'Liberation Sans Bold';text-align:center;text-anch=
or:middle;stroke:none"
+           id=3D"tspan959-9-97">&quot;contrib&quot;</tspan><tspan
+           sodipodi:role=3D"line"
+           x=3D"464.36072"
+           y=3D"686.0639"
+           style=3D"font-style:normal;font-variant:normal;font-weight:bold=
;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-ink=
scape-font-specification:'Liberation Sans Bold';stroke:none"
+           id=3D"tspan957-6-5"><tspan
+   style=3D"text-align:center;text-anchor:middle"
+   id=3D"tspan961-2-44">git repository</tspan> </tspan></text>
+    </g>
+    <g
+       id=3D"g1315-2"
+       transform=3D"translate(305.48304,-6.418026)">
+      <rect
+         style=3D"fill:#99c1f1;fill-opacity:1;fill-rule:evenodd;stroke:#62=
a0ea;stroke-width:2;stroke-opacity:1"
+         id=3D"rect917-2-4-6"
+         width=3D"125.52824"
+         height=3D"69.017166"
+         x=3D"400.02109"
+         y=3D"630.14075"
+         ry=3D"3.4599047" />
+      <text
+         xml:space=3D"preserve"
+         style=3D"font-weight:bold;font-size:13.3333px;line-height:125%;fo=
nt-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';=
letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-op=
acity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin=
:miter;stroke-opacity:1"
+         x=3D"462.51175"
+         y=3D"650.07056"
+         id=3D"text1185-3-5-5-6"><tspan
+           sodipodi:role=3D"line"
+           id=3D"tspan1183-8-4-4-9"
+           x=3D"462.51175"
+           y=3D"650.07056"
+           style=3D"font-style:normal;font-variant:normal;font-weight:bold=
;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-ink=
scape-font-specification:'Liberation Sans Bold';text-align:center;text-anch=
or:middle;stroke:none">project</tspan><tspan
+           sodipodi:role=3D"line"
+           x=3D"462.51175"
+           y=3D"668.06726"
+           style=3D"font-style:normal;font-variant:normal;font-weight:bold=
;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-ink=
scape-font-specification:'Liberation Sans Bold';text-align:center;text-anch=
or:middle;stroke:none"
+           id=3D"tspan959-9-97-7">development</tspan><tspan
+           sodipodi:role=3D"line"
+           x=3D"464.36072"
+           y=3D"686.0639"
+           style=3D"font-style:normal;font-variant:normal;font-weight:bold=
;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-ink=
scape-font-specification:'Liberation Sans Bold';stroke:none"
+           id=3D"tspan957-6-5-4"><tspan
+   style=3D"text-align:center;text-anchor:middle"
+   id=3D"tspan961-2-44-8">git repository</tspan> </tspan></text>
+    </g>
+    <path
+       style=3D"fill:#ffa348;fill-rule:evenodd;stroke:#ffa348;stroke-width=
:3;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-das=
harray:none;stroke-opacity:1;marker-start:url(#Arrow2Mstart);marker-end:url=
(#Arrow2Mend)"
+       d=3D"m 552.51582,536.82903 149.8647,0.32211"
+       id=3D"path3307"
+       inkscape:connector-type=3D"polyline"
+       inkscape:connector-curvature=3D"0"
+       inkscape:connection-start=3D"#g1211"
+       inkscape:connection-end=3D"#g1211-2" />
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
+       x=3D"580.85419"
+       y=3D"524.23517"
+       id=3D"text1185-9"><tspan
+         sodipodi:role=3D"line"
+         id=3D"tspan1183-1"
+         x=3D"580.85419"
+         y=3D"524.23517"
+         style=3D"font-style:normal;font-variant:normal;font-weight:normal=
;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-ink=
scape-font-specification:'Liberation Sans';stroke:none">git pull and push</=
tspan></text>
+    <path
+       style=3D"fill:#62a0ea;fill-opacity:1;fill-rule:evenodd;stroke:#62a0=
ea;stroke-width:3;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlim=
it:4;stroke-dasharray:none;stroke-opacity:1;marker-start:url(#marker4174);m=
arker-end:url(#marker4286)"
+       d=3D"M 551.54932,660.2313 H 705.50413"
+       id=3D"path4056"
+       inkscape:connector-type=3D"polyline"
+       inkscape:connector-curvature=3D"0"
+       inkscape:connection-start=3D"#g1315"
+       inkscape:connection-end=3D"#g1315-2" />
+    <text
+       xml:space=3D"preserve"
+       style=3D"font-weight:bold;font-size:13.3333px;line-height:125%;font=
-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';le=
tter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opac=
ity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:m=
iter;stroke-opacity:1"
+       x=3D"580.85419"
+       y=3D"647.90686"
+       id=3D"text1185-9-4"><tspan
+         sodipodi:role=3D"line"
+         id=3D"tspan1183-1-6"
+         x=3D"580.85419"
+         y=3D"647.90686"
+         style=3D"font-style:normal;font-variant:normal;font-weight:normal=
;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-ink=
scape-font-specification:'Liberation Sans';stroke:none">git pull and push</=
tspan></text>
+    <path
+       style=3D"fill:#62a0ea;fill-rule:evenodd;stroke:#62a0ea;stroke-width=
:2;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-das=
harray:none;stroke-opacity:1;marker-end:url(#marker4414)"
+       d=3D"M 551.54932,632.30915 702.38052,565.2082"
+       id=3D"path4404"
+       inkscape:connector-type=3D"polyline"
+       inkscape:connector-curvature=3D"0"
+       inkscape:connection-start=3D"#g1315"
+       inkscape:connection-end=3D"#g1211-2" />
+    <path
+       style=3D"fill:#ffa348;fill-opacity:1;fill-rule:evenodd;stroke:#ffa3=
48;stroke-width:2;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlim=
it:4;stroke-dasharray:none;stroke-opacity:1;marker-end:url(#marker4604)"
+       d=3D"m 552.51582,564.53342 152.98831,67.8586"
+       id=3D"path4494"
+       inkscape:connector-type=3D"polyline"
+       inkscape:connector-curvature=3D"0"
+       inkscape:connection-start=3D"#g1211"
+       inkscape:connection-end=3D"#g1315-2" />
+    <path
+       style=3D"fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:3;=
stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dashar=
ray:none;stroke-opacity:1;marker-end:url(#marker4712)"
+       d=3D"M 426.98758,552.03263 311.36621,580.28855"
+       id=3D"path4702"
+       inkscape:connector-type=3D"polyline"
+       inkscape:connector-curvature=3D"0"
+       inkscape:connection-start=3D"#g1211"
+       inkscape:connection-end=3D"#g1153" />
+    <text
+       xml:space=3D"preserve"
+       style=3D"font-weight:bold;font-size:13.3333px;line-height:125%;font=
-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';le=
tter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opac=
ity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:m=
iter;stroke-opacity:1"
+       x=3D"377.95239"
+       y=3D"595.54547"
+       id=3D"text1185-9-0"><tspan
+         sodipodi:role=3D"line"
+         x=3D"377.95239"
+         y=3D"595.54547"
+         style=3D"font-style:normal;font-variant:normal;font-weight:normal=
;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-ink=
scape-font-specification:'Liberation Sans';text-align:center;text-anchor:mi=
ddle;stroke:none"
+         id=3D"tspan4840">git pull from the</tspan><tspan
+         sodipodi:role=3D"line"
+         x=3D"377.95239"
+         y=3D"613.54218"
+         style=3D"font-style:normal;font-variant:normal;font-weight:normal=
;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-ink=
scape-font-specification:'Liberation Sans';text-align:center;text-anchor:mi=
ddle;stroke:none"
+         id=3D"tspan4844">maintainer</tspan></text>
+    <path
+       style=3D"fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:3;=
stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dashar=
ray:none;stroke-opacity:1;marker-end:url(#marker4978)"
+       d=3D"M 426.02109,643.34906 311.36621,612.50929"
+       id=3D"path4850"
+       inkscape:connector-type=3D"polyline"
+       inkscape:connector-curvature=3D"0"
+       inkscape:connection-start=3D"#g1315"
+       inkscape:connection-end=3D"#g1153" />
+    <path
+       style=3D"fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:3;=
stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dashar=
ray:none;stroke-opacity:1;marker-start:url(#marker5285);marker-end:url(#mar=
ker5161)"
+       d=3D"M 75.034463,595.62705 H 185.83797"
+       id=3D"path5151"
+       inkscape:connector-type=3D"polyline"
+       inkscape:connector-curvature=3D"0" />
+    <text
+       xml:space=3D"preserve"
+       style=3D"font-weight:bold;font-size:13.3333px;line-height:125%;font=
-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';le=
tter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opac=
ity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:m=
iter;stroke-opacity:1"
+       x=3D"266.03806"
+       y=3D"439.90387"
+       id=3D"text1185-9-7"><tspan
+         sodipodi:role=3D"line"
+         id=3D"tspan1183-1-2"
+         x=3D"266.03806"
+         y=3D"439.90387"
+         style=3D"font-style:normal;font-variant:normal;font-weight:normal=
;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-ink=
scape-font-specification:'Liberation Sans';stroke:none">git pull</tspan></t=
ext>
+    <path
+       style=3D"fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:2.=
99999;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-=
dasharray:none;stroke-opacity:1;marker-end:url(#marker5623)"
+       d=3D"M 250.16567,560.37713 V 455.50595 h 515.77219 l -0.12369,46.24=
529"
+       id=3D"path6123"
+       sodipodi:nodetypes=3D"cccc" />
+    <path
+       style=3D"fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:2.=
99999;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-=
dasharray:none;stroke-opacity:1;marker-end:url(#marker5623-2)"
+       d=3D"m 250.61744,629.82817 v 107.36644 h 515.77214 v -42.1946"
+       id=3D"path6123-0"
+       sodipodi:nodetypes=3D"cccc" />
+    <text
+       xml:space=3D"preserve"
+       style=3D"font-weight:bold;font-size:13.3333px;line-height:125%;font=
-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';le=
tter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opac=
ity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:m=
iter;stroke-opacity:1"
+       x=3D"266.03806"
+       y=3D"720.30841"
+       id=3D"text1185-9-7-7"><tspan
+         sodipodi:role=3D"line"
+         id=3D"tspan1183-1-2-6"
+         x=3D"266.03806"
+         y=3D"720.30841"
+         style=3D"font-style:normal;font-variant:normal;font-weight:normal=
;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-ink=
scape-font-specification:'Liberation Sans';stroke:none">git pull</tspan></t=
ext>
+  </g>
+  <style
+     type=3D"text/css"
+     id=3D"style1021"> .st0{fill:#4A97D2;} .st1{fill:#333333;} </style>
+</svg>
--=20
2.25.1

