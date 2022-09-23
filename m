Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FA99C04A95
	for <webhook@archiver.kernel.org>; Fri, 23 Sep 2022 17:53:59 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web09.569.1663955635945768289
 for <docs@lists.yoctoproject.org>;
 Fri, 23 Sep 2022 10:53:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=RVer2O+2;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 5319220004;
	Fri, 23 Sep 2022 17:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1663955634;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7jlZdpUt4z72CI/opMulp5rsJKLNdLgXaRF55Hv7o+k=;
	b=RVer2O+2LZfKB3eKuVX5McZAhdbtxrxfJI1MJdWDjp+apTLmn25RCptbRJO2qhtVgQ1sJN
	qxexwMZRk8k8nWDJqDjfZILONZ2I7oBO++j7+iVrb/Dy0+A/uDpDYOgu4TTL+TQzAImL7y
	smdKHhdLkJOKGfl4rTraZMswJWkFDePIh83H+K0L/Hc1JH9J9PmaRUE32LNbU4oN+gQj5x
	/VkiTP/EdtYbd6GJdKWNGmbiu0Wj5NVjV3J0Qd1L4/OZ3nKrgGAA+Ej672QC2wduKeJdpF
	Uygx245NxEDIzbnCQdk/ku9vHtkypydujIlRwAZPyWed0j/5c5cmoPuD8PqZZQ==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Quentin Schulz <foss@0leil.net>
Subject: [PATCH 27/30] manuals: add references to the "do_kernel_configme"
 task
Date: Fri, 23 Sep 2022 19:52:16 +0200
Message-Id: <20220923175219.6652-28-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220923175219.6652-1-michael.opdenacker@bootlin.com>
References: <20220923175219.6652-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 23 Sep 2022 17:53:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3242

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

[YOCTO #14508]
Reported-by: Quentin Schulz <foss@0leil.net>
Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/kernel-dev/common.rst | 4 ++--
 documentation/ref-manual/tasks.rst  | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/documentation/kernel-dev/common.rst b/documentation/kernel-dev/common.rst
index f370350264..0a1819ceae 100644
--- a/documentation/kernel-dev/common.rst
+++ b/documentation/kernel-dev/common.rst
@@ -1430,7 +1430,7 @@ To streamline the configuration, do the following:
    successfully. Use this configuration file as your baseline.
 
 2. *Run Configure and Check Tasks:* Separately run the
-   ``do_kernel_configme`` and :ref:`ref-tasks-kernel_configcheck` tasks::
+   :ref:`ref-tasks-kernel_configme` and :ref:`ref-tasks-kernel_configcheck` tasks::
 
       $ bitbake linux-yocto -c kernel_configme -f
       $ bitbake linux-yocto -c kernel_configcheck -f
@@ -1450,7 +1450,7 @@ To streamline the configuration, do the following:
 
 4. *Re-Run Configure and Check Tasks:* After you have worked through the
    output of the kernel configuration audit, you can re-run the
-   ``do_kernel_configme`` and :ref:`ref-tasks-kernel_configcheck` tasks to see the
+   :ref:`ref-tasks-kernel_configme` and :ref:`ref-tasks-kernel_configcheck` tasks to see the
    results of your changes. If you have more issues, you can deal with
    them as described in the previous step.
 
diff --git a/documentation/ref-manual/tasks.rst b/documentation/ref-manual/tasks.rst
index faffe94eb1..29a135beb0 100644
--- a/documentation/ref-manual/tasks.rst
+++ b/documentation/ref-manual/tasks.rst
@@ -686,7 +686,7 @@ section in the Yocto Project Linux Kernel Development Manual.
 ----------------------
 
 After the kernel is patched by the :ref:`ref-tasks-patch`
-task, the ``do_kernel_configme`` task assembles and merges all the
+task, the :ref:`ref-tasks-kernel_configme` task assembles and merges all the
 kernel config fragments into a merged configuration that can then be
 passed to the kernel configuration phase proper. This is also the time
 during which user-specified defconfigs are applied if present, and where
-- 
2.34.1


