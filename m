Return-Path: <ito@lineo.co.jp>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E891C433FE
	for <webhook@archiver.kernel.org>; Thu, 20 Oct 2022 06:52:54 +0000 (UTC)
Received: from mail.lineo.co.jp (mail.lineo.co.jp [203.141.200.203])
 by mx.groups.io with SMTP id smtpd.web10.6786.1666248773220811223
 for <docs@lists.yoctoproject.org>;
 Wed, 19 Oct 2022 23:52:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: lineo.co.jp, ip: 203.141.200.203, mailfrom: ito@lineo.co.jp)
Received: from Lineou-U20.lineo.co.jp (vpn1.lineo.co.jp [203.141.200.204])
	by mail.lineo.co.jp (Postfix) with ESMTPS id 67E9F8041701F;
	Thu, 20 Oct 2022 15:52:49 +0900 (JST)
From: ito@lineo.co.jp
To: docs@lists.yoctoproject.org
Cc: Takayasu Ito <ito@lineo.co.jp>
Subject: [docs][PATCH v6] release-notes-4.1.rst remove bitbake-layers subcommand argument
Date: Thu, 20 Oct 2022 15:52:46 +0900
Message-Id: <20221020065246.33834-1-ito@lineo.co.jp>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 20 Oct 2022 06:52:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3385

From: Takayasu Ito <ito@lineo.co.jp>

Signed-off-by: Takayasu Ito <ito@lineo.co.jp>
---
 documentation/migration-guides/release-notes-4.1.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/migration-guides/release-notes-4.1.rst b/docum=
entation/migration-guides/release-notes-4.1.rst
index 0c552bf1a..a2d4b3d6c 100644
--- a/documentation/migration-guides/release-notes-4.1.rst
+++ b/documentation/migration-guides/release-notes-4.1.rst
@@ -18,7 +18,7 @@ New Features / Enhancements in 4.1
=20
   - New ``scripts/oe-setup-layers`` standalone script to restore the lay=
er
     configuration from a json file
-  - New ``bitbake-layers create-layers-setup destdir`` command to save t=
he
+  - New ``bitbake-layers create-layers-setup`` command to save the
     layer configuration to a json file
   - New ``bitbake-layers save-build-conf`` command to save the active bu=
ild
     configuration as a template into a layer
--=20
2.25.1


