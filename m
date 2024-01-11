Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37B6BC47077
	for <webhook@archiver.kernel.org>; Thu, 11 Jan 2024 13:46:51 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.11549.1704980804898537472
 for <docs@lists.yoctoproject.org>;
 Thu, 11 Jan 2024 05:46:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=DJLa421G;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D81E8240002;
	Thu, 11 Jan 2024 13:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1704980802;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jeeynENQQS2J5lThzQfem3dx09hgxt2fGtVvH5M+5J8=;
	b=DJLa421GsP5pKGzAelpahP7MTeoYLbvSN2lsBs6fAauZG+246OQQ0bgwaNcNaWEAodkFoJ
	bXt+c3nx1Xar7P6VCgh4UIZdNDdBFSyPdQd7VigMMxL4sgCW9gLt+gEmFh/1gmojNOhA3N
	rjXi4KP2nGRInaSZETgkXtP+T08PJ7QZGFKOuAai7M84IH/JC0tCiV4L2bEocnAbrnS9mD
	Qa8vyhkJwONo4LRL0fT/ekbIvWcPd+TRBi0iskNKmij5KYjF8ig7XNUwA/4GYjrt/D+a1f
	pNOvlWrQbVPFgGl/ZN27zniQJQLVsA7AqqmyJO+asQ7Cu0jpNMzTJVa4JWgi8w==
Message-ID: <4c65b620-51c9-4f8f-aaef-b0bce0bd3bb2@bootlin.com>
Date: Thu, 11 Jan 2024 14:46:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: simone.p.weiss@posteo.com, docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] overview-manual: Fix bitbake taskmap example
Content-Language: en-US
To: Talel BELHADJ SALEM <bhstalel@gmail.com>
References: <20231223170808.873741-1-simone.p.weiss@posteo.com>
 <94a2c456-a490-4b0a-86b8-22c9b3fdaed0@bootlin.com>
 <CAOgG7m1orsxLu0CoN9ZsmzjZj2H4Jc9Mui_um09a3jEgBScq8A@mail.gmail.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <CAOgG7m1orsxLu0CoN9ZsmzjZj2H4Jc9Mui_um09a3jEgBScq8A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 11 Jan 2024 13:46:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4762

Hello Simone,

On 08.01.24 at 22:29, Talel BELHADJ SALEM wrote:
> Hi Michael, Simone,
>
> Thanks for the patch.
>
> Shouldn't ${AUTOREV} be in double quotes ? "${AUTOREV}"
>
> Also regarding `SRCREV`, I think we just say:
>
>     SRCREV = "<commit>"
>
> because this is a generic example and not specific to any 
> particular Git repository.
>
> Also I think fixing the recipe version to 0.1 is easier because we 
> need to change also $(LIB).1 to be $(LIB).0
>
> I did not figure out what you, exactly, changed in the Task map, can 
> you point to me the exact changes ?


Don't forget to answer Talel's questions. In the meantime, I removed 
your patch from master-next, in case a V2 is necessary.
Thanks in advance
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


