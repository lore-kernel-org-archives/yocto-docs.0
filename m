Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4C3DD2A009
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 12:56:44 +0000 (UTC)
Received: from smtp-8fad.mail.infomaniak.ch (smtp-8fad.mail.infomaniak.ch [83.166.143.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9351.1768395402893893703
 for <docs@lists.yoctoproject.org>;
 Wed, 14 Jan 2026 04:56:43 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 83.166.143.173, mailfrom: foss+yocto@0leil.net)
Received: from smtp-4-0001.mail.infomaniak.ch (unknown [IPv6:2001:1600:7:10::a6c])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4drmMr60TYzVMp;
	Wed, 14 Jan 2026 13:56:40 +0100 (CET)
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4drmMr35fNzR0S;
	Wed, 14 Jan 2026 13:56:39 +0100 (CET)
From: Quentin Schulz <foss+yocto@0leil.net>
Subject: [PATCH 0/9] sdk-manual: fix code-blocks, migrate one PNG to SVG,
 remove unused PNG
Date: Wed, 14 Jan 2026 13:56:20 +0100
Message-Id: <20260114-code-block-misc-20260114-v1-0-174a6e5dba69@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/z2MSQqAMAwAvyI5G+imB78iHmyMGlwqLYgg/t3iw
 eMwzNyQOAonaIobIp+SJOwZdFkAzf0+McqQGYwytdLaIYWB0a+BFtwkEf7Cj8pW7GxtyEDOj8i
 jXN+67Z7nBSWkqbhqAAAA
X-Change-ID: 20260114-code-block-misc-20260114-bf035e4362c2
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.3
X-Infomaniak-Routing: alpha
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 14 Jan 2026 12:56:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8546

This migrates literal and code blocks to an explicit lexer in
sdk-manual.

It also migrate one PNG to SVG (one that was "easy enough" for me to
quickly do), as well as deleting an unused PNG.

In addition, this removes two PNGs in favor of a simple code-block when
listing the directory layout as it doesn't bring anything valuable and
makes accessibility worse.

Finally, it also fixes some improper indent that resulted in
explanations unintentionally being part of a code-block.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
Quentin Schulz (9):
      sdk-manual: fix incorrect highlight language for text code-blocks
      sdk-manual: fix incorrect highlight language for console code-blocks
      sdk-manual: fix improper indent of general form of tarball installer script
      sdk-manual: working-projects: properly highlight code code-blocks
      sdk-manual: appending-customizing: use none lexer for BitBake code blocks
      sdk-manual: appendix-obtain: replace directory structure PNG with a code-block
      sdk-manual: appendix-obtain: replace eSDK directory structure PNG with a code-block
      sdk-manual: replace sdk-environment PNG with SVG
      sdk-manual: delete sdk-title PNG

 documentation/sdk-manual/appendix-customizing.rst  |  36 +-
 documentation/sdk-manual/appendix-obtain.rst       | 104 ++++-
 documentation/sdk-manual/extensible.rst            |  59 ++-
 .../sdk-manual/figures/sdk-environment.png         | Bin 42098 -> 0 bytes
 .../sdk-installed-extensible-sdk-directory.png     | Bin 66753 -> 0 bytes
 .../sdk-installed-standard-sdk-directory.png       | Bin 39099 -> 0 bytes
 documentation/sdk-manual/figures/sdk-title.png     | Bin 31039 -> 0 bytes
 documentation/sdk-manual/intro.rst                 |   2 +-
 documentation/sdk-manual/svg/sdk-environment.svg   | 463 +++++++++++++++++++++
 documentation/sdk-manual/using.rst                 |  33 +-
 documentation/sdk-manual/working-projects.rst      | 112 +++--
 11 files changed, 711 insertions(+), 98 deletions(-)
---
base-commit: b8a56b8b2e8c0417b2f7204f80c79b05d95e9ce4
change-id: 20260114-code-block-misc-20260114-bf035e4362c2

Best regards,
-- 
Quentin Schulz <quentin.schulz@cherry.de>


