Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28006C47DDB
	for <webhook@archiver.kernel.org>; Mon, 29 Jan 2024 15:07:17 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.17380.1706540836066045414
 for <docs@lists.yoctoproject.org>;
 Mon, 29 Jan 2024 07:07:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=nh9TiZpG;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5A1611C000B;
	Mon, 29 Jan 2024 15:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1706540833;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yj9aR4zvr/JPC8VMASGxvzebRFYDtOO8Zuoen4WIBZ0=;
	b=nh9TiZpGlw/aro4bDnuNI1CoVl7xJEbgXep+qk87oVmI2/cokVKWj7FXV+OwvCdqCyebod
	DBBp1PzHqt5CpeEndDI0p+Mw8Wjtk526XHCwTvmemYfHxONbTBCdJ/6R31YTnyCQeJaKZs
	VI97FGIRg70rJ5isNmN7sT0J1jrq27UIRIYm3TuNfqUleHurNEXzdAXHiTwy/0yI2cpWWA
	xdIxH7IVNCBYZdW2gxoTaXA73/8bIAYGQvUKfI3aHvWKGB0TS2Fk6RRdZ2VZdDdkU522Pp
	2YtnuzYGiTr2YJ5xDL9++hqVCeqBzCItzBOcNOtGE96FztSSBfnZfcBK+aF4jg==
Message-ID: <5dfd6147-bde4-4727-ba21-6dc8780b129e@bootlin.com>
Date: Mon, 29 Jan 2024 16:07:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] migration-guide: add release notes for 4.0.16
Content-Language: en-US
To: Takayasu Ito <ypa.takayasu.ito@gmail.com>
References: <20240129055704.1812957-1-chee.yang.lee@intel.com>
 <497c3940-b6c3-4863-a4a8-e9b63eb7a483@gmail.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <497c3940-b6c3-4863-a4a8-e9b63eb7a483@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 29 Jan 2024 15:07:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4797

Hi Takayasu-San

Thanks for the review!

On 1/29/24 at 14:33, Takayasu Ito wrote:
> Hi Lee,
>
> I see that the Fixed and Security Fixes are listed in opposite places.


Ah right, the section titles are correct and well located, but their 
contents should be swapped.

>
> In the actual Security Fixes, cpio is listed above curl if it is 
> listed in ascending order.


Indeed, that would be nice to fix for consistency.

>
> In the actual Fixes section, "docs" and "documentation" are listed 
> differently for the same subject.
> I also need to be careful about the use of "manuals" and "documentation".


Right, I must confess I haven't paid too much attention to this so far, 
as nobody seemed to care.
Perhaps, we should enforce a "docs" prefix for all documentation 
contributions, and still mention the modified manual when only one 
manual is modified.

What do you think?

Anyway, I wouldn't rewrite the documentation commits we have so far as 
this is probably complicated, and as this has been happening for a long 
time.

Lee, do you have time for a quick V2? I can take care of it too...

Thanks again
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


