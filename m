Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19B02C25B48
	for <webhook@archiver.kernel.org>; Fri, 27 Oct 2023 15:02:57 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.9140.1698418971988649112
 for <docs@lists.yoctoproject.org>;
 Fri, 27 Oct 2023 08:02:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=TniLfN60;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5630F40002;
	Fri, 27 Oct 2023 15:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1698418969;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nA+/SBAccm0ROdEImqrBa2wJKnoWVZNTU0UZwl3gJ1k=;
	b=TniLfN60ox/1umMhQ5xFsLSWK7VMvRzHOeF6hybgVsYHPh/Xvx5IbMJRivOYYxInTKZqJ7
	4bLHdZOz8+F1g16qMmlCtxW/zyN4BPU68l2biMqwVDBRpXhIS+OIy1se5FVGuNAzwY1EDf
	Fz++QKGm/zeyJIIs6v98xQIEjSKtKJaOu48XieaZ3akRA3FbSZjYkR83UdHX5P2/FhvhrF
	ZgYaUlnUTY8GGHn/mlNzKLWlQo7Yx/8cmdHzI+a1jkmQb5/ax+YfjY+hXYdMMFYQJDekX7
	8lRE8BQ6Rb2Db3bC7gViMXNzraM6lJTHwaFhVJqWpZK8regwBGcDmYUxULBa5Q==
Message-ID: <ff30c952-0a18-452f-853f-9011bad05133@bootlin.com>
Date: Fri, 27 Oct 2023 17:02:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] Yocto Tasks Detailed Diagram Proposal
Content-Language: en-US
To: BELHADJ SALEM Talel <bhstalel@gmail.com>
References: <18651.1687433672747999997@lists.yoctoproject.org>
 <29645.1697569015596670723@lists.yoctoproject.org>
 <5c668a44-d9e3-4ca2-ad1d-e42730c76530@bootlin.com>
 <CAOgG7m0eQPFhnrmXd8GhbZJJEf_0dDRAj6Vpthh-NOtVPbZAjg@mail.gmail.com>
 <acba70be-9670-4ff3-a0f0-bb13add4559a@bootlin.com>
 <CAOgG7m3DDDU56NX4=u=UzVbd6idkVMyvz7gyt0s3kkZBi7sZ1A@mail.gmail.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <CAOgG7m3DDDU56NX4=u=UzVbd6idkVMyvz7gyt0s3kkZBi7sZ1A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 27 Oct 2023 15:02:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4514

Hello Talel,

On 27.10.23 at 14:18, BELHADJ SALEM Talel wrote:
> Hello Michael,
>
> Thanks for the clarification,
>
> I have completed the map, and I think it is very perfect now.
>
> I have just another question regarding the recipe's themselves,
>
> Is it okay to create the recipes in my GitHub account and use that in 
> the documentation ?
>
> Or, I put the files contents in the documentation itself like:
>
> The following is the content of Makefile:
>
> ``content``
>
> and so on ...
>
> What do you think?


Well, if you put all the sources in the documentation itself as you're 
suggesting, I believe it's fine to mention that they are also available 
in an external repository for convenience. Richard, you may disagree...

If you are really using git commands in the documentation to fetch 
search sources, I guess we can ask for a new git.yoctoproject.org 
repository for tutorials. It's important that the Yocto Project "owns" 
the contents of its manuals, and if you are no longer available to make 
updates, other people can take over.

Thanks!
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


