Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAB4DC433EF
	for <webhook@archiver.kernel.org>; Fri, 12 Nov 2021 13:39:13 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web12.15627.1636724352149253859
 for <docs@lists.yoctoproject.org>;
 Fri, 12 Nov 2021 05:39:12 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 544F4C0007
	for <docs@lists.yoctoproject.org>; Fri, 12 Nov 2021 13:39:09 +0000 (UTC)
To: YP docs mailing list <docs@lists.yoctoproject.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: Continue to support Ubuntu 16.04?
Organization: Bootlin
Message-ID: <e215954c-7898-a9c5-1df1-0d876ce30a86@bootlin.com>
Date: Fri, 12 Nov 2021 14:39:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 12 Nov 2021 13:39:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2129

Greetings

Ubuntu 16.04 is no longer maintained for free by Canonical
(https://ubuntu.com/16-04)

I guess our builders don't have a subscription to get updates until
2026, so can we really keep Ubuntu 16.04 in our list of supported distros?

Thanks in advance
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


