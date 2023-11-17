Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E356C54FB9
	for <webhook@archiver.kernel.org>; Fri, 17 Nov 2023 18:57:36 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.3673.1700247454147224022
 for <docs@lists.yoctoproject.org>;
 Fri, 17 Nov 2023 10:57:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=hEJKULt1;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CDEEE1C0004;
	Fri, 17 Nov 2023 18:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1700247451;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=TF+HB5xzJh/ThlRdQL0Jtw7pDn4DdopDRr7AyY6kVtg=;
	b=hEJKULt1PLZ11nZbwOcZJYF+ls/2zcOVmek4A1FX5f0dwv21AIs/umngl3Ag+EP8iHP09X
	tT/QXFy8Cqh306B4lnGUzo39C/c8oh7t7XPmhrStgR/6xQ7OJclyU1Jhgqijn/airpRw5e
	KlvUF4PxaA+LSLyN/30vBISdpZOX1bKkSUjVaALiaMw0pekj98pbnOCoLG8nQXFroJ8r7D
	43vv58HaS6CcUROUhJMtF+H3vkBwBWrmhVZ6LF0G8TQg0o7cUzFSZ22Wx98COGpA0jIDi5
	E5QspNZ5zAzoHDw5PPikWjT6GYcVJM/iJsdHc5mo+8AXAj1aU/OT9YUv/zrpFQ==
Message-ID: <cd41b4ac-6422-443b-afb9-aec9ebd6a82a@bootlin.com>
Date: Fri, 17 Nov 2023 19:57:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [master] Pull request
Organization: Bootlin
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 17 Nov 2023 18:57:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4637

Hi Richard

The following changes since commit cfbb2cda2c3d221f944ae610c05039c9d12093bc:

   docs: add support for nanbield (4.3) release (2023-11-09 09:09:49 -0800)

are available in the Git repository at:

   git://git.yoctoproject.org/yocto-docs master-next

for you to fetch changes up to de4fb1f877ae9994c61dfc60447446da317bee0f:

   migration-guide: add release notes for 4.2.4 (2023-11-16 10:29:02 +0100)

----------------------------------------------------------------
Lee Chee Yang (3):
       release-notes-4.3: add Repositories / Downloads section
       migration-guide: add release notes for 4.0.14
       migration-guide: add release notes for 4.2.4

Michael Opdenacker (2):
       manuals: fix URL
       ref-manual: releases.svg: update nanbield release status

Paul Barker (1):
       ref-manual: Fix reference to MIRRORS/PREMIRRORS defaults

  documentation/migration-guides/release-4.0.rst          |   1 +
  documentation/migration-guides/release-4.2.rst          |   1 +
  documentation/migration-guides/release-notes-4.0.14.rst | 227 
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  documentation/migration-guides/release-notes-4.2.4.rst  | 364 
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  documentation/migration-guides/release-notes-4.3.rst    |  60 
++++++++++++++++++++
  documentation/ref-manual/svg/releases.svg               |  32 +++++------
  documentation/ref-manual/variables.rst                  |  10 ++--
  documentation/what-i-wish-id-known.rst                  |   5 +-
  8 files changed, 676 insertions(+), 24 deletions(-)
  create mode 100644 documentation/migration-guides/release-notes-4.0.14.rst
  create mode 100644 documentation/migration-guides/release-notes-4.2.4.rst

Thank you in advance
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


