Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 020FFC4706C
	for <webhook@archiver.kernel.org>; Fri, 12 Jan 2024 10:07:03 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.4044.1705054020275105573
 for <docs@lists.yoctoproject.org>;
 Fri, 12 Jan 2024 02:07:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=m1ojWqtO;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2B24320008;
	Fri, 12 Jan 2024 10:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1705054018;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ErbN4VxJQz7DfiQ+WcQow7VVGZTZsG8LE3oEjQbpQ84=;
	b=m1ojWqtOwp2d6S1Xe6ILx/PAtAJzYg4n5iwp9HCgkAOEqhcK9XUCbtaVssAiNLXQt3pPpR
	SAiMT3GAaU06kBADFMnrEu1kjgcKzoZyMpNuNAlwCU/YhHZ64IJHWiPgPx4oqpIo53QZYz
	Yhki8jU299P3haNXkCe2QwHi/9b7uf6QIBbeYlVOxC1zGPgsXFLypiHLu8nR4xvwSX+kQC
	iJPq9E5/QGLS+dP8E/NRwgmQ89xFwDGQlGAfB7wV1sS3sGjdbS9egCYZeKAUwMcdtBo1CW
	sAsA6EVcheFHKGtGsqY04xBbs/tmL9uLCgZfeGgdGWYkUBO0sYBh/5+tdKU1xg==
Message-ID: <7629831f-6e8b-4c63-9c56-bc75c4c4c2d3@bootlin.com>
Date: Fri, 12 Jan 2024 11:06:57 +0100
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
 <docs@lists.yoctoproject.org>; Fri, 12 Jan 2024 10:07:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4763

Hi Richard

The following changes since commit e52128cd0e555f16c86812a21e92f27ca5d76152:

   migration-guides: add release notes for 4.0.15 (2023-12-18 10:49:00 
+0100)

are available in the Git repository at:

   git://git.yoctoproject.org/yocto-docs master-next

for you to fetch changes up to 29cee590d59294306600a119048a234f10375603:

   migration-guide: add release notes for 4.3.2 (2024-01-11 14:37:32 +0100)

----------------------------------------------------------------
Adrian Freihofer (1):
       ref-manual: document cmake-qemu class

Enguerrand de Ribaucourt (1):
       manuals: document VSCode extension

Ilya A. Kriveshko (1):
       dev-manual: update license manifest path

Jörg Sommer (1):
       documentation: Add UBOOT_BINARY, extend UBOOT_CONFIG

Lee Chee Yang (1):
       migration-guide: add release notes for 4.3.2

Maxin B. John (1):
       ref-manual: classes: remove insserv bbclass

Michael Opdenacker (2):
       contributor-guide: use "apt" instead of "aptitude"
       ref-manual: update tested and supported distros

Simone Weiß (1):
       dev-manual: start.rst: update use of Download page

  documentation/contributor-guide/submit-changes.rst        |   2 +-
  documentation/dev-manual/building.rst                     |   4 +++
  documentation/dev-manual/licenses.rst                     |   2 +-
  documentation/dev-manual/start.rst                        |  33 
+++++++++++++-------
  documentation/migration-guides/release-4.3.rst            |   1 +
  documentation/migration-guides/release-notes-4.3.2.rst    | 247 
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  documentation/overview-manual/development-environment.rst |   8 +++++
  documentation/overview-manual/yp-intro.rst                |  20 
++++++++++++
  documentation/ref-manual/classes.rst                      |  41 
+++++++++++++++++-------
  documentation/ref-manual/resources.rst                    |   5 +++
  documentation/ref-manual/system-requirements.rst          |  17 +++++-----
  documentation/ref-manual/variables.rst                    |  39 
+++++++++++++----------
  documentation/what-i-wish-id-known.rst                    |   7 +++++
  13 files changed, 376 insertions(+), 50 deletions(-)
  create mode 100644 documentation/migration-guides/release-notes-4.3.2.rst

Thank you in advance
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


