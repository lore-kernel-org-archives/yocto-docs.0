Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E200DC25B75
	for <webhook@archiver.kernel.org>; Wed, 29 May 2024 19:20:01 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.24742.1717010398583806543
 for <docs@lists.yoctoproject.org>;
 Wed, 29 May 2024 12:19:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=o//pHsJD;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9A44D40005;
	Wed, 29 May 2024 19:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1717010397;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=GUXqBDk4bbmxS3XW86O1lMxozx3TWGGmfTvHIWqoRNc=;
	b=o//pHsJDl8H1oq1yLZQZr6LF3ufMEnaCePLFDG560rIrb0cuxkegh+c5eYVxxx9Zdk5qzl
	Ueabb9yo4/v0WhycnXfnHRVzX9Aqzf1sX0wj+mLMHw6ImGibF7Fh2GsK+0dLHHM9VJ+Gps
	YQSUZIzrkrjAosXF1kab3wUatUBWLJeVjZ4PfpaEeJycYecnDVxvo25WEA8Hv7jReMs4QB
	1pbewIPMD3DdFD/lLWa+nsYlVDyAkAj2kEuJVi64ByUQYFYonSozASGorepH667/W8tfTm
	r3qB5s+5vqfta7yaUk8OzW6ZvV0CJ2CfnaKRse9ZR7Z5W/NRsKvLmLeY5nf91Q==
Message-ID: <e1237ddd-9c2b-4bc9-b8ef-b8e568bc331d@bootlin.com>
Date: Wed, 29 May 2024 21:19:56 +0200
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
 <docs@lists.yoctoproject.org>; Wed, 29 May 2024 19:20:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5266

Hi Richard

The following changes since commit 9a14157c4d723da0970cfd4bbb2c9500d3e692e0:

   docs: brief-yoctoprojectqs: explicit version dependency on websockets 
python module (2024-05-09 11:55:41 +0100)

are available in the Git repository at:

   git://git.yoctoproject.org/yocto-docs master-next

for you to fetch changes up to 9fb708986cb9019062078f8a34288c44f2667dbd:

   migration-5.1: add the recommended pattern for S/UNPACKDIR definition 
(2024-05-29 21:15:57 +0200)

----------------------------------------------------------------
Lee Chee Yang (2):
       release-notes-4.0.18: specify backported license
       migration-notes: add release notes for 5.0.1

Michael Opdenacker (3):
       migration-guides: placeholder files for 5.1
       ref-manual: introduce UNPACKDIR variable
       migration-5.1.rst: preliminary description of UNPACKDIR changes

Noe Galea (1):
       manuals: document NVDCVE_API_KEY variable

Trevor Gamblin (1):
       ref-manual: variables: document PYPI_PACKAGE_EXT, PYPI_SRC_URI

Yoann Congal (1):
       migration-5.1: add the recommended pattern for S/UNPACKDIR definition

  documentation/dev-manual/vulnerabilities.rst            |   4 ++++
  documentation/migration-guides/index.rst                |   1 +
  documentation/migration-guides/migration-5.1.rst        | 143 
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  documentation/migration-guides/release-5.0.rst          |   1 +
  documentation/migration-guides/release-5.1.rst          |   9 ++++++++
  documentation/migration-guides/release-notes-4.0.18.rst |   2 +-
  documentation/migration-guides/release-notes-5.0.1.rst  | 134 
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  documentation/migration-guides/release-notes-5.1.rst    |  67 
++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  documentation/ref-manual/tasks.rst                      |   9 ++++----
  documentation/ref-manual/variables.rst                  |  33 
++++++++++++++++++++++++++++
  10 files changed, 397 insertions(+), 6 deletions(-)
  create mode 100644 documentation/migration-guides/migration-5.1.rst
  create mode 100644 documentation/migration-guides/release-5.1.rst
  create mode 100644 documentation/migration-guides/release-notes-5.0.1.rst
  create mode 100644 documentation/migration-guides/release-notes-5.1.rst

Thank you in advance
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


