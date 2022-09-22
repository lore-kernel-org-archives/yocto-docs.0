Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECB6AC6FA82
	for <webhook@archiver.kernel.org>; Thu, 22 Sep 2022 08:23:54 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web11.4898.1663835028610273947
 for <docs@lists.yoctoproject.org>;
 Thu, 22 Sep 2022 01:23:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Rp2pnbqL;
 spf=pass (domain: bootlin.com, ip: 217.70.178.231,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 4BB45100010;
	Thu, 22 Sep 2022 08:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1663835026;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3W+jr7E9CEm8DY1hCE6pLcyhWCjrOl96qr4fiNJOG14=;
	b=Rp2pnbqL77k0sBw2l8KH95GAS9RUt7t6ZZ5L28aiWGFy5bd4ZrzOjKudMl1/fbQ+9mL2mr
	TKz0GQMUqtHxAPc62aMYDD1oiBk+CjaXMOraMXxdVHGjK/tVWTQ/9qUqDb4ziSx89uw3Da
	6C6bZlIu47EIMWtdWVN2FEXgKYZjTWwdf88SzoiFiYGHgXQbbMfpKlEuC3jK680AMvmlCZ
	Ur5JvR8cDhZjjUC9KeGd6FXGdZv+y625koG0ogCENTPw45x87M1rJbNlLzcgqJMWQbanbt
	2za4FYTunwgyx/r23YgSBBlIegA3evufHwNK9r4Q6F9MUxkci5ALAmBjMP/QxA==
Message-ID: <dd3980e2-9851-8aaf-9fa1-99c2bb44a3a8@bootlin.com>
Date: Thu, 22 Sep 2022 10:23:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] ref-manual: variables.rst: refer to BBPATH in the
 BitBake User Manual
Content-Language: en-US
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>
References: <17171FA1D41FFAAE.30869@lists.yoctoproject.org>
 <0c84794a-68a2-bcf8-51fc-721934fac761@bootlin.com>
 <f70346dd-8574-0a26-af33-812cba9ba4d0@theobroma-systems.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <f70346dd-8574-0a26-af33-812cba9ba4d0@theobroma-systems.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 22 Sep 2022 08:23:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3205

Hi Quentin

Thanks for sharing your opinion.

On 22.09.22 10:17, Quentin Schulz wrote:
>
> I would just remove the redirection, we don't have any at the moment.


OK, I'll submit a V2 then, and will propose a link to the BitBake 
variable index at the beginning of the Yocto one.

>
> What I just thought of right now is to add another custom extension 
> which would traverse the intersphinx mapping for bitbake terms and 
> insert them in the glossary the way you're doing it above, but just 
> automated.
>
> I have no idea if that is feasible, but I feel like it'd be a better 
> solution than trying to maintain this kind of redirection.


Sure, that would be great if that existed.
Thanks again
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


