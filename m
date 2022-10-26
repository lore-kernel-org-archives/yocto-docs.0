Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1636EC433FE
	for <webhook@archiver.kernel.org>; Wed, 26 Oct 2022 17:51:45 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.10707.1666806700833161661
 for <docs@lists.yoctoproject.org>;
 Wed, 26 Oct 2022 10:51:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=grpEZ2wH;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 516651C0008;
	Wed, 26 Oct 2022 17:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1666806698;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZmSIqhy3IBG5j9WBfiiSarTwVFLtGgGDlK63O/HHQqY=;
	b=grpEZ2wHhy8y9oQKNl3E5Z2ntzWsZM2xoO4R76QX37NOqi8lwV60mOJnooJ38LnVfnyaqz
	L93pOtkkms9c8YVZbvsmfswfG3V7jArCUowiOJ2MGgUEObSrZfxY6S8nPXOnG+YEWucjJq
	vCcfTisDDUYlp2kBhLwAcGyHTaWKrwtdqXbt9wXaiDcM7BAtKrSyyVV17j+E8YemephZMS
	eP+PFLyEL3P/Z3+i0X8vLHOWq/JLLpXfLvBVJ/pHgLf2pSXY+EiO8xmDA8dy/jcjgXPmlK
	JZihR2xWxVR/3bESlhZ+dH7USu1n/U7Ejes6URygv2tUPPsYHE7yx+giNGeU0A==
Message-ID: <627539a4-7d8c-3b7b-38ff-1763a7c27377@bootlin.com>
Date: Wed, 26 Oct 2022 19:51:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Cc: rybczynska@gmail.com, mikko.rapeli@linaro.org
Subject: Re: [docs] [PATCH v2 1/4] ref-manual: variables.rst: add
 documentation for CVE_VERSION
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 docs@lists.yoctoproject.org
References: <1721A288D2BAB036.492@lists.yoctoproject.org>
 <20221026160713.2068570-1-michael.opdenacker@bootlin.com>
 <20221026160713.2068570-2-michael.opdenacker@bootlin.com>
 <8cacc3686a7c813bffa48e17c0bc5d98976ab41e.camel@linuxfoundation.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <8cacc3686a7c813bffa48e17c0bc5d98976ab41e.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 26 Oct 2022 17:51:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3422

Hi Richard

On 10/26/22 18:32, Richard Purdie wrote:
> On Wed, 2022-10-26 at 18:07 +0200, Michael Opdenacker via
> lists.yoctoproject.org wrote:
>> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
>>
>> From: Mikko Rapeli <mikko.rapeli@linaro.org>
> I think your "From:" injection script may need a tweak to avoid two
> entries!


Oh, this is funny! Actually, I don't have any special script.

Mikko's "From:" was added by "git format-patch"
Mine was added by "git send-email".

I'll keep an eye on this.
Good catch, thanks!

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


