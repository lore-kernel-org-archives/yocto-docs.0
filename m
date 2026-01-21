Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07EE2C4453B
	for <webhook@archiver.kernel.org>; Wed, 21 Jan 2026 13:32:02 +0000 (UTC)
Received: from smtp-bc0c.mail.infomaniak.ch (smtp-bc0c.mail.infomaniak.ch [45.157.188.12])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11826.1769002318455377091
 for <docs@lists.yoctoproject.org>;
 Wed, 21 Jan 2026 05:31:58 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 45.157.188.12, mailfrom: foss+yocto@0leil.net)
Received: from smtp-3-0000.mail.infomaniak.ch (unknown [IPv6:2001:1600:4:17::246b])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4dx4qJ67g1z4mJ;
	Wed, 21 Jan 2026 14:31:56 +0100 (CET)
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4dx4qJ1KwQzwV1;
	Wed, 21 Jan 2026 14:31:56 +0100 (CET)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Wed, 21 Jan 2026 14:31:44 +0100
Subject: [PATCH v2 03/12] sdk-manual: fix improper indent of general form
 of tarball installer scripts
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260121-code-block-misc-20260114-v2-3-fdd4bb5c2e68@cherry.de>
References: <20260121-code-block-misc-20260114-v2-0-fdd4bb5c2e68@cherry.de>
In-Reply-To: <20260121-code-block-misc-20260114-v2-0-fdd4bb5c2e68@cherry.de>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.3
X-Infomaniak-Routing: alpha
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 21 Jan 2026 13:32:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8615

From: Quentin Schulz <quentin.schulz@cherry.de>

poky-glibc-host_system-image_type-arch-toolchain-ext-release_version.sh
is in a code-block and thus requires to be indented (it is). Sphinx
knows a block has ended when the indentation of the next line is smaller
than in the block, otherwise it's all in the same block.

The explanation of the replaceable parts in the tarball installer script
filename should be text and not part of the block, so let's do that.

While at it, reformat by putting each replaceable part in a bullet list,
highlight the replaceable part or what it can replaced with as well as
putting the replacement on the same line instead of making it a quote by
having them indented in the bullet list.

Finally, replace the literal block (::) with a parsed-literal block so
we can highlight the placeholders appropriately.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 documentation/sdk-manual/extensible.rst | 21 ++++++++-------------
 documentation/sdk-manual/using.rst      | 21 +++++++--------------
 2 files changed, 15 insertions(+), 27 deletions(-)

diff --git a/documentation/sdk-manual/extensible.rst b/documentation/sdk-manual/extensible.rst
index 808e076e6..0eb9eda8d 100644
--- a/documentation/sdk-manual/extensible.rst
+++ b/documentation/sdk-manual/extensible.rst
@@ -100,26 +100,21 @@ The names of the tarball installer scripts are such that a string
 representing the host system appears first in the filename and then is
 immediately followed by a string representing the target architecture.
 An extensible SDK has the string "-ext" as part of the name. Following
-is the general form::
+is the general form:
 
-   poky-glibc-host_system-image_type-arch-toolchain-ext-release_version.sh
+.. parsed-literal::
 
-   Where:
-       host_system is a string representing your development system:
+   poky-glibc-*host_system*-*image_type*-*arch*-toolchain-ext-*release_version*.sh
 
-                  i686 or x86_64.
+Where:
 
-       image_type is the image for which the SDK was built:
+-  *host_system* is a string representing your development system: ``i686`` or ``x86_64``.
 
-                  core-image-sato or core-image-minimal
+-  *image_type* is the image for which the SDK was built: ``core-image-sato`` or ``core-image-minimal``.
 
-       arch is a string representing the tuned target architecture:
+-  *arch* is a string representing the tuned target architecture: ``aarch64``, ``armv5e``, ``core2-64``, ``i586``, ``mips32r2``, ``mips64``, ``ppc7400``, or ``cortexa8hf-neon``.
 
-                  aarch64, armv5e, core2-64, i586, mips32r2, mips64, ppc7400, or cortexa8hf-neon
-
-       release_version is a string representing the release number of the Yocto Project:
-
-                  &DISTRO;, &DISTRO;+snapshot
+-  *release_version* is a string representing the release number of the Yocto Project: ``&DISTRO;``, ``&DISTRO;+snapshot``.
 
 For example, the following SDK installer is for a 64-bit
 development host system and a i586-tuned target architecture based off
diff --git a/documentation/sdk-manual/using.rst b/documentation/sdk-manual/using.rst
index 28f9e33b0..792e159bf 100644
--- a/documentation/sdk-manual/using.rst
+++ b/documentation/sdk-manual/using.rst
@@ -54,26 +54,19 @@ The names of the tarball installer scripts are such that a string
 representing the host system appears first in the filename and then is
 immediately followed by a string representing the target architecture:
 
-.. code-block:: text
+.. parsed-literal::
 
-   poky-glibc-host_system-image_type-arch-toolchain-release_version.sh
+   poky-glibc-*host_system*-*image_type*-*arch*-toolchain-*release_version*.sh
 
-   Where:
-       host_system is a string representing your development system:
+Where:
 
-                  i686 or x86_64.
+-  *host_system* is a string representing your development system: ``i686`` or ``x86_64``.
 
-       image_type is the image for which the SDK was built:
+-  *image_type* is the image for which the SDK was built: ``core-image-minimal`` or ``core-image-sato``.
 
-                  core-image-minimal or core-image-sato.
+-  *arch* is a string representing the tuned target architecture: ``aarch64``, ``armv5e``, ``core2-64``, ``i586``, ``mips32r2``, ``mips64``, ``ppc7400``, or ``cortexa8hf-neon``.
 
-       arch is a string representing the tuned target architecture:
-
-                  aarch64, armv5e, core2-64, i586, mips32r2, mips64, ppc7400, or cortexa8hf-neon.
-
-       release_version is a string representing the release number of the Yocto Project:
-
-                  &DISTRO;, &DISTRO;+snapshot
+-  *release_version* is a string representing the release number of the Yocto Project: ``&DISTRO;``, ``&DISTRO;+snapshot``.
 
 For example, the following SDK installer is for a 64-bit
 development host system and a i586-tuned target architecture based off

-- 
2.52.0


