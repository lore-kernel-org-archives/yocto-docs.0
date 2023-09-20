Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 885FCCE79AD
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 09:47:25 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.34008.1695203243256675824
 for <docs@lists.yoctoproject.org>;
 Wed, 20 Sep 2023 02:47:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=PoXTDqqM;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4CE811C0009;
	Wed, 20 Sep 2023 09:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695203240;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5DmLUTBoSpf84UgyR+wGv3uN6WdcCCpCuEu/EQQP2p0=;
	b=PoXTDqqMRLLu8dOmiTunEq+Lp9hmRh/+gBfkTpyyU+OXvsfZbp/LMfyxfPXY3JvmA2Xmnt
	LE42Dr/EaIqO6zee3TBayAq/MJAEgDg9GKi+jt/ryPi+ruu6sErrY8vIwcjdCH5iIsVLPF
	FJJxFICLSy1T0jr5LZmdQcIutKGVk4bkGSB4pZNs2GjjgdJimgLwAROBmrsmzGjkwOChK+
	jAgLvO5DbCInvLH2vBlhRk9vPbM+MiSltpT5t0xhUGY0+0Xf/F3dlGFp/hlc01I8EAOdxP
	xY/84Ixy7QVoaMOh1TjOntA6hJbnKWrQNJmEXjFLjtBCRv9MxgINxsro9l4hmw==
Message-ID: <4670f2e9-971a-3ced-3b5a-b551b1ba558f@bootlin.com>
Date: Wed, 20 Sep 2023 11:47:19 +0200
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
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <CANNYZj9sEW_cBLppDmfkk+Hoo628G3WTiH9SBL3TY6iWcd9Nvg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 20 Sep 2023 09:47:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4260

Hi Alex,

Many thanks for your comments!

On 19.09.23 at 16:23, Alexander Kanavin wrote:
> On Tue, 19 Sept 2023 at 16:07, Michael Opdenacker via
> lists.yoctoproject.org
> <michael.opdenacker=bootlin.com@lists.yoctoproject.org> wrote:
>> I'd also like to more details about the "Inappropriate" reasons. For
>> example, I don't have a clue what "native" would mean. Why would be
>> patch be rejected upstream because it only applies to the x86 host platform?
> For what it's worth I think the entire list of possible Inappropriate
> reasons in the original wiki and by extension in this patch is
> horrible, and should be completely deleted. The two valid reasons I
> can think of:
> - the issue is not yocto-specific, and should be fixed upstream but
> the patch in its current form is not suitable for merging upstream,
> and the author lacks sufficient expertise to developer a proper patch.
> Instead the issue is handled via a bug report (include link). This
> would be [upstream ticket <link>] with extended explanation in commit
> message.
> - the issue is specific to how yocto performs builds or sets things up
> at runtime, and can be resolved only with a patch that is not however
> relevant or appropriate for general upstream submission. This would be
> [oe specific] also with extended explanation in commit messages.
>
> Things like 'I'm not the author of the patch' or 'licensing fix' or
> whatnot aren't valid reasons to mark Inappropriate. We should also say
> clearly that adding Inappropriate patches is strongly discouraged, as
> they add to maintenance burden, and can't be allowed to grow
> indefinitely in their numbers.


This definitely makes sense. We could propose documentation changes are 
the reason strings are not specified in the code. However, isn't this 
something we should discuss first with a wider audience, for example 
using the openembedded-core mailing list?

Thanks again,
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


