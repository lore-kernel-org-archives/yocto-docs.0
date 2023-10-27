Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24E5AC25B48
	for <webhook@archiver.kernel.org>; Fri, 27 Oct 2023 17:48:18 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.13474.1698428888302462933
 for <docs@lists.yoctoproject.org>;
 Fri, 27 Oct 2023 10:48:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=GjQMqRCu;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 49356FF80D;
	Fri, 27 Oct 2023 17:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1698428886;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Sxxmlht/Oy19M1FeJ/oAAtxbo634LWaKfDfAWBsro88=;
	b=GjQMqRCuWLGmjdDmJgRABv+6TefM266cjO7gHnMCQX3GvSY0rbQ+5OSCKcYHyoFpeG1bRJ
	D/iC0zpMCAh6F9F6aDALL9iZEi8IlFqrsDgRFL+R6n4sYUEKFEvxFSqdzUr+Gf2KPHwULP
	o1LUMoidVLImeE3O2NKOwnWtNHV9ql2Rh3lVG+PLC8fHrVl9vG3hQWc4P4tvPUNcMK45Od
	L/+m6KeUMwLGy7S57KnugA+FW0yjxqzSM7lpnM87804z3xvmqRBzluRO1Zq7aIuulE7IRp
	co0pRVkXCeBZ1bf4PXq1ZgOAFIZmvCevxom4jWmp744WzZf+PlAZ8MWXaMjCeg==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] manuals: improve description of CVE_STATUS and CVE_STATUS_GROUPS
Date: Fri, 27 Oct 2023 19:48:03 +0200
Message-Id: <20231027174803.1641658-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 27 Oct 2023 17:48:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4521

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

- Mention CVE_STATUS_GROUPS in the development manual
  (otherwise only present in the reference manual, but with
  no reference to it)

- In the reference manual description of CVE_STATUS,
  link back to the development manual, to provide context.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/dev-manual/vulnerabilities.rst | 3 +++
 documentation/ref-manual/variables.rst       | 3 ++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/documentation/dev-manual/vulnerabilities.rst b/documentation/dev-manual/vulnerabilities.rst
index 71111bb3e2..c492b62ffd 100644
--- a/documentation/dev-manual/vulnerabilities.rst
+++ b/documentation/dev-manual/vulnerabilities.rst
@@ -164,6 +164,9 @@ the :term:`CVE_STATUS` variable flag with appropriate reason which is mapped to
 As mentioned previously, if data in the CVE database is wrong, it is recommend to fix those
 issues in the CVE database directly.
 
+Note that if there are many CVEs with the same status and reason, those can be
+shared by using the :term:`CVE_STATUS_GROUPS` variable.
+
 Recipes can be completely skipped by CVE check by including the recipe name in
 the :term:`CVE_CHECK_SKIP_RECIPE` variable.
 
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index ef4d6a0534..2d875c984d 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -1724,7 +1724,8 @@ system and gives an overview of their function and contents.
 
       It has the format "reason: description" and the description is optional.
       The Reason is mapped to the final CVE state by mapping via
-      :term:`CVE_CHECK_STATUSMAP`
+      :term:`CVE_CHECK_STATUSMAP`. See :ref:`dev-manual/vulnerabilities:fixing vulnerabilities in recipes`
+      for details.
 
    :term:`CVE_STATUS_GROUPS`
       If there are many CVEs with the same status and reason, they can by simplified by using this
-- 
2.34.1


