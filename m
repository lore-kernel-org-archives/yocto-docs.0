Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD96BC54E76
	for <webhook@archiver.kernel.org>; Fri,  6 Jan 2023 17:12:01 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.19569.1673025112342637806
 for <docs@lists.yoctoproject.org>;
 Fri, 06 Jan 2023 09:11:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=kEsEAOE0;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 24D271BF20B;
	Fri,  6 Jan 2023 17:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1673025110;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=m3VAZnkyG2nUqZl/z3YRD8oTJpIIRhQlwZ4u4Iy0fAo=;
	b=kEsEAOE0BaYoaIIbYIHeFJWYaeeFtZzYCP3eMT6in1EgL7VRftWlS+FiTsvMw9udXaApok
	UheryVJ7XQyLadb4U1zGJvJvRrj9ILowQgoxggNCuCKoM+7VrV/qBi9m3LNeIkMf01ZESV
	1ZY9XyZQEQORRi8CdW/WcaXOIWxFBhI+s/sNbTo1WHU5c/yESoAsjaLcnxsDp9ZXZeuecU
	eWg0dPXCi5aSDufX8j0gmME5uUZX2MXJM50ua3iYWmEn+PMJnwb7ppBU7Y9ZXTcSpdp+7P
	pRTwayUgkdNN91XJFM+ynRCkhxb2pQ4s51rxGXI1xKodDgw/polB9KjMVWo6YQ==
Message-ID: <a23557be-328a-41fc-0af8-c7d551af346b@bootlin.com>
Date: Fri, 6 Jan 2023 18:11:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
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
 <docs@lists.yoctoproject.org>; Fri, 06 Jan 2023 17:12:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3599

Hi Richard,

The following changes since commit 9276628507233aef554450c807d8456a0eb00225:

   manuals: prepare 4.2 migration notes (2022-12-16 11:44:34 +0100)

are available in the Git repository at:

   git://git.yoctoproject.org/yocto-docs master-next

for you to fetch changes up to df8f862042633594846a93a1b7702fc01bc32ae0:

   ref-manual/system-requirements.rst: recommend buildtools for not 
supported distros (2023-01-06 17:47:59 +0100)

----------------------------------------------------------------
Lee Chee Yang (1):
       migration-guides: add release-notes for 4.0.6

Michael Opdenacker (6):
       migration-guides: fix 4.2 migration note issues
       toaster-manual: fix description of introduction video
       ref-manual/classes.rst: remove .bbclass from section titles
       manuals: simplify references to classes
       migration-1.6.rst: fix redundant reference
       ref-manual/system-requirements.rst: recommend buildtools for not 
supported distros

Quentin Schulz (2):
       docs: kernel-dev: faq: update tip on how to not include kernel in 
image
       docs: migration-guides: migration-4.0: specify variable name 
change for kernel inclusion in image recipe

  documentation/0001-manuals-prepare-4.2-migration-notes.patch | 134 
---------
  documentation/bsp-guide/bsp.rst                              | 2 +-
  documentation/dev-manual/build-quality.rst                   | 12 +-
  documentation/dev-manual/building.rst                        | 15 +-
  documentation/dev-manual/debugging.rst                       | 8 +-
  documentation/dev-manual/disk-space.rst                      | 3 +-
  documentation/dev-manual/error-reporting-tool.rst            | 6 +-
  documentation/dev-manual/gobject-introspection.rst           | 4 +-
  documentation/dev-manual/licenses.rst                        | 19 +-
  documentation/dev-manual/new-recipe.rst                      | 85 +++---
  documentation/dev-manual/packages.rst                        | 16 +-
  documentation/dev-manual/quilt.rst                           | 4 +-
  documentation/dev-manual/read-only-rootfs.rst                | 2 +-
  documentation/dev-manual/runtime-testing.rst                 | 4 +-
  documentation/dev-manual/sbom.rst                            | 4 +-
  documentation/dev-manual/securing-images.rst                 | 8 +-
  documentation/dev-manual/speeding-up-build.rst               | 3 +-
  documentation/dev-manual/upgrading-recipes.rst               | 3 +-
  documentation/dev-manual/vulnerabilities.rst                 | 10 +-
  documentation/dev-manual/wic.rst                             | 3 +-
  documentation/kernel-dev/common.rst                          | 10 +-
  documentation/kernel-dev/faq.rst                             | 2 +-
  documentation/migration-guides/migration-1.3.rst             | 12 +-
  documentation/migration-guides/migration-1.5.rst             | 9 +-
  documentation/migration-guides/migration-1.6.rst             | 14 +-
  documentation/migration-guides/migration-1.7.rst             | 13 +-
  documentation/migration-guides/migration-1.8.rst             | 28 +-
  documentation/migration-guides/migration-2.0.rst             | 2 +-
  documentation/migration-guides/migration-2.1.rst             | 32 +--
  documentation/migration-guides/migration-2.3.rst             | 22 +-
  documentation/migration-guides/migration-2.4.rst             | 12 +-
  documentation/migration-guides/migration-2.5.rst             | 10 +-
  documentation/migration-guides/migration-2.6.rst             | 18 +-
  documentation/migration-guides/migration-2.7.rst             | 3 +-
  documentation/migration-guides/migration-3.0.rst             | 6 +-
  documentation/migration-guides/migration-3.1.rst             | 6 +-
  documentation/migration-guides/migration-3.2.rst             | 33 ++-
  documentation/migration-guides/migration-3.3.rst             | 17 +-
  documentation/migration-guides/migration-3.4.rst             | 4 +-
  documentation/migration-guides/migration-4.0.rst             | 24 +-
  documentation/migration-guides/migration-4.1.rst             | 10 +-
  documentation/migration-guides/migration-general.rst         | 14 +-
  documentation/migration-guides/release-4.0.rst               | 1 +
  documentation/migration-guides/release-notes-3.4.rst         | 4 +-
  documentation/migration-guides/release-notes-4.0.6.rst       | 313 
++++++++++++++++++++
  documentation/migration-guides/release-notes-4.0.rst         | 11 +-
  documentation/migration-guides/release-notes-4.1.rst         | 30 +-
  documentation/migration-guides/release-notes-4.2.rst         | 2 +-
  documentation/overview-manual/concepts.rst                   | 58 ++--
  documentation/ref-manual/classes.rst                         | 1199 
+++++++++++++++++++++++++++++++++++++---------------------------------------
  documentation/ref-manual/features.rst                        | 2 +-
  documentation/ref-manual/qa-checks.rst                       | 12 +-
  documentation/ref-manual/structure.rst                       | 4 +-
  documentation/ref-manual/system-requirements.rst             | 11 +-
  documentation/ref-manual/tasks.rst                           | 10 +-
  documentation/ref-manual/variables.rst                       | 690 
+++++++++++++++++++++-----------------------
  documentation/sdk-manual/appendix-customizing.rst            | 3 +-
  documentation/sdk-manual/extensible.rst                      | 5 +-
  documentation/test-manual/intro.rst                          | 18 +-
  documentation/test-manual/understand-autobuilder.rst         | 2 +-
  documentation/toaster-manual/intro.rst                       | 5 +-
  61 files changed, 1553 insertions(+), 1473 deletions(-)
  delete mode 100644 
documentation/0001-manuals-prepare-4.2-migration-notes.patch
  create mode 100644 documentation/migration-guides/release-notes-4.0.6.rst

Thank you in advance,
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


