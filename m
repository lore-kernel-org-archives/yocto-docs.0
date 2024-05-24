Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9942CC25B74
	for <webhook@archiver.kernel.org>; Fri, 24 May 2024 13:23:11 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.15658.1716556983567515944
 for <docs@lists.yoctoproject.org>;
 Fri, 24 May 2024 06:23:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=PVZIm0w/;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6E41F20005;
	Fri, 24 May 2024 13:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1716556981;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=9BZOJodSsuMJi5jkgSkKUrHT8Ze2JooO6vuAHE7loII=;
	b=PVZIm0w/xBllOFX+BDAv64A+OqVLM89QdiWiic6khZG8fHmHF+He3UPeBrDnJ4FhgNPW0g
	CpqtvT4bfUI7LgcDA6fqYGJDyhPuisG8ayiTy0QTEUaB/vrpZMNCs4N5DmSf4XOR99O3YS
	flw8f2stEk4IiucWtqClhK/9sB785RufEUKDA9W15eH73MuJBAohInMF9GkzLgTyAFSEdt
	b1tfB/To+TFVIaVi/IQfWPQZziN4c1xixe1fQXwjAwf+BxcKjoGCv3LSo8rQxKdUKCgYBD
	7/He3mf/ef0UrALlnXe6m9w8UFvfZjgBhwZhVYWxOYTx9E7b70bTqxAf5t7AIg==
Message-ID: <287741f5-1fc8-4aa2-978e-a18611bbac73@bootlin.com>
Date: Fri, 24 May 2024 15:23:01 +0200
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
 <docs@lists.yoctoproject.org>; Fri, 24 May 2024 13:23:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5255

Hi Richard

The following changes since commit 9a14157c4d723da0970cfd4bbb2c9500d3e692e0:

   docs: brief-yoctoprojectqs: explicit version dependency on websockets 
python module (2024-05-09 11:55:41 +0100)

are available in the Git repository at:

   git://git.yoctoproject.org/yocto-docs master-next

for you to fetch changes up to b2e1ec551a73e1d0ecf980324a8ec400c9cf5586:

   migration-5.1.rst: preliminary description of UNPACKDIR changes 
(2024-05-24 15:04:48 +0200)

----------------------------------------------------------------
Lee Chee Yang (1):
       release-notes-4.0.18: specify backported license

Michael Opdenacker (3):
       migration-guides: placeholder files for 5.1
       ref-manual: introduce UNPACKDIR variable
       migration-5.1.rst: preliminary description of UNPACKDIR changes

Noe Galea (1):
       manuals: document NVDCVE_API_KEY variable

Trevor Gamblin (1):
       ref-manual: variables: document PYPI_PACKAGE_EXT, PYPI_SRC_URI

  documentation/dev-manual/vulnerabilities.rst            |   4 ++++
  documentation/migration-guides/index.rst                |   1 +
  documentation/migration-guides/migration-5.1.rst        | 138 
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  documentation/migration-guides/release-5.1.rst          |   9 +++++++++
  documentation/migration-guides/release-notes-4.0.18.rst |   2 +-
  documentation/migration-guides/release-notes-5.1.rst    |  67 
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  documentation/ref-manual/tasks.rst                      |   9 ++++-----
  documentation/ref-manual/variables.rst                  |  33 
+++++++++++++++++++++++++++++++++
  8 files changed, 257 insertions(+), 6 deletions(-)
  create mode 100644 documentation/migration-guides/migration-5.1.rst
  create mode 100644 documentation/migration-guides/release-5.1.rst
  create mode 100644 documentation/migration-guides/release-notes-5.1.rst

Thank you in advance
Kind regards
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


