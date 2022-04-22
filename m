Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CACD0C54F46
	for <webhook@archiver.kernel.org>; Fri, 22 Apr 2022 16:52:01 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web09.8287.1650633259330910055
 for <docs@lists.yoctoproject.org>;
 Fri, 22 Apr 2022 06:14:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.183.200,
 mailfrom: foss+yocto@0leil.net)
Received: (Authenticated sender: foss@0leil.net)
	by mail.gandi.net (Postfix) with ESMTPSA id 2897F20012;
	Fri, 22 Apr 2022 13:14:16 +0000 (UTC)
From: Quentin Schulz <foss+yocto@0leil.net>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
	Quentin Schulz <foss+yocto@0leil.net>
Subject: [PATCH 2/2] docs: migration-guides: release-notes-4.0: replace kernel
 placeholder with correct recipe name
Date: Fri, 22 Apr 2022 15:14:04 +0200
Message-Id: <20220422131404.283476-2-foss+yocto@0leil.net>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220422131404.283476-1-foss+yocto@0leil.net>
References: <20220422131404.283476-1-foss+yocto@0leil.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 22 Apr 2022 16:52:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2854

From: Quentin Schulz <quentin.schulz@theobroma-systems.com>

If I am not mistaken, the only kernel recipe to have a new PACKAGECONFIG
option is linux-yocto-dev, in commit 1bac831fbaafb
"linux-yocto-dev: introduce dt-validation PACKAGECONFIG".

Therefore, let's replace (kernel) by the one kernel recipe that has this
change.

Cc: Quentin Schulz <foss+yocto@0leil.net>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
---
 documentation/migration-guides/release-notes-4.0.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/migration-guides/release-notes-4.0.rst b/documentation/migration-guides/release-notes-4.0.rst
index c8885cadd..7a41a926c 100644
--- a/documentation/migration-guides/release-notes-4.0.rst
+++ b/documentation/migration-guides/release-notes-4.0.rst
@@ -184,7 +184,7 @@ New Features / Enhancements in 4.0
    - New ``FIT_CONF_PREFIX`` variable to allow overriding FIT configuration prefix
    - Use 'bbnote' for better logging
 
-- New :term:`PACKAGECONFIG` options in ``curl``, ``dtc``, ``epiphany``, ``git``, ``git``, ``gstreamer1.0-plugins-bad``, (kernel), ``kmod``, ``mesa``, ``piglit``, ``qemu``, ``rpm``, ``systemd``, ``webkitgtk``, ``weston-init``
+- New :term:`PACKAGECONFIG` options in ``curl``, ``dtc``, ``epiphany``, ``git``, ``git``, ``gstreamer1.0-plugins-bad``, ``linux-yocto-dev``, ``kmod``, ``mesa``, ``piglit``, ``qemu``, ``rpm``, ``systemd``, ``webkitgtk``, ``weston-init``
 - ptest enhancements in ``findutils``, ``lttng-tools``, ``openssl``, ``gawk``, ``strace``, ``lttng-tools``, ``valgrind``, ``perl``, ``libxml-parser-perl``, ``openssh``, ``python3-cryptography``, ``popt``
 
 - Sysroot dependencies have been further optimised
-- 
2.35.1


