Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25BDDC25B72
	for <webhook@archiver.kernel.org>; Thu, 26 Oct 2023 15:59:18 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.74654.1698335955694807756
 for <docs@lists.yoctoproject.org>;
 Thu, 26 Oct 2023 08:59:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=p1g3DyuX;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 914CC1BF204;
	Thu, 26 Oct 2023 15:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1698335954;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LAT4OFYZGbMlosj+5Billni7F7qBxx3SqxVnUkf2aoA=;
	b=p1g3DyuX7w7sycLB1qKiyIgd0u65xlBSYMEWNUnx9C7iIpnfz8UFTIHiHGuHUx9dBV/EUf
	7XrG9hRF0wfiUN5nwpUVN0k39GA5+fTzzXZeI8rjOnk9q5AkqmiMyAl2c8EjeQ3TetKGHq
	KXZ0tsPwvx/6I5PuSUZUlI0UzXKWi2pYmSgXv4KWbjN98Uwk7NzdB8E6Blv1C6YOCnh/6P
	BuKDUeVdSW959UhlXaThQyTaJIVkDM072A631WT3toSm6jSUppsZpvZqP+30AGO7xM/BRj
	jJQXX72GI1wxgEl4LOc0c+HTIH8QrTvbp9vCwcOixVQSAwwPRB60MpFsN5Fuog==
Message-ID: <017352c4-f01c-4324-8b76-bb425be33fd3@bootlin.com>
Date: Thu, 26 Oct 2023 17:59:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
 docs@lists.yoctoproject.org
Subject: Re: [docs] Possible runqemu release note for Nanbield
Content-Language: en-US
To: Mark Hatle <mark.hatle@kernel.crashing.org>
References: <da900cde-800c-5b0e-80cb-199a93652b50@kernel.crashing.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <da900cde-800c-5b0e-80cb-199a93652b50@kernel.crashing.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 26 Oct 2023 15:59:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4504

Hi Mark

On 25.10.23 at 22:58, Mark Hatle wrote:
> While porting meta-xilinx to nanbield I ran into a difference with the 
> way runqemu works.  I figure this might be something that should be a 
> release note, but unfortunately I'm not sure I understand how to 
> explain it well.  Below are my findings and maybe we can word-smith 
> this into a proper release note.
>
> In Mickledore and before 'runqemu' when run like:
>
> runqemu nographic
>
> would automatically add "-serial mon:stdio" after the QB_OPT_APPEND 
> values as necessary.  (It might have also added "-serial null" in some 
> cases, but after "-serial mon:stdio".). After the commit:
>
> https://git.yoctoproject.org/poky/commit/?h=nanbield&id=8c4bb95c1c472f9eb5235b848e57febcac53aa59 
>
>
> This has changed to counting the number of serial ports and adding 
> "-serial null" if the QB_OPT_APPEND only defined a single serial port, 
> and if two or more ports are specified avoiding automatically adding 
> -serial mon:stdio.  This can break some existing QEMU based 
> configurations by changing the way the serial ports are automatically 
> determined when runqemu is executed.
>
> It may be necessary to compare a prior working (Mickledore) executing 
> and adjusting QB_OPT_APPEND to include the correct ordering and number 
> of serial ports of the emulated machine.
>
>
>
> Hopefully Richard or someone can verify what I wrong about is 
> accurate, and maybe adjust it to better explain how a user should 
> adjust their BSP integration.


Thanks for sharing this!
I'll write something from your explanations and I we'll see whether 
people have things to correct.
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


