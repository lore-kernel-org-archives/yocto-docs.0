Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA9ABC43334
	for <webhook@archiver.kernel.org>; Thu,  7 Jul 2022 13:33:34 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web09.5592.1657200814147830297
 for <docs@lists.yoctoproject.org>;
 Thu, 07 Jul 2022 06:33:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.183.197,
 mailfrom: foss+yocto@0leil.net)
Received: (Authenticated sender: foss@0leil.net)
	by mail.gandi.net (Postfix) with ESMTPSA id C361E1C0010;
	Thu,  7 Jul 2022 13:33:30 +0000 (UTC)
From: Quentin Schulz <foss+yocto@0leil.net>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
	Quentin Schulz <foss+yocto@0leil.net>
Subject: [PATCH] docs: ref-manual: variables: remove sphinx directive from
 literal block
Date: Thu,  7 Jul 2022 15:33:17 +0200
Message-Id: <20220707133317.1202686-1-foss+yocto@0leil.net>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 07 Jul 2022 13:33:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3053

From: Quentin Schulz <quentin.schulz@theobroma-systems.com>

Literal blocks make sphinx take their text verbatim. This means that
directives cannot be used in literal blocks. This means :term:`S` was
printed as-is, without actually creating a link to the S variable
definition as would be expected outside of literal blocks.

Cc: Quentin Schulz <foss+yocto@0leil.net>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
---
 documentation/ref-manual/variables.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index c4b2119f2..dbb7a4628 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -7660,7 +7660,7 @@ system and gives an overview of their function and contents.
       :ref:`systemd-boot <ref-classes-systemd-boot>` class sets the
       :term:`SYSTEMD_BOOT_CFG` as follows::
 
-         SYSTEMD_BOOT_CFG ?= "${:term:`S`}/loader.conf"
+         SYSTEMD_BOOT_CFG ?= "${S}/loader.conf"
 
       For information on Systemd-boot, see the `Systemd-boot
       documentation <https://www.freedesktop.org/wiki/Software/systemd/systemd-boot/>`__.
-- 
2.36.1


