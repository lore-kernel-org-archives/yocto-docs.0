Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4924C43458
	for <webhook@archiver.kernel.org>; Wed,  1 Jul 2026 19:03:01 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.52980.1782932579007598562
 for <docs@lists.yoctoproject.org>;
 Wed, 01 Jul 2026 12:02:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=pwpT3ZxW;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=JIVMQYIoOnDEVtMf7KNsRPg58Pp6FOmKEoWpqLzbbYk=; b=pwpT3ZxW/8wqSf0si0E/S2zRR/
	63r6WK0Bt8aVdQUNuQ5FWXwBT7Y+vozF2bLrdBBSrx9GyvS+EQiFrGJaDTCMqwtQ5oH0gmo/tjOVn
	YYNkm5tl0q6T10hRv3a4VUgUhRrNVOnofs6JnKkT/ZjS7ISE4Sv+uYqlQ+vWQiYy9/a/SlOTE2YIz
	0m93ktqxC1Mn1bVWM0U72pfmeG8XB1dgxlvoOWODcVPvMZHqwy8PhfP+z8CmJMdKqAj7dPFYYCuCb
	R0gVHVn25dIfuD2EIuUXLyCiR5ci4P14C/YaRLe26m/qhfrBB6Rfsu2t/rPw9M1mO3dfawLLhhKrj
	0tU3dvXw==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:40072 helo=sheena)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wf0D2-00000002Kpo-0GYx
	for docs@lists.yoctoproject.org;
	Wed, 01 Jul 2026 15:02:57 -0400
Date: Wed, 1 Jul 2026 15:02:36 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] ref-manual: remmove all traces of "kernel_menuconfig" task
Message-ID: <01354ed7-a6ee-1140-2d7b-bafcb58b6fe7@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel10.indieserve.net
X-AntiAbuse: Original Domain - lists.yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel10.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel10.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 01 Jul 2026 19:03:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9994


It's not clear why the non-existent "kernel_menuconfig" task was
documented in the reference manual, but it does not appear to have
ever existed so delete all references to it and replace with pointers
to rewritten "menuconfig" task.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/ref-manual/tasks.rst b/documentation/ref-manual/tasks.rst
index 7e1937157..e1db2d5ed 100644
--- a/documentation/ref-manual/tasks.rst
+++ b/documentation/ref-manual/tasks.rst
@@ -721,7 +721,7 @@ When invoked by the user, this task creates a file containing the
 differences between the original config as produced by
 :ref:`ref-tasks-kernel_configme` task and the
 changes made by the user with other methods (i.e. using
-(:ref:`ref-tasks-kernel_menuconfig`). Once the
+(:ref:`ref-tasks-menuconfig`). Once the
 file of differences is created, it can be used to create a config
 fragment that only contains the differences. You can invoke this task
 from the command line as follows::
@@ -749,7 +749,7 @@ kernel with the correct branches checked out.
 -------------------------

 Validates the configuration produced by the
-:ref:`ref-tasks-kernel_menuconfig` task. The
+:ref:`ref-tasks-menuconfig` task. The
 :ref:`ref-tasks-kernel_configcheck` task produces warnings when a requested
 configuration does not appear in the final ``.config`` file or when you
 override a policy configuration in a hardware configuration fragment.
@@ -774,26 +774,6 @@ passed to the kernel configuration phase proper. This is also the time
 during which user-specified defconfigs are applied if present, and where
 configuration modes such as ``--allnoconfig`` are applied.

-.. _ref-tasks-kernel_menuconfig:
-
-``do_kernel_menuconfig``
-------------------------
-
-Invoked by the user to manipulate the ``.config`` file used to build a
-linux-yocto recipe. This task starts the Linux kernel configuration
-tool, which you then use to modify the kernel configuration.
-
-.. note::
-
-   You can also invoke this tool from the command line as follows::
-
-           $ bitbake linux-yocto -c menuconfig
-
-
-See the ":ref:`kernel-dev/common:using ``menuconfig```"
-section in the Yocto Project Linux Kernel Development Manual for more
-information on this configuration tool.
-
 .. _ref-tasks-kernel_metadata:

 ``do_kernel_metadata``
@@ -812,10 +792,19 @@ which can then be applied by subsequent tasks such as
 ``do_menuconfig``
 -----------------

-Runs ``make menuconfig`` for the kernel. For information on
-``menuconfig``, see the
-":ref:`kernel-dev/common:using ``menuconfig```"
-section in the Yocto Project Linux Kernel Development Manual.
+Invoked by the user to manipulate the ``.config`` file used to build a
+linux-yocto recipe. This task starts the Linux kernel configuration
+tool, which you then use to modify the kernel configuration.
+
+You can invoke this tool from the command line as follows:
+
+.. code-block:: console
+
+   $ bitbake linux-yocto -c menuconfig
+
+See the ":ref:`kernel-dev/common:using ``menuconfig```"
+section in the Yocto Project Linux Kernel Development Manual for more
+information on this configuration tool.

 .. _ref-tasks-savedefconfig:

@@ -826,7 +815,7 @@ When invoked by the user, creates a defconfig file that can be used
 instead of the default defconfig. The saved defconfig contains the
 differences between the default defconfig and the changes made by the
 user using other methods (i.e. the
-:ref:`ref-tasks-kernel_menuconfig` task. You
+:ref:`ref-tasks-menuconfig` task. You
 can invoke the task using the following command::

    $ bitbake linux-yocto -c savedefconfig

