Return-Path: <bluelightning@bluelightning.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E235C3DA6E
	for <webhook@archiver.kernel.org>; Mon,  6 Nov 2023 10:29:59 +0000 (UTC)
Received: from mail2.g23.pair.com (mail2.g23.pair.com [66.39.132.40])
 by mx.groups.io with SMTP id smtpd.web10.51260.1699266594216111203
 for <docs@lists.yoctoproject.org>;
 Mon, 06 Nov 2023 02:29:54 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=permanent DNS error (domain: bluelightning.org, ip: 66.39.132.40, mailfrom: bluelightning@bluelightning.org)
Received: from mail2.g23.pair.com (localhost [127.0.0.1])
	by mail2.g23.pair.com (Postfix) with ESMTP id 3CE0A2845E;
	Mon,  6 Nov 2023 05:29:53 -0500 (EST)
Received: from linc.fritz.box (unknown [161.29.74.235])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail2.g23.pair.com (Postfix) with ESMTPSA id 60DEB28161;
	Mon,  6 Nov 2023 05:29:52 -0500 (EST)
From: Paul Eggleton <bluelightning@bluelightning.org>
To: docs@lists.yoctoproject.org
Cc: michael.opdenacker@bootlin.com
Subject: [PATCH 02/12] ref-manual: update SDK_NAME variable documentation
Date: Mon,  6 Nov 2023 23:29:32 +1300
Message-Id: <a0a5a2736821e4527513dda1bc9ec0d748906563.1699266393.git.bluelightning@bluelightning.org>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4588

Update for changes in nanbield. Note that I am documenting what is set
by poky.conf here (since this is Yocto Project documentation), which is
slightly different from what is done in meta/conf/bitbake.conf.

Signed-off-by: Paul Eggleton <bluelightning@bluelightning.org>
---
 documentation/ref-manual/variables.rst | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-m=
anual/variables.rst
index 3002bda3ffd..82cef4511ca 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -7422,13 +7422,16 @@ system and gives an overview of their function an=
d contents.
       :term:`SDK_EXT_TYPE` is set to "full".
=20
    :term:`SDK_NAME`
-      The base name for SDK output files. The name is derived from the
-      :term:`DISTRO`, :term:`TCLIBC`,
-      :term:`SDK_ARCH`,
-      :term:`IMAGE_BASENAME`, and
-      :term:`TUNE_PKGARCH` variables::
-
-         SDK_NAME =3D "${DISTRO}-${TCLIBC}-${SDK_ARCH}-${IMAGE_BASENAME}=
-${TUNE_PKGARCH}"
+      The base name for SDK output files. The default value (as set in
+      ``meta-poky/conf/distro/poky.conf``) is derived from the
+      :term:`DISTRO`,
+      :term:`TCLIBC`,
+      :term:`SDKMACHINE`,
+      :term:`IMAGE_BASENAME`,
+      :term:`TUNE_PKGARCH`, and
+      :term:`MACHINE` variables::
+
+         SDK_NAME =3D "${DISTRO}-${TCLIBC}-${SDKMACHINE}-${IMAGE_BASENAM=
E}-${TUNE_PKGARCH}-${MACHINE}"
=20
    :term:`SDK_OS`
       Specifies the operating system for which the SDK will be built. Th=
e
--=20
2.34.1


