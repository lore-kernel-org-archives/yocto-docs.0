Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1074ECCF9F0
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 17:43:00 +0000 (UTC)
Received: from smtp-42ad.mail.infomaniak.ch (smtp-42ad.mail.infomaniak.ch [84.16.66.173])
 by mx.groups.io with SMTP id smtpd.web11.11089.1761759778313287678
 for <docs@lists.yoctoproject.org>;
 Wed, 29 Oct 2025 10:42:58 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 84.16.66.173, mailfrom: foss+yocto@0leil.net)
Received: from smtp-4-0001.mail.infomaniak.ch (unknown [IPv6:2001:1600:7:10::a6c])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4cxZMh3GsfzTV8;
	Wed, 29 Oct 2025 18:42:56 +0100 (CET)
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4cxZMg5SwTzFnk;
	Wed, 29 Oct 2025 18:42:55 +0100 (CET)
From: Quentin Schulz <foss+yocto@0leil.net>
Subject: [PATCH 0/3] migrate most bitbake -e instructions to bitbake-getvar
Date: Wed, 29 Oct 2025 18:42:39 +0100
Message-Id: <20251029-bitbake-e-v1-0-c06ad212db9e@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA9SAmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDAyNL3aTMkqTE7FTdVF2jRPNUi8REcwtzAyMloPqCotS0zAqwWdGxtbU
 As8ReYFsAAAA=
X-Change-ID: 20251029-bitbake-e-2a7e8aa78702
To: docs@lists.yoctoproject.org
Cc: "Robert P. J. Day" <rpjday@crashcourse.ca>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.3
X-Infomaniak-Routing: alpha
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 29 Oct 2025 17:43:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7903

As reported by Robert, we still have a few examples with bitbake -e
instructions instead of the more user-friendly bitbake-getvar.

This migrates what I believe to be the last instances of bitbake -e we
can currently replace with bitbake-getvar.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
Quentin Schulz (3):
      kernel-dev: common: migrate bitbake -e to bitbake-getvar
      ref-manual: variables: migrate the OVERRIDES note to bitbake-getvar
      dev-manual: debugging: use bitbake-getvar in Viewing Variable Values section

 documentation/dev-manual/debugging.rst | 34 ++++++++++++++++++++--------------
 documentation/kernel-dev/common.rst    | 12 +++++-------
 documentation/ref-manual/variables.rst |  4 ++--
 3 files changed, 27 insertions(+), 23 deletions(-)
---
base-commit: 8b85245490ae0b19a9c3880ec31e55b42e19d094
change-id: 20251029-bitbake-e-2a7e8aa78702

Best regards,
-- 
Quentin Schulz <quentin.schulz@cherry.de>


