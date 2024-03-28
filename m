Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 355E9C54E67
	for <webhook@archiver.kernel.org>; Thu, 28 Mar 2024 15:07:39 +0000 (UTC)
Received: from smtp-42ad.mail.infomaniak.ch (smtp-42ad.mail.infomaniak.ch [84.16.66.173])
 by mx.groups.io with SMTP id smtpd.web10.18862.1711638452903704433
 for <docs@lists.yoctoproject.org>;
 Thu, 28 Mar 2024 08:07:33 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 84.16.66.173, mailfrom: foss+yocto@0leil.net)
Received: from smtp-3-0001.mail.infomaniak.ch (smtp-3-0001.mail.infomaniak.ch [10.4.36.108])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4V56N26TKYzggF;
	Thu, 28 Mar 2024 16:07:30 +0100 (CET)
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4V56N22YMlzMppDf;
	Thu, 28 Mar 2024 16:07:30 +0100 (CET)
From: Quentin Schulz <foss+yocto@0leil.net>
Subject: [PATCH 0/3] new yocto-patches ML + some typo/syntax fixes
Date: Thu, 28 Mar 2024 16:07:13 +0100
Message-Id: <20240328-yocto-patches-v1-0-1124fa0bc532@theobroma-systems.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKGHBWYC/x3MQQqAIBBA0avErBPMDLKrRAsZx5pNikYU4t2Tl
 m/xf4FMiSnD0hVIdHPmcDYMfQd42HMnwa4ZlFRajmoWb8AriGgvPCgLtJMxXmqHJKE1MZHn5/+
 tW60ffP6qkF8AAAA=
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>, 
 docs@lists.yoctoproject.org
Cc: Quentin Schulz <foss+yocto@0leil.net>
X-Mailer: b4 0.13.0
X-Infomaniak-Routing: alpha
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 28 Mar 2024 15:07:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5022

Let's mention in the docs there's a new ML where to send patches.

While at it, fix some Python syntax issues and a URL typo.

Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
---
Quentin Schulz (3):
      conf.py: properly escape backslashes for latex_elements
      refer to new yocto-patches mailing list wherever appropriate
      contributor-guide: submit-changes: fix typo in URL

 documentation/conf.py                              | 4 ++--
 documentation/contributor-guide/submit-changes.rst | 4 ++--
 documentation/ref-manual/resources.rst             | 3 +++
 3 files changed, 7 insertions(+), 4 deletions(-)
---
base-commit: 29cee590d59294306600a119048a234f10375603
change-id: 20240328-yocto-patches-ca599f04dce0

Best regards,
-- 
Quentin Schulz <quentin.schulz@theobroma-systems.com>


