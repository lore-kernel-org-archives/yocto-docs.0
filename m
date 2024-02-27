Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35C62C5478C
	for <webhook@archiver.kernel.org>; Tue, 27 Feb 2024 11:00:10 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.9829.1709031609499435883
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Feb 2024 03:00:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=TB9J05yd;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: luca.ceresoli@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B312B4001E;
	Tue, 27 Feb 2024 11:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709031608;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C/mxfYXNL8ykP1x7inzNz7Ty6TLiYhH3jCote2tmxoE=;
	b=TB9J05ydKdqMYeniqTp68PSQI4kBbSiSdefSR4PAxynsZprdohEt1Ew2BkO0vDs3uyoZ9q
	HuLc1VBHai4CqVQp4at08TehF23thy6dF476T1kxX/bbb4h+ALKs09hhIEpJTVcF9JiR/V
	yteCciwOrThnI5h2U0PykP6x9gFUCR83Zs2jFiSecpRMbbRJsRLOx8CYgazgJebemB6ULx
	Ti3CWGhYKo8dBCjdcQ8SUs7Q6l59zCm1JMuDFPrMjYDCGEJhFCdFJlGxXpEuJDZsosrR+a
	nloDXoIbKcA6QLg/nQZPfV/8AhJkDLn4rRpHCYv3cVtMDHviNkMlxvqgPgf3Kg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 27 Feb 2024 11:59:53 +0100
Subject: [PATCH v2 2/2] ref-manual: tasks: do_cleansstate: recommend using
 '-f' instead for a shared sstate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240227-clean-tasks-notes-v2-2-35fb627e9ca0@bootlin.com>
References: <20240227-clean-tasks-notes-v2-0-35fb627e9ca0@bootlin.com>
In-Reply-To: <20240227-clean-tasks-notes-v2-0-35fb627e9ca0@bootlin.com>
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
 <docs@lists.yoctoproject.org>; Tue, 27 Feb 2024 11:00:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4878

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
index ebaa03dc7613..9f130bb4e0c9 100644
--- a/documentation/ref-manual/tasks.rst
+++ b/documentation/ref-manual/tasks.rst
@@ -513,6 +513,18 @@ When you run the :ref:`ref-tasks-cleansstate` task, the OpenEmbedded build syste
 no longer uses any sstate. Consequently, building the recipe from
 scratch is guaranteed.
 
+.. note::
+
+   Using :ref:`ref-tasks-cleansstate` with a shared sstate directory is not
+   recommended because it could trigger an error during the build of a
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


