Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4587.1792492599265225016
 for <docs@lists.yoctoproject.org>;
 Tue, 20 Oct 2026 03:36:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=andrej.kozemcak@siemens.com header.s=fm2 header.b=h4/VdZAx;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-1334352-20261020103635bb8c9c887800020714-noeajj@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20261020103635bb8c9c887800020714
        for <docs@lists.yoctoproject.org>;
        Tue, 20 Oct 2026 12:36:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=andrej.kozemcak@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=Oa2SeUfJZZKygW6Go2cq8eYpCLLVmPDZ9VuEM49C6/s=;
 b=h4/VdZAxaIqaTJRTpN2DjKH3OnodK1D41uC2XIq6yV5nQj+ectcEwqNcN3m2IvudDh2anG
 lXZMl5/ZQursop9zwXR5n1NzGuKXEIU5h3MT1WBFnjVNFRur65hEtRBfGh+i4CMNg7wJrQr0
 3542yhDOlIWE6JY2yL+oQAnD3aw+Vj2RN4pnHlF+2AvwNvIko5DIU/LBNsdDxZEsGLnoUVS1
 PxvhaEomGSm8kGjE/hq5768lbqs8J2RF6OytxSG8ZDzlzq9ug+Ihs6gRi/ToUJP6PCC05NZ9
 jflGQrcM5xH6Db2HKb9n2pPBii9X29jGUBG9yW6jNNlD5e7vZFr3TvOg==;
From: Andrej Kozemcak <andrej.kozemcak@siemens.com>
To: docs@lists.yoctoproject.org
Cc: Andrej Kozemcak <andrej.kozemcak@siemens.com>
Subject: [PATCH] ref-manual/variables.rst: document the QB_FSINFO variable
Date: Tue, 20 Oct 2026 12:36:32 +0200
Message-ID: <20261020103632.1125052-1-andrej.kozemcak@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1334352:519-21489:flowmailer
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Tue, 20 Oct 2026 10:36:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10700
Content-Type: text/plain; charset="utf-8"

Added by commit b6c78bddf3 ("runqemu: support rootfs-dbg flag
in QB_FSINFO") in OE-Core.
Add documentation for the QB_FSINFO variable, which provides
additional filesystem metadata to runqemu as a space-separated
list of fstype:flag entries, covering WIC kernel-in-fs options
and tar rootfs-dbg handling.

Signed-off-by: Andrej Kozemcak <andrej.kozemcak@siemens.com>
---
Request from this email: 
https://lists.openembedded.org/g/openembedded-core/message/248037?p=%2C%2C%2C20%2C0%2C0%2C0%3A%3Acreated%2C%2CQB_FSINFO%2C20%2C2%2C0%2C121544914

 documentation/ref-manual/variables.rst | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 5339721f4..025219d54 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -8205,6 +8205,20 @@ system and gives an overview of their function and contents.
       filesystem image extension found in :term:`DEPLOY_DIR_IMAGE`. For example:
       ``ext4.zst``.
 
+   :term:`QB_FSINFO`
+
+      The :term:`QB_FSINFO` variable provides additional filesystem metadata to
+      ``runqemu`` as a space-separated list of ``fstype:flag`` entries. For
+      example::
+
+         QB_FSINFO = "wic:no-kernel-in-fs tar:rootfs-dbg"
+
+      For WIC images, use ``wic:no-kernel-in-fs`` or ``wic:kernel-in-fs`` to
+      specify whether the kernel is included in the filesystem. For tar-based
+      filesystem types, ``tar:rootfs-dbg`` makes ``runqemu`` use the debug
+      root filesystem image when extracting a tarball for NFS by appending
+      ``-dbg`` to :term:`IMAGE_LINK_NAME`.
+
    :term:`QB_DEFAULT_KERNEL`
 
       When using ``runqemu``, the :term:`QB_DEFAULT_KERNEL` variable controls
