Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 675DBC433FE
	for <webhook@archiver.kernel.org>; Wed, 12 Oct 2022 13:40:19 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web11.20303.1665582014492358133
 for <docs@lists.yoctoproject.org>;
 Wed, 12 Oct 2022 06:40:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ffudmXcn;
 spf=pass (domain: bootlin.com, ip: 217.70.178.230, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id DFB58240013;
	Wed, 12 Oct 2022 13:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1665582012;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ID9G575B3XFkr6RKnmQWaZmR0nO+dVbdZ6zHmxP1AF0=;
	b=ffudmXcnQAFT4tPVNBROytaQ7yvVxvVH8A91pE1UyShPdqxyJPoRWqYbqg4gN0mGdVEq9N
	9s5ponShRExJm5q32oopooxz0vrEX0FI7ZpSl5QNNzaB+abiC/PBd/A6g8XpV8bpdMxal/
	73zHxyWO+n686WMNMsuhyCNWE/hCs+l9QcRlJ22FKT6CdWcANvX2KORAoPO9HK5al1baEa
	iDACXKqUXT11PH8azJP9bCeRqhGndEsmO9u6KAY1wyekZtktwuVuzl2iKznKWW0zaRGddF
	E4B+aGysngYmAX+Bb6HFZx+bXXCwA24LW4exhmFuAu4l3MIlKXO5n9mioIt7Xg==
Message-ID: <c7ea0d5e-225b-3cf4-f000-52e28adedff1@bootlin.com>
Date: Wed, 12 Oct 2022 15:40:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Cc: Alexander Kanavin <alex@linutronix.de>, docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] sdk-manual: correct the bitbake target for a
 unified sysroot build
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>
References: <20221010093026.1803479-1-alex@linutronix.de>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20221010093026.1803479-1-alex@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 12 Oct 2022 13:40:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3358

Hi Alex,

On 10/10/22 11:30, Alexander Kanavin wrote:
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>   documentation/sdk-manual/extensible.rst | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Thanks for the patch!
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
... and merged into "master-next"

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


