Received: from adige.pair.com (adige.pair.com [209.68.5.114])
 by mx.groups.io with SMTP id smtpd.web12.24865.1586987380146974028
 for <docs@lists.yoctoproject.org>;
 Wed, 15 Apr 2020 14:49:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: bluelightning.org, ip: 209.68.5.114, mailfrom: bluelightning@bluelightning.org)
Received: from adige.pair.com (localhost [127.0.0.1])
	by adige.pair.com (Postfix) with ESMTP id 6B049959E1
	for <docs@lists.yoctoproject.org>; Wed, 15 Apr 2020 17:49:39 -0400 (EDT)
Received: from linc.fritz.box (unknown [IPv6:2406:e003:130a:e501:bc33:44c8:4f44:4e95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by adige.pair.com (Postfix) with ESMTPSA id B320C959D1
	for <docs@lists.yoctoproject.org>; Wed, 15 Apr 2020 17:49:38 -0400 (EDT)
From: "Paul Eggleton" <bluelightning@bluelightning.org>
To: docs@lists.yoctoproject.org
Subject: [PATCH 1/2] dev-manual: basic updates for npm fetcher changes
Date: Thu, 16 Apr 2020 09:49:32 +1200
Message-Id: <5126db79aa4b7246f6105ac6c536fa83560b9797.1586987359.git.bluelightning@bluelightning.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1586987359.git.bluelightning@bluelightning.org>
References: <cover.1586987359.git.bluelightning@bluelightning.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Paul Eggleton <paul.eggleton@microsoft.com>

Update the npm:// URL and the generated npm recipe, and remove
references to NPM_SHRINKWRAP, NPM_LOCKDOWN and lockdown functionality in
general.

Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
---
 .../dev-manual/dev-manual-common-tasks.xml    | 52 ++++++++-----------
 1 file changed, 21 insertions(+), 31 deletions(-)

diff --git a/documentation/dev-manual/dev-manual-common-tasks.xml b/docum=
entation/dev-manual/dev-manual-common-tasks.xml
index 2b8868b62..185e1d769 100644
--- a/documentation/dev-manual/dev-manual-common-tasks.xml
+++ b/documentation/dev-manual/dev-manual-common-tasks.xml
@@ -10590,7 +10590,7 @@
                     <filename>devtool</filename> and the NPM fetcher to
                     create the recipe:
                     <literallayout class=3D'monospaced'>
-     $ devtool add "npm://registry.npmjs.org;name=3Dcute-files;version=3D=
1.0.2"
+     $ devtool add "npm://registry.npmjs.org;package=3Dcute-files;versio=
n=3D1.0.2"
                     </literallayout>
                     The <filename>devtool add</filename> command runs
                     <filename>recipetool create</filename> and uses the
@@ -10615,25 +10615,13 @@
                 </para>
=20
                 <para>
-                    <filename>recipetool</filename> creates "shrinkwrap"=
 and
-                    "lockdown" files for your recipe.
+                    <filename>recipetool</filename> creates a "shrinkwra=
p" file
+                    for your recipe.
                     Shrinkwrap files capture the version of all dependen=
t
                     modules.
                     Many packages do not provide shrinkwrap files.
                     <filename>recipetool</filename> create a shrinkwrap
                     file as it runs.
-                    You can replace the shrinkwrap file with your own fi=
le
-                    by setting the <filename>NPM_SHRINKWRAP</filename>
-                    variable.
-                </para>
-
-                <para>
-                    Lockdown files contain the checksum for each module
-                    to determine if your users download the same files w=
hen
-                    building with a recipe.
-                    Lockdown files ensure that dependencies have not bee=
n
-                    changed and that your NPM registry is still providin=
g
-                    the same file.
                     <note>
                         A package is created for each sub-module.
                         This policy is the only practical way to have th=
e
@@ -10648,23 +10636,26 @@
                     <literallayout class=3D'monospaced'>
      $ devtool edit-recipe cute-files
      SUMMARY =3D "Turn any folder on your computer into a cute file brow=
ser, available on the local network."
-     LICENSE =3D "BSD-3-Clause &amp; Unknown &amp; MIT &amp; ISC"
+     LICENSE =3D "MIT &amp; ISC &amp; Unknown"
      LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D71d98c0a1db42956787b1909=
c74a86ca \
-                         file://node_modules/content-disposition/LICENSE=
;md5=3Dc6e0ce1e688c5ff16db06b7259e9cd20 \
-                         file://node_modules/express/LICENSE;md5=3D5513c=
00a5c36cd361da863dd9aa8875d \
+                         file://node_modules/toidentifier/LICENSE;md5=3D=
1a261071a044d02eb6f2bb47f51a3502 \
+                         file://node_modules/debug/LICENSE;md5=3Dddd815a=
475e7338b0be7a14d8ee35a99 \
                          ...
=20
-     SRC_URI =3D "npm://registry.npmjs.org;name=3Dcute-files;version=3D$=
{PV}"
-     NPM_SHRINKWRAP :=3D "${THISDIR}/${PN}/npm-shrinkwrap.json"
-     NPM_LOCKDOWN :=3D "${THISDIR}/${PN}/lockdown.json"
+     SRC_URI =3D " \
+         npm://registry.npmjs.org/;package=3Dcute-files;version=3D${PV} =
\
+         npmsw://${THISDIR}/${BPN}/npm-shrinkwrap.json \
+     "
+
+     S =3D "${WORKDIR}/npm"
+
      inherit npm
-     # Must be set after inherit npm since that itself sets S
-     S =3D "${WORKDIR}/npmpkg"
=20
-     LICENSE_${PN}-content-disposition =3D "MIT"
-     ...
-     LICENSE_${PN}-express =3D "MIT"
      LICENSE_${PN} =3D "MIT"
+     LICENSE_${PN}-accepts =3D "MIT"
+     LICENSE_${PN}-array-flatten =3D "MIT"
+     ...
+     LICENSE_${PN}-vary =3D "MIT"
                     </literallayout>
                     Three key points exist in the previous example:
                     <itemizedlist>
@@ -10757,11 +10748,10 @@
                     However, the <filename>SRC_URI</filename> looks like=
 the
                     following:
                     <literallayout class=3D'monospaced'>
-     SRC_URI =3D "git://github.com/martinaglv/cute-files.git;protocol=3D=
https \
-               npm://registry.npmjs.org;name=3Dcommander;version=3D2.9.0=
;subdir=3Dnode_modules/commander \
-               npm://registry.npmjs.org;name=3Dexpress;version=3D4.14.0;=
subdir=3Dnode_modules/express \
-               npm://registry.npmjs.org;name=3Dcontent-disposition;versi=
on=3D0.3.0;subdir=3Dnode_modules/content-disposition \
-               "
+     SRC_URI =3D " \
+         git://github.com/martinaglv/cute-files.git;protocol=3Dhttps \
+         npmsw://${THISDIR}/${BPN}/npm-shrinkwrap.json \
+         "
                     </literallayout>
                     In this example, the main module is taken from the G=
it
                     repository and dependents are taken from the NPM reg=
istry.
--=20
2.20.1

