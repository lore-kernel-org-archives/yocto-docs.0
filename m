Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22DD4C433FE
	for <webhook@archiver.kernel.org>; Thu, 10 Nov 2022 18:35:26 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web12.283.1668105320903209576
 for <docs@lists.yoctoproject.org>;
 Thu, 10 Nov 2022 10:35:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Z7wDS4d1;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 84A2C40004;
	Thu, 10 Nov 2022 18:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1668105318;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/uZm5N3g2vVX9XqG1z6eUqdnnNE+tJb3cSD5Tdd6H5w=;
	b=Z7wDS4d13f9YTw4Whnm5YgzdGvzc3wQEyay+FMw/IJuhfio0w4ARaWIM5XA2c/WQi+e3LF
	cYf1OX2Mw8HKv0gRvN8wQH6QvRa7SFH1jonbCcOIZX+Q1viJRGzXAtpdIGcGp3+s1QSS3n
	pPkwMKUshsZCRs+bnOQUMWvD2p4nu8vl3OUD5u0FosQorRirzKhg/zEJGJcWsAaM1GkG9M
	0m/ilkup+kwPsHvjumoZYT9Wba2J7zsfbKRfK/gAguV3+MYJs3D6YhpwpvezSOY67YaPCg
	kGMBpzgnQr4rh64HL2MbvjISG/AfsmnmgWjtWaZXBgba/t5Fh2/tN8HoZo5Ppw==
Message-ID: <b92ff781-adae-c216-3c8c-1cb1e7bbf77c@bootlin.com>
Date: Thu, 10 Nov 2022 19:35:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
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
 <docs@lists.yoctoproject.org>; Thu, 10 Nov 2022 18:35:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3490

Hello Richard,

The following changes since commit 47101c15cce156ab71683cac1c42ab94f43bdbee:

   manuals: add shortcut for Wikipedia links (2022-11-04 19:56:04 +0100)

are available in the Git repository at:

   git://git.yoctoproject.org/yocto-docs master-next

for you to fetch changes up to ac844062400a7bf4732ea6ee639a478b1b77b83e:

   release-notes: use oe_git and yocto_git macros (2022-11-10 19:29:25 
+0100)

----------------------------------------------------------------
Atanas Bunchev (1):
       qemu.rst: audio: reference to Command-Line options

Lee Chee Yang (1):
       migration guides: add release notes for 4.0.5

Michael Opdenacker (3):
       ref-manual/variables.rst: expand BB_NUMBER_THREADS description
       ref-manual/variables.rst: expand PARALLEL_MAKE description
       release-notes: use oe_git and yocto_git macros

Quentin Schulz (3):
       docs: ref-manual: classes: fix section name for github-releases
       docs: ref-manual: classes: add missing closing parenthesis
       docs: poky.yaml.in: remove pylint3 from Ubuntu/Debian host 
dependencies

  documentation/dev-manual/qemu.rst                      |   5 ++--
  documentation/migration-guides/release-4.0.rst         |   1 +
  documentation/migration-guides/release-notes-3.4.1.rst |   8 +++---
  documentation/migration-guides/release-notes-3.4.2.rst |  10 ++++----
  documentation/migration-guides/release-notes-3.4.3.rst |  10 ++++----
  documentation/migration-guides/release-notes-3.4.4.rst |  10 ++++----
  documentation/migration-guides/release-notes-3.4.rst   |  10 ++++----
  documentation/migration-guides/release-notes-4.0.1.rst |   8 +++---
  documentation/migration-guides/release-notes-4.0.2.rst |  12 ++++-----
  documentation/migration-guides/release-notes-4.0.3.rst |  12 ++++-----
  documentation/migration-guides/release-notes-4.0.4.rst |  12 ++++-----
  documentation/migration-guides/release-notes-4.0.5.rst | 196 
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  documentation/migration-guides/release-notes-4.0.rst   |   8 +++---
  documentation/migration-guides/release-notes-4.1.rst   |  10 ++++----
  documentation/poky.yaml.in                             |   2 +-
  documentation/ref-manual/classes.rst                   |   6 ++---
  documentation/ref-manual/variables.rst                 |  55 
+++++++++++++++++++++++++++++++---------
  17 files changed, 302 insertions(+), 73 deletions(-)
  create mode 100644 documentation/migration-guides/release-notes-4.0.5.rst


Thank you in advance
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


