Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D279CD1284
	for <webhook@archiver.kernel.org>; Tue,  2 Apr 2024 13:33:40 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.12429.1712064813173005920
 for <docs@lists.yoctoproject.org>;
 Tue, 02 Apr 2024 06:33:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=csbtPaGp;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7730DFF806;
	Tue,  2 Apr 2024 13:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1712064810;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Qg4kOvP5NhQgV6Zu0/IOTMNp/MooBltVR1q+dfVx88Y=;
	b=csbtPaGp5OL8tnCEBgCjfaJUsoV6s28QR4iDvOjy3u+aUi/xZ9n+ZTWi5nILboVgFwBhQ5
	0jlONqMRwNG+gQ496xyOvJRB2s2/5iWIlnvo8zk8peCBjMHP+7ogh29S5O6Oz+U8cc1ENH
	4CUjz4+arHAyQMQgo7oGUZ+fuGOlhbYZKS3fY3C6kf/ce0XpfIyVnmB7/NsPbnmYOXdlvj
	85zBL6mTNQE5JvmOHFM4ouB1SrNgRSkQ9ws6JDQ9EIOhLinxhA0SJf8Nab9BEWoYQSeVK5
	nzyhzNoCyiaNfhzn3Cq2prxHYtRsabrzYsNUjuVxosvkQD5T+MPwGJNNMn31jg==
Message-ID: <90f9bf1d-1cd1-4b42-8af8-41ab7dd5ed5d@bootlin.com>
Date: Tue, 2 Apr 2024 15:33:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 2/4] manuals: remove tab characters
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>
References: <20240330180829.1749526-1-michael.opdenacker@bootlin.com>
 <20240330180829.1749526-2-michael.opdenacker@bootlin.com>
 <0402377f-24e2-47e6-a28e-70be1e801fe9@theobroma-systems.com>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <0402377f-24e2-47e6-a28e-70be1e801fe9@theobroma-systems.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 02 Apr 2024 13:33:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5046

Hi Quentin,

Thanks for the review!

On 4/2/24 at 11:58, Quentin Schulz wrote:
>
>> --- a/documentation/kernel-dev/common.rst
>> +++ b/documentation/kernel-dev/common.rst
>> @@ -1674,10 +1674,10 @@ looks much like the one provided with the 
>> ``hello-mod`` template::
>>      SRC := $(shell pwd)
>>        all:
>> -       $(MAKE) -C $(KERNEL_SRC) M=$(SRC)
>> +        $(MAKE) -C $(KERNEL_SRC) M=$(SRC)
>>        modules_install:
>> -       $(MAKE) -C $(KERNEL_SRC) M=$(SRC) modules_install
>> +        $(MAKE) -C $(KERNEL_SRC) M=$(SRC) modules_install
>>      ...
>
> I think this is actually incorrect.
>
> Makefile indentation is tab and not space, so this won't work. (This 
> is not the only piece of Makefile where this new indent shouldn't be 
> used though, so please be careful about others).


Does this matter? If you look at 
https://docs.yoctoproject.org/kernel-dev/common.html, which was built 
from the Sphinx sources which still have tabs, Sphinx replaced the tabs 
by spaces anyway. So, in any case, this isn't usable as an example we 
can copy and paste from the HTML documentation.

What about replacing the spaces by "<tab>" here? At least, though not 
syntactically correct in raw form, people would understand that a tab is 
needed there.
Cheers
Michael.

-- 

Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


