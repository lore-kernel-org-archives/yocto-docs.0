Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98D41EB64D8
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 16:51:28 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.16872.1687452682599911087
 for <docs@lists.yoctoproject.org>;
 Thu, 22 Jun 2023 09:51:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.183.201, mailfrom: foss+yocto@0leil.net)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B018A1BF20A;
	Thu, 22 Jun 2023 16:51:20 +0000 (UTC)
From: Quentin Schulz <foss+yocto@0leil.net>
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
	docs@lists.yoctoproject.org
Cc: Quentin Schulz <foss+yocto@0leil.net>
Subject: [PATCH 1/4] docs: sdk-manual: appendix-obtain: fix literal block content
Date: Thu, 22 Jun 2023 18:51:03 +0200
Message-ID: <20230622-typos-202306-v1-1-68489d7f23f2@theobroma-systems.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230622-typos-202306-v1-0-68489d7f23f2@theobroma-systems.com>
References: <20230622-typos-202306-v1-0-68489d7f23f2@theobroma-systems.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.12.2
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 22 Jun 2023 16:51:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4028

From: Quentin Schulz <quentin.schulz@theobroma-systems.com>

The literal block renders its content verbatim so a term role (`:term:`)
would appear as :term: string in there and `---` as --- string instead
of the expected hyphen.

While at it, surround the former-term roles with `` to highlight them.

Fixes: e319b3bf4eb6 ("manuals: add missing references to SDKMACHINE and SDK_ARCH")
Cc: Quentin Schulz <foss+yocto@0leil.net>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
---
 documentation/sdk-manual/appendix-obtain.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/sdk-manual/appendix-obtain.rst b/documentation/sdk-manual/appendix-obtain.rst
index ba844507d..e16017de7 100644
--- a/documentation/sdk-manual/appendix-obtain.rst
+++ b/documentation/sdk-manual/appendix-obtain.rst
@@ -140,8 +140,8 @@ build the SDK installer. Follow these steps:
       message similar to the following::
 
          The extensible SDK can currently only be built for the same
-         architecture as the machine being built on --- :term:`SDK_ARCH`
-         is set to ``i686`` (likely via setting :term:`SDKMACHINE`) which is
+         architecture as the machine being built on --- ``SDK_ARCH``
+         is set to ``i686`` (likely via setting ``SDKMACHINE`` which is
          different from the architecture of the build machine (``x86_64``).
 
 

-- 
2.41.0


