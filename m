Return-Path: <m.cavallini@koansoftware.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26159C83F27
	for <webhook@archiver.kernel.org>; Sat, 19 Jul 2025 16:06:59 +0000 (UTC)
Received: from mail.koansoftware.com (mail.koansoftware.com [172.104.12.216])
 by mx.groups.io with SMTP id smtpd.web11.1646.1752941209274797232
 for <docs@lists.yoctoproject.org>;
 Sat, 19 Jul 2025 09:06:49 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: koansoftware.com, ip: 172.104.12.216, mailfrom: m.cavallini@koansoftware.com)
Received: from localhost (localhost [127.0.0.1])
	by mail.koansoftware.com (Postfix) with ESMTP id 3E4514545C;
	Sat, 19 Jul 2025 18:06:48 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail
Received: from mail.koansoftware.com ([127.0.0.1])
	by localhost (mail.koansoftware.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4Lzd9KFgcObw; Sat, 19 Jul 2025 18:06:47 +0200 (CEST)
From: Marco Cavallini <m.cavallini@koansoftware.com>
To: docs@lists.yoctoproject.org
Cc: Marco Cavallini <m.cavallini@koansoftware.com>
Subject: [PATCH] start.rst: added missing command in Optimize your VHDX file using DiskPart
Date: Sat, 19 Jul 2025 18:06:42 +0200
Message-Id: <20250719160642.15601-1-m.cavallini@koansoftware.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sat, 19 Jul 2025 16:06:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7355

Signed-off-by: Marco Cavallini <m.cavallini@koansoftware.com>
---
 documentation/dev-manual/start.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/documentation/dev-manual/start.rst b/documentation/dev-manua=
l/start.rst
index e10367752..803ea2601 100644
--- a/documentation/dev-manual/start.rst
+++ b/documentation/dev-manual/start.rst
@@ -554,6 +554,7 @@ your Yocto Project build host:
          DISKPART> select vdisk file=3D"<path_to_VHDX_file>"
          DISKPART> attach vdisk readonly
          DISKPART> compact vdisk
+         DISKPART> detach
          DISKPART> exit
=20
 .. note::

