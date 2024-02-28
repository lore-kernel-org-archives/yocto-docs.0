Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04538C47DD9
	for <webhook@archiver.kernel.org>; Wed, 28 Feb 2024 11:25:34 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.10926.1709119524303461292
 for <docs@lists.yoctoproject.org>;
 Wed, 28 Feb 2024 03:25:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=itKXfJgm;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: luca.ceresoli@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8DB861BF212;
	Wed, 28 Feb 2024 11:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709119522;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=++gn/5GQpAxpJesijFk6niZFLUub3LLY/yNS84puGJA=;
	b=itKXfJgmqwXvAwflnT8sucsrf6yKvb8p9FkNz/YU/XnCoxqebDBdi7bk+Oq42n4fJn1usZ
	1epE6qv78aS2C3fgkJuU2UEuN93JaLusQJ9wFvEQ1GzjQZcc7/ydyQVIbP0kSnTE8kK4eS
	0tf2ke9y7tLq/DrOlxfS63ThmGsIC9nk0nBKRY3vlPRx3BTpd5g7P15hegpBWEXA407wBI
	JZgGNFN+PA9dyfqPCri/dvkafn+wOX2QXeruxxElCRMOXYOtDYCCgbr0Mp2n1wVJOsQ/4j
	uC/Kj8aM4NJrujKXZsbC3mpS4Q+IAUSGCVUVS5bmYTTY6Vqxn3WqgOuyaiNMjw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 28 Feb 2024 12:25:15 +0100
Subject: [PATCH v3 2/2] ref-manual: tasks: do_cleansstate: recommend using
 '-f' instead for a shared sstate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240228-clean-tasks-notes-v3-2-368af5e1aa0e@bootlin.com>
References: <20240228-clean-tasks-notes-v3-0-368af5e1aa0e@bootlin.com>
In-Reply-To: <20240228-clean-tasks-notes-v3-0-368af5e1aa0e@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>, 
 Richard Purdie <richard.purdie@linuxfoundation.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.12.4
X-GND-Sasl: luca.ceresoli@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 28 Feb 2024 11:25:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4914

do_cleansstat can produce build errors when using a shared sstate cache.

Add a note to clearly discourage, provide a safe alternative (bitbake -f),
and the rationale.

Proposed-by: Quentin Schulz  <quentin.schulz@theobroma-systems.com>
Link: https://lore.kernel.org/yocto-docs/20240219155513.76738-1-luca.ceresoli@bootlin.com/T/#m5529687ecb0f9ec2dacddcb6ff58e2df73af9cde
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 documentation/ref-manual/tasks.rst | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/documentation/ref-manual/tasks.rst b/documentation/ref-manual/tasks.rst
index 7a0915c6e57a..79469bc37221 100644
--- a/documentation/ref-manual/tasks.rst
+++ b/documentation/ref-manual/tasks.rst
@@ -514,6 +514,18 @@ When you run the :ref:`ref-tasks-cleansstate` task, the OpenEmbedded build syste
 no longer uses any sstate. Consequently, building the recipe from
 scratch is guaranteed.
 
+.. note::
+
+   Using :ref:`ref-tasks-cleansstate` with a shared :term:`SSTATE_DIR` is
+   not recommended because it could trigger an error during the build of a
+   separate bitbake instance. This is because the builds check sstate "up
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


