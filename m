Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71D69CE79BC
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 10:09:16 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.34224.1695204555895424914
 for <docs@lists.yoctoproject.org>;
 Wed, 20 Sep 2023 03:09:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=JZuBV8tK;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C67FB6000F;
	Wed, 20 Sep 2023 10:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695204554;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0yYKSyTOPcOUrEZT0T9S9/s+/jKGPDgDPqvLi7A4/9I=;
	b=JZuBV8tKhodZvFus/WdE3dFvku6tHkBb+HsNHdDJSxoPDe13et9deSCKeMkskDG4VLNxzq
	4D8U+47Qs3CfxIppoJ8d5vmIA1tTg0haua7KfDODGeR/v9rGwQ/1wqSTggWWeKpCi5W6V9
	tTP9w4H4DoU5JpEBJVWLJBmdtfmlRkuF4Wc16sjC38/H9jdHmUXxqit86ce5h01qzfKIwD
	90AU8KLoW0SjxT/D4HdNeTJ4+Z0Lnj0GDiGpUExnUG347CEg3tN2BRHnMFxuL2XopQgehP
	p/ODKhK3pbtl+c4eh0LFBULJzqs3ZjQlAuIzPF6UJvJejW8sMAYjHPFK5PB5Rg==
Message-ID: <5e4da470-679c-d7f1-d8c9-20865ba47167@bootlin.com>
Date: Wed, 20 Sep 2023 12:09:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Cc: Roland Hieber <rhi@pengutronix.de>, docs@lists.yoctoproject.org
Subject: Re: [docs] [RESEND] [PATCH] contributor-guide: add docs for
 Upstream-Status patch headers
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>
References: <20230919125757.1571746-1-rhi@pengutronix.de>
 <20230919125757.1571746-2-rhi@pengutronix.de>
 <d3358ebb-5918-aaab-1a86-4236ce9b8854@bootlin.com>
 <CANNYZj9sEW_cBLppDmfkk+Hoo628G3WTiH9SBL3TY6iWcd9Nvg@mail.gmail.com>
 <4670f2e9-971a-3ced-3b5a-b551b1ba558f@bootlin.com>
 <CANNYZj-7C_DeNgVCyRuHRCXZNX-2JPcnysKLn7gQq8w-4aAkNA@mail.gmail.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <CANNYZj-7C_DeNgVCyRuHRCXZNX-2JPcnysKLn7gQq8w-4aAkNA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 20 Sep 2023 10:09:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4267


On 20.09.23 at 12:00, Alexander Kanavin wrote:
> On Wed, 20 Sept 2023 at 11:47, Michael Opdenacker
> <michael.opdenacker@bootlin.com> wrote:
>> This definitely makes sense. We could propose documentation changes are
>> the reason strings are not specified in the code. However, isn't this
>> something we should discuss first with a wider audience, for example
>> using the openembedded-core mailing list?
> I can't parse the second sentence :)


Oops, my first "are" was meant to be an "as".
Sorry for the mind twisting!

> We can notify about these changes outside of the docs list, but
> otherwise as long as the language makes room for other options (e.g.
> saying that there can be other reasons, but they must be clearly
> explained) I don't think this is particularly controversial.

Right, it makes sense!
>
> We should also explain that Pending is something that should not be
> misused as 'I can't be bother to submit upstream', and must have some
> genuine obstacle to immediate upstream submission - just need to find
> polite phrasing for that :)

I agree :)
Thanks
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


