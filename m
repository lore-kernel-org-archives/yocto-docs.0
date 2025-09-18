Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEED1CAC5A9
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 08:56:50 +0000 (UTC)
Received: from smtp-42af.mail.infomaniak.ch (smtp-42af.mail.infomaniak.ch [84.16.66.175])
 by mx.groups.io with SMTP id smtpd.web11.9387.1758185808265160240
 for <docs@lists.yoctoproject.org>;
 Thu, 18 Sep 2025 01:56:48 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 84.16.66.175, mailfrom: foss+yocto@0leil.net)
Received: from smtp-4-0001.mail.infomaniak.ch (unknown [IPv6:2001:1600:7:10::a6c])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4cS8dV5hFFzhTD;
	Thu, 18 Sep 2025 10:56:46 +0200 (CEST)
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4cS8dV2B2TzjTJ;
	Thu, 18 Sep 2025 10:56:46 +0200 (CEST)
From: Quentin Schulz <foss+yocto@0leil.net>
Subject: [PATCH 0/2] drop Debian 11 from supported distros
Date: Thu, 18 Sep 2025 10:56:33 +0200
Message-Id: <20250918-dev-supported-distros-v1-0-aa1dc6b54c30@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEHJy2gC/x3MwQqDMAyA4VeRnA20wli7VxEPdYlbLm1JVITiu
 6/s+B3+v4GxChu8hgbKp5iU3OHHAd7flD+MQt0wuenhon8i8Yl21Fp0Z0IS27UYhjVEnxz5LUX
 obVXe5Pp/5+W+fzxsRsRnAAAA
X-Change-ID: 20250917-dev-supported-distros-8b891a0d1fa9
To: docs@lists.yoctoproject.org
Cc: Ross Burton <ross.burton@arm.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 18 Sep 2025 08:56:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7539

Ross recently sent a patch to remove Debian 11 from supported distros in
poky[1].

Let's do the same for the docs.

While at it, I also removed some comments in the build-docs-container
for distros we currently couldn't support because of missing packages
(or other issues) that we anyway don't support anymore.

[1] https://lore.kernel.org/poky/20250911195545.3525333-1-ross.burton@arm.com/

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
Quentin Schulz (2):
      tools: build-docs-container: remove comment for unsupported distros
      remove Debian 11 Bullseye from supported distros

 documentation/ref-manual/system-requirements.rst | 1 -
 documentation/tools/build-docs-container         | 5 -----
 2 files changed, 6 deletions(-)
---
base-commit: e77139b5c616e6e5ad436eb91416fd804389425f
change-id: 20250917-dev-supported-distros-8b891a0d1fa9

Best regards,
-- 
Quentin Schulz <quentin.schulz@cherry.de>


