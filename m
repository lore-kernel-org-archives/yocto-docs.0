Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8612CC35274
	for <webhook@archiver.kernel.org>; Mon, 18 Dec 2023 09:58:54 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.41076.1702893523765078129
 for <docs@lists.yoctoproject.org>;
 Mon, 18 Dec 2023 01:58:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=XPukXbYA;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 43FB260003;
	Mon, 18 Dec 2023 09:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1702893522;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=7AVoz8fz2oNiOqcYSCj5zMa8rvkxedDF4yy/eHrcJLk=;
	b=XPukXbYAgj4ob+s8jaMMDlBo+Eis/D1EAPU+IoQuUOYaYPlmhVN8oFvmu6q0kCbYPphmvo
	lTiV4wGp7ScqAgZW+0qr4qHWwQDKHiBy9/m5qnLnejQRDNQja3G8518Y/kIWsx8RhdVb9u
	m7WjvBp66/snk59+PE4niLNE4RPogJiyaaddagysLPPfOYxWDBvmRIwEmGrzD8DZQvoTqj
	eLB6OYgn6Kx0AS0PSAZKcPrjTYUmYG7M5TPa5v7LBLCKhnTDiWF9tuCYc/h5lhU2WelTEi
	5mU2umnoTjtXBIGZvI5kER1eQ0Vj3kxmGSXL45f0tkKuzLm2j8lZKccHv66BXw==
Message-ID: <669b2107-8e44-4fdc-b500-f725d98bfd50@bootlin.com>
Date: Mon, 18 Dec 2023 10:58:41 +0100
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
 <docs@lists.yoctoproject.org>; Mon, 18 Dec 2023 09:58:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4683

Hi Richard,

The following changes since commit 7107e18bfa4cf24b912df6c60d8ffb8c74152bca:

   migration-guides: release 3.5 is actually 4.0 (2023-11-30 15:45:49 +0100)

are available in the Git repository at:

   git://git.yoctoproject.org/yocto-docs master-next

for you to fetch changes up to e52128cd0e555f16c86812a21e92f27ca5d76152:

   migration-guides: add release notes for 4.0.15 (2023-12-18 10:49:00 
+0100)

----------------------------------------------------------------
Etienne Cordonnier (1):
       manuals: document minidebuginfo

Lee Chee Yang (2):
       migration-guides: reword fix in release-notes-4.3.1
       migration-guides: add release notes for 4.0.15

Michael Opdenacker (7):
       test-manual: text and formatting fixes
       test-manual: resource updates
       test-manual: use working example
       test-manual: add links to python unittest
       test-manual: explicit or fix file paths
       test-manual: add or improve hyperlinks
       dev-manual: runtime-testing: fix test module name

Peter Kjellerstedt (1):
       dev-manual: Discourage the use of SRC_URI[md5sum]

Simone Weiß (1):
       manuals: brief-yoctoprojectqs: align variable order with default 
local.conf

  documentation/brief-yoctoprojectqs/index.rst            |   4 ++--
  documentation/dev-manual/debugging.rst                  |  17 
+++++++++++++-
  documentation/dev-manual/new-recipe.rst                 |  27 
++++++++++++---------
  documentation/dev-manual/runtime-testing.rst            |   2 +-
  documentation/migration-guides/release-4.0.rst          |   1 +
  documentation/migration-guides/release-notes-4.0.15.rst | 189 
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  documentation/migration-guides/release-notes-4.3.1.rst  |   2 +-
  documentation/ref-manual/features.rst                   |   3 +++
  documentation/test-manual/intro.rst                     | 112 
+++++++++++++++++++++++++++++++++++++++++++--------------------------------------------
  documentation/test-manual/test-process.rst              |  44 
+++++++++++++++++-----------------
  documentation/test-manual/understand-autobuilder.rst    |  62 
++++++++++++++++++++++++------------------------
  11 files changed, 338 insertions(+), 125 deletions(-)
  create mode 100644 documentation/migration-guides/release-notes-4.0.15.rst

Thank you in advance
Cheers
Michael.


-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


