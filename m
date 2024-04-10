Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC293CD11C2
	for <webhook@archiver.kernel.org>; Wed, 10 Apr 2024 09:38:07 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.162750.1712741884118965159
 for <docs@lists.yoctoproject.org>;
 Wed, 10 Apr 2024 02:38:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=IpRUu0up;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: joaomarcos.costa@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2AE6F24000F
	for <docs@lists.yoctoproject.org>; Wed, 10 Apr 2024 09:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1712741882;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1vO6nldH8riGGLjcqpTYxfhTvrc5636fNLgP/SbL7ek=;
	b=IpRUu0upd4dwuifBMbY/0H9lLpPwO4R/vReg4XAKSMHRI5jBOyCEzLmuF1sGFTLIARHbqz
	BwTEFzkOqZBQMJX5HWiNFmiHVUuqyX6QS9EANHT8UL+kbQh1FQ/D8K0TZFRIhjAbS+Vond
	Tfr8b97VZCTfFd/qZIsvvTq+Ba5LwKeqjQ472YjxB3fsAzAeZ4cKe5+JcrYwc9b5+763u6
	Xr5bimUQ5SYxxKu/l20rn7yX54qlL5AqiGKCqLUzZHIXDPuaJP6plPGmW2cHtTEMW7GQy/
	bO7nsSus21T8IEuzluOf9pyKoPvSvMly+oev9tEiKMCbrL3ejJLGoMfq3xvGLw==
Message-ID: <b1aedb8d-d393-4406-bb88-812c9c0fee7e@bootlin.com>
Date: Wed, 10 Apr 2024 11:38:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v1 1/2] release-notes: add updates for 5.0
Content-Language: en-US, fr
To: docs@lists.yoctoproject.org
References: <20240410091124.2976089-1-joaomarcos.costa@bootlin.com>
 <20240410091124.2976089-2-joaomarcos.costa@bootlin.com>
 <ff1a9414-c174-473f-bc92-491d43a57184@bytesatwork.ch>
From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Organization: Bootlin
In-Reply-To: <ff1a9414-c174-473f-bc92-491d43a57184@bytesatwork.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: joaomarcos.costa@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 10 Apr 2024 09:38:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5102

Hello,

On 4/10/24 11:34, Daniel Ammann wrote:
> Hello Joao,
>
> Comment inline.
>
> Kind regards
>
> Daniel
>
[...]
>> +   -  ``core-image-initramfs-boot``: a collaborative effort for making
>> +      machine-readable software metadata easily available
>
> The recipe name seems to not match the description.

Thanks for pointing that out. That's indeed a mistake, from a silly copy/paste. I will send a v2.

-- 
Best regards,
João Marcos Costa


