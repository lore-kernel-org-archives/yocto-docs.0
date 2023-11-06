Return-Path: <bluelightning@bluelightning.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73D6EC4167D
	for <webhook@archiver.kernel.org>; Mon,  6 Nov 2023 10:30:09 +0000 (UTC)
Received: from mail2.g23.pair.com (mail2.g23.pair.com [66.39.132.40])
 by mx.groups.io with SMTP id smtpd.web10.51262.1699266600087499138
 for <docs@lists.yoctoproject.org>;
 Mon, 06 Nov 2023 02:30:00 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=permanent DNS error (domain: bluelightning.org, ip: 66.39.132.40, mailfrom: bluelightning@bluelightning.org)
Received: from mail2.g23.pair.com (localhost [127.0.0.1])
	by mail2.g23.pair.com (Postfix) with ESMTP id 7356928900;
	Mon,  6 Nov 2023 05:29:59 -0500 (EST)
Received: from linc.fritz.box (unknown [161.29.74.235])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail2.g23.pair.com (Postfix) with ESMTPSA id 9791B285C3;
	Mon,  6 Nov 2023 05:29:58 -0500 (EST)
From: Paul Eggleton <bluelightning@bluelightning.org>
To: docs@lists.yoctoproject.org
Cc: michael.opdenacker@bootlin.com
Subject: [PATCH 07/12] release-notes-4.3: remove the Distribution section
Date: Mon,  6 Nov 2023 23:29:37 +1300
Message-Id: <74a05e890ee35349240d643a0344bcc25219755b.1699266393.git.bluelightning@bluelightning.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1699266393.git.bluelightning@bluelightning.org>
References: <cover.1699266393.git.bluelightning@bluelightning.org>
MIME-Version: 1.0
X-Scanned-By: mailmunge 3.10 on 66.39.132.40
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 06 Nov 2023 10:30:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4593

This section doesn't make a lot of sense to separate out. The SPDX
change is now no longer Poky-specific, and the poky-altcfg usrmerge
change is not really notable given that poky-altcfg is not widely used
outside of our testing and also itself selects systemd as INIT_MANAGER
and thus requires usrmerge anyway (as noted elsewhere).

Signed-off-by: Paul Eggleton <bluelightning@bluelightning.org>
---
 documentation/migration-guides/release-notes-4.3.rst | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/documentation/migration-guides/release-notes-4.3.rst b/docum=
entation/migration-guides/release-notes-4.3.rst
index b4d6ae1f974..6491504c9d2 100644
--- a/documentation/migration-guides/release-notes-4.3.rst
+++ b/documentation/migration-guides/release-notes-4.3.rst
@@ -117,13 +117,6 @@ New Features / Enhancements in 4.3
=20
 -  Image-related enhancements:
=20
--  Distribution-related enhancements:
-
-   -  The ``poky`` distribution enables the generation of :term:`SPDX` m=
anifests.
-
-   -  The ``poky-altcfg`` distribution enables the ``usrmerge``
-      :ref:`distro feature <ref-manual/features:Distro Features>`.
-
 -  wic Image Creator enhancements:
=20
 -  FIT image related improvements:
@@ -220,6 +213,8 @@ New Features / Enhancements in 4.3
=20
 -  Miscellaneous changes:
=20
+   -  Generation of :term:`SPDX` manifests is now enabled by default.
+
    -  Git based recipes in OE-Core which used the ``git``  protocol have=
 been
       changed to use `https`` where possible, as it is typically faster =
and
       more reliable.
--=20
2.34.1


