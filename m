Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E550BC77B61
	for <webhook@archiver.kernel.org>; Fri, 28 Apr 2023 16:01:49 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.23889.1682697703921824107
 for <docs@lists.yoctoproject.org>;
 Fri, 28 Apr 2023 09:01:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=NJlH0flg;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 81F6740006;
	Fri, 28 Apr 2023 16:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1682697701;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=zXwjyZO5xT3n7+8j1XQqMOrC1ZpURGDt/7wqB921bzM=;
	b=NJlH0flgoQPrGp+a5mnkpEH4l8VAJiu75cWSid6XtNL9tLWr7ETIeN2lLn5j96i+HsPJep
	EsvfsCg9z9CzjipPrebkzdzBJu+1yTU1ZhdRtvH63WiCJS8HvcRnb5b5WIv5Ap40Xpkn+6
	kvtZKwaVVxu8l8uvG9r2sx6jfzqmxAMwiiw/8aImxLAtnrqs4sHjm69BVBPLsUskRCctsT
	LGNAvXM0m4Ar0exh8/HeK9sQMRdHdAjKTWf972eOR5rXKyU2dFsPDUZrHSu61asHXKHCxl
	axYR3IUxXmuSv+6DZUiBqxazgaaUtnWjkHfa+qvdNA6EE6yyIbedgGFFJoVpNg==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] dev-manual: init-manager.rst: add summary
Date: Fri, 28 Apr 2023 18:01:39 +0200
Message-Id: <20230428160139.2320830-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 28 Apr 2023 16:01:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3882

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Comparing init managers by features

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/dev-manual/init-manager.rst | 49 +++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/documentation/dev-manual/init-manager.rst b/documentation/dev-manual/init-manager.rst
index fd8747b9b0..3fba26f2e7 100644
--- a/documentation/dev-manual/init-manager.rst
+++ b/documentation/dev-manual/init-manager.rst
@@ -111,3 +111,52 @@ configuration file::
 Doing so will prevent ``rsyslog`` / ``busybox-syslog`` from being pulled in by
 default, leaving only ``systemd-journald``.
 
+Summary
+-------
+
+The Yocto Project supports three different initialization managers, offering
+increasing levels of complexity and functionality:
+
+.. list-table::
+   :widths: 40 20 20 20
+   :header-rows: 1
+
+   * - 
+     - BusyBox init
+     - SysVinit
+     - systemd
+   * - Size
+     - Small
+     - Small
+     - Big [#footnote-systemd-size]_
+   * - Complexity
+     - Small
+     - Medium
+     - High
+   * - Support for boot profiles
+     - No
+     - Yes ("runlevels")
+     - Yes ("targets")
+   * - Services defined as
+     - Shell scripts
+     - Shell scripts
+     - Description files
+   * - Starting services in parallel
+     - No
+     - No
+     - Yes
+   * - Setting service resource limits
+     - No
+     - No
+     - Yes
+   * - Support service isolation
+     - No
+     - No
+     - Yes
+   * - Integrated logging
+     - No
+     - No
+     - Yes
+
+.. [#footnote-systemd-size] Using systemd increases the ``core-image-minimal``
+   image size by 160\% for ``qemux86-64`` on Mickledore, compared to SysVinit.
-- 
2.34.1


