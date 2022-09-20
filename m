Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C211C54EE9
	for <webhook@archiver.kernel.org>; Tue, 20 Sep 2022 20:47:07 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web12.2363.1663706821794982094
 for <docs@lists.yoctoproject.org>;
 Tue, 20 Sep 2022 13:47:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=QuLfO3SE;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 52B1140002;
	Tue, 20 Sep 2022 20:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1663706819;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UzkNvkGbBOaIK8YGvT6ezR54zM/Np4/fOrkoHLPTBQw=;
	b=QuLfO3SEFuJw+ry8/2dJe52uVl09N7nK79UqyaeeYGyax0Ug9/OkttRfYlUuR0yTVkLqrp
	awxXJPUVRF9uMHN07OLPUOMlB5pBEaLg02anH1z5nBzydzGwhDT7nFOq3RE/5muTFZPeHA
	DrXka/LxU6iPflEl3dl06rWOjWpStEizoOAaUgU28sHS4AOfnQKp8JI71Ybz8wsOmqNXS4
	g6mrXJOo4NZgxUuIFQi4DectqDJDDn1wtSxZcYzw18sk/DfS0Drk9e0Lue1MxsRsRZg/X6
	UWTJO2r9d0+X6v1TVBrmwf/2mB9Aju3WngvbNTvtq0w+jP7o4C4LZZ0lxKUXAQ==
Message-ID: <eaad5849-ff56-f3d6-9db7-113f4d7ae489@bootlin.com>
Date: Tue, 20 Sep 2022 22:46:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Cc: "docs@lists.yoctoproject.org" <docs@lists.yoctoproject.org>,
 Alexander Kanavin <alex@linutronix.de>
Subject: Re: [docs] [PATCH 5/5] common-tasks.rst: rewrite the section about
 configuration templates
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>,
 Peter Kjellerstedt <peter.kjellerstedt@axis.com>
References: <20220911172608.2542076-1-alex@linutronix.de>
 <20220911172608.2542076-5-alex@linutronix.de>
 <f20e7ca0158e49329b2ed2d7685ef945@axis.com>
 <CANNYZj_mTijA18UCxpTVa9V0k7pPakqvAGBLWBS39UDBCHS8RA@mail.gmail.com>
 <0c6e4dbbf24d4221ba58543cfc48a498@axis.com>
 <CANNYZj-L_TKTv6tniiRw5-d+Nd9LqpKRcHxcbjN4_f3tgN3ahg@mail.gmail.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: 
 <CANNYZj-L_TKTv6tniiRw5-d+Nd9LqpKRcHxcbjN4_f3tgN3ahg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 20 Sep 2022 20:47:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3190

Greetings,

On 14.09.22 06:50, Alexander Kanavin wrote:
> On Wed, 14 Sept 2022 at 01:59, Peter Kjellerstedt
> <peter.kjellerstedt@axis.com> wrote:
>> And I think he documented it exactly as it was intended to be used. See
>> Paul Eggleton's comment:
>>
>>    One way to do it is to set TEMPLATECONF (an environment variable, not a
>>    bitbake variable) to point to a directory where the custom conf-notes.txt
>>    can be found. In a repository this can be set within a .templateconf file -
>>    hopefully we document that somewhere as well."
> Paul didn't think it through either when he wrote this. Specifically,
> .templateconf must be directly next to oe-init-build-env, which means
> it cannot simply be 'in a repository'.
>
> You can't have it both ways: demand that this is kept in the docs, but
> without explaining how to actually make it work (using standard
> tooling). Also, your setup
> is unnecessarily complicated to begin with: just skip the template
> assembly altogether, and write directly to build/conf. Eventually
> you'll be able to do it in a structured, supported
> way with fragments, which is what we should *actually* be talking about.


It's obvious we don't have a consensus yet here.
Can anyone else jump in and contribute to this discussion?

The other patches in this series have been merged into master-next.

Thanks in advance
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


