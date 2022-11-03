Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5F7EC4167D
	for <webhook@archiver.kernel.org>; Thu,  3 Nov 2022 15:16:03 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.12.1667488558024037341
 for <docs@lists.yoctoproject.org>;
 Thu, 03 Nov 2022 08:15:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=S3EydKmd;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 2E7C91C000D;
	Thu,  3 Nov 2022 15:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1667488555;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G+1N9a04ZNX78L4ReSXJzznn2fCiI8Ldze30C2CtcQw=;
	b=S3EydKmdANP08HJE+b3H0YmrOMY3v4uCElaF0jRgZjatJkmh8KhCHQU0cBxyi51xlRFtsB
	q4P2yiFjqmK0Yk5imbjM3oV4lAFBXkKkQrxXAz8MoGczOEYbmmwgotEwbW8QxcfcpTdnJ5
	lE/2rqWsC0DG7Z2Xk2AaHraxTai1q4L+1udiIQ/LDL/ZLBb7LbBiTVoEH/C+Jsx6FkZjTg
	2YgA8OHjNO/FxDYOIyIy3t8PFFr4IkRVBgWghTSaXxGZoIOCXuS32IUYwNhtyhApwNmt7p
	riaopXs5eU4aq/Wr0trFUMuffwKrjM+YF+xjNhxu9ouUwLLkJruBpf4IVlFBfg==
Message-ID: <6a5eb2f2-0760-f1b1-e6fc-ca630c7a8319@bootlin.com>
Date: Thu, 3 Nov 2022 16:15:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH v2 1/1] manuals: remove xterm requirements
To: Paulo Neves <ptsneves@gmail.com>
References: <20221103091159.1607775-1-ptsneves@gmail.com>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20221103091159.1607775-1-ptsneves@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 03 Nov 2022 15:16:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3457


On 11/3/22 10:11, Paulo Neves wrote:
> According to [1] xterm is no longer required. Update the manual
> accordingly. Related to Bug #14873.
>
> [1] https://git.openembedded.org/openembedded-core/commit/?id=ddb825c87dd3e59d50841a993080a00d1459b1e7
>
> Signed-off-by: Paulo Neves <ptsneves@gmail.com>


Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
and merged into "master-next".

Many thanks for helping with this bug!
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


