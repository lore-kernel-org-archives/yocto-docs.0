Return-Path: <ito@lineo.co.jp>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35441C4332F
	for <webhook@archiver.kernel.org>; Wed, 19 Oct 2022 16:17:24 +0000 (UTC)
Received: from mail.lineo.co.jp (mail.lineo.co.jp [203.141.200.203])
 by mx.groups.io with SMTP id smtpd.web08.10311.1666196233716038848
 for <docs@lists.yoctoproject.org>;
 Wed, 19 Oct 2022 09:17:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: lineo.co.jp, ip: 203.141.200.203, mailfrom: ito@lineo.co.jp)
Received: from [192.168.3.12] (softbank126088165209.bbtec.net [126.88.165.209])
	by mail.lineo.co.jp (Postfix) with ESMTPSA id D46038017D93D;
	Thu, 20 Oct 2022 01:17:10 +0900 (JST)
Message-ID: <1ea1ac6e-315c-45d2-61c9-05197154f720@lineo.co.jp>
Date: Thu, 20 Oct 2022 01:17:10 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
To: docs@lists.yoctoproject.org
Content-Language: en-US
From: Takayasu Ito <ito@lineo.co.jp>
Subject: [docs][PATCH] migration-guides/release-notes-4.1.rst: remove
 bitbake-layers subcommand argument
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 19 Oct 2022 16:17:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3375

Hi all

- remove bitbake-layers subcommand argument
---
  documentation/migration-guides/release-notes-4.1.rst | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/migration-guides/release-notes-4.1.rst b/documentation/migration-guides/release-notes-4.1.rst
index 0c552bf1a..a2d4b3d6c 100644
--- a/documentation/migration-guides/release-notes-4.1.rst
+++ b/documentation/migration-guides/release-notes-4.1.rst
@@ -18,7 +18,7 @@ New Features / Enhancements in 4.1

    - New ``scripts/oe-setup-layers`` standalone script to restore the layer
      configuration from a json file
-  - New ``bitbake-layers create-layers-setup destdir`` command to save the
+  - New ``bitbake-layers create-layers-setup`` command to save the
      layer configuration to a json file
    - New ``bitbake-layers save-build-conf`` command to save the active build
      configuration as a template into a layer
--
2.25.1

-- 
Takayasu Ito <ito@lineo.co.jp>
Lineo Solutions Inc.

