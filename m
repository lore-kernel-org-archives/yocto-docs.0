Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 297E0C433EF
	for <webhook@archiver.kernel.org>; Mon,  6 Jun 2022 16:00:05 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web10.25.1654531193355395932
 for <docs@lists.yoctoproject.org>;
 Mon, 06 Jun 2022 08:59:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=iQFq3Sdj;
 spf=pass (domain: bootlin.com, ip: 217.70.178.230,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 2ED8C240007;
	Mon,  6 Jun 2022 15:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1654531191;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=8nu3Qa3I+yI0T3NxuPAFV8pmghq9zoaEC4qYnh8/x/w=;
	b=iQFq3SdjpK8kl/XH2LxJPxRrZF3QePLkbWgkj1sIS4MdbirB7N4HiVKm1A69YMb6M3D5eF
	Kud4IwEHHRvirYIBDXL3BFAqJvBs3cmDUj4JiVv/c7kYZN+xkH7BzBB9HC2FTsWEpjKjsM
	TFocoWW+ZVVeB608VnSvaxyEsSzDaJPD+veg7Ex0klW8LSjsfku8HhkI9K0zUMQcnW9oFt
	cIlnM6SGAjDZSXtZLrpyaJLJt5072BUE09dJOoencAowegC6TD+A6+0lVKi05ZbYrJranp
	wAe1dcuVhLiTAl/UJZLJyFWtLOV/LoA1mfC3PFHjsOmYUzwtxuz+9nJTOXvE3A==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] dev-manual: mention the new CVE patch metrics page
Date: Mon,  6 Jun 2022 17:59:43 +0200
Message-Id: <20220606155943.52427-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 06 Jun 2022 16:00:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2963

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/dev-manual/common-tasks.rst | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index ca6d594386..d7f0b263e7 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -11507,8 +11507,15 @@ known security vulnerabilities, as tracked by the public
 `Common Vulnerabilities and Exposures (CVE) <https://en.wikipedia.org/wiki/Common_Vulnerabilities_and_Exposures>`__
 database.
 
-To know which packages are vulnerable to known security vulnerabilities,
-add the following setting to your configuration::
+The Yocto Project maintains a `list of known vulnerabilities
+<https://autobuilder.yocto.io/pub/non-release/patchmetrics/>`__
+for packages in Poky and OE-Core, tracking the evolution of the number of
+unpatched CVEs and the status of patches. Such information is available for
+the current development version and for each supported release.
+
+To know which packages are vulnerable to known security vulnerabilities
+in the specific image you are building, add the following setting to your
+configuration::
 
    INHERIT += "cve-check"
 
-- 
2.25.1


