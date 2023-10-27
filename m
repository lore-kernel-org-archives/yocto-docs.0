Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FB7CC25B47
	for <webhook@archiver.kernel.org>; Fri, 27 Oct 2023 15:46:37 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.10261.1698421588619488000
 for <docs@lists.yoctoproject.org>;
 Fri, 27 Oct 2023 08:46:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=L2QjzxTh;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 87672FF80A;
	Fri, 27 Oct 2023 15:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1698421586;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=OcslTauNkJeV0GLiXhKmz/CLWV/QIRVuXpVA0Ouftnw=;
	b=L2QjzxThz4xaA1pNxXNvVeFODDEJVZ4vimV6tE4FKn7KXvOibU6+mR4MQ5UwGW8V7lBC4r
	hnOdiHuAhPCpfHri5eL+ZM9QTeau0kFgNPYxe1/3ai8cyo3OxS9nAQGq/tJBoVCsvww2vO
	8IcNQwN3h8/GRnqdVCGn25UU8qc40d+Lx9klADJPJygkoTrAEMS7zRSgDVoGRp9yNA8ALr
	tli9I08XpLKTtzdJcLcTsr90BDWjXtV0PRc/odM2lVece0JSkN/BF6APA8rWgxlu7WXnFt
	MDI4GACZDWME8GwaYDMRoT4TziY+wBktRtas2HKjlCLBaUKEFtUFvRYdiekBZQ==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Mark Hatle <mark.hatle@kernel.crashing.org>
Subject: [PATCH] migration-guides: mention runqemu change in serial port management
Date: Fri, 27 Oct 2023 17:46:14 +0200
Message-Id: <20231027154614.1630176-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 27 Oct 2023 15:46:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4517

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Reported-by: Mark Hatle <mark.hatle@kernel.crashing.org>
---
 .../migration-guides/migration-4.3.rst        | 20 +++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/documentation/migration-guides/migration-4.3.rst b/documentation/migration-guides/migration-4.3.rst
index c47d09a1ae..3fa131ef0c 100644
--- a/documentation/migration-guides/migration-4.3.rst
+++ b/documentation/migration-guides/migration-4.3.rst
@@ -108,11 +108,27 @@ The following classes have been removed in this release:
 
 .. _migration-4.3-misc-changes:
 
+QEMU changes
+~~~~~~~~~~~~
+
+-  The ``runqemu`` script no longer systematically adds two serial ports
+   (``--serial null`` and ``-serial mon:stdio``) to the QEMU emulated machine
+   if the user already adds such ports through the ``QB_OPT_APPEND`` setting.
+
+   If the user adds one port, only ``--serial null`` is added, and
+   ``-serial mon:stdio`` is no longer passed. If the user adds more than one
+   port, ``--serial null`` is no longer added either. This can break some
+   existing QEMU based configurations expecting such serial ports to be added
+   when ``runqemu`` is executed.
+
+   This change was made to avoid exceeding two serial ports, which interferes
+   with automated testing.
+
 QA check changes
 ~~~~~~~~~~~~~~~~
 
-- The fetcher in ``lib/bb/tests/fetch.py`` now uses the ``https`` protocol
-  instead of ``git``, whenever possible.
+-  The fetcher in ``lib/bb/tests/fetch.py`` now uses the ``https`` protocol
+   instead of ``git``, whenever possible.
 
 Miscellaneous changes
 ~~~~~~~~~~~~~~~~~~~~~
-- 
2.34.1


