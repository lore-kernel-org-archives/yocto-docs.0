Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4DF9CE79AF
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 09:52:15 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.34071.1695203528710544467
 for <docs@lists.yoctoproject.org>;
 Wed, 20 Sep 2023 02:52:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=WkNd+d71;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A14CB240006;
	Wed, 20 Sep 2023 09:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695203527;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H3MXpIB66MSAJo6O3gK6W+7WwW+Q/b0mG+/6/XKAKcQ=;
	b=WkNd+d71q7riTG8ubD61Uxj88AootcSaXouxS/eXtmRa/5rVzPLHGa9coHqKkS1NUo8Uyi
	GZA/ShrFrmiNagZgwBCb1+ueGIetlZQfbwIzvgFmaHY0wo/Ix3LOcSYFbAu6ScyXGM0ei+
	Qz0DB3FC2KikK9KqTCAcNVI9jS/n26ZWoq57QcV22B1NBBRSC5DMzUIXi6R62vOKDqzhR+
	AlZklNG/m49nlJrfaL2pkqtkjcZc3t2DWohVU1OAm15QCy11rcqNWQCNHekhpZyQ3/GO35
	/ZTOgMAS79J3jO22L4t5mPL9IydPMCqTJEWF8KDQ6vYxI4HxKYPsOGX3utDXWw==
Message-ID: <ee396649-196c-3348-79ad-d621c0621de1@bootlin.com>
Date: Wed, 20 Sep 2023 11:52:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [RESEND] [PATCH] contributor-guide: add docs for
 Upstream-Status patch headers
Content-Language: en-US
To: Roland Hieber <rhi@pengutronix.de>
References: <20230919125757.1571746-1-rhi@pengutronix.de>
 <20230919125757.1571746-2-rhi@pengutronix.de>
 <d3358ebb-5918-aaab-1a86-4236ce9b8854@bootlin.com>
 <20230920085637.ypa3jr676bdqocf5@pengutronix.de>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20230920085637.ypa3jr676bdqocf5@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 20 Sep 2023 09:52:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4261

Hi again Roland

On 20.09.23 at 10:56, Roland Hieber wrote:
>> Last but not least, we'd need to deprecate the "Accepted" reason and
>> recommend "Backport" instead (see https://docs.yoctoproject.org/migration-guides/migration-3.2.html#miscellaneous-changes).


For this change, I think a separate commit would be better. We can 
actually remove "Accepted"  from the list, as only "Backport" should be 
used.
Thanks
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


