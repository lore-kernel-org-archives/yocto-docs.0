Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61A65C433F5
	for <webhook@archiver.kernel.org>; Tue,  9 Nov 2021 10:40:21 +0000 (UTC)
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web08.10484.1636454420738952748
 for <docs@lists.yoctoproject.org>;
 Tue, 09 Nov 2021 02:40:21 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.178.232, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay12.mail.gandi.net (Postfix) with ESMTPSA id 6550E200019;
	Tue,  9 Nov 2021 10:40:18 +0000 (UTC)
Cc: Jasper Orschulko <Jasper.Orschulko@iris-sensing.com>
Subject: Re: Fwd: Re: [bitbake-devel] [oe-core][PATCH 1/2] devtools: Initial
 recipe for repo 2.17.3
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 docs <docs@lists.yoctoproject.org>,
 Michael Halstead <mhalstead@linuxfoundation.org>
References: <a82b048c5f9f164696b1dd1e3e6c4997ede4f5ad.camel@iris-sensing.com>
 <45438478b288da1880e92bb1ccc246732a24abc9.camel@linuxfoundation.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <ab0450c7-8f2f-9822-1ef7-61712cc45f6e@bootlin.com>
Date: Tue, 9 Nov 2021 11:40:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: 
 <45438478b288da1880e92bb1ccc246732a24abc9.camel@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 09 Nov 2021 10:40:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2108

Richard, Jasper,

On 11/8/21 1:48 PM, Richard Purdie wrote:
> Hi Michael and Michael,
>
> This sounds like something we should prioritise fixing?

Good catch, thanks!

I agree,
https://www.yoctoproject.org/docs/latest/mega-manual/mega-manual.html
should also redirect to https://docs.yoctoproject.org/singleindex.html

I'll ask Michael H. to change this.

Cheers
Michael

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


