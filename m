Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D609AC47077
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 15:06:35 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.9036.1704726387459438830
 for <docs@lists.yoctoproject.org>;
 Mon, 08 Jan 2024 07:06:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ps3pnsMC;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E261F1BF20B;
	Mon,  8 Jan 2024 15:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1704726386;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v3MrdaRzDCbLElcBehE9eSJr2vrnxT2xM1lBvEJ0X7c=;
	b=ps3pnsMCI4n5pVdBlD9m58WyyrAEzl5n/L12Mo4lEi19funjwrE8Oc1LZ3vKiCox24cngo
	pg4wnNrOms7kjyl0I081OEYEh9uFWx2kD7RbUyTTZbCS6T9UGDQa3Ll8FZ3Dg8ymPVigEc
	VFGB097/+/EJjG//7jCC4oZxGy6wjmNI8z0sbw8tqN3m2bSHAieUiv5lY5cvQ6/2v+gUIG
	VpnGdtMNrAokLlH+tx+FswbHxGTxZB5KVjOTAREzFwYMm9XxJ662KuXqEbgFYLZ2xnP4j1
	d4XRRQ+sKrt6bEXPoDOSU4Yc8ofAqXMQBgymUyZg/D37Ijq5QddthUt4YwPbXg==
Message-ID: <b20e8c6a-9826-43ec-8be5-896dbdf930ae@bootlin.com>
Date: Mon, 8 Jan 2024 16:06:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] ref-manual: classes: remove insserv bbclass
Content-Language: en-US
To: "Maxin B. John" <maxin.john@gmail.com>
References: <20240103074415.6097-1-maxin.john@gmail.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20240103074415.6097-1-maxin.john@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 08 Jan 2024 15:06:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4746

Hi Maxin

Thanks for the patch!

On 03.01.24 at 08:44, Maxin B. John wrote:
> insserv.bbclass was removed from oe-core:
>
> commit e6bb5dbb62257a7de730ea9085dfd89520f3e47d
> Author: Richard Purdie <richard.purdie@linuxfoundation.org>
> Date:   Sun May 10 12:30:49 2015 +0100
>
> insserv: Remove


Oops, this was a long time ago :-}
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Merged into master-next, and will backport to other maintained 
documentation branches.

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


