Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 968E6CA0EEB
	for <webhook@archiver.kernel.org>; Tue, 19 Aug 2025 16:04:54 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.web10.18603.1755619493177888762
 for <docs@lists.yoctoproject.org>;
 Tue, 19 Aug 2025 09:04:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=xYC6z+wK;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id C4745C6B3B0
	for <docs@lists.yoctoproject.org>; Tue, 19 Aug 2025 16:04:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5779760697
	for <docs@lists.yoctoproject.org>; Tue, 19 Aug 2025 16:04:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EE60F1C22C587;
	Tue, 19 Aug 2025 18:04:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1755619490; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=p6DPKTGGKAWX6LAODRFTO7qwo1Hk2mcklm9J90UBQgQ=;
	b=xYC6z+wKchkC11GrmK+JhlWDE+30+BdnL1t/4DvJQd+IDrsS5knbWBq5KXoRlu0cIlFBEv
	GmCMk3HL1B+hd+frR5xPp/Djq1HAzcl0tuzfg7+6zkFW0jkT/xzUVYxmOGkU04cRf73MLp
	t/RtRMHmVDQw1povTQKsSDV02ucJSl9h9HgazJtW3LgdglEpSoJvvfUOz35FYjajQrTNDP
	t++mrwoHTKKBltswaKzKQxDKW+jax6FB1+9A/EVjO/wHkplAiju0W/aJQVplBodQjJsPvn
	2eIciIUBvpEcvnVqzzarjOAzfP/wXJ6MQcNCV06GBZ76GLFeZTZ1reDGFB4dUw==
From: joaomarcos.costa@bootlin.com
To: docs@lists.yoctoproject.org
Cc: thomas.petazzoni@bootlin.com,
	Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Subject: [docs][PATCH] ref-manual/variables.rst: expand IMAGE_OVERHEAD_FACTOR glossary entry
Date: Tue, 19 Aug 2025 18:04:31 +0200
Message-ID: <20250819160431.382820-1-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 19 Aug 2025 16:04:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7455

From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>

There's a (second) overhead factor applied in images generated with Wic,
and this is already documented in the .wks reference. However, the
IMAGE_OVERHEAD_FACTOR entry does not mention it, and by looking at the
partition sizes (e.g. with parted) one may find it confusing that they
don't match with the expected rootfs size (e.g. in a scenario where the
extra space is "0" and IMAGE_OVERHEAD_FACTOR=3D"1.0").

This second overhead is already documented, though:
https://docs.yoctoproject.org/ref-manual/kickstart.html#command-part-or-p=
artition

Mention the '--overhead-factor' option in the glossary entry and add a
reference to the wks documentation.

Signed-off-by: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
---
 documentation/ref-manual/variables.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-m=
anual/variables.rst
index d559899c6..c18bc7ba4 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -4166,6 +4166,11 @@ system and gives an overview of their function and=
 contents.
       added to the image by using the :term:`IMAGE_ROOTFS_EXTRA_SPACE`
       variable.
=20
+      When using Wic tool, beware that a second overhead factor is also =
applied.
+      This overhead's value is defined by the ``--overhead-factor`` opti=
on, and
+      not by :term:`IMAGE_OVERHEAD_FACTOR`. See the
+      ":doc:`/ref-manual/kickstart`" chapter for details.
+
    :term:`IMAGE_PKGTYPE`
       Defines the package type (i.e. DEB, RPM or IPK) used by the
       OpenEmbedded build system. The variable is defined appropriately b=
y
--=20
2.47.0


