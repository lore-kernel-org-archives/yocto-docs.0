Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69A64C4332F
	for <webhook@archiver.kernel.org>; Wed,  5 Oct 2022 18:15:47 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web11.1553.1664993737575943757
 for <docs@lists.yoctoproject.org>;
 Wed, 05 Oct 2022 11:15:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=YMPBnp5w;
 spf=pass (domain: bootlin.com, ip: 217.70.178.230,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 37CCF240007;
	Wed,  5 Oct 2022 18:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1664993735;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iCX37CMVSNqHIybc3c6oP7Ugc7Lg5n2fWlaevEP95P4=;
	b=YMPBnp5wP9KAiCRNn/E3RXaKurf2EtyDDhO/Hyl6pY5WN+ueMDjNJFNaJ29gZsjrCaIOW4
	W1GFtHUfv89itUIskuDxCS/Fmj57f7YrJ/2K/6p4L8T+kSORRL9oC/5aXCfm//Dia6vrJM
	f+ir2S2Q1YxmwD+8aleUMnJUbXgRb1UAOYrgcuLAuUcqqHw7MbLQlnnYKos4mf/M4mZnqd
	gLV2+1N9bLTkCYDoJitwMoSXjSZoZyaLVLAAJk9oQcFBQCkDd6pAYXe5OG9E/CBRwVPRiq
	DEPb386OgDBMLp0zSn0Ri3SWRGESK0Y9WBazTnovNOOxXWw4l6V452xmdNsEzQ==
Message-ID: <90085ee0-6b86-dcf8-9120-c38becef0428@bootlin.com>
Date: Wed, 5 Oct 2022 20:15:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 00/30] manuals: add missing references to tasks
Content-Language: en-US
To: quentin.schulz@theobroma-systems.com
References: <20220923175219.6652-1-michael.opdenacker@bootlin.com>
 <774d421e-0ee0-dbb8-8d7d-254cbc9b9fa0@theobroma-systems.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <774d421e-0ee0-dbb8-8d7d-254cbc9b9fa0@theobroma-systems.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 05 Oct 2022 18:15:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3291


On 26.09.22 16:00, Quentin Schulz via lists.yoctoproject.org wrote:
> Hi Michael,
>
> On 9/23/22 19:51, Michael Opdenacker via lists.yoctoproject.org wrote:
>> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
>>
>> manuals: add missing references to tasks
>>
>> As suggested by Quentin Schulz on 
>> https://urldefense.proofpoint.com/v2/url?u=https-3A__bugzilla.yoctoproject.org_show-5Fbug.cgi-3Fid-3D14508&d=DwIDAg&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=HuSyEeTT-KxIT3uX-8IenyuDr00g1CP3df1fW1p3wdbCHI96kWRHSCTRw9BLNyWR&s=UWoJbMECYt0997xRv7yfZIXOJ4HiCK0Kk57CApO1lwc&e=
>>
>
> There are a few rogue do_image_complete we can convert still.


Good catch! I found two instances. Fixed.

Many thanks for everything!
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


