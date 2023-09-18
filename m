Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3B77C46CA1
	for <webhook@archiver.kernel.org>; Mon, 18 Sep 2023 14:17:15 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.52267.1695046634043913997
 for <docs@lists.yoctoproject.org>;
 Mon, 18 Sep 2023 07:17:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=dyRnoXKm;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C9867FF811;
	Mon, 18 Sep 2023 14:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695046632;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z6u+WMufNX8udllZ3a7QOp6nN3JtJgxL0DaF8WF1jic=;
	b=dyRnoXKmMqTk2CfEjZGfmrq0E6nh1QoO5L4HIoXP0fThTdIXGrnAhqHI1S3anUh9cbfU1b
	D7Rkd1aO4bzj0VNCiysCrD78rTwk0PsGJkN8YPFZifNePYh5Nm9k1VgN+bWBeQ6z2wfJUu
	LwWZK3bHTNxamM7RlOtq1+STvS9ZAXxaxAcSsmIw260vwCZDbyuWJzXnqTN0PuZBCV5sv8
	BFa+whnzqzN7GiouSAnUd5MDr0dQ5DTe/WPBWECN4TodGCmGoBwTOWXaWloDgp/PUiebJ9
	gMbyO+t+6dxRbjbi8tru/iYHYzPZdQH4pUqZK2VwziGCdpqnKbm/JSliVoBwQg==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [kirkstone][PATCH 2/5] ref-manual: add Initramfs term
Date: Mon, 18 Sep 2023 16:17:01 +0200
Message-Id: <20230918141704.79680-2-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230918141704.79680-1-michael.opdenacker@bootlin.com>
References: <20230918141704.79680-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 18 Sep 2023 14:17:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4220

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Backported from the master branch

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/terms.rst | 42 ++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/documentation/ref-manual/terms.rst b/documentation/ref-manual/terms.rst
index ba13f77f19..a7ae8e1801 100644
--- a/documentation/ref-manual/terms.rst
+++ b/documentation/ref-manual/terms.rst
@@ -192,6 +192,48 @@ universal, the list includes them just in case:
       of the supported image types that the Yocto Project provides, see the
       ":ref:`ref-manual/images:Images`" chapter.
 
+   :term:`Initramfs`
+      An Initial RAM Filesystem (:term:`Initramfs`) is an optionally compressed
+      :wikipedia:`cpio <Cpio>` archive which is extracted
+      by the Linux kernel into RAM in a special :wikipedia:`tmpfs <Tmpfs>`
+      instance, used as the initial root filesystem.
+
+      This is a replacement for the legacy init RAM disk ("initrd")
+      technique, booting on an emulated block device in RAM, but being less
+      efficient because of the overhead of going through a filesystem and
+      having to duplicate accessed file contents in the file cache in RAM,
+      as for any block device.
+
+      .. note::
+
+         As far as bootloaders are concerned, :term:`Initramfs` and "initrd"
+         images are still copied to RAM in the same way. That's why most
+	 most bootloaders refer to :term:`Initramfs` images as "initrd"
+	 or "init RAM disk".
+
+      This kind of mechanism is typically used for two reasons:
+
+      -  For booting the same kernel binary on multiple systems requiring
+         different device drivers. The :term:`Initramfs` image is then customized
+	 for each type of system, to include the specific kernel modules
+         necessary to access the final root filesystem. This technique
+	 is used on all GNU / Linux distributions for desktops and servers.
+
+      -  For booting faster. As the root filesystem is extracted into RAM,
+         accessing the first user-space applications is very fast, compared
+         to having to initialize a block device, to access multiple blocks
+         from it, and to go through a filesystem having its own overhead.
+         For example, this allows to display a splashscreen very early,
+	 and to later take care of mounting the final root filesystem and
+         loading less time-critical kernel drivers.
+
+      This cpio archive can either be loaded to RAM by the bootloader,
+      or be included in the kernel binary.
+
+      For information on creating and using an :term:`Initramfs`, see the
+      ":ref:`dev-manual/building:building an initial ram filesystem (Initramfs) image`"
+      section in the Yocto Project Development Tasks Manual.
+
    :term:`Layer`
       A collection of related recipes. Layers allow you to consolidate related
       metadata to customize your build. Layers also isolate information used
-- 
2.34.1


