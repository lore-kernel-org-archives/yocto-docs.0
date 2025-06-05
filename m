Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5814C5B552
	for <webhook@archiver.kernel.org>; Thu,  5 Jun 2025 14:10:50 +0000 (UTC)
Received: from smtp-1908.mail.infomaniak.ch (smtp-1908.mail.infomaniak.ch [185.125.25.8])
 by mx.groups.io with SMTP id smtpd.web11.8768.1749132644869393851
 for <docs@lists.yoctoproject.org>;
 Thu, 05 Jun 2025 07:10:45 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 185.125.25.8, mailfrom: foss+yocto@0leil.net)
Received: from smtp-3-0001.mail.infomaniak.ch (smtp-3-0001.mail.infomaniak.ch [10.4.36.108])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4bCmZC0Pxhz3vb;
	Thu,  5 Jun 2025 16:10:43 +0200 (CEST)
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4bCmZB4MgHz2PZ;
	Thu,  5 Jun 2025 16:10:42 +0200 (CEST)
From: Quentin Schulz <foss+yocto@0leil.net>
Subject: [PATCH 0/2] README: fix contribution instructions when included in
 poky
Date: Thu, 05 Jun 2025 16:10:22 +0200
Message-Id: <20250605-readme-contrib-v1-0-c51b8cc57b7a@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE6lQWgC/x3MQQqAIBBA0avIrBMmw6SuEi1Sp5pFFmNEEN09a
 fkW/z+QSZgy9OoBoYsz76mgrhSEdUoLaY7FYNBYbNFqoSlupMOeTmGvnXHOIwYKXQMlOoRmvv/
 hML7vBwvei/hgAAAA
X-Change-ID: 20250605-readme-contrib-7277b00cec93
To: docs@lists.yoctoproject.org
Cc: Dixit Parmar <dixitparmar19@gmail.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 05 Jun 2025 14:10:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7007

While trying to explain how to figure out which mailing list to
contribute to based on the changed files in poky, I discovered a few
things:

- the contribution instructions in documentation/README point to
  "top-level README", but
- yocto-docs's top-level README isn't copied in poky and poky doesn't
  have one,

So let's make the contribution instructions part of
documentation/README. Considering that this document now contains
everything the top-level README contains, there's no need to duplicate
its content partially. Keeping a README file at the top of a git repo is
kind of best practice so let's just make it a symlink to
documentation/README.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
Quentin Schulz (2):
      docs: README: specify how to contribute instead of pointing at another file
      deduplicate README

 README               | 32 +-------------------------------
 documentation/README | 21 +++++++++++++++++++--
 2 files changed, 20 insertions(+), 33 deletions(-)
---
base-commit: 406e8a8e30404c0538f5aa46f211540bae2b206b
change-id: 20250605-readme-contrib-7277b00cec93

Best regards,
-- 
Quentin Schulz <quentin.schulz@cherry.de>


