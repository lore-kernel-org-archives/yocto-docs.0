Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F757C54E4A
	for <webhook@archiver.kernel.org>; Tue, 27 Feb 2024 11:00:10 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.9828.1709031608864817603
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Feb 2024 03:00:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ep0+lwFm;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: luca.ceresoli@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1B7D340020;
	Tue, 27 Feb 2024 11:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709031607;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wD2kefB0XhuVuaC/rVryiChctQOZAFNt42xh3SOdAcI=;
	b=ep0+lwFmmtp53VxRlCi/GD95kYOnl6PjpJ2NZm1G8/N2ceTYtDYnU6oAR6m6FS34WuYZ8C
	jkoO59VfoAEdghSgkKXeYN1nRvGdtIFQZWsK2EyPejMpF96tkugaFQ/PwOIj6x7Pr2+GqX
	YHzeRjwiqZsztfQMaQaIIsC2BtgtGG5XrrysPtMHJHnPqz3nql4ZiXILzBqqHLqP5ADdzg
	QSbMS9SNEAHQLfYunFmkYn6+4b12+QBGb23JdNvebpU1TVC3nkeB/luvIfZ3Ytsaq8y/4b
	SQ3zCmlnDt5L2BT9X7kJ6UsomcVJR9HNnJ+/P19DTKMY4o+gulsgYQSbPWAEjQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 27 Feb 2024 11:59:52 +0100
Subject: [PATCH v2 1/2] ref-manual: tasks: do_cleanall: recommend using '-f
 fetch' instead
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240227-clean-tasks-notes-v2-1-35fb627e9ca0@bootlin.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4877

do_cleanall can produce failures when used in legitimate cases, wuch as
with recipe variants (foo and foo-native) or a shared DL_DIR. This is why
it is forbidden when writing tests that will run on the autobuilders
(https://docs.yoctoproject.org/test-manual/intro.html?highlight=cleanall#considerations-when-writing-tests).

Reword the documentation to clearly discourage, provide a safe alternative
(bitbake -f fecth), and the rationale with an example.

Reported-by: Sam Liddicott
Link: https://bootlin.com/blog/yocto-sharing-the-sstate-cache-and-download-directories/#comment-2650335
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 documentation/ref-manual/tasks.rst | 25 ++++++++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/documentation/ref-manual/tasks.rst b/documentation/ref-manual/tasks.rst
index 0db960b22f80..ebaa03dc7613 100644
--- a/documentation/ref-manual/tasks.rst
+++ b/documentation/ref-manual/tasks.rst
@@ -470,9 +470,28 @@ You can run this task using BitBake as follows::
 
    $ bitbake -c cleanall recipe
 
-Typically, you would not normally use the :ref:`ref-tasks-cleanall` task. Do so only
-if you want to start fresh with the :ref:`ref-tasks-fetch`
-task.
+You should never use the :ref:`ref-tasks-cleanall` task in a normal
+scenario. If you want to start fresh with the :ref:`ref-tasks-fetch` task,
+use instead::
+
+  $ bitbake -f fetch recipe
+
+.. note::
+
+   The reason to prefer ``bitbake -f fetch`` is that the
+   :ref:`ref-tasks-cleanall` task would break in some cases, such as::
+
+      $ bitbake -c fetch    recipe
+      $ bitbake -c cleanall recipe-native
+      $ bitbake -c unpack   recipe
+
+   because after step 1 there is a stamp file for the
+   :ref:`ref-tasks-fetch` task of ``recipe``, and it won't be removed at
+   step 2 because step 2 uses a different work dirctory. So the unpack task
+   at step 3 will try to extract the downloaded archive and fail as it has
+   been deleted in step 2.
+
+   This can be even more tricky if using a shared download directory.
 
 .. _ref-tasks-cleansstate:
 

-- 
2.34.1


