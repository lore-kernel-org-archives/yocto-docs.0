Return-Path: <bluelightning@bluelightning.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DE5DC4167D
	for <webhook@archiver.kernel.org>; Mon,  6 Nov 2023 10:30:19 +0000 (UTC)
Received: from mail2.g23.pair.com (mail2.g23.pair.com [66.39.132.40])
 by mx.groups.io with SMTP id smtpd.web11.50735.1699266610590795754
 for <docs@lists.yoctoproject.org>;
 Mon, 06 Nov 2023 02:30:10 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=permanent DNS error (domain: bluelightning.org, ip: 66.39.132.40, mailfrom: bluelightning@bluelightning.org)
Received: from mail2.g23.pair.com (localhost [127.0.0.1])
	by mail2.g23.pair.com (Postfix) with ESMTP id E9F4C2855F;
	Mon,  6 Nov 2023 05:30:09 -0500 (EST)
Received: from linc.fritz.box (unknown [161.29.74.235])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail2.g23.pair.com (Postfix) with ESMTPSA id 1AF3328A05;
	Mon,  6 Nov 2023 05:30:08 -0500 (EST)
From: Paul Eggleton <bluelightning@bluelightning.org>
To: docs@lists.yoctoproject.org
Cc: michael.opdenacker@bootlin.com
Subject: [PATCH 10/12] migration-4.3: remove some unnecessary items
Date: Mon,  6 Nov 2023 23:29:40 +1300
Message-Id: <975a67082ac85964aa24808f4b01592884107832.1699266393.git.bluelightning@bluelightning.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1699266393.git.bluelightning@bluelightning.org>
References: <cover.1699266393.git.bluelightning@bluelightning.org>
MIME-Version: 1.0
X-Scanned-By: mailmunge 3.10 on 66.39.132.40
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 06 Nov 2023 10:30:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4596

Remove some items from the 4.3 migration guide:

* The PERLVERSION and PERLARCH items are already mentioned under the
  removed variables section
* The jsDelivr item is interesting, but it isn't a backwards
  compatibility issue that the user would need to take action to
  resolve, and we already cover it in the release notes.

Signed-off-by: Paul Eggleton <bluelightning@bluelightning.org>
---
 documentation/migration-guides/migration-4.3.rst | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/documentation/migration-guides/migration-4.3.rst b/documenta=
tion/migration-guides/migration-4.3.rst
index 9f8fe34ca3d..d2c3d2ad985 100644
--- a/documentation/migration-guides/migration-4.3.rst
+++ b/documentation/migration-guides/migration-4.3.rst
@@ -101,15 +101,6 @@ Recipe changes
 -  Runtime testing of ptest now fails if no test results are returned by
    any given ptest.
=20
-.. _migration-4.3-class-changes:
-
-Class changes
-~~~~~~~~~~~~~
-
--  The ``perl-version`` class no longer provides the ``PERLVERSION`` and=
 ``PERLARCH`` variables
-   as there were no users in any core layer. The functions for this func=
tionality
-   are still available.
-
 .. _migration-4.3-deprecated-variables:
=20
 Deprecated variables
@@ -173,13 +164,6 @@ QEMU changes
 Miscellaneous changes
 ~~~~~~~~~~~~~~~~~~~~~
=20
--  `jsDelivr <https://www.jsdelivr.com/`>__ now offers a new Content Del=
ivery
-   Network (CDN) to Yocto Project users, which is completely free of cha=
rge
-   for Open Source projects. In particular, it can be used to efficientl=
y
-   access prebuilt binary artifacts (see :term:`SSTATE_MIRRORS`) from ma=
ny
-   different locations in the world. This is available to all supported =
Poky
-   releases.
-
 -  The ``-crosssdk`` suffix and any :term:`MLPREFIX` were removed from
    ``virtual/XXX`` provider/dependencies where a ``PREFIX`` was used as =
well,
    as we don't need both and it made automated dependency rewriting
--=20
2.34.1


