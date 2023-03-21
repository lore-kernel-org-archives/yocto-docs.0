Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38EACC7619A
	for <webhook@archiver.kernel.org>; Tue, 21 Mar 2023 17:24:38 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.19821.1679419470988011780
 for <docs@lists.yoctoproject.org>;
 Tue, 21 Mar 2023 10:24:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ZSCXkyz7;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 8C60360009;
	Tue, 21 Mar 2023 17:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1679419468;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jHn8lksqORLF3JNbCkojQrqXWydeb58j/RpvPm69lRo=;
	b=ZSCXkyz7uK/qGTasSDRwI3RLXMg1LQzHMqlkmZs5OeM0cYb1jTwgISY4xEOdG9s7NHIY3N
	jBGeKz3HvqtQE7SMrtPTYIV/U1dWZrzkd6RbjMr5joUkXPMMhxoBMwskjODNtz6jTMPfbc
	uzJ3u8d0y3QNwCgMpD/df/5akH7Cjad0hy2UFsVLALCVPpzujKd8hc0m52y0N231A2Q6fP
	w+D2W2LcduJmIRRrUxzQ7XZbA3v2pVMn4z4ITKeuq0u+IbtuQIjhR/zx62Jn8eZGBizeo2
	tCVBeMW1UpzUSu0so0O3nbDHJUgX8I2gKVWWWNiE9MZ7z9NpmzcRc+sv6JiS8w==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 1/2] ref-manual: release-process.rst: major updates
Date: Tue, 21 Mar 2023 18:24:22 +0100
Message-Id: <20230321172423.57050-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 21 Mar 2023 17:24:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3808

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

- Introduce LTS releases
- Fix stable release support duration
- Update release notes
- Add a diagram illustrating the release process

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/release-process.rst |   50 +-
 documentation/ref-manual/svg/releases.svg    | 1200 ++++++++++++++++++
 2 files changed, 1234 insertions(+), 16 deletions(-)
 create mode 100644 documentation/ref-manual/svg/releases.svg

diff --git a/documentation/ref-manual/release-process.rst b/documentation/r=
ef-manual/release-process.rst
index fa057e055c..8b70a08f04 100644
--- a/documentation/ref-manual/release-process.rst
+++ b/documentation/ref-manual/release-process.rst
@@ -18,9 +18,9 @@ Following are examples of some major YP releases with the=
ir codenames
 also shown. See the ":ref:`ref-manual/release-process:major release codena=
mes`"
 section for information on codenames used with major releases.
=20
-  - 2.2 (Morty)=20
-  - 2.1 (Krogoth)
-  - 2.0 (Jethro)=20
+  - 4.1 ("Langdale")
+  - 4.0 ("Kirkstone")
+  - 3.4 ("Honister")
=20
 While the cadence is never perfect, this timescale facilitates
 regular releases that have strong QA cycles while not overwhelming users
@@ -32,9 +32,9 @@ basis and are usually driven by the accumulation of enoug=
h significant
 fixes or enhancements to the associated major release. Following are
 some example past point releases:
=20
-  - 2.1.1
-  - 2.1.2
-  - 2.2.1=20
+  - 4.1.3
+  - 4.0.8
+  - 3.4.4
=20
 The point release
 indicates a point in the major release branch where a full QA cycle and
@@ -87,15 +87,34 @@ stable release.
    exception to this policy occurs when there is a strong reason such as
    the fix happens to also be the preferred upstream approach.
=20
-Stable release branches have strong maintenance for about a year after
-their initial release. Should significant issues be found for any
-release regardless of its age, fixes could be backported to older
-releases. For issues that are not backported given an older release,
-Community LTS trees and branches allow community members to share
-patches for older releases. However, these types of patches do not go
-through the same release process as do point releases. You can find more
-information about stable branch maintenance at
-:yocto_wiki:`/Stable_branch_maintenance`.
+Long Term Support Releases
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
+
+While stable releases are supported for a duration of seven months,
+some specific ones are now supported for a longer period by the Yocto
+Project, and are called Long Term Support (LTS) releases.
+
+This started with version 3.1 ("Dunfell"), released in April 2020, that
+the project committed to supporting until the next LTS release was out.
+This next LTS release, version 4.0 ("Kirkstone"), was released in May 2022
+and offered with two years of support too.
+
+However, as an experiment, support for "Dunfell" was extended to four year=
s, until
+April 2024, therefore offering more stability to projects and leaving more=
 time
+to upgrade to the latest LTS release. The project hasn't made any commitme=
nt to
+extending "Kirkstone" support too, as this will also depend on available f=
unding
+for such an effort.
+
+When significant issues are found, LTS releases allow to publish
+fixes not only for the current stable release, but also to the
+LTS releases that are still supported. Older stable releases which
+have reached their End of Life (EOL) won't receive such updates.
+
+See :yocto_wiki:`/Stable_Release_and_LTS` for details about the management
+of stable and LTS releases.
+
+.. image:: svg/releases.*
+   :width: 100%
=20
 .. note::
=20
@@ -113,7 +132,6 @@ information about stable branch maintenance at
    testing on them. Other "mixin" layers may be released elsewhere by the =
wider
    community.
=20
-
 Testing and Quality Assurance
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
=20
diff --git a/documentation/ref-manual/svg/releases.svg b/documentation/ref-=
manual/svg/releases.svg
new file mode 100644
index 0000000000..40fccd97d6
--- /dev/null
+++ b/documentation/ref-manual/svg/releases.svg
@@ -0,0 +1,1200 @@
+<?xml version=3D"1.0" encoding=3D"UTF-8" standalone=3D"no"?>
+<svg
+   version=3D"1.1"
+   id=3D"svg2"
+   width=3D"1175.0006"
+   height=3D"568.85858"
+   viewBox=3D"0 0 1175.0006 568.85856"
+   sodipodi:docname=3D"releases.svg"
+   inkscape:version=3D"1.1.2 (0a00cf5339, 2022-02-04)"
+   xmlns:inkscape=3D"http://www.inkscape.org/namespaces/inkscape"
+   xmlns:sodipodi=3D"http://sodipodi.sourceforge.net/DTD/sodipodi-0.dtd"
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
+     inkscape:window-width=3D"1846"
+     inkscape:window-height=3D"1016"
+     id=3D"namedview4"
+     showgrid=3D"true"
+     inkscape:zoom=3D"0.72360224"
+     inkscape:cx=3D"959.78144"
+     inkscape:cy=3D"463.65252"
+     inkscape:window-x=3D"1994"
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
+       originx=3D"-289.99935"
+       originy=3D"269.99997" />
+  </sodipodi:namedview>
+  <g
+     inkscape:groupmode=3D"layer"
+     inkscape:label=3D"Image"
+     id=3D"g10"
+     transform=3D"translate(-289.99935,270)">
+    <path
+       style=3D"fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:0.=
5;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dash=
array:none;stroke-opacity:1"
+       d=3D"M 1080,220.00002 V -240 v 0 0"
+       id=3D"path207708" />
+    <path
+       style=3D"fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:0.=
5;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dash=
array:none;stroke-opacity:1"
+       d=3D"M 1200,220.00002 V -240 v 0 0"
+       id=3D"path207708-4" />
+    <path
+       style=3D"fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:0.=
5;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dash=
array:none;stroke-opacity:1"
+       d=3D"M 1320,220.00002 V -240 v 0 0"
+       id=3D"path207708-4-3" />
+    <path
+       style=3D"fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:0.=
5;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dash=
array:none;stroke-opacity:1"
+       d=3D"M 960,220.00002 V -240 v 0 0"
+       id=3D"path207708-9" />
+    <path
+       style=3D"fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:0.=
5;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dash=
array:none;stroke-opacity:1"
+       d=3D"m 840,220.00001 v -375 0 0"
+       id=3D"path207708-9-6" />
+    <path
+       style=3D"fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:0.=
5;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dash=
array:none;stroke-opacity:1"
+       d=3D"M 840,220.00002 V -240 v 0 0"
+       id=3D"path207708-9-6-2" />
+    <path
+       style=3D"fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:0.=
5;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dash=
array:none;stroke-opacity:1"
+       d=3D"M 720,220.00002 V -240 v 0 0"
+       id=3D"path207708-9-6-2-5" />
+    <path
+       style=3D"fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:0.=
5;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dash=
array:none;stroke-opacity:1"
+       d=3D"M 600,220.00002 V -240 v 0 0"
+       id=3D"path207708-9-6-2-5-9" />
+    <path
+       style=3D"fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:0.=
5;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dash=
array:none;stroke-opacity:1"
+       d=3D"M 480,220.00002 V -240 v 0 0"
+       id=3D"path207708-9-6-2-5-9-0" />
+    <path
+       style=3D"fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:0.=
5;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dash=
array:none;stroke-opacity:1"
+       d=3D"M 360,220.00002 V -240 v 0 0"
+       id=3D"path207708-9-6-2-5-9-0-5" />
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
+       style=3D"fill:#333333;fill-opacity:1;fill-rule:evenodd;stroke:none;=
stroke-width:2;stroke-opacity:1"
+       id=3D"rect917-0-0"
+       width=3D"960.00006"
+       height=3D"45.000004"
+       x=3D"360"
+       y=3D"154.99997"
+       ry=3D"2.2558987" />
+    <text
+       xml:space=3D"preserve"
+       style=3D"font-weight:bold;font-size:13.3333px;line-height:125%;font=
-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';le=
tter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#fffefe;fill-opac=
ity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:m=
iter;stroke-opacity:1"
+       x=3D"402.05414"
+       y=3D"174.26933"
+       id=3D"text1185-3-55-4"><tspan
+         sodipodi:role=3D"line"
+         x=3D"402.05414"
+         y=3D"174.26933"
+         style=3D"font-style:normal;font-variant:normal;font-weight:bold;f=
ont-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inksc=
ape-font-specification:'Liberation Sans Bold';text-align:center;text-anchor=
:middle;fill:#fffefe;fill-opacity:1;stroke:none"
+         id=3D"tspan957-2-8">Dunfell</tspan><tspan
+         sodipodi:role=3D"line"
+         x=3D"402.05414"
+         y=3D"192.26601"
+         style=3D"font-style:normal;font-variant:normal;font-weight:bold;f=
ont-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inksc=
ape-font-specification:'Liberation Sans Bold';text-align:center;text-anchor=
:middle;fill:#fffefe;fill-opacity:1;stroke:none"
+         id=3D"tspan10317">3.1</tspan></text>
+    <rect
+       style=3D"fill:#333333;fill-opacity:1;fill-rule:evenodd;stroke:none;=
stroke-width:2;stroke-opacity:1"
+       id=3D"rect917-0-0-4"
+       width=3D"140.00002"
+       height=3D"45.000004"
+       x=3D"480"
+       y=3D"99.999969"
+       ry=3D"2.2558987" />
+    <text
+       xml:space=3D"preserve"
+       style=3D"font-weight:bold;font-size:13.3333px;line-height:125%;font=
-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';le=
tter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#fffefe;fill-opac=
ity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:m=
iter;stroke-opacity:1"
+       x=3D"534.10651"
+       y=3D"118.94971"
+       id=3D"text1185-3-55-4-0"><tspan
+         sodipodi:role=3D"line"
+         x=3D"534.10651"
+         y=3D"118.94971"
+         style=3D"font-style:normal;font-variant:normal;font-weight:bold;f=
ont-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inksc=
ape-font-specification:'Liberation Sans Bold';text-align:center;text-anchor=
:middle;fill:#fffefe;fill-opacity:1;stroke:none"
+         id=3D"tspan957-2-8-6">Gatesgarth</tspan><tspan
+         sodipodi:role=3D"line"
+         x=3D"534.10651"
+         y=3D"136.9464"
+         style=3D"font-style:normal;font-variant:normal;font-weight:bold;f=
ont-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inksc=
ape-font-specification:'Liberation Sans Bold';text-align:center;text-anchor=
:middle;fill:#fffefe;fill-opacity:1;stroke:none"
+         id=3D"tspan10317-2">3.2</tspan></text>
+    <rect
+       style=3D"fill:#333333;fill-opacity:1;fill-rule:evenodd;stroke:none;=
stroke-width:2;stroke-opacity:1"
+       id=3D"rect917-0-0-4-4"
+       width=3D"140.00002"
+       height=3D"45.000004"
+       x=3D"599.99994"
+       y=3D"45.000011"
+       ry=3D"2.2558987" />
+    <rect
+       style=3D"fill:#333333;fill-opacity:1;fill-rule:evenodd;stroke:none;=
stroke-width:2;stroke-opacity:1"
+       id=3D"rect917-0-0-4-4-9"
+       width=3D"160.00002"
+       height=3D"45.000004"
+       x=3D"720"
+       y=3D"-9.9999905"
+       ry=3D"2.2558987" />
+    <text
+       xml:space=3D"preserve"
+       style=3D"font-weight:bold;font-size:13.3333px;line-height:125%;font=
-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';le=
tter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#fffefe;fill-opac=
ity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:m=
iter;stroke-opacity:1"
+       x=3D"766.10297"
+       y=3D"9.57586"
+       id=3D"text1185-3-55-4-0-0"><tspan
+         sodipodi:role=3D"line"
+         x=3D"766.10297"
+         y=3D"9.57586"
+         style=3D"font-style:normal;font-variant:normal;font-weight:bold;f=
ont-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inksc=
ape-font-specification:'Liberation Sans Bold';text-align:center;text-anchor=
:middle;fill:#fffefe;fill-opacity:1;stroke:none"
+         id=3D"tspan957-2-8-6-3">Honister</tspan><tspan
+         sodipodi:role=3D"line"
+         x=3D"766.10297"
+         y=3D"27.57254"
+         style=3D"font-style:normal;font-variant:normal;font-weight:bold;f=
ont-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inksc=
ape-font-specification:'Liberation Sans Bold';text-align:center;text-anchor=
:middle;fill:#fffefe;fill-opacity:1;stroke:none"
+         id=3D"tspan10317-2-9">3.4</tspan></text>
+    <rect
+       style=3D"fill:#333333;fill-opacity:1;fill-rule:evenodd;stroke:none;=
stroke-width:2;stroke-opacity:1"
+       id=3D"rect917-0-0-4-4-9-4"
+       width=3D"140.00002"
+       height=3D"45.000004"
+       x=3D"960"
+       y=3D"-120"
+       ry=3D"2.2558987" />
+    <text
+       xml:space=3D"preserve"
+       style=3D"font-weight:bold;font-size:13.3333px;line-height:125%;font=
-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';le=
tter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#fffefe;fill-opac=
ity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:m=
iter;stroke-opacity:1"
+       x=3D"1008.4941"
+       y=3D"-100.605"
+       id=3D"text1185-3-55-4-0-0-0"><tspan
+         sodipodi:role=3D"line"
+         x=3D"1008.4941"
+         y=3D"-100.605"
+         style=3D"font-style:normal;font-variant:normal;font-weight:bold;f=
ont-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inksc=
ape-font-specification:'Liberation Sans Bold';text-align:center;text-anchor=
:middle;fill:#fffefe;fill-opacity:1;stroke:none"
+         id=3D"tspan957-2-8-6-3-9">Langdale</tspan><tspan
+         sodipodi:role=3D"line"
+         x=3D"1008.4941"
+         y=3D"-82.608322"
+         style=3D"font-style:normal;font-variant:normal;font-weight:bold;f=
ont-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inksc=
ape-font-specification:'Liberation Sans Bold';text-align:center;text-anchor=
:middle;fill:#fffefe;fill-opacity:1;stroke:none"
+         id=3D"tspan10317-2-9-1">4.1</tspan></text>
+    <rect
+       style=3D"opacity:0.75;fill:#333333;fill-opacity:1;fill-rule:evenodd=
;stroke:none;stroke-width:2;stroke-opacity:1"
+       id=3D"rect917-0-0-4-4-9-4-5"
+       width=3D"140.00002"
+       height=3D"45.000004"
+       x=3D"1080"
+       y=3D"-174.99998"
+       ry=3D"2.2558987" />
+    <text
+       xml:space=3D"preserve"
+       style=3D"font-weight:bold;font-size:13.3333px;line-height:125%;font=
-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';le=
tter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#fffefe;fill-opac=
ity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:m=
iter;stroke-opacity:1"
+       x=3D"1134.2344"
+       y=3D"-155.49881"
+       id=3D"text1185-3-55-4-0-0-0-1"><tspan
+         sodipodi:role=3D"line"
+         x=3D"1134.2344"
+         y=3D"-155.49881"
+         style=3D"font-style:normal;font-variant:normal;font-weight:bold;f=
ont-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inksc=
ape-font-specification:'Liberation Sans Bold';text-align:center;text-anchor=
:middle;fill:#fffefe;fill-opacity:1;stroke:none"
+         id=3D"tspan957-2-8-6-3-9-7">Mickledore</tspan><tspan
+         sodipodi:role=3D"line"
+         x=3D"1134.2344"
+         y=3D"-137.50214"
+         style=3D"font-style:normal;font-variant:normal;font-weight:bold;f=
ont-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inksc=
ape-font-specification:'Liberation Sans Bold';text-align:center;text-anchor=
:middle;fill:#fffefe;fill-opacity:1;stroke:none"
+         id=3D"tspan10317-2-9-1-4">4.2</tspan></text>
+    <rect
+       style=3D"opacity:0.75;fill:#333333;fill-opacity:1;fill-rule:evenodd=
;stroke:none;stroke-width:2;stroke-opacity:1"
+       id=3D"rect917-0-0-4-4-9-4-5-3"
+       width=3D"140.00014"
+       height=3D"45.000004"
+       x=3D"1199.9999"
+       y=3D"-229.99998"
+       ry=3D"2.2558987" />
+    <text
+       xml:space=3D"preserve"
+       style=3D"font-weight:bold;font-size:13.3333px;line-height:125%;font=
-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';le=
tter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#fffefe;fill-opac=
ity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:m=
iter;stroke-opacity:1"
+       x=3D"1247.2329"
+       y=3D"-210.32925"
+       id=3D"text1185-3-55-4-0-0-0-1-1"><tspan
+         sodipodi:role=3D"line"
+         x=3D"1247.2329"
+         y=3D"-210.32925"
+         style=3D"font-style:normal;font-variant:normal;font-weight:bold;f=
ont-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inksc=
ape-font-specification:'Liberation Sans Bold';text-align:center;text-anchor=
:middle;fill:#fffefe;fill-opacity:1;stroke:none"
+         id=3D"tspan957-2-8-6-3-9-7-4">Nanbield</tspan><tspan
+         sodipodi:role=3D"line"
+         x=3D"1247.2329"
+         y=3D"-192.33258"
+         style=3D"font-style:normal;font-variant:normal;font-weight:bold;f=
ont-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inksc=
ape-font-specification:'Liberation Sans Bold';text-align:center;text-anchor=
:middle;fill:#fffefe;fill-opacity:1;stroke:none"
+         id=3D"tspan10317-2-9-1-4-6">4.3</tspan></text>
+    <rect
+       style=3D"fill:#333333;fill-opacity:1;fill-rule:evenodd;stroke:none;=
stroke-width:2;stroke-opacity:1"
+       id=3D"rect917-0-0-4-4-9-9"
+       width=3D"480.00006"
+       height=3D"45.000004"
+       x=3D"860"
+       y=3D"-64.999992"
+       ry=3D"2.2558987" />
+    <text
+       xml:space=3D"preserve"
+       style=3D"font-weight:bold;font-size:13.3333px;line-height:125%;font=
-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';le=
tter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#fffefe;fill-opac=
ity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:m=
iter;stroke-opacity:1"
+       x=3D"910.59369"
+       y=3D"-45.648258"
+       id=3D"text1185-3-55-4-0-0-9"><tspan
+         sodipodi:role=3D"line"
+         x=3D"910.59369"
+         y=3D"-45.648258"
+         style=3D"font-style:normal;font-variant:normal;font-weight:bold;f=
ont-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inksc=
ape-font-specification:'Liberation Sans Bold';text-align:center;text-anchor=
:middle;fill:#fffefe;fill-opacity:1;stroke:none"
+         id=3D"tspan957-2-8-6-3-6">Kirkstone</tspan><tspan
+         sodipodi:role=3D"line"
+         x=3D"910.59369"
+         y=3D"-27.651581"
+         style=3D"font-style:normal;font-variant:normal;font-weight:bold;f=
ont-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inksc=
ape-font-specification:'Liberation Sans Bold';text-align:center;text-anchor=
:middle;fill:#fffefe;fill-opacity:1;stroke:none"
+         id=3D"tspan10317-2-9-0">4.0</tspan></text>
+    <text
+       xml:space=3D"preserve"
+       style=3D"font-weight:bold;font-size:13.3333px;line-height:125%;font=
-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';le=
tter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#fffefe;fill-opac=
ity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:m=
iter;stroke-opacity:1"
+       x=3D"650.42737"
+       y=3D"64.633629"
+       id=3D"text1185-3-55-4-0-0-7"><tspan
+         sodipodi:role=3D"line"
+         x=3D"650.42737"
+         y=3D"64.633629"
+         style=3D"font-style:normal;font-variant:normal;font-weight:bold;f=
ont-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inksc=
ape-font-specification:'Liberation Sans Bold';text-align:center;text-anchor=
:middle;fill:#fffefe;fill-opacity:1;stroke:none"
+         id=3D"tspan957-2-8-6-3-2">Hardknott</tspan><tspan
+         sodipodi:role=3D"line"
+         x=3D"650.42737"
+         y=3D"82.63031"
+         style=3D"font-style:normal;font-variant:normal;font-weight:bold;f=
ont-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inksc=
ape-font-specification:'Liberation Sans Bold';text-align:center;text-anchor=
:middle;fill:#fffefe;fill-opacity:1;stroke:none"
+         id=3D"tspan10317-2-9-8">3.3</tspan></text>
+    <g
+       id=3D"g1125-0"
+       transform=3D"matrix(0.42240595,0,0,0.41654472,354.16682,-355.15199)"
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
+       x=3D"1199.6055"
+       y=3D"250.21216"
+       id=3D"text1185-9-7-1-1"><tspan
+         sodipodi:role=3D"line"
+         x=3D"1199.6055"
+         y=3D"250.21216"
+         style=3D"font-style:normal;font-variant:normal;font-weight:bold;f=
ont-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inksc=
ape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:norma=
l;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-as=
ian:normal;text-align:center;text-anchor:middle;stroke:none"
+         id=3D"tspan31345">Oct.</tspan><tspan
+         sodipodi:role=3D"line"
+         x=3D"1199.6055"
+         y=3D"268.20883"
+         style=3D"font-style:normal;font-variant:normal;font-weight:bold;f=
ont-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inksc=
ape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:norma=
l;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-as=
ian:normal;text-align:center;text-anchor:middle;stroke:none"
+         id=3D"tspan49906">2023</tspan></text>
+    <text
+       xml:space=3D"preserve"
+       style=3D"font-weight:bold;font-size:13.3333px;line-height:125%;font=
-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';le=
tter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opac=
ity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:m=
iter;stroke-opacity:1"
+       x=3D"962.71832"
+       y=3D"250.21216"
+       id=3D"text1185-9-7-1-1-0"><tspan
+         sodipodi:role=3D"line"
+         x=3D"962.71832"
+         y=3D"250.21216"
+         style=3D"font-style:normal;font-variant:normal;font-weight:bold;f=
ont-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inksc=
ape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:norma=
l;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-as=
ian:normal;text-align:center;text-anchor:middle;stroke:none"
+         id=3D"tspan31345-42">Oct.</tspan><tspan
+         sodipodi:role=3D"line"
+         x=3D"962.71832"
+         y=3D"268.20883"
+         style=3D"font-style:normal;font-variant:normal;font-weight:bold;f=
ont-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inksc=
ape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:norma=
l;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-as=
ian:normal;text-align:center;text-anchor:middle;stroke:none"
+         id=3D"tspan49906-9">2022</tspan></text>
+    <text
+       xml:space=3D"preserve"
+       style=3D"font-weight:bold;font-size:13.3333px;line-height:125%;font=
-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';le=
tter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opac=
ity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:m=
iter;stroke-opacity:1"
+       x=3D"721.13617"
+       y=3D"250.21216"
+       id=3D"text1185-9-7-1-1-2"><tspan
+         sodipodi:role=3D"line"
+         x=3D"721.13617"
+         y=3D"250.21216"
+         style=3D"font-style:normal;font-variant:normal;font-weight:bold;f=
ont-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inksc=
ape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:norma=
l;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-as=
ian:normal;text-align:center;text-anchor:middle;stroke:none"
+         id=3D"tspan31345-1">Oct.</tspan><tspan
+         sodipodi:role=3D"line"
+         x=3D"721.13617"
+         y=3D"268.20883"
+         style=3D"font-style:normal;font-variant:normal;font-weight:bold;f=
ont-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inksc=
ape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:norma=
l;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-as=
ian:normal;text-align:center;text-anchor:middle;stroke:none"
+         id=3D"tspan49906-5">2021</tspan></text>
+    <text
+       xml:space=3D"preserve"
+       style=3D"font-weight:bold;font-size:13.3333px;line-height:125%;font=
-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';le=
tter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opac=
ity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:m=
iter;stroke-opacity:1"
+       x=3D"485.04486"
+       y=3D"250.21216"
+       id=3D"text1185-9-7-1-1-80"><tspan
+         sodipodi:role=3D"line"
+         x=3D"485.04486"
+         y=3D"250.21216"
+         style=3D"font-style:normal;font-variant:normal;font-weight:bold;f=
ont-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inksc=
ape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:norma=
l;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-as=
ian:normal;text-align:center;text-anchor:middle;stroke:none"
+         id=3D"tspan31345-5">Oct.</tspan><tspan
+         sodipodi:role=3D"line"
+         x=3D"485.04486"
+         y=3D"268.20883"
+         style=3D"font-style:normal;font-variant:normal;font-weight:bold;f=
ont-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inksc=
ape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:norma=
l;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-as=
ian:normal;text-align:center;text-anchor:middle;stroke:none"
+         id=3D"tspan49906-6">2020</tspan></text>
+    <text
+       xml:space=3D"preserve"
+       style=3D"font-weight:bold;font-size:13.3333px;line-height:125%;font=
-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';le=
tter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opac=
ity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:m=
iter;stroke-opacity:1"
+       x=3D"360.96921"
+       y=3D"250.07544"
+       id=3D"text1185-9-7-1-1-8"><tspan
+         sodipodi:role=3D"line"
+         x=3D"360.96921"
+         y=3D"250.07544"
+         style=3D"font-style:normal;font-variant:normal;font-weight:bold;f=
ont-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inksc=
ape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:norma=
l;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-as=
ian:normal;text-align:center;text-anchor:middle;stroke:none"
+         id=3D"tspan31345-4">Apr.</tspan><tspan
+         sodipodi:role=3D"line"
+         x=3D"360.96921"
+         y=3D"268.07211"
+         style=3D"font-style:normal;font-variant:normal;font-weight:bold;f=
ont-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inksc=
ape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:norma=
l;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-as=
ian:normal;text-align:center;text-anchor:middle;stroke:none"
+         id=3D"tspan49906-7">2020</tspan></text>
+    <text
+       xml:space=3D"preserve"
+       style=3D"font-weight:bold;font-size:13.3333px;line-height:125%;font=
-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';le=
tter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opac=
ity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:m=
iter;stroke-opacity:1"
+       x=3D"840.9248"
+       y=3D"250.07544"
+       id=3D"text1185-9-7-1-1-8-1"><tspan
+         sodipodi:role=3D"line"
+         x=3D"840.9248"
+         y=3D"250.07544"
+         style=3D"font-style:normal;font-variant:normal;font-weight:bold;f=
ont-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inksc=
ape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:norma=
l;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-as=
ian:normal;text-align:center;text-anchor:middle;stroke:none"
+         id=3D"tspan31345-4-0">Apr</tspan><tspan
+         sodipodi:role=3D"line"
+         x=3D"840.9248"
+         y=3D"268.07211"
+         style=3D"font-style:normal;font-variant:normal;font-weight:bold;f=
ont-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inksc=
ape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:norma=
l;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-as=
ian:normal;text-align:center;text-anchor:middle;stroke:none"
+         id=3D"tspan49906-7-3">2022</tspan></text>
+    <text
+       xml:space=3D"preserve"
+       style=3D"font-weight:bold;font-size:13.3333px;line-height:125%;font=
-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';le=
tter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opac=
ity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:m=
iter;stroke-opacity:1"
+       x=3D"1317.4003"
+       y=3D"250.07544"
+       id=3D"text1185-9-7-1-1-8-1-0"><tspan
+         sodipodi:role=3D"line"
+         x=3D"1317.4003"
+         y=3D"250.07544"
+         style=3D"font-style:normal;font-variant:normal;font-weight:bold;f=
ont-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inksc=
ape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:norma=
l;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-as=
ian:normal;text-align:center;text-anchor:middle;stroke:none"
+         id=3D"tspan31345-4-0-4">Apr.</tspan><tspan
+         sodipodi:role=3D"line"
+         x=3D"1317.4003"
+         y=3D"268.07211"
+         style=3D"font-style:normal;font-variant:normal;font-weight:bold;f=
ont-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inksc=
ape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:norma=
l;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-as=
ian:normal;text-align:center;text-anchor:middle;stroke:none"
+         id=3D"tspan49906-7-3-8">2024</tspan></text>
+    <text
+       xml:space=3D"preserve"
+       style=3D"font-weight:bold;font-size:13.3333px;line-height:125%;font=
-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';le=
tter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opac=
ity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:m=
iter;stroke-opacity:1"
+       x=3D"1081.4458"
+       y=3D"250.07544"
+       id=3D"text1185-9-7-1-1-8-1-0-2"><tspan
+         sodipodi:role=3D"line"
+         x=3D"1081.4458"
+         y=3D"250.07544"
+         style=3D"font-style:normal;font-variant:normal;font-weight:bold;f=
ont-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inksc=
ape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:norma=
l;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-as=
ian:normal;text-align:center;text-anchor:middle;stroke:none"
+         id=3D"tspan31345-4-0-4-8">Apr.</tspan><tspan
+         sodipodi:role=3D"line"
+         x=3D"1081.4458"
+         y=3D"268.07211"
+         style=3D"font-style:normal;font-variant:normal;font-weight:bold;f=
ont-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inksc=
ape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:norma=
l;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-as=
ian:normal;text-align:center;text-anchor:middle;stroke:none"
+         id=3D"tspan49906-7-3-8-3">2023</tspan></text>
+    <text
+       xml:space=3D"preserve"
+       style=3D"font-weight:bold;font-size:13.3333px;line-height:125%;font=
-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';le=
tter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opac=
ity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:m=
iter;stroke-opacity:1"
+       x=3D"604.18005"
+       y=3D"250.07544"
+       id=3D"text1185-9-7-1-1-8-1-7"><tspan
+         sodipodi:role=3D"line"
+         x=3D"604.18005"
+         y=3D"250.07544"
+         style=3D"font-style:normal;font-variant:normal;font-weight:bold;f=
ont-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inksc=
ape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:norma=
l;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-as=
ian:normal;text-align:center;text-anchor:middle;stroke:none"
+         id=3D"tspan31345-4-0-5">Apr.</tspan><tspan
+         sodipodi:role=3D"line"
+         x=3D"604.18005"
+         y=3D"268.07211"
+         style=3D"font-style:normal;font-variant:normal;font-weight:bold;f=
ont-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inksc=
ape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:norma=
l;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-as=
ian:normal;text-align:center;text-anchor:middle;stroke:none"
+         id=3D"tspan49906-7-3-6">2021</tspan></text>
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
+    <path
+       id=3D"path29430"
+       style=3D"fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:2;=
stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dashar=
ray:none;stroke-opacity:1"
+       d=3D"M 319.99935,219.99912 H 1435 Z" />
+    <path
+       style=3D"fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:2;=
stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dashar=
ray:none;stroke-opacity:1"
+       d=3D"m 360,219.99997 v 10.00004 0"
+       id=3D"path29548" />
+    <path
+       style=3D"fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:2;=
stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dashar=
ray:none;stroke-opacity:1"
+       d=3D"m 480,219.99996 v 10 0"
+       id=3D"path29548-5" />
+    <path
+       style=3D"fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:2;=
stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dashar=
ray:none;stroke-opacity:1"
+       d=3D"m 600,219.99992 v 10.00005 0"
+       id=3D"path29548-5-1" />
+    <path
+       style=3D"fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:2;=
stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dashar=
ray:none;stroke-opacity:1"
+       d=3D"m 720,220.00002 v 9.99999 0"
+       id=3D"path29548-5-1-3" />
+    <path
+       style=3D"fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:2;=
stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dashar=
ray:none;stroke-opacity:1"
+       d=3D"m 840,220.00002 v 9.99995 0"
+       id=3D"path29548-5-1-3-6" />
+    <path
+       style=3D"fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:2;=
stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dashar=
ray:none;stroke-opacity:1"
+       d=3D"m 960,220.00002 v 9.99999 0"
+       id=3D"path29548-5-1-3-6-3" />
+    <path
+       style=3D"fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:2;=
stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dashar=
ray:none;stroke-opacity:1"
+       d=3D"m 1080,220.00002 v 9.99999 0"
+       id=3D"path29548-5-1-3-6-3-1" />
+    <path
+       style=3D"fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;=
stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dashar=
ray:none;stroke-opacity:1"
+       d=3D"m 380,219.99997 v 5.00004 0"
+       id=3D"path29548-8"
+       inkscape:transform-center-x=3D"14.782001"
+       inkscape:transform-center-y=3D"-0.085282837" />
+    <path
+       style=3D"fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;=
stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dashar=
ray:none;stroke-opacity:1"
+       d=3D"m 400,219.99997 v 5.00004 0"
+       id=3D"path29548-8-5"
+       inkscape:transform-center-x=3D"14.782001"
+       inkscape:transform-center-y=3D"-0.085282837" />
+    <path
+       style=3D"fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:0.=
999997;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke=
-dasharray:none;stroke-opacity:1"
+       d=3D"m 420,219.99997 v 5 0"
+       id=3D"path29548-8-5-0"
+       inkscape:transform-center-x=3D"14.782001"
+       inkscape:transform-center-y=3D"-0.085282155" />
+    <path
+       style=3D"fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:0.=
999997;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke=
-dasharray:none;stroke-opacity:1"
+       d=3D"m 440,219.99997 v 5 0"
+       id=3D"path29548-8-5-0-6"
+       inkscape:transform-center-x=3D"14.782001"
+       inkscape:transform-center-y=3D"-0.085282155" />
+    <path
+       style=3D"fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;=
stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dashar=
ray:none;stroke-opacity:1"
+       d=3D"m 460,219.99997 v 5.00004 0"
+       id=3D"path29548-8-5-0-6-4-6"
+       inkscape:transform-center-x=3D"14.782001"
+       inkscape:transform-center-y=3D"-0.085282837" />
+    <path
+       style=3D"fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;=
stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dashar=
ray:none;stroke-opacity:1"
+       d=3D"m 500,219.99997 v 5.00004 0"
+       id=3D"path29548-8-5-0-6-4-6-2"
+       inkscape:transform-center-x=3D"14.782001"
+       inkscape:transform-center-y=3D"-0.085282837" />
+    <path
+       style=3D"fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:0.=
999997;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke=
-dasharray:none;stroke-opacity:1"
+       d=3D"m 520,219.99997 v 5 0"
+       id=3D"path29548-8-5-0-6-4-6-2-9"
+       inkscape:transform-center-x=3D"14.782001"
+       inkscape:transform-center-y=3D"-0.085282155" />
+    <path
+       style=3D"fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;=
stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dashar=
ray:none;stroke-opacity:1"
+       d=3D"m 540,219.99997 v 5.00004 0"
+       id=3D"path29548-8-5-0-6-4-6-2-9-0"
+       inkscape:transform-center-x=3D"14.782001"
+       inkscape:transform-center-y=3D"-0.085282837" />
+    <path
+       style=3D"fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;=
stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dashar=
ray:none;stroke-opacity:1"
+       d=3D"m 560,219.99997 v 5.00004 0"
+       id=3D"path29548-8-5-0-6-4-6-2-9-0-8"
+       inkscape:transform-center-x=3D"14.782001"
+       inkscape:transform-center-y=3D"-0.085282837" />
+    <path
+       style=3D"fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;=
stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dashar=
ray:none;stroke-opacity:1"
+       d=3D"m 580,219.99997 v 5.00004 0"
+       id=3D"path29548-8-5-0-6-4-6-2-9-0-8-1"
+       inkscape:transform-center-x=3D"14.782001"
+       inkscape:transform-center-y=3D"-0.085282837" />
+    <path
+       style=3D"fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;=
stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dashar=
ray:none;stroke-opacity:1"
+       d=3D"m 620.266,219.99997 v 5.00004 0"
+       id=3D"path29548-8-5-0-6-4-6-2-9-0-8-1-3"
+       inkscape:transform-center-x=3D"14.782001"
+       inkscape:transform-center-y=3D"-0.085282837" />
+    <path
+       style=3D"fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;=
stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dashar=
ray:none;stroke-opacity:1"
+       d=3D"m 640,219.99997 v 5.00004 0"
+       id=3D"path29548-8-5-0-6-4-6-2-9-0-8-1-3-1"
+       inkscape:transform-center-x=3D"14.782001"
+       inkscape:transform-center-y=3D"-0.085282837" />
+    <path
+       style=3D"fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;=
stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dashar=
ray:none;stroke-opacity:1"
+       d=3D"m 660,219.99997 v 5.00004 0"
+       id=3D"path29548-8-5-0-6-4-6-2-9-0-8-1-3-1-9"
+       inkscape:transform-center-x=3D"14.782001"
+       inkscape:transform-center-y=3D"-0.085282837" />
+    <path
+       style=3D"fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;=
stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dashar=
ray:none;stroke-opacity:1"
+       d=3D"m 679.61073,219.99997 v 5.00004 0"
+       id=3D"path29548-8-5-0-6-4-6-2-9-0-8-1-3-1-9-6"
+       inkscape:transform-center-x=3D"14.782001"
+       inkscape:transform-center-y=3D"-0.085282837" />
+    <path
+       style=3D"fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;=
stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dashar=
ray:none;stroke-opacity:1"
+       d=3D"m 700,219.99997 v 5.00004 0"
+       id=3D"path29548-8-5-0-6-4-6-2-9-0-8-1-3-1-9-6-9"
+       inkscape:transform-center-x=3D"14.782001"
+       inkscape:transform-center-y=3D"-0.085282837" />
+    <path
+       style=3D"fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;=
stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dashar=
ray:none;stroke-opacity:1"
+       d=3D"m 740,219.99997 v 5.00004 0"
+       id=3D"path29548-8-5-0-6-4-6-2-9-0-8-1-3-1-9-6-9-3"
+       inkscape:transform-center-x=3D"14.782001"
+       inkscape:transform-center-y=3D"-0.085282837" />
+    <path
+       style=3D"fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;=
stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dashar=
ray:none;stroke-opacity:1"
+       d=3D"m 760,219.99997 v 5.00004 0"
+       id=3D"path29548-8-5-0-6-4-6-2-9-0-8-1-3-1-9-6-9-3-4"
+       inkscape:transform-center-x=3D"14.782001"
+       inkscape:transform-center-y=3D"-0.085282837" />
+    <path
+       style=3D"fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;=
stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dashar=
ray:none;stroke-opacity:1"
+       d=3D"m 780.36587,219.99997 v 5.00004 0"
+       id=3D"path29548-8-5-0-6-4-6-2-9-0-8-1-3-1-9-6-9-3-4-0"
+       inkscape:transform-center-x=3D"14.782001"
+       inkscape:transform-center-y=3D"-0.085282837" />
+    <path
+       style=3D"fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;=
stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dashar=
ray:none;stroke-opacity:1"
+       d=3D"m 800,219.99997 v 5.00004 0"
+       id=3D"path29548-8-5-0-6-4-6-2-9-0-8-1-3-1-9-6-9-3-4-0-4"
+       inkscape:transform-center-x=3D"14.782001"
+       inkscape:transform-center-y=3D"-0.085282837" />
+    <path
+       style=3D"fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;=
stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dashar=
ray:none;stroke-opacity:1"
+       d=3D"m 820,219.99997 v 5.00004 0"
+       id=3D"path29548-8-5-0-6-4-6-2-9-0-8-1-3-1-9-6-9-3-4-0-4-6"
+       inkscape:transform-center-x=3D"14.782001"
+       inkscape:transform-center-y=3D"-0.085282837" />
+    <path
+       style=3D"fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;=
stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dashar=
ray:none;stroke-opacity:1"
+       d=3D"m 860,219.99997 v 5.00004 0"
+       id=3D"path29548-8-5-0-6-4-6-2-9-0-8-1-3-1-9-6-9-3-4-0-4-6-2"
+       inkscape:transform-center-x=3D"14.782001"
+       inkscape:transform-center-y=3D"-0.085282837" />
+    <path
+       style=3D"fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;=
stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dashar=
ray:none;stroke-opacity:1"
+       d=3D"m 880,219.99997 v 5.00004 0"
+       id=3D"path29548-8-5-0-6-4-6-2-9-0-8-1-3-1-9-6-9-3-4-0-4-6-2-2"
+       inkscape:transform-center-x=3D"14.782001"
+       inkscape:transform-center-y=3D"-0.085282837" />
+    <path
+       style=3D"fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;=
stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dashar=
ray:none;stroke-opacity:1"
+       d=3D"m 899.72384,219.99997 v 5.00004 0"
+       id=3D"path29548-8-5-0-6-4-6-2-9-0-8-1-3-1-9-6-9-3-4-0-4-6-2-2-7"
+       inkscape:transform-center-x=3D"14.782001"
+       inkscape:transform-center-y=3D"-0.085282837" />
+    <path
+       style=3D"fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;=
stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dashar=
ray:none;stroke-opacity:1"
+       d=3D"m 920,219.99997 v 5.00004 0"
+       id=3D"path29548-8-5-0-6-4-6-2-9-0-8-1-3-1-9-6-9-3-4-0-4-6-2-2-7-6"
+       inkscape:transform-center-x=3D"14.782001"
+       inkscape:transform-center-y=3D"-0.085282837" />
+    <path
+       style=3D"fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;=
stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dashar=
ray:none;stroke-opacity:1"
+       d=3D"m 940,219.99997 v 5.00004 0"
+       id=3D"path29548-8-5-0-6-4-6-2-9-0-8-1-3-1-9-6-9-3-4-0-4-6-2-2-7-6-1"
+       inkscape:transform-center-x=3D"14.782001"
+       inkscape:transform-center-y=3D"-0.085282837" />
+    <path
+       style=3D"fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;=
stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dashar=
ray:none;stroke-opacity:1"
+       d=3D"m 980,219.99997 v 5.00004 0"
+       id=3D"path29548-8-5-0-6-4-6-2-9-0-8-1-3-1-9-6-9-3-4-0-4-6-2-2-7-6-1=
-9"
+       inkscape:transform-center-x=3D"14.782001"
+       inkscape:transform-center-y=3D"-0.085282837" />
+    <path
+       style=3D"fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;=
stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dashar=
ray:none;stroke-opacity:1"
+       d=3D"m 1000,219.99997 v 5.00004 0"
+       id=3D"path29548-8-5-0-6-4-6-2-9-0-8-1-3-1-9-6-9-3-4-0-4-6-2-2-7-6-1=
-9-9"
+       inkscape:transform-center-x=3D"14.782001"
+       inkscape:transform-center-y=3D"-0.085282837" />
+    <path
+       style=3D"fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;=
stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dashar=
ray:none;stroke-opacity:1"
+       d=3D"m 1020,219.99997 v 5.00004 0"
+       id=3D"path29548-8-5-0-6-4-6-2-9-0-8-1-3-1-9-6-9-3-4-0-4-6-2-2-7-6-1=
-9-9-1"
+       inkscape:transform-center-x=3D"14.782001"
+       inkscape:transform-center-y=3D"-0.085282837" />
+    <path
+       style=3D"fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;=
stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dashar=
ray:none;stroke-opacity:1"
+       d=3D"m 1040,219.99997 v 5.00004 0"
+       id=3D"path29548-8-5-0-6-4-6-2-9-0-8-1-3-1-9-6-9-3-4-0-4-6-2-2-7-6-1=
-9-9-1-4"
+       inkscape:transform-center-x=3D"14.782001"
+       inkscape:transform-center-y=3D"-0.085282837" />
+    <path
+       style=3D"fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;=
stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dashar=
ray:none;stroke-opacity:1"
+       d=3D"m 1059.7216,219.99997 v 5.00004 0"
+       id=3D"path29548-8-5-0-6-4-6-2-9-0-8-1-3-1-9-6-9-3-4-0-4-6-2-2-7-6-1=
-9-9-1-4-9"
+       inkscape:transform-center-x=3D"-14.78205"
+       inkscape:transform-center-y=3D"-0.085282837" />
+    <path
+       style=3D"fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;=
stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dashar=
ray:none;stroke-opacity:1"
+       d=3D"m 1100,219.99997 v 5.00004 0"
+       id=3D"path29548-8-5-0-6-4-6-2-9-0-8-1-3-1-9-6-9-3-4-0-4-6-2-2-7-6-1=
-9-0"
+       inkscape:transform-center-x=3D"14.782001"
+       inkscape:transform-center-y=3D"-0.085282837" />
+    <path
+       style=3D"fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;=
stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dashar=
ray:none;stroke-opacity:1"
+       d=3D"m 1120,219.99997 v 5.00004 0"
+       id=3D"path29548-8-5-0-6-4-6-2-9-0-8-1-3-1-9-6-9-3-4-0-4-6-2-2-7-6-1=
-9-9-7"
+       inkscape:transform-center-x=3D"14.782001"
+       inkscape:transform-center-y=3D"-0.085282837" />
+    <path
+       style=3D"fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;=
stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dashar=
ray:none;stroke-opacity:1"
+       d=3D"m 1140,219.99997 v 5.00004 0"
+       id=3D"path29548-8-5-0-6-4-6-2-9-0-8-1-3-1-9-6-9-3-4-0-4-6-2-2-7-6-1=
-9-9-1-5"
+       inkscape:transform-center-x=3D"14.782001"
+       inkscape:transform-center-y=3D"-0.085282837" />
+    <path
+       style=3D"fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;=
stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dashar=
ray:none;stroke-opacity:1"
+       d=3D"m 1160,219.99997 v 5.00004 0"
+       id=3D"path29548-8-5-0-6-4-6-2-9-0-8-1-3-1-9-6-9-3-4-0-4-6-2-2-7-6-1=
-9-9-1-4-8"
+       inkscape:transform-center-x=3D"14.782001"
+       inkscape:transform-center-y=3D"-0.085282837" />
+    <path
+       style=3D"fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;=
stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dashar=
ray:none;stroke-opacity:1"
+       d=3D"m 1179.7216,219.99997 v 5.00004 0"
+       id=3D"path29548-8-5-0-6-4-6-2-9-0-8-1-3-1-9-6-9-3-4-0-4-6-2-2-7-6-1=
-9-9-1-4-9-7"
+       inkscape:transform-center-x=3D"-14.78205"
+       inkscape:transform-center-y=3D"-0.085282837" />
+    <path
+       style=3D"fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:2;=
stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dashar=
ray:none;stroke-opacity:1"
+       d=3D"m 1200,220.00002 v 9.99999 0"
+       id=3D"path29548-5-1-3-6-3-1-0" />
+    <path
+       style=3D"fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:2;=
stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dashar=
ray:none;stroke-opacity:1"
+       d=3D"m 1320,219.99996 v 10 0"
+       id=3D"path29548-5-1-3-6-3-1-0-8" />
+    <path
+       style=3D"fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;=
stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dashar=
ray:none;stroke-opacity:1"
+       d=3D"m 1220,219.99997 v 5.00004 0"
+       id=3D"path29548-8-5-0-6-4-6-2-9-0-8-1-3-1-9-6-9-3-4-0-4-6-2-2-7-6-1=
-9-0-5"
+       inkscape:transform-center-x=3D"14.782001"
+       inkscape:transform-center-y=3D"-0.085282837" />
+    <path
+       style=3D"fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;=
stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dashar=
ray:none;stroke-opacity:1"
+       d=3D"m 1240,219.99997 v 5.00004 0"
+       id=3D"path29548-8-5-0-6-4-6-2-9-0-8-1-3-1-9-6-9-3-4-0-4-6-2-2-7-6-1=
-9-9-7-5"
+       inkscape:transform-center-x=3D"14.782001"
+       inkscape:transform-center-y=3D"-0.085282837" />
+    <path
+       style=3D"fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;=
stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dashar=
ray:none;stroke-opacity:1"
+       d=3D"m 1260,219.99997 v 5.00004 0"
+       id=3D"path29548-8-5-0-6-4-6-2-9-0-8-1-3-1-9-6-9-3-4-0-4-6-2-2-7-6-1=
-9-9-1-5-2"
+       inkscape:transform-center-x=3D"14.782001"
+       inkscape:transform-center-y=3D"-0.085282837" />
+    <path
+       style=3D"fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;=
stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dashar=
ray:none;stroke-opacity:1"
+       d=3D"m 1280,219.99997 v 5.00004 0"
+       id=3D"path29548-8-5-0-6-4-6-2-9-0-8-1-3-1-9-6-9-3-4-0-4-6-2-2-7-6-1=
-9-9-1-4-8-9"
+       inkscape:transform-center-x=3D"14.782001"
+       inkscape:transform-center-y=3D"-0.085282837" />
+    <path
+       style=3D"fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1;=
stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dashar=
ray:none;stroke-opacity:1"
+       d=3D"m 1299.7216,219.99997 v 5.00004 0"
+       id=3D"path29548-8-5-0-6-4-6-2-9-0-8-1-3-1-9-6-9-3-4-0-4-6-2-2-7-6-1=
-9-9-1-4-9-7-0"
+       inkscape:transform-center-x=3D"-14.78205"
+       inkscape:transform-center-y=3D"-0.085282837" />
+  </g>
+  <style
+     type=3D"text/css"
+     id=3D"style1021"> .st0{fill:#4A97D2;} .st1{fill:#333333;} </style>
+</svg>
--=20
2.34.1


