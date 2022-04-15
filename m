Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64A6EC4167D
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:25:53 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.11521.1650051982379888970
 for <docs@lists.yoctoproject.org>;
 Fri, 15 Apr 2022 12:46:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=KEbtgSp6;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 40716FF802;
	Fri, 15 Apr 2022 19:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1650051980;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jqf1AkGfnqYnjCdPDpqTognplVSjU17xr7emhkgISwI=;
	b=KEbtgSp6t/uxtTvw76DM0DdE0d2b5v8/vtuYhaul/VbHUGNCiedg1kwaGdGBiXib7cXlDN
	F9TnNTqdpc+buBlRiMAu7A8b3gqI9Ltmcl5VyO4aAzytddxZnr+R0r0tJ+jxNCL/ZcEKWx
	3VsXDPtKxkm/DK6UtKp+ObjgOVxkWmxObWFOslFOehJvcGXmoVxuDQRVf2YX/raLKBjBvk
	47jh5Mi2Oea9riRRP32FFkr7a5zPkvsAcGCsznqkXMNQ0JQQdsDfA3VT2pnJvH6RUdB4Wt
	RrMS/TdxqcX7uZQ7gp7iltkp2xUzZ+78ixbzZh9JILglZHmQfarV53N/q5c8yw==
Message-ID: <3171dd9f-ad7c-025b-2edf-cb2b419adf75@bootlin.com>
Date: Fri, 15 Apr 2022 21:46:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [docs] YP Quick Build: errors/annoyances: ubu-22.04 docker
 container
Content-Language: en-US
To: Randy MacLeod <randy.macleod@windriver.com>
References: <2fd29235-6c93-a911-944a-f78dd7a27904@windriver.com>
 <c756a98b-b38a-115a-6e17-0d9d9a883727@bootlin.com>
 <6bf3c70e-7531-36db-93ad-c1648a8aaf42@windriver.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
In-Reply-To: <6bf3c70e-7531-36db-93ad-c1648a8aaf42@windriver.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 18 Apr 2022 14:25:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2782


On 4/13/22 23:45, Randy MacLeod wrote:
> On 2022-04-13 13:08, Michael Opdenacker wrote:
> ...
>>>
>>
>> No, I'll process your comments one by one. I'll take care of opening a
>> bug if necessary.
>> Thanks again
>> Michael.
>>
>
> Just what I wanted to hear...
>
> Thanks Michael!


I don't forget you, but I need to get familiar with using Docker, to
test the prerequisites not only on Ubuntu, but on other supported distros.
So, I could send updates just for Ubuntu, but something more generic
would probably be better.

I'll be on holiday next week, but I won't forget.
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


