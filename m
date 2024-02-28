Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21C92C54E49
	for <webhook@archiver.kernel.org>; Wed, 28 Feb 2024 11:25:34 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.10925.1709119523902393925
 for <docs@lists.yoctoproject.org>;
 Wed, 28 Feb 2024 03:25:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=g46zQIhc;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: luca.ceresoli@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0CF1F1BF203;
	Wed, 28 Feb 2024 11:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709119522;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eUe9GDuqTMB8/fntSstdQ+MBDxPvtqDTNKZN2YQW7DM=;
	b=g46zQIhcL+3yisihsShB0a+sWvzxCWp8OGW7S4aFdsOHD7KbE5aaDUbTP+y/1HCsifVp1J
	zi0p+Zz8sbjSFyOJKm7fWXOnFiBpGqLWGa6YWCkZxMuA/GDpXGaW9CBRr4Jq39wW92F0mY
	rgA2Z/cV1uJiU8afvl+IYG7Eje7vUCCv3Ux7SwgEhAeMfnGmXgNuKB90iNPNlB81hjdCCL
	uGQLwx6MBnIxlm7KfKnYVWGpwSeTl+C1bNsqkxxNsVFiyZY4hb6LCUlHZH4obZdWRcyx9+
	bIGFPZDxpC15jhWvhUobRdvWWsbMu7Ipy39TIGMR1zK/vrxtxm280WzMpTDCkA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 28 Feb 2024 12:25:14 +0100
Subject: [PATCH v3 1/2] ref-manual: tasks: do_cleanall: recommend using
 '-f' instead
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240228-clean-tasks-notes-v3-1-368af5e1aa0e@bootlin.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4913

do_cleanall can produce failures when used in legitimate cases, such as
with recipe variants (foo and foo-native) or a shared DL_DIR. This is why
it is forbidden when writing tests that will run on the autobuilders
(https://docs.yoctoproject.org/test-manual/intro.html?highlight=cleanall#considerations-when-writing-tests).

Reword the documentation to clearly discourage, provide a safe alternative
(bitbake -f -c fetch), and the rationale with an example.

Reported-by: Sam Liddicott
Link: https://bootlin.com/blog/yocto-sharing-the-sstate-cache-and-download-directories/#comment-2650335
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 documentation/ref-manual/tasks.rst | 26 +++++++++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)

diff --git a/documentation/ref-manual/tasks.rst b/documentation/ref-manual/tasks.rst
index 0db960b22f80..7a0915c6e57a 100644
--- a/documentation/ref-manual/tasks.rst
+++ b/documentation/ref-manual/tasks.rst
@@ -470,9 +470,29 @@ You can run this task using BitBake as follows::
 
    $ bitbake -c cleanall recipe
 
-Typically, you would not normally use the :ref:`ref-tasks-cleanall` task. Do so only
-if you want to start fresh with the :ref:`ref-tasks-fetch`
-task.
+You should never use the :ref:`ref-tasks-cleanall` task in a normal
+scenario. If you want to start fresh with the :ref:`ref-tasks-fetch` task,
+use instead::
+
+  $ bitbake -f -c fetch recipe
+
+.. note::
+
+   The reason to prefer ``bitbake -f -c fetch`` is that the
+   :ref:`ref-tasks-cleanall` task would break in some cases, such as::
+
+      $ bitbake -c fetch    recipe
+      $ bitbake -c cleanall recipe-native
+      $ bitbake -c unpack   recipe
+
+   because after step 1 there is a stamp file for the
+   :ref:`ref-tasks-fetch` task of ``recipe``, and it won't be removed at
+   step 2 because step 2 uses a different work directory. So the unpack task
+   at step 3 will try to extract the downloaded archive and fail as it has
+   been deleted in step 2.
+
+   Note that this also applies to bitbake from concurrent processes when a
+   shared download directory (:term:`DL_DIR`) is setup.
 
 .. _ref-tasks-cleansstate:
 

-- 
2.34.1


