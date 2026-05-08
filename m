Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8FF9CD37AD
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 16:59:44 +0000 (UTC)
Received: from smtp-1909.mail.infomaniak.ch (smtp-1909.mail.infomaniak.ch [185.125.25.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1618.1778259579385373764
 for <docs@lists.yoctoproject.org>;
 Fri, 08 May 2026 09:59:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@0leil.net header.s=20231125 header.b=hwdX78j+;
 spf=pass (domain: 0leil.net, ip: 185.125.25.9, mailfrom: foss+yocto@0leil.net)
Received: from smtp-4-0001.mail.infomaniak.ch (unknown [IPv6:2001:1600:7:10::a6c])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4gBwMY1VnFzDSD;
	Fri,  8 May 2026 18:59:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0leil.net;
	s=20231125; t=1778259577;
	bh=J/dgko9tJo6bkiTdVua+yrMnePSrfjrFi8K6QLNqwhw=;
	h=From:Subject:Date:To:Cc:From;
	b=hwdX78j+6PWxNjzOHVHG8PVJCE9Clt4CIbVs8i98NkVYQDIldGFJpnjB0O2xBBPY9
	 7WDdcpqEKD21BgtYL9H23tHpmGv7n6RXaqc13fsN5LQWs+9SV7M8dlySlmKjanVG8/
	 qOda9/M7kw8UCyXPmF07cJ4sjuY1uivAEsFdvcSEFmavBI1FXdYQu+6LozGXOQ6mOZ
	 hY9DGAwo0/AGTs+9jk/1WB5nf/tnGPhvt46ge65wDvOFSAI3z0hudIlD/3CjlOO0pE
	 pioB4wq8GxohWkku8v7kPpGyp+dYSb+sp9C/wcugzfaZdHTtnQcauI9/fl4ODZZJtB
	 5lD+xKb8WIhcg==
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4gBwMX4lX5znyH;
	Fri,  8 May 2026 18:59:36 +0200 (CEST)
From: Quentin Schulz <foss+yocto@0leil.net>
Subject: [PATCH 00/11] fix typos, grammar, consistency, missing word, and
 broken links
Date: Fri, 08 May 2026 18:59:24 +0200
Message-Id: <20260508-misc-typo-20260508-v1-0-8fb61b5358cc@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDUwML3dzM4mTdksqCfF24kKWZoVGyuaklEBoqATUWFKWmZVaADY2OhfC
 LS5OyUpNLQCYp1dYCAD7WOHZ2AAAA
X-Change-ID: 20260508-misc-typo-20260508-9612c7595951
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev-47773
X-Infomaniak-Routing: alpha
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 08 May 2026 16:59:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9405

Fix a few mistakes/oversight I stumbled upon while reviewing patches too
late :)

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
Quentin Schulz (11):
      migration-guides: fix https:// prefix missing in anonymous reference
      ref-manual: classes: fix https:// prefix missing in anonymous reference
      migration-guides: migration-6.0: reword meta-poky templates removal
      migration-guides: migration-6.0: fix grammar and missing word
      migration-guide: migration-6.0: fix typos in cve-check removal
      migration-guides: release-notes-6.0: fix typo in documentation changes
      ref-manual: classes: add missing "task" after create_recipe_sbom
      ref-manual: fix "include to" grammar for UKI_DEVICETREE
      ref-manual: fragments: fix style inconsistencies
      ref-manual: variables: add hyphen to "space separated"
      ref-manual: variables: add hyphen to "space separated" and "auto generated"

 documentation/migration-guides/migration-6.0.rst     | 13 +++++--------
 documentation/migration-guides/release-notes-6.0.rst |  4 ++--
 documentation/ref-manual/classes.rst                 |  8 ++++----
 documentation/ref-manual/fragments.rst               |  6 +++---
 documentation/ref-manual/variables.rst               |  8 ++++----
 5 files changed, 18 insertions(+), 21 deletions(-)
---
base-commit: 6b78593bed7174245fd7f6861263c69a3c439a74
change-id: 20260508-misc-typo-20260508-9612c7595951

Best regards,
--  
Quentin Schulz <quentin.schulz@cherry.de>


