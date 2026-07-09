Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58528C44515
	for <webhook@archiver.kernel.org>; Thu,  9 Jul 2026 08:49:04 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4623.1783586941353026564
 for <docs@lists.yoctoproject.org>;
 Thu, 09 Jul 2026 01:49:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=F4HQVAwv;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=7tfU0z66xxEModz7mZ+58S+9N5p5eeNnGs3jGdgKaM4=; b=F4HQVAwvRhDo+8251aSnzqlgH9
	zx61vz1zSrC5hemsCvNCmN+Cb3edKrSrxndMnYHf5oK8utfHitzWt0l6X36ZBqyn3romNazUbwjDs
	2rvqOXXL3Lfx+X1XPkds0EykMw8ngTDt+vfEJTHyfXMnvSt20FQdPqQy7fYO8/SxSlYzWHTIIPdsB
	R0P60427v2nNAsTi6tc3wqn4VyCNHct+s3qMJjt6OFEBloZzJZXkSXateAngg9zMzNUf7THp06Tal
	QFlEDnP7/nISqiggGxwW62lYfaa+JngiItoY6FRmltHtgUcWfK5PBO+o0MlPXXRQMlRw7/VGetvBu
	jXdvVvwQ==;
Received: from pool-174-114-114-5.cpe.net.cable.rogers.com ([174.114.114.5]:60250 helo=sheena)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1whkRF-00000005lYu-45D0
	for docs@lists.yoctoproject.org;
	Thu, 09 Jul 2026 04:48:59 -0400
Date: Thu, 9 Jul 2026 04:48:33 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] ref-manual: add "KERNEL_IMAGE_STRIP_EXTRA_SECTIONS" to
 variables
Message-ID: <bbb920f3-06ee-356c-1641-e9d4dda960d8@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Thu, 09 Jul 2026 08:49:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10047


Add this variable to the variables glossary, and add links to it and
back to the do_strip() task for completeness.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/ref-manual/tasks.rst b/documentation/ref-manual/tasks.rst
index e1db2d5ed..ea0899f53 100644
--- a/documentation/ref-manual/tasks.rst
+++ b/documentation/ref-manual/tasks.rst
@@ -848,7 +848,7 @@ the kernel build produces a warning to that effect.
 ``do_strip``
 ------------

-If ``KERNEL_IMAGE_STRIP_EXTRA_SECTIONS`` is defined, this task strips
+If :term:`KERNEL_IMAGE_STRIP_EXTRA_SECTIONS` is defined, this task strips
 the sections named in that variable from ``vmlinux``. This stripping is
 typically used to remove nonessential sections such as ``.comment``
 sections from a size-sensitive configuration.
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index c92b195ff..1629df99f 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -5623,6 +5623,11 @@ system and gives an overview of their function and contents.

       See :term:`KERNEL_ARTIFACT_NAME` for additional information.

+   :term:`KERNEL_IMAGE_STRIP_EXTRA_SECTIONS`
+      If this variable is set, it should contain the sections to be
+      stripped from the ``vmlinux`` image by the kernel-related
+      :ref:`ref-tasks-strip` task.
+
    :term:`KERNEL_IMAGETYPE`
       The type of kernel to build for a device, usually set by the machine
       configuration files and defaults to "zImage". This variable is used

