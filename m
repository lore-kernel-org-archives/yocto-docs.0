Return-Path: <bluelightning@bluelightning.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EBFEC4167B
	for <webhook@archiver.kernel.org>; Mon,  6 Nov 2023 10:29:59 +0000 (UTC)
Received: from mail2.g23.pair.com (mail2.g23.pair.com [66.39.132.40])
 by mx.groups.io with SMTP id smtpd.web11.50729.1699266596396374858
 for <docs@lists.yoctoproject.org>;
 Mon, 06 Nov 2023 02:29:56 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=permanent DNS error (domain: bluelightning.org, ip: 66.39.132.40, mailfrom: bluelightning@bluelightning.org)
Received: from mail2.g23.pair.com (localhost [127.0.0.1])
	by mail2.g23.pair.com (Postfix) with ESMTP id B508E28462;
	Mon,  6 Nov 2023 05:29:55 -0500 (EST)
Received: from linc.fritz.box (unknown [161.29.74.235])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail2.g23.pair.com (Postfix) with ESMTPSA id D8ED82827C;
	Mon,  6 Nov 2023 05:29:54 -0500 (EST)
From: Paul Eggleton <bluelightning@bluelightning.org>
To: docs@lists.yoctoproject.org
Cc: michael.opdenacker@bootlin.com
Subject: [PATCH 04/12] release-notes-4.3: fix some typos
Date: Mon,  6 Nov 2023 23:29:34 +1300
Message-Id: <6714c3912cb7c6b1ef81eccb3abe7920d2df0767.1699266393.git.bluelightning@bluelightning.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1699266393.git.bluelightning@bluelightning.org>
References: <cover.1699266393.git.bluelightning@bluelightning.org>
MIME-Version: 1.0
X-Scanned-By: mailmunge 3.10 on 66.39.132.40
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 06 Nov 2023 10:29:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4590

Signed-off-by: Paul Eggleton <bluelightning@bluelightning.org>
---
 .../migration-guides/release-notes-4.3.rst       | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/documentation/migration-guides/release-notes-4.3.rst b/docum=
entation/migration-guides/release-notes-4.3.rst
index cd6d79d40b2..2f20fcb6946 100644
--- a/documentation/migration-guides/release-notes-4.3.rst
+++ b/documentation/migration-guides/release-notes-4.3.rst
@@ -1,21 +1,21 @@
 .. SPDX-License-Identifier: CC-BY-SA-2.0-UK
=20
-Release notes for 4.3 (nandbield)
-----------------------------------
+Release notes for 4.3 (nanbield)
+--------------------------------
=20
 New Features / Enhancements in 4.3
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
=20
 -  Linux kernel 6.5 and 6.1, gcc 13, glibc 2.38, LLVM 17, and other reci=
pe upgrades
=20
--  The autobuilder's shared-state artefacts are now available over the `=
jsDeliver
+-  The autobuilder's shared-state artefacts are now available over the `=
jsDelivr
    <https://jsdelivr.com>`__ Content Delivery Network (CDN).
    See :term:`SSTATE_MIRRORS`.
=20
 -  New variables:
=20
    -  :term:`CVE_CHECK_STATUSMAP`, :term:`CVE_STATUS`, :term:`CVE_STATUS=
_GROUPS`,
-      replaceing the deprecated :term:`CVE_CHECK_IGNORE`.
+      replacing the deprecated :term:`CVE_CHECK_IGNORE`.
=20
    -  :term:`FILE_LAYERNAME`: bitbake now sets this to the name of the l=
ayer
       containing the recipe
@@ -109,7 +109,7 @@ New Features / Enhancements in 4.3
    -  Many updates to the ``runqemu`` command.
=20
    -  The ``qemu-system-native`` recipe is now built with PNG support, w=
hich could be
-      useful to grab screeshots for error reporting purposes.
+      useful to grab screenshots for error reporting purposes.
=20
 -  Rust improvements:
=20
@@ -182,16 +182,16 @@ New Features / Enhancements in 4.3
=20
    -  :term:`FILES` now accepts ``**``, which matches zero or more subdi=
rectories.
=20
-   -  The X server packagroup now defaults to using the ``modesetting`` =
X
+   -  The X server packagegroup now defaults to using the ``modesetting`=
` X
       driver, which obsoletes the ``fbdev`` driver.
=20
    -  If a recipe uses :term:`LICENSE_FLAGS` and the licenses are not ac=
cepted,
       it can set a custom message with :term:`LICENSE_FLAGS_DETAILS` to =
be
       displayed to the users.
=20
-   -  Recipes that fetch specific revisions no longer need to explictly =
add
+   -  Recipes that fetch specific revisions no longer need to explicitly=
 add
       :term:`SRCPV` to :term:`PV` as BitBake will now automatically add =
the
-      revision infomation to :term:`PKGV` if needed.
+      revision information to :term:`PKGV` if needed.
=20
    -  The default :term:`PR` values in many recipes have been removed.
=20
--=20
2.34.1


