Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3B7EC001DF
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 13:22:38 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.54057.1697808150734574786
 for <docs@lists.yoctoproject.org>;
 Fri, 20 Oct 2023 06:22:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=op+XKYa/;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 97B691C0003;
	Fri, 20 Oct 2023 13:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697808148;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+KyftXBJRcySMBVH4LhO5RK1bZJJ3qKG8RO4MTxTAX8=;
	b=op+XKYa/KrFZrA8jptdiRrr1dI6tl14P/vnM62HfhELPiNCJLBOTJ1LZ5izw4drdBq8h/t
	VxuCeEgdVMm0IBw7Ws9aeOEycBzuZuf2RgC05Wzds6J+Hh1Ex7amryY1ZS6tDxBwAmVdVf
	adW6mmoYXU38yiRHwo5yzHYEUTp/jRR/AYnO9EIvI0C36Y4N3UCKUj6OOuIQB3rEiVlwhf
	oKJu2WQfovll9sd/L0kLvekRRqbDs9W+TsxwfRP+W4DzJeA/Zgl9TnwzW+Qhh4DALcXZP+
	pnoI47OzcaTjktD1D3gzV9Yk/uj7hhjLFCzkZ+7UutBMZrsHTTYLxN1ohGjBrg==
Message-ID: <d95c042c-0edc-4287-bab4-d00a9095bea6@bootlin.com>
Date: Fri, 20 Oct 2023 15:22:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 3/3] ref-manual: variables: Add example for
 SYSROOT_DIRS variable
Content-Language: en-US
To: BELHADJ SALEM Talel <bhstalel@gmail.com>
References: <20231020094102.414940-1-bhstalel@gmail.com>
 <20231020094102.414940-3-bhstalel@gmail.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20231020094102.414940-3-bhstalel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 20 Oct 2023 13:22:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4442

Hi Talel

Thanks for not giving up!

For all 3 commits:
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Merged into master-next.

Thanks again

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


