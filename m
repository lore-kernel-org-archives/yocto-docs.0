Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E225C43458
	for <webhook@archiver.kernel.org>; Fri, 10 Jul 2026 09:18:18 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8875.1783675089664085276
 for <docs@lists.yoctoproject.org>;
 Fri, 10 Jul 2026 02:18:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=Bth8Vhnj;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=GcSVToS3e/FFXyL0ov0IemZeboIiwr048I2olbOfNvM=; b=Bth8VhnjUIWw6FPthMgrLr4WJ7
	4cMMC6NnFyDBSQ/MtZ8fuKOvRG5UM6+LBGSla5yGyyuKtgKnfzCNTT+zmt91eUT+8K2MTt2M+Hl8a
	5steUsE1XVidcRX3xpw+sYfwUgsD4VKTlZCnQOhPocP1tT5nZvGUYTSQbUMmSHCOPLrz8pkA9mvKa
	ybkvte6EqMzv6VFAZws5t7NFNjZnvVrgq9W9HWyucgGK9MPRydPEuqQanz1PJT6FcilVa3YQOUzO6
	14DN5jNw9GVd3/85cdhzux+rTZBJytjOue9OUUBC2TYOeRe8+z1e4q6n1zqJy5ByybXhlGgkbU9Ip
	ti605Ttg==;
Received: from pool-174-114-114-5.cpe.net.cable.rogers.com ([174.114.114.5]:60610 helo=sheena)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wi7Mz-00000008WOc-3ztb
	for docs@lists.yoctoproject.org;
	Fri, 10 Jul 2026 05:18:07 -0400
Date: Fri, 10 Jul 2026 05:17:35 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [docs] [PATCH v2] ref-manual: add "KERNEL_IMAGE_STRIP_EXTRA_SECTIONS"
 to variables
Message-ID: <9cd7883a-e24c-8376-5954-cdfd8b18dbcb@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Fri, 10 Jul 2026 09:18:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10055


Add this variable to the variables glossary, and add links to it and
back to the do_strip() task for completeness.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/ref-manual/tasks.rst b/documentation/ref-manual/tasks.rst
index e1db2d5ed..f328edd9b 100644
--- a/documentation/ref-manual/tasks.rst
+++ b/documentation/ref-manual/tasks.rst
@@ -848,11 +848,19 @@ the kernel build produces a warning to that effect.
 ``do_strip``
 ------------

-If ``KERNEL_IMAGE_STRIP_EXTRA_SECTIONS`` is defined, this task strips
+If :term:`KERNEL_IMAGE_STRIP_EXTRA_SECTIONS` is defined, this task strips
 the sections named in that variable from ``vmlinux``. This stripping is
 typically used to remove nonessential sections such as ``.comment``
 sections from a size-sensitive configuration.

+Common sections to strip:
+
+-  ``.comment``: Holds compiler version strings and information
+
+-  ``.note.*``: Extra notes often left by the compiler
+
+-  ``.debug``: Debugging information
+
 .. _ref-tasks-validate_branches:

 ``do_validate_branches``
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index c92b195ff..cd5979a84 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -5623,6 +5623,13 @@ system and gives an overview of their function and contents.

       See :term:`KERNEL_ARTIFACT_NAME` for additional information.

+   :term:`KERNEL_IMAGE_STRIP_EXTRA_SECTIONS`
+      If this variable is set, it should contain the sections to be
+      stripped from the ``vmlinux`` image by the kernel-related
+      :ref:`ref-tasks-strip` task. As a simple example::
+
+         KERNEL_IMAGE_STRIP_EXTRA_SECTIONS = ".comment .note.* .debug"
+
    :term:`KERNEL_IMAGETYPE`
       The type of kernel to build for a device, usually set by the machine
       configuration files and defaults to "zImage". This variable is used

