Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8DE1C433FE
	for <webhook@archiver.kernel.org>; Thu, 20 Oct 2022 07:35:24 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.6975.1666251317030395317
 for <docs@lists.yoctoproject.org>;
 Thu, 20 Oct 2022 00:35:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=dBkxJ/qj;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id D88761C0007;
	Thu, 20 Oct 2022 07:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1666251314;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qWsE8COtUQ6GqgI/R9AiaBjnDeEjfbROMrrD4mECfZU=;
	b=dBkxJ/qjAz6Glm1UeUnnKlXKmqt1tudKJtqpCoBndrXWYTUgetCc6nEkUPVbX6h/0KR1yW
	tzmM+x33gThmrPH9F2+vfM94m4uuh7Cb9iiAKnQF0mPZZ6tNN5tehiKU78nelMRyTKaEhm
	BwIqZe8xxBfW3c8YW8msQVZTNVvQITEMJaUpYNyCI/VyYUkOlAdMdmFc8yuda/KXCqqCFi
	kcKHcTQZXqkJlyRdjSelUZvfFKVUElXg+ibRqd504BolNcBzNVZIcb00GeZ1gF9s1k6Z6B
	dg/zpUT+oXx+pcjanerBz4Pb2P96yYqh3sSSSkgNFRpMAMfAAzr1ihcrumoiqA==
Message-ID: <ef49bd1c-1f31-4161-e72c-2e7e7c30ee45@bootlin.com>
Date: Thu, 20 Oct 2022 09:35:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs][PATCH v6] release-notes-4.1.rst remove bitbake-layers
 subcommand argument
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>, Takayasu Ito <ito@lineo.co.jp>
References: <20221020065246.33834-1-ito@lineo.co.jp>
 <39e4d562-ea12-9fe3-7d6d-853c57f45cc7@bootlin.com>
 <57f9883f-b4a5-34b0-9a57-80b4a6ca9d5d@lineo.co.jp>
 <CANNYZj89KMUU5DwmceqOPWK0hn7v6r-_7RV2jRWNqnwwZxBz1Q@mail.gmail.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <CANNYZj89KMUU5DwmceqOPWK0hn7v6r-_7RV2jRWNqnwwZxBz1Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 20 Oct 2022 07:35:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3390


On 10/20/22 09:29, Alexander Kanavin wrote:
> I agree with the change: only the command should be mentioned, and all
> arguments should be left out, even if they're mandatory.
>
> Alex
>
> On Thu, 20 Oct 2022 at 09:28, Takayasu Ito <ito@lineo.co.jp> wrote:
>> Hi Michael
>>
>> The subcommand save-build-conf, which was added at the same time, only
>> contains the subcommand name and no parameters, so we have made a
>> proposal to unify the notation.
>>
>> If "bitbake-layers create-layers-setup destdir" is used, it would be
>> better to use "bitbake-layers save-build-conf layerpath templatename"
>> with the required parameters to unify the notation.


Ok, makes sense, thanks!
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
... and merged into "master-next".

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


