Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7540C77B7C
	for <webhook@archiver.kernel.org>; Fri,  5 May 2023 16:40:29 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.438.1683304822894495202
 for <docs@lists.yoctoproject.org>;
 Fri, 05 May 2023 09:40:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=RtXTrYDm;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 5F69520007;
	Fri,  5 May 2023 16:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1683304821;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Wd77Z2rFDJN0+EWqX7pfwWoZtJAV2Wa7Oj2oAn+e+aI=;
	b=RtXTrYDmXrRIavFcVFQenKFk/kgDTmXU6v2espmoG7PBEq6nN4ldbnk9AagY2U6feB7SlB
	QJJZWTziK4pdPshRizgw9EayZfVzk/PN40MRnrr384LwAZBKXOM8a/kMbRz81+EHLt6Fha
	v9wrNvX+l74nDRSpBSFamt11LsuYsUZ9FmX/Ad/T6vqBqwdn85NOklrRf+4Wb1midDXPR2
	In5sAKT5kEIWNf1VT8EGhBSPJibqhqJTBxx0pdjjTiXaD/GuuVbh8mDSdF4LtYz6v80qlz
	vgDqNwQYWdjlOlNkGSg8vKytyWo1nZKv0/xa25vmV2us7cilkTYVIVC4a1jIjA==
Message-ID: <d002676f-90a8-ab90-7fd0-381e7c1e9bff@bootlin.com>
Date: Fri, 5 May 2023 18:40:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 2/2] ref-manual: classes: kernel: document
 automatic defconfig usage
Content-Language: en-US
To: luca.ceresoli@bootlin.com
References: <20230505091006.1888595-1-luca.ceresoli@bootlin.com>
 <20230505091006.1888595-2-luca.ceresoli@bootlin.com>
 <175C47EAC5CB336C.898@lists.yoctoproject.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <175C47EAC5CB336C.898@lists.yoctoproject.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 05 May 2023 16:40:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3918

Hi Luca,

On 05.05.23 at 17:10, Michael Opdenacker via lists.yoctoproject.org wrote:
>
> On 05.05.23 at 11:10, Luca Ceresoli via lists.yoctoproject.org wrote:
>> Since a very long time the kernel bbclass uses a defconfig file from
>> SRC_URI automatically. Document this feature.
>>
>> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>
>
> Hi Luca,
>
> That's great to document this behavior. Good catch!
> For both patches: Reviewed-by: Michael Opdenacker 
> <michael.opdenacker@bootlin.com>
> ... and merged into "master-next".


Oops, I realize you should run a few git commands to have a proper 
identity in your git commits.

See 
https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded#Fixing_your_From_identity

Don't need to send your patches again, I will fix your last two commits 
by myself.

Thanks in advance for next time.
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


