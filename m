Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35BA6C433F5
	for <webhook@archiver.kernel.org>; Fri, 12 Nov 2021 16:55:53 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web09.18708.1636736152468228099
 for <docs@lists.yoctoproject.org>;
 Fri, 12 Nov 2021 08:55:52 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 9B17EC000F
	for <docs@lists.yoctoproject.org>; Fri, 12 Nov 2021 16:55:50 +0000 (UTC)
To: YP docs mailing list <docs@lists.yoctoproject.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: Why "git send-email -M -1" in our contributing instructions?
Organization: Bootlin
Message-ID: <84ac62a4-4e20-5453-47eb-994be2e11511@bootlin.com>
Date: Fri, 12 Nov 2021 17:55:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 12 Nov 2021 16:55:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2140

Hi,

I've just sent a patch to the bitbake-devel and docs mailing lists using
"git send-email -M -1", strictly following the contribution instructions.

However, my e-mail got sent twice. What's this "-M -1" option? I can't
find it in the manual of "git send-email", and I had done without it so far.

I wonder if we could remove it from our guidelines for sending patches
with "git send-email"...

Thanks in advance
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


