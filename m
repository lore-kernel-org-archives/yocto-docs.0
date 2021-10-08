Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75FF4C4332F
	for <webhook@archiver.kernel.org>; Fri,  8 Oct 2021 18:06:48 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web08.1029.1633716406477781088
 for <docs@lists.yoctoproject.org>;
 Fri, 08 Oct 2021 11:06:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id B4CB120002;
	Fri,  8 Oct 2021 18:06:43 +0000 (UTC)
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] manuals: remove obsolete documentation/template/ directory
Date: Fri,  8 Oct 2021 20:06:40 +0200
Message-Id: <20211008180640.1031212-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 08 Oct 2021 18:06:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/1973

Files in this directly are no longer used to generate
current documentation.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/template/Vera.ttf             | Bin 65932 -> 0 bytes
 documentation/template/VeraMoBd.ttf         | Bin 49052 -> 0 bytes
 documentation/template/VeraMono.ttf         | Bin 49224 -> 0 bytes
 documentation/template/draft.png            | Bin 24847 -> 0 bytes
 documentation/template/ohand-color.svg      | 150 ------------------
 documentation/template/poky-ref-manual.png  | Bin 32145 -> 0 bytes
 documentation/template/poky.svg             | 163 --------------------
 documentation/template/yocto-project-qs.png | Bin 17829 -> 0 bytes
 8 files changed, 313 deletions(-)
 delete mode 100644 documentation/template/Vera.ttf
 delete mode 100644 documentation/template/VeraMoBd.ttf
 delete mode 100644 documentation/template/VeraMono.ttf
 delete mode 100644 documentation/template/draft.png
 delete mode 100644 documentation/template/ohand-color.svg
 delete mode 100644 documentation/template/poky-ref-manual.png
 delete mode 100644 documentation/template/poky.svg
 delete mode 100644 documentation/template/yocto-project-qs.png

diff --git a/documentation/template/Vera.ttf b/documentation/template/Vera.=
ttf
deleted file mode 100644
index 58cd6b5e61eff273e920942e28041f8ddcf1e1b5..000000000000000000000000000=
0000000000000
GIT binary patch
literal 0
HcmV?d00001

literal 65932
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
B52OG9

diff --git a/documentation/template/VeraMoBd.ttf b/documentation/template/V=
eraMoBd.ttf
deleted file mode 100644
index 9be6547ed61cbea68f354fc49651bc3645c822fa..000000000000000000000000000=
0000000000000
GIT binary patch
literal 0
HcmV?d00001

literal 49052
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

diff --git a/documentation/template/VeraMono.ttf b/documentation/template/V=
eraMono.ttf
deleted file mode 100644
index 139f0b4311ad2e0369a347b3be6c46e6c2b730d5..000000000000000000000000000=
0000000000000
GIT binary patch
literal 0
HcmV?d00001

literal 49224
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

diff --git a/documentation/template/draft.png b/documentation/template/draf=
t.png
deleted file mode 100644
index 53051a9dddd3a89b086af6aed145106f3f1f3a6c..000000000000000000000000000=
0000000000000
GIT binary patch
literal 0
HcmV?d00001

literal 24847
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
E4@T<Iy#N3J

diff --git a/documentation/template/ohand-color.svg b/documentation/templat=
e/ohand-color.svg
deleted file mode 100644
index e42ff9c6fc..0000000000
--- a/documentation/template/ohand-color.svg
+++ /dev/null
@@ -1,150 +0,0 @@
-<?xml version=3D"1.0" encoding=3D"UTF-8" standalone=3D"no"?>
-<!-- Created with Inkscape (http://www.inkscape.org/) -->
-<svg
-   xmlns:dc=3D"http://purl.org/dc/elements/1.1/"
-   xmlns:cc=3D"http://web.resource.org/cc/"
-   xmlns:rdf=3D"http://www.w3.org/1999/02/22-rdf-syntax-ns#"
-   xmlns:svg=3D"http://www.w3.org/2000/svg"
-   xmlns=3D"http://www.w3.org/2000/svg"
-   xmlns:sodipodi=3D"http://sodipodi.sourceforge.net/DTD/sodipodi-0.dtd"
-   xmlns:inkscape=3D"http://www.inkscape.org/namespaces/inkscape"
-   width=3D"141.17999"
-   height=3D"55.34"
-   id=3D"svg2207"
-   sodipodi:version=3D"0.32"
-   inkscape:version=3D"0.45"
-   version=3D"1.0"
-   sodipodi:docname=3D"ohand-color.svg"
-   inkscape:output_extension=3D"org.inkscape.output.svg.inkscape"
-   sodipodi:docbase=3D"/home/mallum/Projects/admin/oh-doc-tools/common"
-   sodipodi:modified=3D"true">
-  <defs
-     id=3D"defs3" />
-  <sodipodi:namedview
-     id=3D"base"
-     pagecolor=3D"#ffffff"
-     bordercolor=3D"#666666"
-     borderopacity=3D"1.0"
-     inkscape:pageopacity=3D"0.0"
-     inkscape:pageshadow=3D"2"
-     inkscape:zoom=3D"1.2"
-     inkscape:cx=3D"160"
-     inkscape:cy=3D"146.21189"
-     inkscape:document-units=3D"mm"
-     inkscape:current-layer=3D"layer1"
-     height=3D"55.34px"
-     width=3D"141.18px"
-     inkscape:window-width=3D"772"
-     inkscape:window-height=3D"581"
-     inkscape:window-x=3D"5"
-     inkscape:window-y=3D"48" />
-  <metadata
-     id=3D"metadata2211">
-    <rdf:RDF>
-      <cc:Work
-         rdf:about=3D"">
-        <dc:format>image/svg+xml</dc:format>
-        <dc:type
-           rdf:resource=3D"http://purl.org/dc/dcmitype/StillImage" />
-      </cc:Work>
-    </rdf:RDF>
-  </metadata>
-  <g
-     inkscape:label=3D"Layer 1"
-     inkscape:groupmode=3D"layer"
-     id=3D"layer1">
-    <g
-       id=3D"g2094"
-       style=3D"fill:#6d6d70;fill-opacity:1"
-       inkscape:export-filename=3D"/home/mallum/Desktop/g2126.png"
-       inkscape:export-xdpi=3D"312.71841"
-       inkscape:export-ydpi=3D"312.71841"
-       transform=3D"matrix(0.5954767,0,0,0.5954767,31.793058,-18.471052)">
-      <g
-         id=3D"g19"
-         style=3D"fill:#6d6d70;fill-opacity:1">
-        <path
-           style=3D"fill:#6d6d70;fill-opacity:1"
-           id=3D"path21"
-           d=3D"M 48.693,50.633 C 40.282,50.633 33.439,57.477 33.439,65.88=
8 L 33.439,81.142 L 41.066,81.142 L 41.066,65.888 C 41.066,61.684 44.486,58=
.261 48.692,58.261 C 52.897,58.261 56.32,61.684 56.32,65.888 C 56.32,70.093=
 52.897,73.516 48.692,73.516 C 45.677,73.516 43.065,71.756 41.828,69.211 L =
41.828,79.504 C 43.892,80.549 46.224,81.142 48.692,81.142 C 57.103,81.142 6=
3.947,74.3 63.947,65.888 C 63.948,57.477 57.104,50.633 48.693,50.633 z " />
-      </g>
-      <path
-         style=3D"fill:#6d6d70;fill-opacity:1"
-         id=3D"path23"
-         d=3D"M 18.486,50.557 C 26.942,50.557 33.819,57.435 33.819,65.888 =
C 33.819,74.344 26.942,81.223 18.486,81.223 C 10.032,81.223 3.152,74.344 3.=
152,65.888 C 3.152,57.435 10.032,50.557 18.486,50.557 z M 18.486,73.556 C 2=
2.713,73.556 26.153,70.118 26.153,65.888 C 26.153,61.661 22.713,58.222 18.4=
86,58.222 C 14.258,58.222 10.819,61.661 10.819,65.888 C 10.82,70.117 14.259=
,73.556 18.486,73.556 z " />
-      <path
-         style=3D"fill:#6d6d70;fill-opacity:1"
-         id=3D"path25"
-         d=3D"M 94.074,107.465 L 94.074,96.016 C 94.074,87.605 87.233,80.7=
63 78.822,80.763 C 70.41,80.763 63.567,87.605 63.567,96.016 C 63.567,104.42=
7 70.41,111.269 78.822,111.269 C 81.289,111.269 83.621,110.676 85.685,109.6=
31 L 85.685,99.339 C 84.448,101.885 81.836,103.644 78.822,103.644 C 74.615,=
103.644 71.194,100.221 71.194,96.016 C 71.194,91.81 74.615,88.388 78.822,88=
.388 C 83.026,88.388 86.448,91.81 86.448,96.016 L 86.448,107.456 C 86.448,1=
09.562 88.156,111.268 90.262,111.268 C 92.364,111.269 94.068,109.566 94.074=
,107.465 z " />
-      <path
-         style=3D"fill:#6d6d70;fill-opacity:1"
-         id=3D"path27"
-         d=3D"M 124.197,95.814 C 124.088,87.496 117.293,80.762 108.949,80.=
762 C 100.59,80.762 93.783,87.52 93.697,95.856 L 93.693,95.856 L 93.695,107=
.456 C 93.695,109.562 95.402,111.268 97.509,111.268 C 99.611,111.268 101.31=
6,109.566 101.321,107.464 L 101.321,95.994 L 101.321,95.994 C 101.333,91.79=
8 104.747,88.388 108.948,88.388 C 113.147,88.388 116.563,91.798 116.575,95.=
994 L 116.575,107.456 C 116.575,109.562 118.282,111.268 120.387,111.268 C 1=
22.492,111.268 124.201,109.562 124.201,107.456 L 124.201,95.814 L 124.197,9=
5.814 z " />
-      <path
-         style=3D"fill:#6d6d70;fill-opacity:1"
-         id=3D"path29"
-         d=3D"M 63.946,96.005 L 63.946,95.854 L 63.943,95.854 L 63.943,95.=
815 L 63.942,95.815 C 63.833,87.497 57.037,80.761 48.693,80.761 C 48.682,80=
.761 48.671,80.763 48.658,80.763 C 48.382,80.763 48.107,80.772 47.833,80.78=
6 C 47.75,80.791 47.668,80.799 47.586,80.806 C 47.378,80.822 47.172,80.838 =
46.968,80.862 C 46.884,80.873 46.801,80.882 46.719,80.893 C 46.508,80.92 46=
.298,80.952 46.091,80.987 C 46.024,80.999 45.958,81.01 45.891,81.024 C 45.6=
49,81.068 45.406,81.119 45.168,81.175 C 45.14,81.183 45.112,81.189 45.085,8=
1.195 C 43.656,81.542 42.306,82.092 41.065,82.812 L 41.065,80.761 L 33.438,=
80.761 L 33.438,95.857 L 33.435,95.857 L 33.435,107.457 C 33.435,109.563 35=
.142,111.269 37.248,111.269 C 39.093,111.269 40.632,109.958 40.984,108.217 =
C 41.036,107.963 41.065,107.702 41.065,107.435 L 41.065,95.873 C 41.086,94.=
732 41.357,93.65 41.828,92.685 L 41.828,92.693 C 42.598,91.106 43.905,89.82=
4 45.511,89.085 C 45.519,89.08 45.529,89.076 45.536,89.073 C 45.849,88.928 =
46.174,88.807 46.508,88.707 C 46.523,88.704 46.536,88.699 46.55,88.696 C 46=
.699,88.651 46.85,88.614 47.004,88.576 C 47.025,88.575 47.046,88.567 47.069=
,88.562 C 47.234,88.527 47.402,88.495 47.572,88.469 C 47.586,88.468 47.6,88=
.466 47.615,88.463 C 47.763,88.443 47.916,88.427 48.067,88.415 C 48.106,88.=
41 48.145,88.407 48.186,88.404 C 48.352,88.393 48.52,88.386 48.691,88.386 C=
 52.888,88.387 56.304,91.797 56.316,95.992 L 56.316,107.454 C 56.316,109.56=
 58.023,111.266 60.13,111.266 C 61.976,111.266 63.516,109.954 63.867,108.21=
1 C 63.919,107.963 63.946,107.706 63.946,107.442 L 63.946,96.024 C 63.946,9=
6.021 63.947,96.018 63.947,96.015 C 63.948,96.011 63.946,96.008 63.946,96.0=
05 z " />
-      <path
-         style=3D"fill:#6d6d70;fill-opacity:1"
-         id=3D"path31"
-         d=3D"M 180.644,50.633 C 178.539,50.633 176.832,52.341 176.832,54.=
447 L 176.832,65.887 C 176.832,70.092 173.41,73.513 169.203,73.513 C 164.99=
8,73.513 161.576,70.092 161.576,65.887 C 161.576,61.683 164.998,58.26 169.2=
03,58.26 C 172.219,58.26 174.83,60.019 176.068,62.565 L 176.068,52.271 C 17=
4.004,51.225 171.673,50.632 169.203,50.632 C 160.793,50.632 153.951,57.476 =
153.951,65.887 C 153.951,74.298 160.793,81.141 169.203,81.141 C 177.615,81.=
141 184.459,74.298 184.459,65.887 L 184.459,54.447 C 184.458,52.341 182.751=
,50.633 180.644,50.633 z " />
-      <path
-         style=3D"fill:#6d6d70;fill-opacity:1"
-         id=3D"path33"
-         d=3D"M 124.203,77.339 L 124.203,65.687 L 124.197,65.687 C 124.088=
,57.371 117.293,50.633 108.949,50.633 C 100.592,50.633 93.783,57.393 93.697=
,65.731 L 93.695,65.731 L 93.695,65.877 C 93.695,65.882 93.693,65.885 93.69=
3,65.888 C 93.693,65.891 93.695,65.896 93.695,65.899 L 93.695,77.33 C 93.69=
5,79.435 95.402,81.142 97.509,81.142 C 99.614,81.142 101.321,79.435 101.321=
,77.33 L 101.321,65.868 C 101.333,61.672 104.747,58.261 108.948,58.261 C 11=
3.147,58.261 116.563,61.672 116.575,65.868 L 116.575,65.868 L 116.575,77.32=
9 C 116.575,79.434 118.282,81.141 120.389,81.141 C 122.492,81.142 124.197,7=
9.44 124.203,77.339 z " />
-      <path
-         style=3D"fill:#6d6d70;fill-opacity:1"
-         id=3D"path35"
-         d=3D"M 150.517,80.761 C 148.41,80.761 146.703,82.469 146.703,84.5=
75 L 146.703,96.015 C 146.703,100.22 143.283,103.643 139.076,103.643 C 134.=
871,103.643 131.449,100.22 131.449,96.015 C 131.449,91.808 134.871,88.387 1=
39.076,88.387 C 142.092,88.387 144.703,90.145 145.941,92.692 L 145.941,82.3=
97 C 143.875,81.353 141.545,80.76 139.076,80.76 C 130.666,80.76 123.822,87.=
604 123.822,96.015 C 123.822,104.426 130.666,111.268 139.076,111.268 C 147.=
486,111.268 154.33,104.426 154.33,96.015 L 154.33,84.575 C 154.33,82.469 15=
2.623,80.761 150.517,80.761 z " />
-      <path
-         style=3D"fill:#6d6d70;fill-opacity:1"
-         id=3D"path37"
-         d=3D"M 82.625,77.345 C 82.625,75.247 80.923,73.547 78.826,73.547 =
L 78.826,81.142 C 80.922,81.142 82.625,79.442 82.625,77.345 z " />
-      <path
-         style=3D"fill:#6d6d70;fill-opacity:1"
-         id=3D"path39"
-         d=3D"M 90.252,69.685 C 92.35,69.685 94.048,67.987 94.048,65.888 L=
 86.453,65.888 C 86.453,67.986 88.154,69.685 90.252,69.685 z " />
-      <path
-         style=3D"fill:#6d6d70;fill-opacity:1"
-         id=3D"path41"
-         d=3D"M 93.832,77.329 C 93.832,75.223 92.125,73.516 90.018,73.516 =
L 78.825,73.516 C 74.619,73.516 71.199,70.093 71.199,65.888 C 71.199,61.684=
 74.619,58.261 78.825,58.261 C 83.032,58.261 86.453,61.684 86.453,65.888 C =
86.453,68.904 84.694,71.514 82.149,72.752 L 92.442,72.752 C 93.488,70.689 9=
4.08,68.356 94.08,65.888 C 94.08,57.477 87.237,50.633 78.826,50.633 C 70.41=
5,50.633 63.571,57.477 63.571,65.888 C 63.571,74.3 70.415,81.142 78.826,81.=
142 L 90.018,81.142 C 92.125,81.142 93.832,79.435 93.832,77.329 z " />
-      <path
-         style=3D"fill:#6d6d70;fill-opacity:1"
-         id=3D"path43"
-         d=3D"M 142.869,77.345 C 142.869,75.247 141.168,73.547 139.07,73.5=
47 L 139.07,81.142 C 141.167,81.142 142.869,79.442 142.869,77.345 z " />
-      <path
-         style=3D"fill:#6d6d70;fill-opacity:1"
-         id=3D"path45"
-         d=3D"M 150.496,69.685 C 152.594,69.685 154.293,67.987 154.293,65.=
888 L 146.699,65.888 C 146.699,67.986 148.398,69.685 150.496,69.685 z " />
-      <path
-         style=3D"fill:#6d6d70;fill-opacity:1"
-         id=3D"path47"
-         d=3D"M 154.076,77.329 C 154.076,75.223 152.367,73.516 150.262,73.=
516 L 139.07,73.516 C 134.865,73.516 131.443,70.093 131.443,65.888 C 131.44=
3,61.684 134.865,58.261 139.07,58.261 C 143.275,58.261 146.699,61.684 146.6=
99,65.888 C 146.699,68.904 144.939,71.514 142.392,72.752 L 152.687,72.752 C=
 153.73,70.689 154.324,68.356 154.324,65.888 C 154.324,57.477 147.48,50.633=
 139.07,50.633 C 130.66,50.633 123.816,57.477 123.816,65.888 C 123.816,74.3=
 130.66,81.142 139.07,81.142 L 150.261,81.142 C 152.367,81.142 154.076,79.4=
35 154.076,77.329 z " />
-    </g>
-    <g
-       id=3D"g2126"
-       transform=3D"matrix(0.7679564,0,0,0.7679564,-66.520631,11.42903)"
-       inkscape:export-xdpi=3D"312.71841"
-       inkscape:export-ydpi=3D"312.71841"
-       style=3D"fill:#35992a;fill-opacity:1">
-      <g
-         transform=3D"translate(86.33975,4.23985e-2)"
-         style=3D"fill:#35992a;fill-opacity:1"
-         id=3D"g2114">
-        <g
-           style=3D"fill:#35992a;fill-opacity:1"
-           id=3D"g2116">
-          <path
-             id=3D"path2118"
-             transform=3D"translate(-86.33975,-4.239934e-2)"
-             d=3D"M 89.96875,0.03125 C 87.962748,0.031250001 86.34375,1.68=
15001 86.34375,3.6875 L 86.34375,17.71875 L 86.34375,19.6875 L 86.34375,28.=
90625 C 86.343752,39.06825 94.61925,47.34375 104.78125,47.34375 L 113.375,4=
7.34375 L 123.1875,47.34375 L 127.15625,47.34375 C 129.16325,47.343749 130.=
8125,45.72475 130.8125,43.71875 C 130.8125,41.71275 129.16325,40.09375 127.=
15625,40.09375 L 123.1875,40.09375 L 123.1875,19.6875 L 123.1875,14.65625 L=
 123.1875,3.6875 C 123.1875,1.6815 121.5675,0.03125 119.5625,0.03125 C 117.=
5555,0.031250001 115.9375,1.6815001 115.9375,3.6875 L 115.9375,14.28125 C 1=
15.1185,13.65425 114.26275,13.109 113.34375,12.625 L 113.34375,3.6875 C 113=
.34475,1.6815 111.6925,0.03125 109.6875,0.03125 C 107.6825,0.031250001 106.=
0625,1.6815001 106.0625,3.6875 L 106.0625,10.5625 C 105.6305,10.5325 105.22=
025,10.5 104.78125,10.5 C 104.34125,10.5 103.90075,10.5325 103.46875,10.562=
5 L 103.46875,3.6875 C 103.46975,1.6815 101.84975,0.03125 99.84375,0.03125 =
C 97.837749,0.031250001 96.21875,1.6815001 96.21875,3.6875 L 96.21875,12.62=
5 C 95.299754,13.109 94.41375,13.65425 93.59375,14.28125 L 93.59375,3.6875 =
C 93.59475,1.6815 91.97475,0.03125 89.96875,0.03125 z M 104.78125,14.34375 =
C 112.80825,14.34375 119.3125,20.87925 119.3125,28.90625 C 119.3125,36.9332=
5 112.80825,43.46875 104.78125,43.46875 C 96.754254,43.46875 90.21875,36.93=
425 90.21875,28.90625 C 90.218752,20.87825 96.753253,14.34375 104.78125,14.=
34375 z "
-             style=3D"fill:#35992a;fill-opacity:1" />
-        </g>
-      </g>
-      <path
-         style=3D"fill:#35992a;fill-opacity:1"
-         id=3D"path2122"
-         d=3D"M 112.04875,28.913399 C 112.04875,24.899399 108.78275,21.634=
399 104.76975,21.634399 C 100.75675,21.634399 97.490753,24.900399 97.490753=
,28.913399 C 97.490753,32.926399 100.75675,36.192399 104.76975,36.192399 C =
108.78275,36.192399 112.04875,32.927399 112.04875,28.913399 z " />
-    </g>
-  </g>
-</svg>
diff --git a/documentation/template/poky-ref-manual.png b/documentation/tem=
plate/poky-ref-manual.png
deleted file mode 100644
index 2085edb4677efa6357eb82274b0b32485ca9527d..000000000000000000000000000=
0000000000000
GIT binary patch
literal 0
HcmV?d00001

literal 32145
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

diff --git a/documentation/template/poky.svg b/documentation/template/poky.=
svg
deleted file mode 100644
index a4ea5e2f45..0000000000
--- a/documentation/template/poky.svg
+++ /dev/null
@@ -1,163 +0,0 @@
-<?xml version=3D"1.0" encoding=3D"UTF-8" standalone=3D"no"?>
-<!-- Created with Inkscape (http://www.inkscape.org/) -->
-<svg
-   xmlns:svg=3D"http://www.w3.org/2000/svg"
-   xmlns=3D"http://www.w3.org/2000/svg"
-   version=3D"1.0"
-   width=3D"158.56076"
-   height=3D"79.284424"
-   viewBox=3D"-40.981 -92.592 300 300"
-   id=3D"svg2"
-   xml:space=3D"preserve">
-<defs
-   id=3D"defs4">
-</defs>
-<path
-   d=3D"M -36.585379,54.412576 L -36.585379,54.421305 L -36.582469,54.4213=
05 L -36.582469,54.243829 C -36.57956,54.302018 -36.585379,54.357297 -36.58=
5379,54.412576 z "
-   style=3D"fill:#6ac7bd"
-   id=3D"path6" />
-<g
-   transform=3D"matrix(2.9094193,0,0,2.9094193,-179.03055,-86.624435)"
-   style=3D"opacity:0.65"
-   id=3D"g8">
-	<g
-   id=3D"g10">
-		<path
-   d=3D"M 24.482,23.998 L 24.482,23.995 C 10.961,23.994 0,34.955 0,48.476 =
L 0.001,48.479 L 0.001,48.482 C 0.003,62.001 10.962,72.96 24.482,72.96 L 24=
.482,72.96 L 0,72.96 L 0,97.442 L 0.003,97.442 C 13.523,97.44 24.482,86.48 =
24.482,72.961 L 24.485,72.961 C 38.005,72.959 48.963,62 48.963,48.479 L 48.=
963,48.476 C 48.962,34.957 38.001,23.998 24.482,23.998 z M 24.482,50.928 C =
23.13,50.928 22.034,49.832 22.034,48.48 C 22.034,47.128 23.13,46.032 24.482=
,46.032 C 25.834,46.032 26.93,47.128 26.93,48.48 C 26.93,49.832 25.834,50.9=
28 24.482,50.928 z "
-   style=3D"fill:#ef412a"
-   id=3D"path12" />
-	</g>
-</g>
-<g
-   transform=3D"matrix(2.9094193,0,0,2.9094193,-179.03055,-86.624435)"
-   style=3D"opacity:0.65"
-   id=3D"g14">
-	<g
-   id=3D"g16">
-		<path
-   d=3D"M 119.96,48.842 C 120.024,47.548 121.086,46.516 122.397,46.516 C 1=
23.707,46.516 124.768,47.548 124.833,48.843 C 137.211,47.62 146.879,37.181 =
146.879,24.483 L 122.397,24.483 C 122.396,10.961 111.435,0 97.915,0 L 97.91=
5,24.485 C 97.917,37.183 107.584,47.619 119.96,48.842 z M 124.833,49.084 C =
124.769,50.379 123.707,51.411 122.397,51.411 L 122.396,51.411 L 122.396,73.=
444 L 146.878,73.444 L 146.878,73.441 C 146.876,60.745 137.208,50.308 124.8=
33,49.084 z M 119.949,48.963 L 97.915,48.963 L 97.915,73.442 L 97.915,73.44=
2 C 110.613,73.442 121.052,63.774 122.275,51.399 C 120.981,51.334 119.949,5=
0.274 119.949,48.963 z "
-   style=3D"fill:#a9c542"
-   id=3D"path18" />
-	</g>
-</g>
-<g
-   transform=3D"matrix(2.9094193,0,0,2.9094193,-179.03055,-86.624435)"
-   style=3D"opacity:0.65"
-   id=3D"g20">
-	<g
-   id=3D"g22">
-		<path
-   d=3D"M 168.912,48.967 C 168.912,47.656 169.945,46.596 171.24,46.531 C 1=
70.018,34.152 159.579,24.482 146.879,24.482 L 146.879,48.963 C 146.879,62.4=
84 157.84,73.444 171.361,73.444 L 171.361,51.414 C 170.007,51.415 168.912,5=
0.319 168.912,48.967 z M 195.841,48.978 C 195.841,48.973 195.842,48.969 195=
.842,48.964 L 195.842,24.482 L 195.838,24.482 C 183.14,24.484 172.702,34.15=
4 171.482,46.531 C 172.776,46.595 173.808,47.656 173.808,48.967 C 173.808,5=
0.278 172.776,51.339 171.481,51.403 C 172.679,63.59 182.814,73.146 195.244,=
73.445 L 171.361,73.445 L 171.361,97.927 L 171.364,97.927 C 184.879,97.925 =
195.834,86.973 195.842,73.46 L 195.844,73.46 L 195.844,48.979 L 195.841,48.=
978 z M 195.832,48.964 L 195.842,48.964 L 195.842,48.978 L 195.832,48.964 z=
 "
-   style=3D"fill:#f9c759"
-   id=3D"path24" />
-	</g>
-</g>
-<g
-   transform=3D"matrix(2.9094193,0,0,2.9094193,-179.03055,-86.624435)"
-   style=3D"opacity:0.65"
-   id=3D"g26">
-	<g
-   id=3D"g28">
-		<path
-   d=3D"M 70.994,48.479 L 48.962,48.479 L 48.962,48.481 L 70.995,48.481 C =
70.995,48.481 70.994,48.48 70.994,48.479 z M 73.44,24.001 L 73.437,24.001 L=
 73.437,46.032 C 73.439,46.032 73.44,46.032 73.442,46.032 C 74.794,46.032 7=
5.89,47.128 75.89,48.48 C 75.89,49.832 74.794,50.928 73.442,50.928 C 72.091=
,50.928 70.996,49.834 70.994,48.483 L 48.958,48.483 L 48.958,48.486 C 48.96=
,62.005 59.919,72.964 73.437,72.964 C 86.955,72.964 97.914,62.005 97.916,48=
.486 L 97.916,48.483 C 97.916,34.963 86.958,24.003 73.44,24.001 z "
-   style=3D"fill:#6ac7bd"
-   id=3D"path30" />
-	</g>
-</g>
-<g
-   transform=3D"matrix(2.9094193,0,0,2.9094193,-179.03055,-86.624435)"
-   style=3D"opacity:0.65"
-   id=3D"g32">
-	<g
-   id=3D"g34">
-		<path
-   d=3D"M 24.482,23.998 L 24.482,23.995 C 10.961,23.994 0,34.955 0,48.476 =
L 22.034,48.476 C 22.036,47.125 23.131,46.031 24.482,46.031 C 25.834,46.031=
 26.93,47.127 26.93,48.479 C 26.93,49.831 25.834,50.927 24.482,50.927 L 24.=
482,72.937 C 24.469,59.427 13.514,48.479 0,48.479 L 0,72.96 L 24.481,72.96 =
L 24.481,72.96 L 0,72.96 L 0,97.442 L 0.003,97.442 C 13.523,97.44 24.482,86=
.48 24.482,72.961 L 24.485,72.961 C 38.005,72.959 48.963,62 48.963,48.479 L=
 48.963,48.476 C 48.962,34.957 38.001,23.998 24.482,23.998 z "
-   style=3D"fill:#ef412a"
-   id=3D"path36" />
-	</g>
-</g>
-<g
-   transform=3D"matrix(2.9094193,0,0,2.9094193,-179.03055,-86.624435)"
-   style=3D"opacity:0.65"
-   id=3D"g38">
-	<g
-   id=3D"g40">
-		<path
-   d=3D"M 122.397,46.516 C 123.707,46.516 124.768,47.548 124.833,48.843 C =
137.211,47.62 146.879,37.181 146.879,24.483 L 122.397,24.483 L 122.397,46.5=
16 L 122.397,46.516 z M 97.915,0 L 97.915,24.482 L 122.396,24.482 C 122.396=
,10.961 111.435,0 97.915,0 z M 122.275,46.528 C 121.052,34.151 110.613,24.4=
82 97.914,24.482 L 97.914,48.964 L 97.914,48.964 L 97.914,73.443 L 97.914,7=
3.443 C 110.612,73.443 121.051,63.775 122.274,51.4 C 120.98,51.335 119.948,=
50.275 119.948,48.964 C 119.949,47.653 120.98,46.593 122.275,46.528 z M 124=
.833,49.084 C 124.769,50.379 123.707,51.411 122.397,51.411 L 122.396,51.411=
 L 122.396,73.444 L 146.878,73.444 L 146.878,73.441 C 146.876,60.745 137.20=
8,50.308 124.833,49.084 z "
-   style=3D"fill:#a9c542"
-   id=3D"path42" />
-	</g>
-</g>
-<g
-   transform=3D"matrix(2.9094193,0,0,2.9094193,-179.03055,-86.624435)"
-   style=3D"opacity:0.65"
-   id=3D"g44">
-	<g
-   id=3D"g46">
-		<path
-   d=3D"M 173.795,49.1 C 173.724,50.389 172.666,51.415 171.36,51.415 C 170=
.006,51.415 168.911,50.319 168.911,48.967 C 168.911,47.656 169.944,46.596 1=
71.239,46.531 C 170.017,34.152 159.578,24.482 146.878,24.482 L 146.878,48.9=
63 C 146.878,62.484 157.839,73.444 171.36,73.444 L 171.36,97.926 L 171.363,=
97.926 C 184.878,97.924 195.833,86.972 195.841,73.459 L 195.842,73.459 L 19=
5.842,73.443 L 195.841,73.443 C 195.833,60.753 186.167,50.322 173.795,49.1 =
z M 195.838,24.482 C 183.14,24.484 172.702,34.154 171.482,46.531 C 172.775,=
46.595 173.806,47.655 173.808,48.964 L 195.841,48.964 L 195.841,48.979 C 19=
5.841,48.974 195.842,48.969 195.842,48.964 L 195.842,24.482 L 195.838,24.48=
2 z "
-   style=3D"fill:#f9c759"
-   id=3D"path48" />
-	</g>
-</g>
-<g
-   transform=3D"matrix(2.9094193,0,0,2.9094193,-179.03055,-86.624435)"
-   style=3D"opacity:0.65"
-   id=3D"g50">
-	<g
-   id=3D"g52">
-		<path
-   d=3D"M 71.007,48.347 C 71.075,47.105 72.062,46.117 73.304,46.046 C 72.5=
09,38.02 67.85,31.133 61.201,27.284 C 57.601,25.2 53.424,24 48.965,24 L 48.=
962,24 C 48.962,28.46 50.161,32.638 52.245,36.24 C 56.093,42.891 62.98,47.5=
52 71.007,48.347 z M 48.962,48.418 C 48.962,48.438 48.961,48.456 48.961,48.=
476 L 48.961,48.479 L 48.962,48.479 L 48.962,48.418 z M 70.995,48.482 C 70.=
995,48.481 70.995,48.481 70.995,48.48 L 48.962,48.48 L 48.962,48.482 L 70.9=
95,48.482 z M 73.44,24.001 L 73.437,24.001 L 73.437,46.032 C 73.439,46.032 =
73.44,46.032 73.442,46.032 C 74.794,46.032 75.89,47.128 75.89,48.48 C 75.89=
,49.832 74.794,50.928 73.442,50.928 C 72.091,50.928 70.996,49.834 70.994,48=
.483 L 48.958,48.483 L 48.958,48.486 C 48.96,62.005 59.919,72.964 73.437,72=
.964 C 86.955,72.964 97.914,62.005 97.916,48.486 L 97.916,48.483 C 97.916,3=
4.963 86.958,24.003 73.44,24.001 z "
-   style=3D"fill:#6ac7bd"
-   id=3D"path54" />
-	</g>
-</g>
-<g
-   transform=3D"matrix(2.9094193,0,0,2.9094193,-179.03055,-86.624435)"
-   style=3D"opacity:0.65"
-   id=3D"g56">
-	<g
-   id=3D"g58">
-		<path
-   d=3D"M 24.482,23.998 L 24.482,23.995 C 10.961,23.994 0,34.955 0,48.476 =
L 22.034,48.476 C 22.036,47.125 23.131,46.031 24.482,46.031 C 25.834,46.031=
 26.93,47.127 26.93,48.479 C 26.93,49.831 25.834,50.927 24.482,50.927 C 23.=
171,50.927 22.11,49.894 22.046,48.6 C 9.669,49.824 0.001,60.262 0.001,72.96=
 L 0,72.96 L 0,97.442 L 0.003,97.442 C 13.523,97.44 24.482,86.48 24.482,72.=
961 L 24.485,72.961 C 38.005,72.959 48.963,62 48.963,48.479 L 48.963,48.476=
 C 48.962,34.957 38.001,23.998 24.482,23.998 z "
-   style=3D"fill:#ef412a"
-   id=3D"path60" />
-	</g>
-</g>
-<g
-   transform=3D"matrix(2.9094193,0,0,2.9094193,-179.03055,-86.624435)"
-   style=3D"opacity:0.65"
-   id=3D"g62">
-	<g
-   id=3D"g64">
-		<path
-   d=3D"M 119.949,48.963 C 119.949,47.611 121.045,46.515 122.397,46.515 C =
123.707,46.515 124.768,47.547 124.833,48.842 C 137.211,47.619 146.879,37.18=
 146.879,24.482 L 122.397,24.482 C 122.396,10.961 111.435,0 97.915,0 L 97.9=
15,24.482 L 122.394,24.482 C 108.874,24.484 97.916,35.444 97.916,48.963 L 9=
7.916,48.963 L 97.916,73.442 L 97.916,73.442 C 110.614,73.442 121.053,63.77=
4 122.276,51.399 C 120.981,51.334 119.949,50.274 119.949,48.963 z M 124.833=
,49.084 C 124.769,50.379 123.707,51.411 122.397,51.411 L 122.396,51.411 L 1=
22.396,73.444 L 146.878,73.444 L 146.878,73.441 C 146.876,60.745 137.208,50=
.308 124.833,49.084 z "
-   style=3D"fill:#a9c542"
-   id=3D"path66" />
-	</g>
-</g>
-<g
-   transform=3D"matrix(2.9094193,0,0,2.9094193,-179.03055,-86.624435)"
-   style=3D"opacity:0.65"
-   id=3D"g68">
-	<g
-   id=3D"g70">
-		<path
-   d=3D"M 195.841,48.979 L 195.835,48.964 L 195.841,48.964 L 195.841,48.97=
9 C 195.841,48.974 195.842,48.969 195.842,48.964 L 195.842,24.482 L 195.838=
,24.482 C 183.14,24.484 172.702,34.154 171.482,46.531 C 172.776,46.595 173.=
808,47.656 173.808,48.967 C 173.808,50.319 172.712,51.415 171.361,51.415 C =
170.007,51.415 168.912,50.319 168.912,48.967 C 168.912,47.656 169.945,46.59=
6 171.24,46.531 C 170.018,34.152 159.579,24.482 146.879,24.482 L 146.879,48=
.963 C 146.879,62.484 157.84,73.444 171.361,73.444 L 171.361,97.926 L 171.3=
64,97.926 C 184.883,97.924 195.843,86.963 195.843,73.444 L 171.959,73.444 C=
 185.203,73.126 195.841,62.299 195.841,48.979 z "
-   style=3D"fill:#f9c759"
-   id=3D"path72" />
-	</g>
-</g>
-<g
-   transform=3D"matrix(2.9094193,0,0,2.9094193,-179.03055,-86.624435)"
-   style=3D"opacity:0.65"
-   id=3D"g74">
-	<g
-   id=3D"g76">
-		<path
-   d=3D"M 73.44,24.001 L 73.437,24.001 C 59.919,24.003 48.96,34.959 48.958=
,48.476 L 48.958,48.479 L 48.961,48.479 L 48.961,48.481 L 48.957,48.482 L 4=
8.957,48.485 C 48.959,62.004 59.918,72.963 73.436,72.963 C 86.954,72.963 97=
.913,62.004 97.915,48.485 L 97.915,48.482 C 97.916,34.963 86.958,24.003 73.=
44,24.001 z M 73.442,50.928 C 72.09,50.928 70.994,49.832 70.994,48.48 C 70.=
994,47.128 72.09,46.032 73.442,46.032 C 74.794,46.032 75.89,47.128 75.89,48=
.48 C 75.89,49.832 74.794,50.928 73.442,50.928 z "
-   style=3D"fill:#6ac7bd"
-   id=3D"path78" />
-	</g>
-</g>
-</svg>
\ No newline at end of file
diff --git a/documentation/template/yocto-project-qs.png b/documentation/te=
mplate/yocto-project-qs.png
deleted file mode 100644
index 333442e0d63e407f55f589c37cea07dfca99dbeb..000000000000000000000000000=
0000000000000
GIT binary patch
literal 0
HcmV?d00001

literal 17829
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
b|JAQe&iR@5e*y3y76t}SS3j3^P6<r_MzKk(

--=20
2.25.1


