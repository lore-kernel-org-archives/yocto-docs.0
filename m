Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6976EEB64D7
	for <webhook@archiver.kernel.org>; Fri, 16 Jun 2023 16:06:59 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.2716.1686931616200699974
 for <docs@lists.yoctoproject.org>;
 Fri, 16 Jun 2023 09:06:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=KAWpt6RL;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
X-GND-Sasl: michael.opdenacker@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1686931614;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=4F/Sv9XNBuFldXMMgW6OtOIHDthCXoyIJFPvk4p+I6o=;
	b=KAWpt6RLKm8WZGo8w0hJn20mqtrbyBNxotLgyofa5Jg5MaqX2QXpq/kyOiigAKQDH/+5tI
	BLNBYDZH+amSkAi/XvCZ3DM2ucCo8UXYRs16spm4xDXgki3Q1i9l1Me1tu0MihKgNbUcBr
	6CHDU0v85UxwKvHalhA7xSpZ4ea73l97YiBy+yl0oZ9nzYkkbBZcbv+0c+N43gmEA2+CCh
	bkij8KkUNl9Z7chIIelicvynMLbh9KYa23dsS4habdcqynBmddQd1+G83N+K2YFoqjJgD7
	Gy5eQFmcALZtkV7HTV/hKveYe5jJ3TM82ID2q+0uWC/mL4C6meL8SSVe7WJvlw==
X-GND-Sasl: michael.opdenacker@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8ACF51C0008;
	Fri, 16 Jun 2023 16:06:53 +0000 (UTC)
Message-ID: <0f8667ec-f66f-0968-f1b1-693d89122b70@bootlin.com>
Date: Fri, 16 Jun 2023 18:06:53 +0200
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
 <docs@lists.yoctoproject.org>; Fri, 16 Jun 2023 16:06:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4001

Hi Richard,

The following changes since commit ad24794b095b17beee8e7bdb0b8c92ae72c6e5b0:

   sdk-manual: fix Makefile example (2023-06-01 15:51:33 +0200)

are available in the Git repository at:

   git://git.yoctoproject.org/yocto-docs master-next

for you to fetch changes up to c74928b1a7b2f285ed70999539f0c630316ad364:

   reproducible-builds.rst: document OEQA_REPRODUCIBLE_TEST_TARGET and 
OEQA_REPRODUCIBLE_TEST_SSTATE_TARGETS (2023-06-15 19:42:32 +0200)

----------------------------------------------------------------
Ed Beroset (1):
       Add clarification for SRCREV

Hannu Lounento (1):
       profile-manual: fix blktrace remote usage instructions

Michael Opdenacker (1):
       migration-guides: release-notes-4.3: update documentation notes

Mikko Rapeli (2):
       variables.rst: document OEQA_REPRODUCIBLE_TEST_TARGET and 
OEQA_REPRODUCIBLE_TEST_SSTATE_TARGETS
       reproducible-builds.rst: document OEQA_REPRODUCIBLE_TEST_TARGET 
and OEQA_REPRODUCIBLE_TEST_SSTATE_TARGETS

  documentation/migration-guides/release-notes-4.3.rst |  9 +++++++++
  documentation/profile-manual/usage.rst               | 19 
++++++++++---------
  documentation/ref-manual/variables.rst               | 11 ++++++++++-
  documentation/test-manual/reproducible-builds.rst    |  8 +++++---
  4 files changed, 34 insertions(+), 13 deletions(-)

Thank you in advance
Cheers
Michael

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


