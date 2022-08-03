Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1584C19F28
	for <webhook@archiver.kernel.org>; Wed,  3 Aug 2022 13:35:53 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.8420.1659533750940119806
 for <docs@lists.yoctoproject.org>;
 Wed, 03 Aug 2022 06:35:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Kz2DAZyh;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id A82A2240008;
	Wed,  3 Aug 2022 13:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1659533749;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vhUeT87Vx5rUsHeoy0MZjdN37Gau6cFpXj8UL/an/xQ=;
	b=Kz2DAZyh0lDCSghHicLDm+csmGx/qurCy9n5lVyzSF6UEvCH/hf4Qr3WXOaSwB5BUntEX7
	Wb2sJ1YaSzCPetxj//vDpQAYAaFQ8UCm/2DcTi/XtrMMUtXeP2dEgYuNawAYVLKA172Idh
	3kcGovNWpBMnNXE8wCLD2osGa4smO08qcbD2X5f49L+VzQzEhq3rgZ6J0tg79Fgw/orh5z
	8qASfm2eu/yNTGmMajjT/vUHYqV2mktoVroSSCj/NsMfD29XwDDyDuqmKN23AymeVRnq5l
	JFo5/wEjSTayiunt1IybUqAi010dyu/6L2ekeKQKStl3W+BSbLZRCChqhAiJnA==
Message-ID: <5e913f8e-8223-fbe7-fe8a-dab2c4788f94@bootlin.com>
Date: Wed, 3 Aug 2022 15:35:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [docs] Generated master docs not up to date - issue in
 run-docs-build?
Content-Language: en-US
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 YP docs mailing list <docs@lists.yoctoproject.org>
References: <ac5fc19e-3c47-edb2-b5f0-da408275c0f6@bootlin.com>
 <eb55af01-e73f-856d-e61b-3eb331504da9@theobroma-systems.com>
 <84dc376f-36c9-8c75-2613-84f464d79f7f@theobroma-systems.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <84dc376f-36c9-8c75-2613-84f464d79f7f@theobroma-systems.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 03 Aug 2022 13:35:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3107


On 8/3/22 15:20, Quentin Schulz wrote:
>
> But this is actually a very good point. I personally believe the 
> Release Manuals section should be the same for all releases and branches.
>
> I had in mind to force the use of the Release Manuals from the master 
> branch when building with the auto-builder so that they'd always be in 
> sync. I haven't had the time to do it yet, but something like rm -rf 
> of the previous location of the release manuals for older releases, + 
> a patch for using the master release manuals, then git checkout master 
> migration-guides/ and whatnot.


Strongly voting for this good idea!
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


