Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9650FC433F5
	for <webhook@archiver.kernel.org>; Fri, 17 Dec 2021 07:07:25 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web12.3546.1639724843806486896
 for <docs@lists.yoctoproject.org>;
 Thu, 16 Dec 2021 23:07:24 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.178.230, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay10.mail.gandi.net (Postfix) with ESMTPSA id 1AE1524000C;
	Fri, 17 Dec 2021 07:07:20 +0000 (UTC)
Subject: Re: [docs] [PATCH v2 2/2] ref-manual: document overlayfs-etc image
 feature
To: Vyacheslav Yurkov <uvv.mail@gmail.com>, docs@lists.yoctoproject.org
References: <20211216112235.129737-1-uvv.mail@gmail.com>
 <20211216112235.129737-2-uvv.mail@gmail.com>
 <daf0e23e-60f5-6716-5137-c64b4d4442a1@bootlin.com>
 <0f073e9e-8b94-86d3-bdb6-4ab2b25e3249@gmail.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <15d6f7f1-6eaa-7baf-88b4-d3efc83e1afd@bootlin.com>
Date: Fri, 17 Dec 2021 08:07:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <0f073e9e-8b94-86d3-bdb6-4ab2b25e3249@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 17 Dec 2021 07:07:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2300

Hi Slava

On 12/17/21 7:07 AM, Vyacheslav Yurkov wrote:
> Hi Michael,
> Thanks for the review and updates.
>
> I assume it might be easier to send an update patch separately if
> needed. Or you can do fix-ups in master-next? :)


I can make fixups in master-next indeed. This way, we just have one commit.
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


