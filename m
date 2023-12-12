Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 784E5C4167B
	for <webhook@archiver.kernel.org>; Tue, 12 Dec 2023 09:45:15 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.13115.1702374311702753977
 for <docs@lists.yoctoproject.org>;
 Tue, 12 Dec 2023 01:45:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=pChl12EC;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AB63DFF80F;
	Tue, 12 Dec 2023 09:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1702374310;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=O4kePFyBjs0R1UU0BUdI4Xfm+pbvXNA1xZJPJ34xoH8=;
	b=pChl12ECnMwzdouTsxiRopZ4Yrub228fYYtfywTv7YO59D+q4FazjUePGAcr4MUtWUVf4w
	xyuy3DAWFiHzSvoOVr3m+nZX3Q1dKh2Wq3x0nknaIYoydEKyqsDBkuc7AYASg+gnRMDmIq
	8rM1MqGPdYcghFq1JAQnANyCiMJynEh62cPYYhXaYjtLIoRVQiuCWulIyWT8rthEEE6jvl
	L+Yq+ToVw/BjFoPNI5DQfP4cIJ3F9ilMZ75iwJpTt72pVaqJcYa7XjgZf7fMLiYpug/jbQ
	3pXIhJmH+Ezn+YOLPB+SURoXj6mB6UjJdicDXxb0nlvG5Xhk6slN1fjfpQElEg==
Message-ID: <f5ef1f5d-e0d3-4860-8a8d-abd84c9fb76d@bootlin.com>
Date: Tue, 12 Dec 2023 10:45:09 +0100
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
 <docs@lists.yoctoproject.org>; Tue, 12 Dec 2023 09:45:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4679

Hi Richard,

The following changes since commit 7107e18bfa4cf24b912df6c60d8ffb8c74152bca:

   migration-guides: release 3.5 is actually 4.0 (2023-11-30 15:45:49 +0100)

are available in the Git repository at:

   git://git.yoctoproject.org/yocto-docs master-next

for you to fetch changes up to d4a836d1ea2b97c81f7edb4dc234b4a1bd532766:

   manuals: brief-yoctoprojectqs: align variable order with default 
local.conf (2023-12-12 10:37:00 +0100)

----------------------------------------------------------------
Etienne Cordonnier (1):
       manuals: document minidebuginfo

Lee Chee Yang (1):
       migration-guides: reword fix in release-notes-4.3.1

Michael Opdenacker (6):
       test-manual: text and formatting fixes
       test-manual: resource updates
       test-manual: use working example
       test-manual: add links to python unittest
       test-manual: explicit or fix file paths
       test-manual: add or improve hyperlinks

Peter Kjellerstedt (1):
       dev-manual: Discourage the use of SRC_URI[md5sum]

Simone Weiß (1):
       manuals: brief-yoctoprojectqs: align variable order with default 
local.conf

  documentation/brief-yoctoprojectqs/index.rst           |   4 ++--
  documentation/dev-manual/debugging.rst                 |  17 
++++++++++++++++-
  documentation/dev-manual/new-recipe.rst                |  27 
++++++++++++++++-----------
  documentation/migration-guides/release-notes-4.3.1.rst |   2 +-
  documentation/ref-manual/features.rst                  |   3 +++
  documentation/test-manual/intro.rst                    | 112 
++++++++++++++++++++++++++++++++++++++++++++++++++++++++--------------------------------------------------------
  documentation/test-manual/test-process.rst             |  44 
+++++++++++++++++++++-----------------------
  documentation/test-manual/understand-autobuilder.rst   |  62 
++++++++++++++++++++++++++++++++------------------------------
  8 files changed, 147 insertions(+), 124 deletions(-)

Thank you in advance
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


