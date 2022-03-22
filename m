Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC962C433F5
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 14:58:40 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web09.10915.1647961119255225441
 for <docs@lists.yoctoproject.org>;
 Tue, 22 Mar 2022 07:58:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=M9AzVCEL;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id D5E9A40006;
	Tue, 22 Mar 2022 14:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1647961117;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BFptvwtTekFnlq9xbw00IBzlYmz7o+E6wcYFLCX0UyQ=;
	b=M9AzVCELhz+GYpxP2c4qbd21m2taqtHUeKlp9hr1wmEmtVEsfOxODuTTV2NwvQQaNFPcqI
	T9+6LZxNK4FrcgszGGRaJsO3FesES3h87s3FER+waWpoYIlzVHq0BdAQkm69w8gHL1bLeK
	xl45jmFasdHuKuDjb08k4ldAzEPr/bjoTbfhvjtzv2zApAdZN0l+T74rYKpyb6BnGY/xny
	ttSlLV7GZEgTnfyThIRpSeGeI9NIRnEb3D0vY1kH+uzZrmKdhfEAMokL7sPdf8z8SuYmjy
	gLt3N2m3zoYl3Y3Y+9xB5FQumwJKSMo346GqRGf4DFcyAW43Xea8bAvEWi+iuQ==
Message-ID: <8f843dd4-6d50-4c67-8d2a-388c6a051798@bootlin.com>
Date: Tue, 22 Mar 2022 15:58:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Cc: Quentin Schulz <foss+yocto@0leil.net>, docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] [honister] docs: fix hardcoded link warning
 messages
Content-Language: en-US
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>
References: <20220322142502.550191-1-michael.opdenacker@bootlin.com>
 <f25caea4-29da-e9ed-f941-68615d737f3e@theobroma-systems.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <f25caea4-29da-e9ed-f941-68615d737f3e@theobroma-systems.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 22 Mar 2022 14:58:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2687

Hi Quentin,

On 3/22/22 15:35, Quentin Schulz wrote:
> Hi Michael,
>
> On 3/22/22 15:25, Michael Opdenacker via lists.yoctoproject.org wrote:
>> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
>>
>> Sphinx complains about hardcoded links which can be replaced by an
>> extlink.
>>
>> So let's apply its recommendations.
>>
>
> If Sphinx is now happy,. I'm happy :)


You were actually the first one to have a recent version of Sphinx and
propose such a patch for master.

>
> BTW, you might want to send patches for honister tags to
> yocto-autobuilder-helper too otherwise we'll have build failures once
> we update sphinx package in the doc toolchain.


... and for dunfell and hardknott tags too.
This sounds like a lot on not productive work, I'd prefer to contribute
to "master" instead :-|

I saw your latest patch
(https://git.yoctoproject.org/yocto-autobuilder-helper/commit/scripts/run-docs-build?id=8273124feb9da2ffe93fcee7c4529d5597e1684a)
and I understand that we don't break docs anymore when there is a
failure. But what about just ignoring warnings? At least these ones
don't have any impact on the generated docs.

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


