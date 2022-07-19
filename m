Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D10F9C433EF
	for <webhook@archiver.kernel.org>; Tue, 19 Jul 2022 18:44:40 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web09.44353.1658256272829996530
 for <docs@lists.yoctoproject.org>;
 Tue, 19 Jul 2022 11:44:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=gKjx+Kzr;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id BB6C260004;
	Tue, 19 Jul 2022 18:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1658256271;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=G5k3n/gq3+pfNj7UKOiH3PqS9RItEjQ/266jZB/j3ks=;
	b=gKjx+KzrN6NKVPA2C2mTUlt+jMPfiCiQKkx4XabsbhPJ2hNb4lEDn5n5NAA3JgOjjgVFcG
	0FmQVwhRm7RkisRbBPqgexr7wdFOXIhuxIxbeK/ANNihcwGUQdlzu4oZbReuDYWUsvG0D/
	cXutzavg9o7rL8S95wGyI22v2CXZYcpO48g4J1oFBKZn+gHgv807sWvIm6hYiONGGhzFt3
	HnC85nNkR1nVPE9GVYbnEG6enuhC6dYmM3UzzmMdjMTzySLf3QqowcpR1ipQLjAVzEQ3eg
	Y17ENcgr3bJvpWo6MRQtb742lExLeb9+aG7bOc8vRg0Cm8mG9PBdNs7I0kMdJQ==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Quentin Schulz <foss@0leil.net>
Subject: [PATCH] kirkstone: ref-manual: variables: remove sphinx directive
 from literal block
Date: Tue, 19 Jul 2022 20:44:28 +0200
Message-Id: <20220719184428.512441-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 19 Jul 2022 18:44:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3072

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Literal blocks make sphinx take their text verbatim. This means that
directives cannot be used in literal blocks. This means :term:`S` was
printed as-is, without actually creating a link to the S variable
definition as would be expected outside of literal blocks.

Initially contributed to the master branch by Quentin Schulz.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Reported-by: Quentin Schulz <foss@0leil.net>
---
 documentation/ref-manual/variables.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index f8808cc052..47462233c9 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -7609,7 +7609,7 @@ system and gives an overview of their function and contents.
       :ref:`systemd-boot <ref-classes-systemd-boot>` class sets the
       :term:`SYSTEMD_BOOT_CFG` as follows::
 
-         SYSTEMD_BOOT_CFG ?= "${:term:`S`}/loader.conf"
+         SYSTEMD_BOOT_CFG ?= "${S}/loader.conf"
 
       For information on Systemd-boot, see the `Systemd-boot
       documentation <https://www.freedesktop.org/wiki/Software/systemd/systemd-boot/>`__.
-- 
2.34.1


