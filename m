Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6061BC433EF
	for <webhook@archiver.kernel.org>; Fri,  1 Oct 2021 17:29:16 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web12.599.1633109354872094566
 for <docs@lists.yoctoproject.org>;
 Fri, 01 Oct 2021 10:29:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id CFBFF40007;
	Fri,  1 Oct 2021 17:29:12 +0000 (UTC)
Subject: Re: [docs] [PATCH 0/2] add notes about license implications of
 bundled initramfs
To: Daniel Wagenknecht <dwagenknecht@emlix.com>, docs@lists.yoctoproject.org
References: <20210923083412.1500103-1-dwagenknecht@emlix.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <15102f4c-dbed-bdda-8e89-afb14ba0c633@bootlin.com>
Date: Fri, 1 Oct 2021 19:29:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210923083412.1500103-1-dwagenknecht@emlix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 01 Oct 2021 17:29:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/1907

Hi Daniel,

Many thanks for the patches!

On 9/23/21 10:34 AM, Daniel Wagenknecht wrote:
> As discussed on IRC the license implications of using
> INITRAMFS_IMAGE_BUNDLE are not necessarily obvious. This patchseries
> adds notes about them in the relevant places.
>
> Source of this interpretation of the license implications is the second
> paragraph of
> https://www.kernel.org/doc/html/latest/filesystems/ramfs-rootfs-initramfs.html#external-initramfs-images

I agree. Good to point this out.
>
> I placed them where I saw fit, although this leads to multiple `note`
> blocks in direct succession. If this should be avoided a more thorough
> rewrite of those sections might be necessary.


Right. We might find a way to improve this later, but merging your
changes is important too.

Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Merged into master-next.

Thanks again,

Cheers,
Michael
-- 

Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


