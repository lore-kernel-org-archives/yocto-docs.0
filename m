Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACE23C77B7F
	for <webhook@archiver.kernel.org>; Fri, 12 May 2023 08:35:21 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.19151.1683880516932517401
 for <docs@lists.yoctoproject.org>;
 Fri, 12 May 2023 01:35:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=PNZI9Fbc;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id C4A89FF806;
	Fri, 12 May 2023 08:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1683880514;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=QDONUMgzbM8t/LnYnY5wa76uiM84lTcTfuvyZsEDGQ8=;
	b=PNZI9Fbc1NpbXMfvq/BSVktnpt6nGUJesQ0LwdgV+8+4ZVf6/P3Tn/2Sr0pskQdlMRDW6L
	AzEsS5DT7+LRFBS0WUhLmoA+7NY3ygxgMN1i8XOkc945DPqXkJnzgecgKil0eeuYXw5lnQ
	k0AnxcDKasYupfnqm+wDvo0joSjNXJzghCoEgE+eXTYQ+iqoqzggTuMN1L2jHY8y5t+WZy
	XPpAVVDQIOKdI/1T0uvgQFF6DL5thBCWa1cWevyYcFaSBJecgweAueM0pe3YTMNoiWVSNJ
	+2MWg9Z9WFV/y72SpM10kpBuXbx0M2d/CMqLye/LOSS0F5Z5+D9izGjI0TJ3pw==
Message-ID: <af1894dc-cd7e-c127-aadd-35d58c514fa3@bootlin.com>
Date: Fri, 12 May 2023 10:35:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [master] Pull request
Organization: Bootlin
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 12 May 2023 08:35:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3937

Hi Richard

The following changes since commit 220b25d7d47d46b0d85c616b88ead75fab917092:

   ref-manual: classes: kernel: document automatic defconfig usage 
(2023-05-05 20:38:37 +0200)

are available in the Git repository at:

   git://git.yoctoproject.org/yocto-docs master-next

for you to fetch changes up to 77c0076a5dc35282aa09fb4453a69e2f4738b09e:

   migration-guides: add release-notes for 4.1.4 (2023-05-12 10:27:32 +0200)

----------------------------------------------------------------
Lee Chee Yang (2):
       release-notes-4.2: update known issues and Repositories/Downloads
       migration-guides: add release-notes for 4.1.4

Michael Opdenacker (5):
       migration-guides: release-notes-4.2: add doc improvement highlights
       migration-guides: release-notes-4.3: add stub section for 
documentation changes
       releases.svg: update according to latest release
       ref-manual: improve description of kernel-fitimage variables
       ref-manual: document uboot-sign class and variables

Petr Kubizňák (1):
       ref-manual: document devicetree class variables

  documentation/dev-manual/new-recipe.rst                |   2 ++
  documentation/migration-guides/release-4.1.rst         |   1 +
  documentation/migration-guides/release-notes-4.1.4.rst | 254 
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  documentation/migration-guides/release-notes-4.2.rst   |  79 
++++++++++++++++++++++++++++++++++++++++++++
  documentation/migration-guides/release-notes-4.3.rst   |   2 ++
  documentation/ref-manual/classes.rst                   |  51 
+++++++++++++++++++++++++---
  documentation/ref-manual/svg/releases.svg              |  22 ++++++-------
  documentation/ref-manual/system-requirements.rst       |   2 ++
  documentation/ref-manual/variables.rst                 | 248 
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-------------------------
  9 files changed, 602 insertions(+), 59 deletions(-)
  create mode 100644 documentation/migration-guides/release-notes-4.1.4.rst

Thank you in advance
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


