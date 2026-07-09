Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3302DC43458
	for <webhook@archiver.kernel.org>; Thu,  9 Jul 2026 08:32:04 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4367.1783585913248760315
 for <docs@lists.yoctoproject.org>;
 Thu, 09 Jul 2026 01:31:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=BjMjCqZp;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=gDhJGcvCRGqU2NocTEOaw/Ckv2L6RBsdTMxO3Rj1aSU=; b=BjMjCqZpPSBLAbnWslssKEMiSz
	fAdo9lKgu/ZGYZailywuNAbDMQFV1NpgUaf9L4qAF19FIsjxapygrsSv/Q9jnzAeH0Z+VbaEHkoXH
	sUaLQ1Gulv7T3UHEtXmRKY1yuxpy9O2jwCF0LL51wFYGymbhKc+YXaugCesK8KlTk8CbobH5S+kkQ
	K3PcjtATjCHU4wTubYydRReXNIjHXU8Ql3yOOP4NDJJYwco7CBYHFPB5NZmQyO9hAxevoyodhVLfc
	ImMMXkWiInEZ8S7E1p8NSxEZF3Ny3J1txU1dS+urDmTns0BUaLWJNqqb1FIm3x/+oPNtIHPItx/RO
	/rBMH+Cg==;
Received: from pool-174-114-114-5.cpe.net.cable.rogers.com ([174.114.114.5]:43210 helo=sheena)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1whkAf-00000005jOj-3BqT
	for docs@lists.yoctoproject.org;
	Thu, 09 Jul 2026 04:31:51 -0400
Date: Thu, 9 Jul 2026 04:31:10 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] ref-manual: expand on kernel "do_sizecheck" task
Message-ID: <b5a26548-6620-a7cb-ae04-d42f57df9bc3@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Thu, 09 Jul 2026 08:32:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10046


Expand on the description of do_sizecheck() to mention that it will
size-check on *all* kernel images listed in KERNEL_IMAGETYPES.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/ref-manual/tasks.rst b/documentation/ref-manual/tasks.rst
index e1db2d5ed..db0abad00 100644
--- a/documentation/ref-manual/tasks.rst
+++ b/documentation/ref-manual/tasks.rst
@@ -837,11 +837,10 @@ can successfully build the kernel modules in the next step of the build.
 ``do_sizecheck``
 ----------------

-After the kernel has been built, this task checks the size of the
-stripped kernel image against
-:term:`KERNEL_IMAGE_MAXSIZE`. If that
-variable was set and the size of the stripped kernel exceeds that size,
-the kernel build produces a warning to that effect.
+If the variable :term:`KERNEL_IMAGE_MAXSIZE` is set, this task compares
+the size of all stripped kernel images listed in :term:`KERNEL_IMAGETYPES`
+against that value. If more than one image type is listed there, warn on
+any that exceed that value, but fail only if none of them fit.

 .. _ref-tasks-strip:

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index c92b195ff..ba83b6e6f 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -5603,17 +5603,18 @@ system and gives an overview of their function and contents.
       information.

    :term:`KERNEL_IMAGE_MAXSIZE`
-      Specifies the maximum size of the kernel image file in kilobytes. If
-      :term:`KERNEL_IMAGE_MAXSIZE` is set, the size of the kernel image file is
-      checked against the set value during the
-      :ref:`ref-tasks-sizecheck` task. The task fails if
-      the kernel image file is larger than the setting.
+      Specifies the maximum allowable size of the kernel image file in kilobytes.
+      If this variable is set, the sizes of all of the kernel image files listed
+      in :term:`KERNEL_IMAGETYPES` are checked against this value during the
+      :ref:`ref-tasks-sizecheck` task. That task will warn about any of the
+      kernel images that exceed the maximum, and will fail only if all images
+      are too large.

       :term:`KERNEL_IMAGE_MAXSIZE` is useful for target devices that have a
       limited amount of space in which the kernel image must be stored.

       By default, this variable is not set, which means the size of the
-      kernel image is not checked.
+      kernel images are not checked.

    :term:`KERNEL_IMAGE_NAME`
       The base name of the kernel image. This variable is set in the

