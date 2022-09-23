Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62B8FC07E9D
	for <webhook@archiver.kernel.org>; Fri, 23 Sep 2022 17:53:59 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web09.568.1663955634278420073
 for <docs@lists.yoctoproject.org>;
 Fri, 23 Sep 2022 10:53:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=K4FRVTX8;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id ADFE660005;
	Fri, 23 Sep 2022 17:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1663955633;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OzYAKs1fazu0VEZ6Z+srTbnoGGlA2g87pMq3SlOVJQA=;
	b=K4FRVTX8dOeNb4x9E4p3CfyYclxFU/aFOwNo4uG0ZQI/QCaNHzp3CpHUq0JkRAQ10CHEPQ
	m76ChzivjVFR2UotbXmHBfoTZd2eJSovM4U/8U3zIxVxxM5yPBgIN/qHXg3NnS2jUSwKc0
	oB3SxY2f3j3OOp3vaJvpKPj6vcU4NDJJG18Jj0uDQb5av7WdOm41pFkLeGB6U7IYeMA+SS
	7C4FIP0oXAkQFkBFhnZEhTKhFR7lW1ESMXIRw6s1AWB2VbDDUKniWcHiudL6TaBxC866VS
	FSxruksKo9hJeA8y9h1MJONvBdin7LKfPbwtuzvqJaHKlDSmvwX5bbSxHWRZ7g==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 26/30] manuals: add reference to the "do_kernel_configcheck"
 task
Date: Fri, 23 Sep 2022 19:52:15 +0200
Message-Id: <20220923175219.6652-27-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220923175219.6652-1-michael.opdenacker@bootlin.com>
References: <20220923175219.6652-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 23 Sep 2022 17:53:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3241

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/kernel-dev/common.rst | 10 +++++-----
 documentation/ref-manual/tasks.rst  |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/documentation/kernel-dev/common.rst b/documentation/kernel-dev/common.rst
index fb8d7cd029..f370350264 100644
--- a/documentation/kernel-dev/common.rst
+++ b/documentation/kernel-dev/common.rst
@@ -1316,7 +1316,7 @@ In order to run this task, you must have an existing ``.config`` file.
 See the ":ref:`kernel-dev/common:using \`\`menuconfig\`\``" section for
 information on how to create a configuration file.
 
-Following is sample output from the ``do_kernel_configcheck`` task:
+Following is sample output from the :ref:`ref-tasks-kernel_configcheck` task:
 
 .. code-block:: none
 
@@ -1396,7 +1396,7 @@ possible by reading the output of the kernel configuration fragment
 audit, noting any issues, making changes to correct the issues, and then
 repeating.
 
-As part of the kernel build process, the ``do_kernel_configcheck`` task
+As part of the kernel build process, the :ref:`ref-tasks-kernel_configcheck` task
 runs. This task validates the kernel configuration by checking the final
 ``.config`` file against the input files. During the check, the task
 produces warning messages for the following issues:
@@ -1430,13 +1430,13 @@ To streamline the configuration, do the following:
    successfully. Use this configuration file as your baseline.
 
 2. *Run Configure and Check Tasks:* Separately run the
-   ``do_kernel_configme`` and ``do_kernel_configcheck`` tasks::
+   ``do_kernel_configme`` and :ref:`ref-tasks-kernel_configcheck` tasks::
 
       $ bitbake linux-yocto -c kernel_configme -f
       $ bitbake linux-yocto -c kernel_configcheck -f
 
 3. *Process the Results:* Take the resulting list of files from the
-   ``do_kernel_configcheck`` task warnings and do the following:
+   :ref:`ref-tasks-kernel_configcheck` task warnings and do the following:
 
    -  Drop values that are redefined in the fragment but do not change
       the final ``.config`` file.
@@ -1450,7 +1450,7 @@ To streamline the configuration, do the following:
 
 4. *Re-Run Configure and Check Tasks:* After you have worked through the
    output of the kernel configuration audit, you can re-run the
-   ``do_kernel_configme`` and ``do_kernel_configcheck`` tasks to see the
+   ``do_kernel_configme`` and :ref:`ref-tasks-kernel_configcheck` tasks to see the
    results of your changes. If you have more issues, you can deal with
    them as described in the previous step.
 
diff --git a/documentation/ref-manual/tasks.rst b/documentation/ref-manual/tasks.rst
index 673068a3e7..faffe94eb1 100644
--- a/documentation/ref-manual/tasks.rst
+++ b/documentation/ref-manual/tasks.rst
@@ -668,7 +668,7 @@ kernel with the correct branches checked out.
 
 Validates the configuration produced by the
 :ref:`ref-tasks-kernel_menuconfig` task. The
-``do_kernel_configcheck`` task produces warnings when a requested
+:ref:`ref-tasks-kernel_configcheck` task produces warnings when a requested
 configuration does not appear in the final ``.config`` file or when you
 override a policy configuration in a hardware configuration fragment.
 You can run this task explicitly and view the output by using the
-- 
2.34.1


