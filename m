Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C3F3C07E8F
	for <webhook@archiver.kernel.org>; Mon, 22 Apr 2024 07:43:40 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.13035.1713771810613202582
 for <docs@lists.yoctoproject.org>;
 Mon, 22 Apr 2024 00:43:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=CnWULhwk;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8DE301C0005;
	Mon, 22 Apr 2024 07:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1713771808;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=FdjcOuXHDDMaQHwwv+0UycWf8yu177NYZEII6C2mebM=;
	b=CnWULhwk9j7qPctjdJxx6s6uew2QTYlwvHo4JY5b7eGswbZP3DHq7XzUXPE3IjEo2luSj5
	cgFCIQ3La3pJfSxcCFio34Lz512/ufZRBzM0UGQDIKJxTUBeWhmkcgzSlnJebP/WT3NLy5
	c6NBaCV2wKmkT9wWtLp3i1shGugUbeSuyNnsG+LVdrj5Ut1qdg8cvgwq6/e+cGMs5ThUJr
	KeOdoc6GiJ7UGRGFuHkQg/1I6TNjJ7lNZBQuoOjceXKsubfZjxOotVvgwwHgLFlQUaKRxP
	w4sK7IGnuFaPCo2WHtqJKF7tWSiiQ7qnspSDl9rDGye2YXO4mMHqpU6mIqrfvg==
Message-ID: <4de083b1-8f38-4dee-9584-935261ad1df9@bootlin.com>
Date: Mon, 22 Apr 2024 09:43:28 +0200
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
 <docs@lists.yoctoproject.org>; Mon, 22 Apr 2024 07:43:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5171

Hi Richard,

The following changes since commit 0cdc0afd3332459d30cfc8f4c2e62bdcc23f5ed5:

   release-notes: additional features and one known issue for 5.0 
(2024-04-15 17:39:29 +0200)

are available in the Git repository at:

   git://git.yoctoproject.org/yocto-docs master-next

for you to fetch changes up to fa6700af56213a5079eaa8d9683f3c2b2fc93740:

   manuals: standards.md5: add standard for project names (2024-04-21 
06:43:12 +0200)

----------------------------------------------------------------
Michael Opdenacker (1):
       manuals: standards.md5: add standard for project names

Paul Eggleton (2):
       ref-manual: variables: add USERADD_DEPENDS
       release-notes: add a few more new features

  documentation/migration-guides/release-notes-5.0.rst | 32 
++++++++++++++++++++++++++++++--
  documentation/ref-manual/variables.rst               |  6 ++++++
  documentation/standards.md                           | 33 
++++++++++++++++++---------------
  3 files changed, 54 insertions(+), 17 deletions(-)

Thank you in advance
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


