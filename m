Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10513.1792587163160253853
 for <docs@lists.yoctoproject.org>;
 Wed, 21 Oct 2026 05:52:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=andrej.kozemcak@siemens.com header.s=fm2 header.b=mTtRpIak;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-1334352-202610211252394a184405cc00020731-wecvb0@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 202610211252394a184405cc00020731
        for <docs@lists.yoctoproject.org>;
        Wed, 21 Oct 2026 14:52:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=andrej.kozemcak@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=UAKWPw3Lj40scbn0g9i3L/F0jtPpnBgf3COQjCE/Pho=;
 b=mTtRpIakSCi/TdIeocYRjUqJfbEBNlwXwZQjloAqdJ6wTD9/mzzhW5fXuOY0z1czuREDV2
 Y/0ctmJiDGSY3boCuBK6e15NsAJ5D0Yhaab3tf/PttaaXBz1EkxgxMqvQLPp0vrSaSbarJBv
 VuCewom6sSffhFvEqfhpl2NKAHfTgspWf+SamtIJrDXZ1EbHC1s5KdNtSWBvqV9XiFNcl+Fw
 mOVJXiTLyg1aDsbpe4foEO4lAA17JbOOUFluKQxVSBfLYYWlKD/2yJLbit0tmbWYWfS9JwGw
 fA5YkqcCMyZiKK4PV4AmvE6wPBS98xI8ca4apCNIuYw4Xa0/ORsQoTJA==;
From: Andrej Kozemcak <andrej.kozemcak@siemens.com>
To: docs@lists.yoctoproject.org
Cc: Andrej Kozemcak <andrej.kozemcak@siemens.com>
Subject: [PATCH v2] ref-manual/variables.rst: document the QB_FSINFO variable
Date: Wed, 21 Oct 2026 14:52:35 +0200
Message-ID: <20261021125235.2954-1-andrej.kozemcak@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1334352:519-21489:flowmailer
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Wed, 21 Oct 2026 12:52:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10707
Content-Type: text/plain; charset="utf-8"

Added by commit b6c78bddf3 ("runqemu: support rootfs-dbg flag
in QB_FSINFO") in OE-Core.
Add documentation for the QB_FSINFO variable, which provides
additional filesystem metadata to runqemu as a space-separated
list of fstype:flag entries, covering WIC kernel-in-fs options
and tar rootfs-dbg handling.

Signed-off-by: Andrej Kozemcak <andrej.kozemcak@siemens.com>
---
 documentation/ref-manual/variables.rst | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 5339721f4..c79d58954 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -8205,6 +8205,30 @@ system and gives an overview of their function and contents.
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
+      The currently supported ``fstype`` and ``flag`` entries are:
+
+      -  ``wic``:
+
+         -  ``no-kernel-in-fs``: Specifies that the kernel is not included in
+            the WIC image. In this case, ``runqemu`` loads the kernel separately.
+
+         -  ``kernel-in-fs``: Specifies that the kernel is included in the
+            WIC image. In this case, ``runqemu`` does not load a separate kernel.
+
+      -  ``tar``:
+
+         -  ``rootfs-dbg``: Makes ``runqemu`` use the debug root filesystem
+            image when extracting a tarball for NFS by appending ``-dbg`` to
+            :term:`IMAGE_LINK_NAME`.
+
    :term:`QB_DEFAULT_KERNEL`
 
       When using ``runqemu``, the :term:`QB_DEFAULT_KERNEL` variable controls
