Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C96A9C282EC
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 12:30:40 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.7744.1741696232389909583
 for <docs@lists.yoctoproject.org>;
 Tue, 11 Mar 2025 05:30:32 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A8ECD152B
	for <docs@lists.yoctoproject.org>; Tue, 11 Mar 2025 05:30:42 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 29A023F673
	for <docs@lists.yoctoproject.org>; Tue, 11 Mar 2025 05:30:31 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH] dev-manual: remove qemu machine name list in runqemu invocation
Date: Tue, 11 Mar 2025 12:30:25 +0000
Message-ID: <20250311123025.1915242-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 11 Mar 2025 12:30:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6531

This list of "valid" qemu machine names is obsolete and incorrect, so
just remove it as it serves no real purpose.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 documentation/dev-manual/qemu.rst | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/documentation/dev-manual/qemu.rst b/documentation/dev-manual=
/qemu.rst
index 9014d75f4..030bd5514 100644
--- a/documentation/dev-manual/qemu.rst
+++ b/documentation/dev-manual/qemu.rst
@@ -367,9 +367,6 @@ command line:
=20
 -  `VM`: The virtual machine image, which must be a ``.wic.vmdk``
    file. Use this option when you want to boot a ``.wic.vmdk`` image.
-   The image filename you provide must contain one of the following
-   strings: "qemux86-64", "qemux86", "qemuarm", "qemumips64",
-   "qemumips", "qemuppc", or "qemush4".
=20
 -  `ROOTFS`: A root filesystem that has one of the following filetype
    extensions: "ext2", "ext3", "ext4", "jffs2", "nfs", or "btrfs". If
--=20
2.43.0


