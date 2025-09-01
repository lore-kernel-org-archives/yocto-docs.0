Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 535EECA0FFF
	for <webhook@archiver.kernel.org>; Mon,  1 Sep 2025 16:08:21 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.web11.55796.1756742893541291353
 for <docs@lists.yoctoproject.org>;
 Mon, 01 Sep 2025 09:08:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=s1IDnIvY;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 9F2B71A09A0
	for <docs@lists.yoctoproject.org>; Mon,  1 Sep 2025 16:08:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 736AA60699;
	Mon,  1 Sep 2025 16:08:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8AEBC1C22DCBC;
	Mon,  1 Sep 2025 18:08:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1756742891; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=/0cSPT8n3MK9HCAiacs1lraNtbTZgkzI12TaYHpmvIw=;
	b=s1IDnIvYbgCqz51OL8kQf/l5GtAMg14rWx0MAkHr4F4BQMXeikMmUFuXEdEh1LxSry9QZC
	EMRCwyogTZvD7ovRkdXkalbZ/aHuJdePfu244/FFnAWwPA/fEkYj39n5LHeSUFBkO9k9qH
	SrKBeMYCXHQI+E7fgeErDQUgzkD4WyRRUhQgtOWl4+AGFIA99OrN8p4zmmv7JJXyHl2QcW
	YvlqQ2LV4D0zj8XxwuEVqxdzyjkCy2bD+2B9IzMDqafIn1C5WS4cRJUFjdkNFVWrkX8RWs
	0vo9k/j+plcyU69sLPGbyUedeizuJWMT3yA7GOHJst1LZFQGfq+6DJLEVDoFtQ==
From: joaomarcos.costa@bootlin.com
To: docs@lists.yoctoproject.org
Cc: thomas.petazzoni@bootlin.com,
	quentin.schulz@cherry.de,
	Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Subject: [docs][PATCH v3] ref-manual/variables.rst: expand IMAGE_OVERHEAD_FACTOR glossary entry
Date: Mon,  1 Sep 2025 18:07:59 +0200
Message-ID: <20250901160759.556662-1-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 01 Sep 2025 16:08:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7478

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
 documentation/ref-manual/variables.rst | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-m=
anual/variables.rst
index d559899c6..18ead7d04 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -4166,6 +4166,12 @@ system and gives an overview of their function and=
 contents.
       added to the image by using the :term:`IMAGE_ROOTFS_EXTRA_SPACE`
       variable.
=20
+      When using Wic tool, beware that a second overhead factor is also =
applied.
+      This overhead value is defined by the ``--overhead-factor`` option=
, which
+      defaults to "1.3" when omitted. See the
+      :ref:`ref-manual/kickstart:command: part or partition` chapter in
+      :doc:`/ref-manual/kickstart` for details.
+
    :term:`IMAGE_PKGTYPE`
       Defines the package type (i.e. DEB, RPM or IPK) used by the
       OpenEmbedded build system. The variable is defined appropriately b=
y
--=20
2.47.0


