Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD4A2C77B75
	for <webhook@archiver.kernel.org>; Wed,  3 May 2023 08:45:18 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.14170.1683103508664856153
 for <docs@lists.yoctoproject.org>;
 Wed, 03 May 2023 01:45:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=eKJkck8W;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id D56DC1C0003;
	Wed,  3 May 2023 08:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1683103506;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=7n+e4iElCo2BYuQVlUJuRhGsNfeBATQqNorRLyIQ93c=;
	b=eKJkck8WXvjpvQ/AhQgtbS85L7/CDY53ds53GxF/i8s8GwV2ObiIjnieBpRw9Ln81arGW0
	Vk7tP8kwVg3fxIpWZ0kzMTK25Djvi91omvvxgP1s0g6PsMDFqvYLzIDXDknWtw1Krd46aR
	bmgajq5c+fMUpzK44OxeZp6lqK77S8RtPJ3QEbV75Oy39jmAfLmt+tlwC37Src+uZP98rX
	C/v8hELR05P13MwwOtI2BTqQfr1k/9tFeyVb2POC2fJdXu+TbFpHT7AMQrePCJDLLigqBz
	sdcsFEJmv/juMUSMCcPys6bXeNWPCezNQ7Dd+X3QQARK4ix0p8QBnLuSuNM5Tg==
Message-ID: <e9d8e12f-41e7-28a5-4235-7796b8355517@bootlin.com>
Date: Wed, 3 May 2023 10:45:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
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
 <docs@lists.yoctoproject.org>; Wed, 03 May 2023 08:45:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3894

Hi Richard,

The following changes since commit dc59b636bb4319a3af552bce84929ddb22a479fb:

   ref-manual: variables.rst: document 
KERNEL_DANGLING_FEATURES_WARN_ONLY (2023-04-28 10:23:55 +0200)

are available in the Git repository at:

   git://git.yoctoproject.org/yocto-docs master-next

for you to fetch changes up to d84b771e2ca22fa7dd9525dc515d3972035366eb:

   ref-manual: system-requirements.rst: fix AlmaLinux variable name 
(2023-05-03 06:05:25 +0200)

----------------------------------------------------------------
Lee Chee Yang (1):
       release-notes-4.2: remove/merge duplicates entries

Michael Opdenacker (2):
       dev-manual: init-manager.rst: add summary
       ref-manual: system-requirements.rst: fix AlmaLinux variable name

  documentation/dev-manual/init-manager.rst            | 49 
+++++++++++++++++++++++++++++++++++++++++++++++++
  documentation/migration-guides/release-notes-4.2.rst | 48 
++++++++++--------------------------------------
  documentation/ref-manual/system-requirements.rst     |  2 +-
  3 files changed, 60 insertions(+), 39 deletions(-)

Thank you in advance
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


