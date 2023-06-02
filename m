Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 159EBC77B7A
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 15:10:29 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.1578.1685718624267430713
 for <docs@lists.yoctoproject.org>;
 Fri, 02 Jun 2023 08:10:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=E0X0x0u5;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
X-GND-Sasl: michael.opdenacker@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1685718621;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=lxO4KeEgmIZ2upI6kZ2uceIW1ifuXsOWoIsebThrmWE=;
	b=E0X0x0u5kqEFkhwSuiPkKVmJFvyzqM/aL/0uymx1ETKPD8orVidTyyRhO4v/2DEsehvk9X
	VzNgBBUphrfekH4xQgaMf4FR/6rnheYtRVQSDl0XsmgoYWApIkObhDh71RwNRymHG5iVRT
	3qhIDbiLT20kn3CacS+0j/ah0PMwttYYrcAp6fBFpE3l3s1z5OQK3+i7QLk/uCDmLfQNMt
	NaCJNMacQ40C7kWuHA/Ys32yCQED5Vo7ESvz2HohnmlBu56EaX5a9WjioXktGnegTwwMst
	O1hIkD5gSLdNE5mezjSNRF/ej1SvShNbqi9wcJe+vud+Lz0Te9+PHqWmEZAkMw==
X-GND-Sasl: michael.opdenacker@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3283640008;
	Fri,  2 Jun 2023 15:10:21 +0000 (UTC)
Message-ID: <907f730f-1901-0a25-8c29-edb4da6aaac3@bootlin.com>
Date: Fri, 2 Jun 2023 17:10:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
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
 <docs@lists.yoctoproject.org>; Fri, 02 Jun 2023 15:10:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3984

Hi Richard,

The following changes since commit 084ba9fad50d9903f520d0333e6a7d5ed4f40cc9:

   migration-guides: release-notes-4.0.4.rst: fix typo (2023-05-25 
15:39:10 +0200)

are available in the Git repository at:

   git://git.yoctoproject.org/yocto-docs master-next

for you to fetch changes up to ad24794b095b17beee8e7bdb0b8c92ae72c6e5b0:

   sdk-manual: fix Makefile example (2023-06-01 15:51:33 +0200)

----------------------------------------------------------------
Daniel Ammann (1):
       overview-manual: concepts.rst: Fix a typo

Lee Chee Yang (1):
       migration-guides: add release notes for 4.2.1

Michael Opdenacker (2):
       ref-manual: document SPLASH variable
       manuals: document SPLASH_IMAGES variable

Tom Isaacson (1):
       sdk-manual: fix Makefile example

Ulrich Ölmann (1):
       ref-manual: classes.rst: fix typo

  documentation/dev-manual/custom-distribution.rst       |   9 ++++---
  documentation/migration-guides/release-4.2.rst         |   1 +
  documentation/migration-guides/release-notes-4.2.1.rst | 206 
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  documentation/overview-manual/concepts.rst             |   2 +-
  documentation/ref-manual/classes.rst                   |   2 +-
  documentation/ref-manual/features.rst                  |   2 +-
  documentation/ref-manual/variables.rst                 |  38 
++++++++++++++++++++++++++
  documentation/sdk-manual/working-projects.rst          |   6 ++---
  8 files changed, 256 insertions(+), 10 deletions(-)
  create mode 100644 documentation/migration-guides/release-notes-4.2.1.rst

Thank you in advance
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


