Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C66B3C54E71
	for <webhook@archiver.kernel.org>; Thu, 14 Mar 2024 09:14:14 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.8343.1710407651042163130
 for <docs@lists.yoctoproject.org>;
 Thu, 14 Mar 2024 02:14:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=JOxPhB2k;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8CB3E24000F;
	Thu, 14 Mar 2024 09:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1710407649;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LDHxbF1Q/OFOiVwmE2AZPvQfkW4suGGvPrhUvyoPcJI=;
	b=JOxPhB2k3DPwI6gudmQWuiSsDGOLCK+12VTAPSkSyZCT0Wn2sIZGsu3hTa1gmh2bBj/yp2
	5kdkjmjG4gc8Rl5IU2h/+INsN9puliSCPEvGt8tXp00JYgj/KbGFDR/pzsQ1yu+8oWSbG0
	fnk2cT6gI8P4WK8o246TiwJcua1RUxaecQoPyzB1K8/OXqG/PF0zMAMrCnIykYtAp/4kmr
	HjPV7vnmxGkT/cZQkURE0S9pMvNgPh6zoiOCjHgDRIuZ44q7tZhbS+0MDZP+GGhcrf2rwY
	XSBh1pVdBfWPQJFo8xgRy6OH1TGxFmRsTa9Heea1cbYZ3ObXvmRTQrSuIF5VZg==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Quentin Schulz <quentin.schulz@theobroma-systems.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [kirkstone][PATCH 2/8] ref-manual: tasks: do_cleansstate: recommend using '-f' instead for a shared sstate
Date: Thu, 14 Mar 2024 10:13:52 +0100
Message-Id: <20240314091358.84025-3-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240314091358.84025-1-michael.opdenacker@bootlin.com>
References: <20240314091358.84025-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 14 Mar 2024 09:14:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4960

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

From: Luca Ceresoli <luca.ceresoli@bootlin.com>

do_cleansstat can produce build errors when using a shared sstate cache.

Add a note to clearly discourage, provide a safe alternative (bitbake -f),
and the rationale.

Suggested-by: Quentin Schulz  <quentin.schulz@theobroma-systems.com>
Link: https://lore.kernel.org/yocto-docs/20240219155513.76738-1-luca.ceresoli@bootlin.com/T/#m5529687ecb0f9ec2dacddcb6ff58e2df73af9cde
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
---
 documentation/ref-manual/tasks.rst | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/documentation/ref-manual/tasks.rst b/documentation/ref-manual/tasks.rst
index a3258fda55..0f1f95b9ff 100644
--- a/documentation/ref-manual/tasks.rst
+++ b/documentation/ref-manual/tasks.rst
@@ -527,7 +527,19 @@ scratch is guaranteed.
 
 .. note::
 
-   The ``do_cleansstate`` task cannot remove sstate from a remote sstate
+   Using :ref:`ref-tasks-cleansstate` with a shared :term:`SSTATE_DIR` is
+   not recommended because it could trigger an error during the build of a
+   separate BitBake instance. This is because the builds check sstate "up
+   front" but download the files later, so it if is deleted in the
+   meantime, it will cause an error but not a total failure as it will
+   rebuild it.
+
+   The reliable and preferred way to force a new build is to use ``bitbake
+   -f`` instead.
+
+.. note::
+
+   The :ref:`ref-tasks-cleansstate` task cannot remove sstate from a remote sstate
    mirror. If you need to build a target from scratch using remote mirrors, use
    the "-f" option as follows::
 
-- 
2.34.1


