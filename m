Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89D3BEB64DA
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 16:51:28 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.16873.1687452683348749033
 for <docs@lists.yoctoproject.org>;
 Thu, 22 Jun 2023 09:51:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.183.201, mailfrom: foss+yocto@0leil.net)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 835771BF205;
	Thu, 22 Jun 2023 16:51:21 +0000 (UTC)
From: Quentin Schulz <foss+yocto@0leil.net>
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
	docs@lists.yoctoproject.org
Cc: Quentin Schulz <foss+yocto@0leil.net>
Subject: [PATCH 2/4] docs: ref-manual: terms: fix typos in SPDX term
Date: Thu, 22 Jun 2023 18:51:04 +0200
Message-ID: <20230622-typos-202306-v1-2-68489d7f23f2@theobroma-systems.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4029

From: Quentin Schulz <quentin.schulz@theobroma-systems.com>

Fixes: 2c53ac40e99a ("ref-manual: terms.rst: add SBOM and SPDX terms")
Cc: Quentin Schulz <foss+yocto@0leil.net>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
---
 documentation/ref-manual/terms.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/ref-manual/terms.rst b/documentation/ref-manual/terms.rst
index 4baef38cf..8f7281676 100644
--- a/documentation/ref-manual/terms.rst
+++ b/documentation/ref-manual/terms.rst
@@ -475,11 +475,11 @@ universal, the list includes them just in case:
      section in the Yocto Project Overview and Concepts Manual.
 
    :term:`SPDX`
-      This term means *Software Package Data Exchange*, and is used as a open
+      This term means *Software Package Data Exchange*, and is used as an open
       standard for providing a *Software Bill of Materials* (:term:`SBOM`).
       This standard is developed through a `Linux Foundation project
       <https://spdx.dev/>`__ and is used by the OpenEmbedded Build System to
-      provide an :term:`SBOM` associated to each a software image.
+      provide an :term:`SBOM` associated to each software image.
 
       For details, see Wikipedia's :wikipedia:`SPDX page <Software_Package_Data_Exchange>`
       and the ":ref:`dev-manual/sbom:creating a software bill of materials`"

-- 
2.41.0


