Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F2BCCDB465
	for <webhook@archiver.kernel.org>; Thu, 19 Oct 2023 14:29:51 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.29429.1697725788452470802
 for <docs@lists.yoctoproject.org>;
 Thu, 19 Oct 2023 07:29:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=acPQoSau;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6C58DE000E;
	Thu, 19 Oct 2023 14:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697725785;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LnZ1qCH0AVS9KWMEUmG0GOrg1kHG7oAj3UAi68KLSxo=;
	b=acPQoSauNUjgRUW6FYmOGRKyCFF0jxSmVkUW2QRRM/tiRh1qR3WzekPFrEQw0fvWr488u2
	V8yceCAzewQ2pnzwbI+yre8Vi/dV0UDoQn26Sv9z2wj7/zHi4djoE90RAuhajjUkVHIxuQ
	maScyHa8DKqruZ3Ft/2f2zczDSvWAphuZYm3AgxYDvMqx3ryZaOe7td+dZ7273uLc4hkzd
	TG/eswQoWV9gKowxmlKOGWhEwnqMOow6cBY+9zY/MXF+dZxxsZAWjlDGKZh8FXlsKQ8TMM
	IooPxAIRn5FETw8CnZNaZcEVEOsr8FTLS1Q+OweyQtqF2hiXC7D5/3nL7b4TUg==
Message-ID: <5c668a44-d9e3-4ca2-ad1d-e42730c76530@bootlin.com>
Date: Thu, 19 Oct 2023 16:29:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] Yocto Tasks Detailed Diagram Proposal
Content-Language: en-US
To: BELHADJ SALEM Talel <bhstalel@gmail.com>
References: <18651.1687433672747999997@lists.yoctoproject.org>
 <29645.1697569015596670723@lists.yoctoproject.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <29645.1697569015596670723@lists.yoctoproject.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 19 Oct 2023 14:29:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4424

Hi Talel

On 17.10.23 at 20:56, BELHADJ SALEM Talel wrote:
> Hello,
>
> Returning to the detailed diagram proposal,
>
> I have created another one that is more and more detailed using 
> draw.io, I tried inkspace but it seems really to deal with.


This one looks good. I opened it in Inkscape and I can open it and edit 
it, which is what matter most.

A minor issue though. I can see in your PNG export that you are using 
"fancy" fonts, and I don't have them on my Linux box, and we probably 
don't either on the autobuilder machine which compiles the docs. 
However, this should be fixable. You could look at the fonts I used on 
https://docs.yoctoproject.org/_images/releases.svg and you/we could 
probably use those or similar ones.

>
> If this SVG file fine and accepted we can move on with it, otherwise, 
> what is the solution for this ? Should I try to take more time to 
> adapt it to inkscape and following the SVG template or someone can 
> help me with this ?


Actually, the style of the SVG template should be updated. I liked the 
style of your original diagram and I must confess it influence me for 
https://docs.yoctoproject.org/_images/releases.svg :)

This being said, we should be careful not to convey too much meaning 
through colors, and keep in mind colorblind people and readers on e-ink 
(grayscale) displays. Accessibility is important and this is something 
you could improve  in the version you've just submitted. The first 
version was almost perfect with respect to this. All we need is manage 
to import it properly with an Open Source editor like Inkscape.


>
> After dealing with that, I am planning to suggest adding a new "6.5 
> Tasks Map" in ref-manual/tasks and for the recipes example in the 
> diagram I will put their content in that section before introducing 
> the diagram.
>
> What do you think?

It sounds great! I'll be happy to help if I can.
Thanks in advance,
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


