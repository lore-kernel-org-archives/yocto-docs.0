Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 034A5C44532
	for <webhook@archiver.kernel.org>; Wed, 21 Jan 2026 13:32:12 +0000 (UTC)
Received: from smtp-bc0e.mail.infomaniak.ch (smtp-bc0e.mail.infomaniak.ch [45.157.188.14])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11831.1769002322024268432
 for <docs@lists.yoctoproject.org>;
 Wed, 21 Jan 2026 05:32:02 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 45.157.188.14, mailfrom: foss+yocto@0leil.net)
Received: from smtp-3-0000.mail.infomaniak.ch (smtp-3-0000.mail.infomaniak.ch [10.4.36.107])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4dx4qN4fcTz25n;
	Wed, 21 Jan 2026 14:32:00 +0100 (CET)
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4dx4qN1jLnzvp4;
	Wed, 21 Jan 2026 14:32:00 +0100 (CET)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Wed, 21 Jan 2026 14:31:51 +0100
Subject: [PATCH v2 10/12] sdk-manual: appendix-obtain: use parsed-literal
 block for naming convention of the installer scripts
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260121-code-block-misc-20260114-v2-10-fdd4bb5c2e68@cherry.de>
References: <20260121-code-block-misc-20260114-v2-0-fdd4bb5c2e68@cherry.de>
In-Reply-To: <20260121-code-block-misc-20260114-v2-0-fdd4bb5c2e68@cherry.de>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.3
X-Infomaniak-Routing: alpha
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 21 Jan 2026 13:32:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8621

From: Quentin Schulz <quentin.schulz@cherry.de>

It's easier on the eye to use a parsed-literal block for highlighting
things that must be changed than simply stating the word, so this makes
use of a parsed-literal block instead of a simple inline code-block and
also highlight in italic which words are placeholders.

Also make the explanation below the literal-block use the same
highlighting (italic).

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 documentation/sdk-manual/appendix-obtain.rst | 28 +++++++++++++++++++---------
 1 file changed, 19 insertions(+), 9 deletions(-)

diff --git a/documentation/sdk-manual/appendix-obtain.rst b/documentation/sdk-manual/appendix-obtain.rst
index 7fbb72d54..34a3f5bbb 100644
--- a/documentation/sdk-manual/appendix-obtain.rst
+++ b/documentation/sdk-manual/appendix-obtain.rst
@@ -40,15 +40,20 @@ Follow these steps to locate and hand-install the toolchain:
    hardware, and image type.
 
    The installer files (``*.sh``) follow this naming convention:
-   ``poky-glibc-host_system-core-image-type-arch-toolchain[-ext]-release.sh``:
 
-   -  ``host_system``: string representing your development system: ``i686`` or ``x86_64``
+   .. parsed-literal::
 
-   -  ``type``: string representing the image: ``sato`` or ``minimal``
+      poky-glibc-*host_system*-core-image-*type*-*arch*-toolchain[-ext]-*release*.sh
 
-   -  ``arch``: string representing the target architecture such as ``cortexa57-qemuarm64``
+   With:
 
-   -  ``release``: version of the Yocto Project.
+   -  *host_system*: string representing your development system: ``i686`` or ``x86_64``
+
+   -  *type*: string representing the image: ``sato`` or ``minimal``
+
+   -  *arch*: string representing the target architecture such as ``cortexa57-qemuarm64``
+
+   -  *release*: version of the Yocto Project.
 
    .. note::
       The standard SDK installer does not have the ``-ext`` string as
@@ -223,14 +228,19 @@ Follow these steps to extract the root filesystem:
    also contain flattened root filesystem image files (``*.ext4``),
    which you can use with QEMU directly.
 
-   The pre-built root filesystem image files follow the
-   ``core-image-profile-machine.tar.bz2`` naming convention:
+   The pre-built root filesystem image files follow this naming convention:
 
-   -  ``profile``: filesystem image's profile, such as ``minimal``,
+   .. parsed-literal::
+
+      core-image-*profile*-*machine*.tar.bz2
+
+   With:
+
+   -  *profile*: filesystem image's profile, such as ``minimal``,
       ``minimal-dev`` or ``sato``. For information on these types of image
       profiles, see the "Images" chapter in the Yocto Project Reference Manual.
 
-   -  ``machine``:  same string as the name of the parent download directory.
+   -  *machine*:  same string as the name of the parent download directory.
 
    The root filesystems
    provided by the Yocto Project are based off of the

-- 
2.52.0


