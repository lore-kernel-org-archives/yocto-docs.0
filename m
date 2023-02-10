Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B5EDC05027
	for <webhook@archiver.kernel.org>; Fri, 10 Feb 2023 10:33:45 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.11177.1676025221941301880
 for <docs@lists.yoctoproject.org>;
 Fri, 10 Feb 2023 02:33:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=A06xD+On;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 4BED360009;
	Fri, 10 Feb 2023 10:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1676025219;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=tTqnknDdneXOzgNxesUBQT/WaA3L5j/D1CXzWB3Ph9A=;
	b=A06xD+Onhtl7myOxh8f5LTViL9DWI5w4nexeqgZtGpBH3WQv71v0w1Ph0SfWOxYfsS78il
	+scrGTqsqOPDr4IztFgrpGL/j3TjuSYfr8XAEqhkVoeLm8X0JJq/b0wKxVQv0lWFxYlzoY
	JZ4IXd88lPxuPaX4Ovf+BdUTnSpHio8qUiq9Ooj1ipod2gtAfO6LK28pL3ieMGqNE8nMT+
	t+hlAtGg0rvf080LpRSVX87ziVXhj403Jh83kafHzoiLWILYgXxYFPZ92yTsigiw2cfwpg
	7VJhwSITGEw2gEnP+ifclrqsFwnXeEdZjGOHopJe6wG8kO1Q+uuuf41CjiFupQ==
Message-ID: <7bb63e93-f8e7-5414-e9ee-e61f1bc55c80@bootlin.com>
Date: Fri, 10 Feb 2023 11:33:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
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
 <docs@lists.yoctoproject.org>; Fri, 10 Feb 2023 10:33:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3664

Hi Richard,

The following changes since commit 2a98cebea5238bcea46abfdb6b3981e615161b8d:

   migration-guides: add release-notes for 4.1.2 (2023-01-19 16:50:33 +0100)

are available in the Git repository at:

   git://git.yoctoproject.org/yocto-docs master-next

for you to fetch changes up to 3f3f0ad23f31fb5bb7b550dbe18bbedb1449b3ca:

   ref-manual: document Rust classes (2023-02-10 11:16:14 +0100)

----------------------------------------------------------------
Lee Chee Yang (1):
       migration-guides: add release-notes for 4.0.7

Michael Opdenacker (7):
       migration-guides/migration-4.2.rst: fix minor issues
       ref-manual: variables.rst: fix broken hyperlink
       profile-manual: update WireShark hyperlinks
       manuals: replace unnecessary uses of 'yocto_docs' by internal 
references
       bsp-guide: fix broken git URLs and missing word
       ref-manual: improve "devtool check-upgrade-status" explanations
       ref-manual: document Rust classes

Richard Leitner (1):
       ref-manual: variables: FIT_KERNEL_COMP_ALG: add lzo

Ulrich Ölmann (1):
       dev-manual: fix old override syntax

  documentation/bsp-guide/bsp.rst                        |   6 ++--
  documentation/dev-manual/prebuilt-libraries.rst        |   4 +--
  documentation/migration-guides/migration-4.2.rst       |   9 +++---
  documentation/migration-guides/release-4.0.rst         |   1 +
  documentation/migration-guides/release-notes-4.0.7.rst | 242 
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  documentation/profile-manual/usage.rst                 |   6 ++--
  documentation/ref-manual/classes.rst                   |  78 
++++++++++++++++++++++++++++++++++++++++++++++++
  documentation/ref-manual/devtool-reference.rst         |  19 +++++++-----
  documentation/ref-manual/resources.rst                 |   2 +-
  documentation/ref-manual/variables.rst                 |   9 +++---
  documentation/test-manual/reproducible-builds.rst      |   4 +--
  11 files changed, 353 insertions(+), 27 deletions(-)
  create mode 100644 documentation/migration-guides/release-notes-4.0.7.rst

Thank you in advance
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


