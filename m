Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8D6FC44537
	for <webhook@archiver.kernel.org>; Wed, 21 Jan 2026 13:32:01 +0000 (UTC)
Received: from smtp-190a.mail.infomaniak.ch (smtp-190a.mail.infomaniak.ch [185.125.25.10])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11821.1769002317321461459
 for <docs@lists.yoctoproject.org>;
 Wed, 21 Jan 2026 05:31:58 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 185.125.25.10, mailfrom: foss+yocto@0leil.net)
Received: from smtp-3-0000.mail.infomaniak.ch (smtp-3-0000.mail.infomaniak.ch [10.4.36.107])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4dx4qH1KY5z3QW;
	Wed, 21 Jan 2026 14:31:55 +0100 (CET)
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4dx4qD72gMzxSV;
	Wed, 21 Jan 2026 14:31:52 +0100 (CET)
From: Quentin Schulz <foss+yocto@0leil.net>
Subject: [PATCH v2 00/12] sdk-manual: fix code-blocks, migrate one PNG to
 SVG, remove unused PNG
Date: Wed, 21 Jan 2026 14:31:41 +0100
Message-Id: <20260121-code-block-misc-20260114-v2-0-fdd4bb5c2e68@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42NwQ6CMBBEf4Xs2TVtKTV68j8MB7pdZKNS0xoiI
 fy7lYNnj28m82aBzEk4w6laIPEkWeJYwOwqoKEbr4wSCoNRximtLVIMjP4e6YYPyYS/wveqbtj
 WzpCBMn8m7uW9qS9t4UHyK6Z5e5r0N/1DOmlUqA+2c9wE37njmQZOad4HhnZd1w8syqXtwAAAA
 A==
X-Change-ID: 20260114-code-block-misc-20260114-bf035e4362c2
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.3
X-Infomaniak-Routing: alpha
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 21 Jan 2026 13:32:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8614

This migrates literal and code blocks to an explicit lexer in
sdk-manual.

It also migrate one PNG to SVG (one that was "easy enough" for me to
quickly do), as well as deleting an unused PNG.

In addition, this removes two PNGs in favor of simple parsed literal
blocks when listing the directory layout as it doesn't bring anything
valuable and makes accessibility worse.

Finally, it also fixes some improper indent that resulted in
explanations unintentionally being part of a code-block.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
Changes in v2:
- used parsed-literal blocks instead of code-blocks for directory
  layout,
- highlighted placeholders with the same mechanism as in parsed-literal
  blocks (italicized),
- highlighted possible values of placeholders with double-tick instead
  of single-tick,
- updated directory layout with output from 5.0.15 toolchains,
- reorder alphabetically the directory layouts such that files and
  directories are now mixed,
- reworded text after the now-deleted figures as it still said "Within
  the figure", and highlighted placeholders in the text the same way
  as they appear in the parsed-literal block,
- added patch to use parsed-literal block for the naming convention of
  the install scripts,
- added patch to fix SDK filename example,
- added patch to fix default path for eSDK installer script,
- Link to v1: https://patch.msgid.link/20260114-code-block-misc-20260114-v1-0-174a6e5dba69@cherry.de

---
Quentin Schulz (12):
      sdk-manual: fix incorrect highlight language for text code-blocks
      sdk-manual: fix incorrect highlight language for console code-blocks
      sdk-manual: fix improper indent of general form of tarball installer scripts
      sdk-manual: working-projects: properly highlight code code-blocks
      sdk-manual: appending-customizing: use none lexer for BitBake code blocks
      sdk-manual: appendix-obtain: replace directory structure PNG with a parsed-literal block
      sdk-manual: appendix-obtain: replace eSDK directory structure PNG with a parsed-literal block
      sdk-manual: replace sdk-environment PNG with SVG
      sdk-manual: delete sdk-title PNG
      sdk-manual: appendix-obtain: use parsed-literal block for naming convention of the installer scripts
      sdk-manual: using: fix SDK filename example
      sdk-manual: appendix-obtain: fix default path for eSDK installer script

 documentation/sdk-manual/appendix-customizing.rst  |  36 +-
 documentation/sdk-manual/appendix-obtain.rst       | 154 +++++--
 documentation/sdk-manual/extensible.rst            |  63 +--
 .../sdk-manual/figures/sdk-environment.png         | Bin 42098 -> 0 bytes
 .../sdk-installed-extensible-sdk-directory.png     | Bin 66753 -> 0 bytes
 .../sdk-installed-standard-sdk-directory.png       | Bin 39099 -> 0 bytes
 documentation/sdk-manual/figures/sdk-title.png     | Bin 31039 -> 0 bytes
 documentation/sdk-manual/intro.rst                 |   2 +-
 documentation/sdk-manual/svg/sdk-environment.svg   | 463 +++++++++++++++++++++
 documentation/sdk-manual/using.rst                 |  35 +-
 documentation/sdk-manual/working-projects.rst      | 112 +++--
 11 files changed, 746 insertions(+), 119 deletions(-)
---
base-commit: b8a56b8b2e8c0417b2f7204f80c79b05d95e9ce4
change-id: 20260114-code-block-misc-20260114-bf035e4362c2

Best regards,
-- 
Quentin Schulz <quentin.schulz@cherry.de>


