Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46721C54E60
	for <webhook@archiver.kernel.org>; Tue, 19 Mar 2024 13:56:00 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.16100.1710856558542754117
 for <docs@lists.yoctoproject.org>;
 Tue, 19 Mar 2024 06:55:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Vbh8Q/g1;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8496CFF802;
	Tue, 19 Mar 2024 13:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1710856556;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=OLqtYeMu/tDvcJIkx0s7XV2Kxce2/xjIzJYhwmUTQjs=;
	b=Vbh8Q/g1/EE0T9IhfeL5a7QDYqAl4G1ZyZsgnvsYr3KZxBdz8Lxv7/d/JNWFpT7onJYvAK
	sFf+CfmMkvyi+Dyo6L8U3/8w1V8q+Pqp26De6VNPFRqeaiqdjaxKEkLFjFrYGTsYjOlja2
	vrpVfN9/ht14rNOqy89BQ/ckZiKnULtaE35WOC5VGPpSDlpxcEE2/lxDdWoAAU8uQAVnzX
	3Xhm68yOK+c2jZEvsnQ7Q6kdY64E2Kb9hKwqhTiNrAPyWMpEmYuvxth73VamPifd6ShUBj
	NkKMZoG7OUzYtYpMDhOsMCk94xFtNu8pQSkCKa4xkI6lV5GrkkU5u5+eyVvO4g==
Message-ID: <693a516c-b178-47cc-97c1-dbb808d9be27@bootlin.com>
Date: Tue, 19 Mar 2024 14:55:56 +0100
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
 <docs@lists.yoctoproject.org>; Tue, 19 Mar 2024 13:56:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4996

Hi Richard

It would be great if you could merge this pull request, as it contains 
the initial release and migration notes for 5.0. This will make it 
easier for people to contribute to these notes if they find them in the 
master branch.

The following changes since commit 9c1505eabd69af548652381cf996d44f40a4fa8a:

   dev-manual: bmaptool: rename (2024-03-06 16:15:49 +0100)

are available in the Git repository at:

   git://git.yoctoproject.org/yocto-docs master-next

for you to fetch changes up to cfaf2707b4a77888316d5eb24bf41ccc21e2c12b:

   dev-manual: improve descriptions of 'bitbake -S printdiff' 
(2024-03-19 14:45:21 +0100)

----------------------------------------------------------------
Alexander Kanavin (3):
       sdk-manual: correctly describe separate build-sysroots tasks in 
direct sdk workflows
       dev/ref-manual: document conf-summary.txt together with 
conf-notes.txt
       dev-manual: improve descriptions of 'bitbake -S printdiff'

BELOUARGA Mohamed (1):
       ref-manual: add documentation of the variable SPDX_NAMESPACE_PREFIX

Lee Chee Yang (1):
       migration-guides: add release notes for 4.0.17

Martin Jansa (1):
       contributor-guide: be more specific about meta-* trees

Michael Opdenacker (8):
       manuals: add initial stylechecks with Vale
       profile-manual: usage.rst: formatting fixes
       manuals: use "manual page(s)"
       profile-manual: usage.rst: fix reference to bug report
       documentation: Makefile: remove releases.rst in "make clean"
       migration-guides: draft notes for upcoming release 5.0
       manuals: add initial stylechecks with Vale
       profile-manual: usage.rst: further style improvements

Ulrich Ölmann (1):
       ref-manual: classes: update description of class 'image_types'

  documentation/.gitignore |   2 +
  documentation/.vale.ini |   7 ++
  documentation/Makefile                                               | 
15 ++-
  documentation/README                                                 | 
14 +++
  documentation/contributor-guide/submit-changes.rst |   2 +-
  documentation/dev-manual/building.rst |   7 +-
  documentation/dev-manual/custom-template-configuration-directory.rst 
|   6 +-
  documentation/dev-manual/debugging.rst                               | 
13 ++-
  documentation/migration-guides/index.rst |   1 +
  documentation/migration-guides/migration-5.0.rst                     | 
105 ++++++++++++++++++++
  documentation/migration-guides/release-4.0.rst |   1 +
  documentation/migration-guides/release-5.0.rst |   9 ++
  documentation/migration-guides/release-notes-4.0.17.rst              | 
238 ++++++++++++++++++++++++++++++++++++++++++++
  documentation/migration-guides/release-notes-5.0.rst                 | 
66 ++++++++++++
  documentation/profile-manual/usage.rst                               | 
734 
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-------------------------------------------------------------------
  documentation/ref-manual/classes.rst                                 | 
10 +-
  documentation/ref-manual/structure.rst |   7 +-
  documentation/ref-manual/variables.rst |   7 +-
  documentation/sdk-manual/extensible.rst |   8 +-
  documentation/standards.md                                           | 
15 +++
  documentation/styles/config/vocabularies/OpenSource/accept.txt       | 
20 ++++
  documentation/styles/config/vocabularies/Yocto/accept.txt |   5 +
  22 files changed, 903 insertions(+), 389 deletions(-)
  create mode 100644 documentation/.vale.ini
  create mode 100644 documentation/migration-guides/migration-5.0.rst
  create mode 100644 documentation/migration-guides/release-5.0.rst
  create mode 100644 documentation/migration-guides/release-notes-4.0.17.rst
  create mode 100644 documentation/migration-guides/release-notes-5.0.rst
  create mode 100644 
documentation/styles/config/vocabularies/OpenSource/accept.txt
  create mode 100644 
documentation/styles/config/vocabularies/Yocto/accept.txt

Thank you in advance
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


