Return-Path: <bluelightning@bluelightning.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3375DC77B76
	for <webhook@archiver.kernel.org>; Sat, 22 Apr 2023 03:20:16 +0000 (UTC)
Received: from mail2.g23.pair.com (mail2.g23.pair.com [66.39.132.40])
 by mx.groups.io with SMTP id smtpd.web10.1289.1682133612167095721
 for <docs@lists.yoctoproject.org>;
 Fri, 21 Apr 2023 20:20:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: bluelightning.org, ip: 66.39.132.40, mailfrom: bluelightning@bluelightning.org)
Received: from mail2.g23.pair.com (localhost [127.0.0.1])
	by mail2.g23.pair.com (Postfix) with ESMTP id 89919E7708;
	Fri, 21 Apr 2023 23:20:11 -0400 (EDT)
Received: from linc.fritz.box (unknown [161.29.131.251])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by mail2.g23.pair.com (Postfix) with ESMTPSA id B92ABE7700;
	Fri, 21 Apr 2023 23:20:10 -0400 (EDT)
From: Paul Eggleton <bluelightning@bluelightning.org>
To: docs@lists.yoctoproject.org
Cc: michael.opdenacker@bootlin.com
Subject: [PATCH 09/17] ref-manual: document new patch-status-* QA checks
Date: Sat, 22 Apr 2023 15:19:45 +1200
Message-Id: <0af28e2c3e4d2f4d4d1ff47a81973c56341bcc78.1682133339.git.bluelightning@bluelightning.org>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3860

Newly added in 4.2.

Signed-off-by: Paul Eggleton <bluelightning@bluelightning.org>
---
 documentation/ref-manual/classes.rst   |  7 +++++++
 documentation/ref-manual/qa-checks.rst | 23 +++++++++++++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-man=
ual/classes.rst
index aacbb8a495c..0762d1d8bc8 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -1336,6 +1336,13 @@ Here are the tests you can list with the :term:`WA=
RN_QA` and
 -  ``patch-fuzz:`` Checks for fuzz in patch files that may allow
    them to apply incorrectly if the underlying code changes.
=20
+-  ``patch-status-core:`` Checks that the Upstream-Status is specified
+   and valid in the headers of patches for recipes in the OE-Core layer.
+
+-  ``patch-status-noncore:`` Checks that the Upstream-Status is specifie=
d
+   and valid in the headers of patches for recipes in layers other than
+   OE-Core.
+
 -  ``perllocalpod:`` Checks for ``perllocal.pod`` being erroneously
    installed and packaged by a recipe.
=20
diff --git a/documentation/ref-manual/qa-checks.rst b/documentation/ref-m=
anual/qa-checks.rst
index 13096816d2e..6fdb0fbde9a 100644
--- a/documentation/ref-manual/qa-checks.rst
+++ b/documentation/ref-manual/qa-checks.rst
@@ -750,6 +750,29 @@ Errors and Warnings
     other things in the patches, those can be discarded.
=20
=20
+.. _qa-check-patch-status:
+
+- ``Missing Upstream-Status in patch <patchfile> Please add according to=
 <url> [patch-status-core/patch-status-noncore]``
+
+    The Upstream-Status value is missing in the specified patch file's h=
eader.
+    This value is intended to track whether or not the patch has been se=
nt
+    upstream, whether or not it has been merged, etc.
+
+    There are two options for this same check - ``patch-status-core`` (f=
or
+    recipes in OE-Core) and ``patch-status-noncore`` (for recipes in any=
 other
+    layer).
+
+    For more information on setting Upstream-Status see:
+    https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines#Pa=
tch_Header_Recommendations:_Upstream-Status
+
+
+- ``Malformed Upstream-Status in patch <patchfile> Please correct accord=
ing to <url> [patch-status-core/patch-status-noncore]``
+
+    The Upstream-Status value in the specified patch file's header is in=
valid -
+    it must be a specific format. See the "Missing Upstream-Status" entr=
y above
+    for more information.
+
+
 .. _qa-check-buildpaths:
=20
 - ``File <filename> in package <packagename> contains reference to TMPDI=
R [buildpaths]``
--=20
2.34.1


