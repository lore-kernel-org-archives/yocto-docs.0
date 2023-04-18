Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5C1AC77B75
	for <webhook@archiver.kernel.org>; Tue, 18 Apr 2023 17:14:44 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.15856.1681838082434001020
 for <docs@lists.yoctoproject.org>;
 Tue, 18 Apr 2023 10:14:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ADtsgym1;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 331F4FF808;
	Tue, 18 Apr 2023 17:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1681838080;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=x0nVV0tW9sjyYqKPjMD58R+ITrLeNVcRxu5cts/Muc8=;
	b=ADtsgym1p6kigUJEhtzzY6wzhYLWglM++FHet1CPytPenqHzfKG0VEEyMlXYlMns6YM3rD
	Vh/13pXHD+H+WwiPmCurLRQZAv7IQyhM1kInUj+6Z7p4UUxKFfIsKhjc6cqWl+xRwoA6SI
	uyHjtIxU4pkRXGtSlahavP6LvvTqlPo/ZIIIcuvibPEPAJvwKHDZm3zK1W1qIIGc9BptDt
	86MJIXWFhtqevxjiR306QzlvIbI2XLF0iKrvR3MyaiRkgMMW4Bx2DseDZu8w42HVH1Z0hI
	NIgf5lJrl7UIbN+lkzruGrfKiJgsC8HyDyK1jwmel8CtgkGptVzE88f6Shv7zw==
Message-ID: <4926faa7-4343-6432-2b5d-b47feb2886b6@bootlin.com>
Date: Tue, 18 Apr 2023 19:14:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
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
 <docs@lists.yoctoproject.org>; Tue, 18 Apr 2023 17:14:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3848

Hello Richard,

The following changes since commit 3aac9f8b57434f3852a78915c326074252177515:

   migration-guides: update 4.2 migration and release notes (2023-04-12 
14:41:19 +0200)

are available in the Git repository at:

   git://git.yoctoproject.org/yocto-docs master-next

for you to fetch changes up to 1123e1eedb62d98d44e141d2a366794c1c82b45a:

   ref-manual: add "Mixin" term (2023-04-18 16:44:29 +0200)

----------------------------------------------------------------
Michael Opdenacker (8):
       ref-manual: classes.rst: document devicetree.bbclass
       ref-manual: remove unused and obsolete file
       ref-manual: variables.rst: add wikipedia shortcut for "getty"
       manuals: document INIT_MANAGER
       overview-manual: update section about source archives
       manuals: document SPDX_CUSTOM_ANNOTATION_VARS
       overview-manual: development-environment: update text and screenshots
       ref-manual: add "Mixin" term

  documentation/dev-manual/device-manager.rst               |   2 ++
  documentation/dev-manual/init-manager.rst                 | 111 
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++----------------------------------------------
  documentation/dev-manual/sbom.rst                         |   3 +++
  documentation/dev-manual/start.rst                        |  45 
++++++++++++---------------------------------
  documentation/migration-guides/migration-3.0.rst          |   6 +++---
  documentation/migration-guides/release-notes-4.2.rst      |   9 ++++++---
  documentation/overview-manual/development-environment.rst |  34 
+++++++++++-----------------------
  documentation/overview-manual/figures/index-downloads.png | Bin 18142 
-> 0 bytes
  documentation/overview-manual/figures/source-repos.png    | Bin 298757 
-> 775796 bytes
  documentation/overview-manual/figures/yp-download.png     | Bin 82939 
-> 518257 bytes
  documentation/ref-manual/TODO                             |  11 
-----------
  documentation/ref-manual/classes.rst                      |  43 
+++++++++++++++++++++++++++++++++++++++++++
  documentation/ref-manual/release-process.rst              |   8 +++++---
  documentation/ref-manual/terms.rst                        |   8 +++++++-
  documentation/ref-manual/variables.rst                    |  70 
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-----------
  15 files changed, 216 insertions(+), 134 deletions(-)
  delete mode 100755 
documentation/overview-manual/figures/index-downloads.png
  delete mode 100644 documentation/ref-manual/TODO

Thank you in advance
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


