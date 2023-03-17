Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73977C6FD1D
	for <webhook@archiver.kernel.org>; Fri, 17 Mar 2023 16:28:09 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.24313.1679070482880635459
 for <docs@lists.yoctoproject.org>;
 Fri, 17 Mar 2023 09:28:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=X4/qFMPY;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id EBB441C0007;
	Fri, 17 Mar 2023 16:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1679070480;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+Szky8TACwDS9mMfc3P3IOPH+PabH3b2q2DQdHL3as8=;
	b=X4/qFMPYk8IXCq9mgDsb5NEw6f9UYxFdMTNMtfHUBVvm+WwtkihXj2uAYrI2Heq8NoNd9L
	2TGOkQlrARd/qgRqhGOCybllqiVhjDV0ICTLtFc3s24Irv/I6n/yZ25UIab8FZ00U+H1le
	vksaeXxfmfi1H7Y5aSBt0z8vQGaJE2+tN/oxwtJObC/XfTozyNhWYpOrp5LwU21xizyK4+
	Ky0WUr4nRGVhhz2fLmu313cOm8LJV+7lFBvFmjn6fE6cquT+0fo0WVzSgaUqVY+KiecyA6
	aa0hUmgD1sXKRe6+Vtk+J6RNE7IGMr1vVJfrJB+qdG7BXORavxU3x9x8FAPBZg==
Message-ID: <bf26c185-a119-453c-879c-2b8c6071df68@bootlin.com>
Date: Fri, 17 Mar 2023 17:27:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
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
 <docs@lists.yoctoproject.org>; Fri, 17 Mar 2023 16:28:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3803

Hello Richard,

The following changes since commit 4058998dbeba4262ccced8999be338c04c324b48:

   dev-manual: new-recipe.rst: add references to subsections in Examples 
section (2023-02-24 16:31:52 +0100)

are available in the Git repository at:

   git://git.yoctoproject.org/yocto-docs master-next

for you to fetch changes up to 87cdda981fa6a3d05c559fb00e214214956346dc:

   ref-manual: variables.rst: update LAYERSERIES_COMPAT (2023-03-17 
17:23:02 +0100)

----------------------------------------------------------------
Lee Chee Yang (2):
       migration-guides: add release-notes for 4.0.8
       migration-guides: add release-notes for 4.1.3

Michael Opdenacker (6):
       ref-manual: clarify explanations about feature backfilling
       overview-manual: add missing link to BitBake User Manual
       manuals: simplify references to the BitBake User Manual
       poky.yaml.in, system-requirements.rst: update system requirements
       ref-manual: system-requirements.rst: simplify supported distro 
requirements
       ref-manual: variables.rst: update LAYERSERIES_COMPAT

Yoann Congal (1):
       ref-manual: Add info on "mixin" layers

  documentation/README                                   |  18 +++++---
  documentation/brief-yoctoprojectqs/index.rst           |   8 ++--
  documentation/dev-manual/debugging.rst                 |  29 +++++++------
  documentation/dev-manual/new-recipe.rst                |  26 +++++-------
  documentation/dev-manual/packages.rst                  |  12 +++---
  documentation/dev-manual/python-development-shell.rst  |   2 +-
  documentation/kernel-dev/advanced.rst                  |  20 ++++-----
  documentation/migration-guides/migration-2.2.rst       |   9 ++--
  documentation/migration-guides/migration-2.3.rst       |   6 +--
  documentation/migration-guides/migration-2.4.rst       |   2 +-
  documentation/migration-guides/migration-2.6.rst       |   2 +-
  documentation/migration-guides/migration-3.4.rst       |   2 +-
  documentation/migration-guides/migration-4.0.rst       |   4 +-
  documentation/migration-guides/release-4.0.rst         |   1 +
  documentation/migration-guides/release-4.1.rst         |   1 +
  documentation/migration-guides/release-notes-4.0.8.rst | 217 
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  documentation/migration-guides/release-notes-4.0.rst   |   2 +-
  documentation/migration-guides/release-notes-4.1.3.rst | 317 
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  documentation/overview-manual/concepts.rst             |  71 
+++++++++++++++-----------------
  documentation/overview-manual/yp-intro.rst             |   2 +-
  documentation/poky.yaml.in                             |  27 +++++-------
  documentation/ref-manual/classes.rst                   |   5 ++-
  documentation/ref-manual/devtool-reference.rst         |   2 +-
  documentation/ref-manual/features.rst                  |  92 
+++++++++++++++++++----------------------
  documentation/ref-manual/release-process.rst           |  17 ++++++++
  documentation/ref-manual/system-requirements.rst       |  87 
++++++++++++++++-----------------------
  documentation/ref-manual/tasks.rst                     |  10 ++---
  documentation/ref-manual/variables.rst                 | 156 
++++++++++++++++++++++++++++++++-------------------------------------
  documentation/sdk-manual/appendix-customizing.rst      |   2 +-
  documentation/sdk-manual/extensible.rst                |  11 +++--
  30 files changed, 832 insertions(+), 328 deletions(-)
  create mode 100644 documentation/migration-guides/release-notes-4.0.8.rst
  create mode 100644 documentation/migration-guides/release-notes-4.1.3.rst

Thank you in advance
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


