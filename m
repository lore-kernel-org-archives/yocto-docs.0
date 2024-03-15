Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 779B7C54E67
	for <webhook@archiver.kernel.org>; Fri, 15 Mar 2024 13:01:50 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.21591.1710507706823533556
 for <docs@lists.yoctoproject.org>;
 Fri, 15 Mar 2024 06:01:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=AB447QnR;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4009A2000F;
	Fri, 15 Mar 2024 13:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1710507705;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Pyib4R3lplK6hdSCoz/5dIXQFittDvA7rkn23P1aB1s=;
	b=AB447QnR7nPfGT3J37/TFZs9TB9KgZv9r9nXB1O19DHuj5AoijIEFXGyGA7ay6nAbhEQbP
	c11K+17quGiJxOodRkVnaDBR2YoREeoFxduHhKRxFiXcKu4tuahweW1rjAaH4J9jpGlr7m
	SJy6GTAorNxwhndAIMlXciokchNFXpFoLohAbZkVLNaVtHekW1TdSPhALEMn4JDTtRVbDQ
	eKxpZuqUu4SK8Zu7Gw/qVvG51vKiQ9CjLfarFRoXeoSWq0HfrWT7dY/MBxl6YeDP2l9792
	alV0tqSqxtVK7j244NPrJzSH1CcS9NtZpxtWeAXnGa7xIHupHc3SEJqKV9hYyw==
Message-ID: <d1cb2b4d-5e76-48ab-ad8f-89edbbf3e81a@bootlin.com>
Date: Fri, 15 Mar 2024 14:01:39 +0100
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
 <docs@lists.yoctoproject.org>; Fri, 15 Mar 2024 13:01:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4982

Hi Richard,

The following changes since commit 9c1505eabd69af548652381cf996d44f40a4fa8a:

   dev-manual: bmaptool: rename (2024-03-06 16:15:49 +0100)

are available in the Git repository at:

   git://git.yoctoproject.org/yocto-docs master-next

for you to fetch changes up to fc808b2dca4321209bfa6206d9e43aa1a5a0c5b8:

   profile-manual: usage.rst: further style improvements (2024-03-15 
13:57:07 +0100)

----------------------------------------------------------------
Lee Chee Yang (1):
       migration-guides: add release notes for 4.0.17

Martin Jansa (1):
       contributor-guide: be more specific about meta-* trees

Michael Opdenacker (8):
       manuals: add initial stylechecks with Vale
       profile-manual: usage.rst: formatting fixes
       manuals: use "manual page(s)"
       profile-manual: usage.rst: fix reference to bug report
       documentation: Makefile: remove releases.rst in "make clean"
       migration-guides: draft notes for upcoming release 5.0
       manuals: add initial stylechecks with Vale
       profile-manual: usage.rst: further style improvements

Ulrich Ölmann (1):
       ref-manual: classes: update description of class 'image_types'

  documentation/.gitignore |   2 +
  documentation/.vale.ini |   7 ++
  documentation/Makefile                                         | 15 ++-
  documentation/README                                           | 14 +++
  documentation/contributor-guide/submit-changes.rst |   2 +-
  documentation/migration-guides/index.rst |   1 +
  documentation/migration-guides/migration-5.0.rst               | 105 
+++++++++++++++++++
  documentation/migration-guides/release-4.0.rst |   1 +
  documentation/migration-guides/release-5.0.rst |   9 ++
  documentation/migration-guides/release-notes-4.0.17.rst        | 238 
+++++++++++++++++++++++++++++++++++++++++++
  documentation/migration-guides/release-notes-5.0.rst           | 66 
++++++++++++
  documentation/profile-manual/usage.rst                         | 734 
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-------------------------------------------------------------------
  documentation/ref-manual/classes.rst                           | 10 +-
  documentation/ref-manual/variables.rst |   2 +-
  documentation/standards.md                                     | 15 +++
  documentation/styles/config/vocabularies/OpenSource/accept.txt | 20 ++++
  documentation/styles/config/vocabularies/Yocto/accept.txt |   5 +
  17 files changed, 872 insertions(+), 374 deletions(-)
  create mode 100644 documentation/.vale.ini
  create mode 100644 documentation/migration-guides/migration-5.0.rst
  create mode 100644 documentation/migration-guides/release-5.0.rst
  create mode 100644 documentation/migration-guides/release-notes-4.0.17.rst
  create mode 100644 documentation/migration-guides/release-notes-5.0.rst
  create mode 100644 
documentation/styles/config/vocabularies/OpenSource/accept.txt
  create mode 100644 
documentation/styles/config/vocabularies/Yocto/accept.txt

Thank you in advance
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


