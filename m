Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B284C05027
	for <webhook@archiver.kernel.org>; Fri, 20 Jan 2023 16:25:09 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.79018.1674231906201471889
 for <docs@lists.yoctoproject.org>;
 Fri, 20 Jan 2023 08:25:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=pdYgJwwQ;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id B5E9540002;
	Fri, 20 Jan 2023 16:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1674231904;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Bo9ZU2ywlKgCbSFNKBqipbTbqiKF0OH8Ia6rS/Y14wc=;
	b=pdYgJwwQr82qrLmTeu3hAIyQ3g+mfJgtQg7ZZ4pf4kgCEXGv5jp6GVlzOMybQzap8kRUhS
	dq6sWdpefdenw53oL7TbiM7teCBf1WbW6++8t6ZL+/S+6XIZbhZuR22eBz6bc7sRRQLpw/
	Jqq29oXCZ7bwQogBeUvQkEonQ1QAUQB0eiW9RfS5U6SxbQGfJIvVmsEKzmhD45myw51wcd
	4ySBA/YPqx92TblJ/H1kmwNiOvcU0hpf+m+eSrUmFys0BG4X04yKiYPPuaOgU9lv9sINIq
	83uhOkO2xL0pfKknUcoaPionTGk1h1jFwJY4FPqROzXN5ayMSxKIc2MNp25qDA==
Message-ID: <751beefd-630a-89aa-d976-0e78d7ab575d@bootlin.com>
Date: Fri, 20 Jan 2023 17:25:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
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
 <docs@lists.yoctoproject.org>; Fri, 20 Jan 2023 16:25:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3619

Hi Richard,

The following changes since commit df8f862042633594846a93a1b7702fc01bc32ae0:

   ref-manual/system-requirements.rst: recommend buildtools for not 
supported distros (2023-01-06 17:47:59 +0100)

are available in the Git repository at:

   git://git.yoctoproject.org/yocto-docs master-next

for you to fetch changes up to 2a98cebea5238bcea46abfdb6b3981e615161b8d:

   migration-guides: add release-notes for 4.1.2 (2023-01-19 16:50:33 +0100)

----------------------------------------------------------------
Lee Chee Yang (1):
       migration-guides: add release-notes for 4.1.2

Luca Ceresoli (1):
       manuals: fix typo in the MLPREFIX description

Michael Opdenacker (1):
       ref-manual: initial documentation for go and go-mod classes

  documentation/migration-guides/release-4.1.rst         |   1 +
  documentation/migration-guides/release-notes-4.1.2.rst | 286 
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  documentation/ref-manual/classes.rst                   |  23 +++++++++++
  documentation/ref-manual/variables.rst                 |  69 
++++++++++++++++++++++++++++++-
  4 files changed, 378 insertions(+), 1 deletion(-)
  create mode 100644 documentation/migration-guides/release-notes-4.1.2.rst

Thank you in advance
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


