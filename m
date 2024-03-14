Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42C88C54E73
	for <webhook@archiver.kernel.org>; Thu, 14 Mar 2024 09:15:25 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.8389.1710407718266422478
 for <docs@lists.yoctoproject.org>;
 Thu, 14 Mar 2024 02:15:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=eBNMEMPT;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 43F8B6000A;
	Thu, 14 Mar 2024 09:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1710407716;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Xxd2lJ4i+QEbnxmtmrBZeioxSA7cq++aBm3/SsfLZUw=;
	b=eBNMEMPTQL4YJ08GKfNc5XkTgzw5kw4TaMEbLgDIV01xTPTqavg7eVMcmjkwxnZA8M4zt5
	L37UbfiYCho2AfkweTiftQpP/LmTHExmRNdfmI9iKv/G48LkaNquUzzTvLbu5uALPGywpp
	TSiawwimJJ8+1rabhgIbByqaEIETa0Ik8ClUI2xFXA9RJ8j22f3eASZbcVN5NMQdY15HQX
	hNjF28dpZ5KI9QOAIyD+2ty8vGOj+KYxsMSk0xBfPKQN0N0s7AX0JKr4xlBP2hD9g56N9U
	dkpAdaNJ4Y1doF2/gWVunBLwEB92Ftmfn/97uLZn3xKV6zG4TGeQucpyMyAs5A==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Quentin Schulz <quentin.schulz@theobroma-systems.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [nanbield][PATCH 2/7] ref-manual: tasks: do_cleansstate: recommend using '-f' instead for a shared sstate
Date: Thu, 14 Mar 2024 10:15:03 +0100
Message-Id: <20240314091508.84166-3-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240314091508.84166-1-michael.opdenacker@bootlin.com>
References: <20240314091508.84166-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 14 Mar 2024 09:15:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4970

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
 documentation/ref-manual/tasks.rst | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/documentation/ref-manual/tasks.rst b/documentation/ref-manual/tasks.rst
index 16b48ca0bc..c28cd7a94a 100644
--- a/documentation/ref-manual/tasks.rst
+++ b/documentation/ref-manual/tasks.rst
@@ -514,6 +514,18 @@ When you run the :ref:`ref-tasks-cleansstate` task, the OpenEmbedded build syste
 no longer uses any sstate. Consequently, building the recipe from
 scratch is guaranteed.
 
+.. note::
+
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
 .. note::
 
    The :ref:`ref-tasks-cleansstate` task cannot remove sstate from a remote sstate
-- 
2.34.1


