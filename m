Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ABACCD6E76
	for <webhook@archiver.kernel.org>; Wed, 11 Oct 2023 14:20:32 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web10.17734.1697034024665190382
 for <docs@lists.yoctoproject.org>;
 Wed, 11 Oct 2023 07:20:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=wEfMTKa+;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Transfer-Encoding:Content-Type:
	Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:MIME-Version:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=NFkr8LmUEqKYaY+HhHdUoiJ+qwTfQSMVUhImy/l7y58=; b=wEfMTKa+Dp5dO3jZQ5WerUrK0b
	uYtnIHdklcUpInXEjw39Bal3QmMM0hevdLw33o+CiJqu+KXv04AJgmudB9YqsPyw2KRkKYetBUB2r
	rguEI76JTXzPFH+BAp65ocCQRiipeoGz3vXsx4yMPrYIOy82kXpvZ8+6kGyL8NnVWlKcsXn09sN/F
	7uqD7xqaj00yN+C0cXQVEBszARYPResur6MTyVEpIMTaB8XceWQZvzjNb2CkCWUliPjznOavIwFgy
	5X10fNWkdrGQQOA3oohztiPaDB18umArT7FNf49u81mqAUX1Acfn0y2fmmHah7lyTmH67J0Bbxpx8
	olZxxdMA==;
Received: from [::1] (port=52166 helo=cpanel10.indieserve.net)
	by cpanel10.indieserve.net with esmtpa (Exim 4.96.1)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1qqa4S-007Ard-2g;
	Wed, 11 Oct 2023 10:20:22 -0400
MIME-Version: 1.0
Date: Wed, 11 Oct 2023 10:20:20 -0400
From: rpjday@crashcourse.ca
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] BSP guide still conflates "repo" with "layer"
In-Reply-To: <f33d2f73-f4eb-4a10-bffd-eb252a9da78a@bootlin.com>
References: <67f75a6f-3f77-3ae5-56-25c011722bb9@crashcourse.ca>
 <f33d2f73-f4eb-4a10-bffd-eb252a9da78a@bootlin.com>
User-Agent: Roundcube Webmail/1.6.0
Message-ID: <cfe235e1834bc889b1d3536f4190f134@crashcourse.ca>
X-Sender: rpjday@crashcourse.ca
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel10.indieserve.net
X-AntiAbuse: Original Domain - lists.yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel10.indieserve.net: authenticated_id: rpjday@crashcourse.ca
X-Authenticated-Sender: cpanel10.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 11 Oct 2023 14:20:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4352

On 2023-10-11 10:17, Michael Opdenacker wrote:
> Hi Robert
> 
> On 11.10.23 at 09:14, Robert P. J. Day wrote:
>>    i've mentioned this before, but some of the YP docs still
>> mislabel a checkout as a "layer". case in point -- the reference to
>> "meta-ti" as a "layer" in the BSP guide. it's not, of course:
>> 
>>    https://git.yoctoproject.org/meta-ti/tree/
>> 
>> it's a git repo which consists of two layers, but the current BSP
>> guide still describes meta-ti as a "layer" in places. i'll ponder how
>> to fix this. are there any other checkouts with that structure? i
>> recall meta-intel used to do that, but now it's a proper layer.
> 
> Oops, good catch.
> What about just replacing "meta-ti" and other bad examples by better 
> ones?
> Patches welcome, but let me know if you wish me to take care of this.

   I'm doing a massive patch of bsp.rst, let me finish and submit that 
and
we'll tackle this. It will take more than changing a sentence or two to 
make
sure it's all consistent.

rday

