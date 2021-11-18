Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E195EC433F5
	for <webhook@archiver.kernel.org>; Thu, 18 Nov 2021 10:35:33 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.3929.1637231732280272315
 for <docs@lists.yoctoproject.org>;
 Thu, 18 Nov 2021 02:35:32 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 614062000E;
	Thu, 18 Nov 2021 10:35:29 +0000 (UTC)
Cc: Khem Raj <raj.khem@gmail.com>,
 YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] Continue to support Ubuntu 16.04?
To: Tim Orling <ticotimo@gmail.com>
References: <e215954c-7898-a9c5-1df1-0d876ce30a86@bootlin.com>
 <bebd3578-f723-8574-93f7-061454b57c8f@gmail.com>
 <e1766a73-31fa-4251-408b-fd4f0b46c9b3@bootlin.com>
 <CANx9H-A6XfeQga1eC83=hqxfhDwzByWbGwzvBxwT66N+QSW-rQ@mail.gmail.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <85e10b1a-d0fe-54f7-8c18-967c50c2d05f@bootlin.com>
Date: Thu, 18 Nov 2021 11:35:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: 
 <CANx9H-A6XfeQga1eC83=hqxfhDwzByWbGwzvBxwT66N+QSW-rQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 18 Nov 2021 10:35:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2161


On 11/18/21 5:55 AM, Tim Orling wrote:
>
>     Then, if everyone agrees, let's drop the 16.04 workers, and use freed
>     CPU time for other tests.
>     How to drop the 16.04 workers?
>     Cheers
>     Michael.
>
>
> Probably the docs list is not a wide enough audience to discuss the
> impact?


Right, it makes sense. I posted this topic on the automated-testing@
mailing list.
Thanks
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


