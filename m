Return-Path: <bluelightning@bluelightning.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33EF9C7EE20
	for <webhook@archiver.kernel.org>; Sat, 22 Apr 2023 03:20:16 +0000 (UTC)
Received: from mail2.g23.pair.com (mail2.g23.pair.com [66.39.132.40])
 by mx.groups.io with SMTP id smtpd.web10.1286.1682133608670463430
 for <docs@lists.yoctoproject.org>;
 Fri, 21 Apr 2023 20:20:08 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: bluelightning.org, ip: 66.39.132.40, mailfrom: bluelightning@bluelightning.org)
Received: from mail2.g23.pair.com (localhost [127.0.0.1])
	by mail2.g23.pair.com (Postfix) with ESMTP id 0EA81E6A4D;
	Fri, 21 Apr 2023 23:20:08 -0400 (EDT)
Received: from linc.fritz.box (unknown [161.29.131.251])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by mail2.g23.pair.com (Postfix) with ESMTPSA id 3D5B1E73DE;
	Fri, 21 Apr 2023 23:20:07 -0400 (EDT)
From: Paul Eggleton <bluelightning@bluelightning.org>
To: docs@lists.yoctoproject.org
Cc: michael.opdenacker@bootlin.com
Subject: [PATCH 06/17] Add coverage of addpylib directive
Date: Sat, 22 Apr 2023 15:19:42 +1200
Message-Id: <693b3b929a36bd7ee694760e29a088447e684983.1682133339.git.bluelightning@bluelightning.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1682133339.git.bluelightning@bluelightning.org>
References: <cover.1682133339.git.bluelightning@bluelightning.org>
MIME-Version: 1.0
X-Scanned-By: mailmunge 3.11 on 66.39.132.40
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sat, 22 Apr 2023 03:20:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3857

To complement what I am adding to the BitBake reference manual, add a
section in the 4.2 migration guide, a reference in the structure section
of the reference manual (where we talk about meta/lib) and adjust the
release notes item to be a little more concise.

Signed-off-by: Paul Eggleton <bluelightning@bluelightning.org>
---
 .../migration-guides/migration-4.2.rst        | 22 +++++++++++++++++++
 .../migration-guides/release-notes-4.2.rst    |  8 ++-----
 documentation/ref-manual/structure.rst        |  4 +++-
 3 files changed, 27 insertions(+), 7 deletions(-)

diff --git a/documentation/migration-guides/migration-4.2.rst b/documenta=
tion/migration-guides/migration-4.2.rst
index ccc3e8905e6..c2ec8af8a45 100644
--- a/documentation/migration-guides/migration-4.2.rst
+++ b/documentation/migration-guides/migration-4.2.rst
@@ -85,6 +85,28 @@ On the other hand, some earlier distributions are no l=
onger supported:
=20
 See :ref:`all supported distributions <system-requirements-supported-dis=
tros>`.
=20
+
+.. _migration-4.2-addpylib:
+
+Python library code extensions
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+BitBake in this release now supports a new ``addpylib`` directive to ena=
ble
+Python libraries within layers.
+
+This directive should be added to your layer configuration
+as in the below example from ``meta/conf/layer.conf``::
+
+   addpylib ${LAYERDIR}/lib oe
+
+Layers currently adding a lib directory to extend Python library code sh=
ould now
+use this directive as :term:`BBPATH` is not going to be added automatica=
lly by
+OE-Core in future. Note that the directives are immediate operations, so=
 it does
+make modules available for use sooner than the current BBPATH-based appr=
oach.
+
+For more information, see :ref:`bitbake-user-manual/bitbake-user-manual-=
metadata:extending python library code`.
+
+
 .. _migration-4.2-misc-changes:
=20
 Miscellaneous changes
diff --git a/documentation/migration-guides/release-notes-4.2.rst b/docum=
entation/migration-guides/release-notes-4.2.rst
index 4cf1974d4f2..a3e821cb4be 100644
--- a/documentation/migration-guides/release-notes-4.2.rst
+++ b/documentation/migration-guides/release-notes-4.2.rst
@@ -11,12 +11,8 @@ New Features / Enhancements in 4.2
    :term:`buildtools` tarball.
=20
 -  BitBake in this release now supports a new ``addpylib`` directive to =
enable
-   Python libraries within layers.
-
-   This directive should be added to your layer configuration
-   as in the below example from ``meta/conf/layer.conf``::
-
-      addpylib ${LAYERDIR}/lib oe
+   Python libraries within layers. For more information,
+   see :ref:`bitbake-user-manual/bitbake-user-manual-metadata:extending =
python library code`.
=20
 -  BitBake has seen multiple internal changes that may impact
    memory and disk usage as well as parsing time, in particular:
diff --git a/documentation/ref-manual/structure.rst b/documentation/ref-m=
anual/structure.rst
index e895382eec7..f1b11ad69b7 100644
--- a/documentation/ref-manual/structure.rst
+++ b/documentation/ref-manual/structure.rst
@@ -750,7 +750,9 @@ and lists of files and directories with known permiss=
ions.
 -------------
=20
 This directory contains OpenEmbedded Python library code used during the
-build process.
+build process. It is enabled via the ``addpylib`` directive in
+``meta/conf/local.conf``. For more information, see
+:ref:`bitbake-user-manual/bitbake-user-manual-metadata:extending python =
library code`.
=20
 .. _structure-meta-recipes-bsp:
=20
--=20
2.34.1


