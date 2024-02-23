Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE515C48BC4
	for <webhook@archiver.kernel.org>; Fri, 23 Feb 2024 09:35:45 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.7208.1708680941290144423
 for <docs@lists.yoctoproject.org>;
 Fri, 23 Feb 2024 01:35:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=jxJDVnSW;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C00F8C0003;
	Fri, 23 Feb 2024 09:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708680939;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oybnhbg0J6/TL0N698y4O/SgcabgWtCqABmYgOe8cSE=;
	b=jxJDVnSWEKp5JolT+ES4n14vhH7h2SbqfD+yW4xypug9pnUzJ+jF6MWxBYh9w5XjzsAiZ8
	UhJWz01fQULWYYktWwYU8HF5IbbPiB3WpaPi28iz8ZUetZFyBU7AmXqMlBemG/tFMohKk6
	TW3pycF/pel+8yqSFBjreYPPsb78cWkF01hV7DeWV/9Rgkn9QB1GjSRtT3WAH1cUgrL+a/
	b3cs8CgCwPf06ry04fe2X+6OshQ9LUm6E9I72DBDX2HeuDJiRM48IT/tAj3wl7Ii0R+RH1
	+nNRg/FJ+18ji4hzc9J4B4CcRfXGsXvTDE5ckfLBANYXyL1xINyzb6jS8KgeMQ==
Message-ID: <0ec61615-ec1d-4fa5-8753-10730e0ac7da@bootlin.com>
Date: Fri, 23 Feb 2024 10:35:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>,
 Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
Subject: Re: [docs] [PATCH] sdk-manual: extensible.rst: cover devtool ide-sdk
Content-Language: en-US
To: Adrian Freihofer <adrian.freihofer@gmail.com>, docs@lists.yoctoproject.org
References: <20240221195921.1911170-1-adrian.freihofer@siemens.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20240221195921.1911170-1-adrian.freihofer@siemens.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 23 Feb 2024 09:35:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4859

Hi Andrian

On 2/21/24 at 20:59, Adrian Freihofer wrote:
> Cover the new devtool ide plugin in the extensible sdk section.
>
> Many thanks to Enguerrand de Ribaucourt for his re-view and
> contributions.


Many thanks for this very nice addition to the documentation! I took a 
bit of time to review it, fix a few minor issues and also improve the 
formatting.

That would have taken too much time to report all the small changes I 
wanted to make, so I directly merged them in the master-next branch. You 
can check the resulting output on 
https://docs.yoctoproject.org/next/sdk-manual/extensible.html or the 
final source code on 
https://git.yoctoproject.org/yocto-docs/log/?h=master-next .

That's not too late to correct some mistakes I could have introduced.
Thanks again
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


