Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6824CC6FD18
	for <webhook@archiver.kernel.org>; Fri, 31 Mar 2023 09:36:47 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.50533.1680255399451933785
 for <docs@lists.yoctoproject.org>;
 Fri, 31 Mar 2023 02:36:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=U2WI9Tv7;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 6A44820009;
	Fri, 31 Mar 2023 09:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1680255397;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ccvMyxm484p/pZ7ugsR0/BQlmqzsJMlDW3wetWpRpIk=;
	b=U2WI9Tv7S26HRwEWRQBTBuPcRaFNwJ1+HPKvXiJnB9x9KfaXIW0977YJj46U64mC91LB7d
	1ftHHTBb4Gy6y/CLWm5yBmqfut3SR43I8y9GAY2WTVzc7n2MPM4MtT6TP8edDEM/WwSIih
	yGChzvPv7TkHZ399A2jKUaphFUamEcR1gqN08Gmy/UFYAB6ti5VQeA8L0ullhjo1jN6RB6
	Hsoy384VQ6ANKUDr5xc/9lZ3rmzxeqc+McJrHVj+leOv05uWuax1WPVaCB6cH4Z0aS0NvZ
	mkzs+/HReLybHgwFrcHJGxPgdz/gnMYLupxVljf5lN81shhQHOI3DAhNszmeXA==
Message-ID: <3959dfa5-8ef0-6b2b-a227-161ec165fb0d@bootlin.com>
Date: Fri, 31 Mar 2023 11:36:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [master] pull request
Organization: Bootlin
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 31 Mar 2023 09:36:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3820

Hi Richard

The following changes since commit 87cdda981fa6a3d05c559fb00e214214956346dc:

   ref-manual: variables.rst: update LAYERSERIES_COMPAT (2023-03-17 
17:23:02 +0100)

are available in the Git repository at:

   git://git.yoctoproject.org/yocto-docs master-next

for you to fetch changes up to c6cc3403bcb4b12de74d89f563020669340592ed:

   ref-manual: classes.rst: fix typo (2023-03-28 19:24:35 +0200)

----------------------------------------------------------------
Michael Opdenacker (6):
       manuals: update disk space requirements
       manuals: add rm_work disk space data
       manuals: add minimum RAM requirements
       ref-manual: release-process.rst: update testing section
       ref-manual: release-process.rst: major updates
       manuals: add "LTS" term

Ulrich Ölmann (2):
       kernel-dev: fix typos
       ref-manual: classes.rst: fix typo

  documentation/brief-yoctoprojectqs/index.rst           |    8 +-
  documentation/dev-manual/disk-space.rst                |    6 +
  documentation/dev-manual/securing-images.rst           |    2 +-
  documentation/kernel-dev/common.rst                    |    4 +-
  documentation/migration-guides/release-notes-4.0.1.rst |    2 +-
  documentation/poky.yaml.in                             |    6 +
  documentation/ref-manual/classes.rst                   |    2 +-
  documentation/ref-manual/release-process.rst           |   72 +++---
  documentation/ref-manual/svg/releases.svg              | 1230 
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  documentation/ref-manual/system-requirements.rst       |   19 ++
  documentation/ref-manual/terms.rst                     |    6 +
  11 files changed, 1320 insertions(+), 37 deletions(-)
  create mode 100644 documentation/ref-manual/svg/releases.svg

Thank you in advance
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


