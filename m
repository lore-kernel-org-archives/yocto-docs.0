Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6BF0C4321E
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 18:26:35 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web10.52426.1669919187125035003
 for <docs@lists.yoctoproject.org>;
 Thu, 01 Dec 2022 10:26:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=hqQRF/V4;
 spf=pass (domain: bootlin.com, ip: 217.70.178.231, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 56E2310000A;
	Thu,  1 Dec 2022 18:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1669919184;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dGoy1JcZgi2gUQ6sAaFTOhvCwWONJ++F8DcxB8zkasA=;
	b=hqQRF/V4T111XwfkaLtYyrpM2NuMI9/ho8Wu25w7vr7KPFpIrjwaIKQUzFQmGgpAlVcM4i
	rQUvWVFSTuzHZmfMqzKIucC8KWbhwicgjswbUM4aH3YNNR40NzxEqXHMmwDaWB46XBbNuu
	ziBz5y/sGpjZNQpQ3x9YrVnkLVcpeq9flo19hkagCEPYA5Y3S2meD1+aCIbL2DXcVUyQhY
	xTKGuNPMzKb5vOVlUKg2oDemBFu7thE6zMlkNftclQIHNw+tAyRKYWre9j4q68lY/Rq3/W
	xEavi4ILYeDz9BjIopcO3S1m0nAMFMfpQXrH5WmLcJzg4D0wGcAfLPWrrGOkkA==
Message-ID: <ffd76424-02b0-0420-3bd7-8c544aac168c@bootlin.com>
Date: Thu, 1 Dec 2022 19:26:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] ref-manual: add references to variables only
 documented in the BitBake manual
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>
References: <20221201170625.266217-1-michael.opdenacker@bootlin.com>
 <015a0ce9-3745-1720-2af1-3558dc77a688@theobroma-systems.com>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <015a0ce9-3745-1720-2af1-3558dc77a688@theobroma-systems.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 01 Dec 2022 18:26:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3513

Hi Quentin,

On 12/1/22 18:11, Quentin Schulz wrote:
> Hi Michael,
>
> On 12/1/22 18:06, Michael Opdenacker via lists.yoctoproject.org wrote:
>> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
>>
>> This makes the Yocto Project manual variable list and index more useful,
>> not missing any potentially useful variable.
>>
>> The price to pay is that a reference to such variables now has to go 
>> through
>> the intermediate reference in the Yocto Project variable list, instead
>> of going straight to the Bitbake manual.
>>
>
> Is there a script/command you used and can share that does this or was 
> it done entirely manually?

I used this to find the variables only in BitBake's manual...

In BitBake, find all variables:
grep "^   :term:" 
doc/bitbake-user-manual/bitbake-user-manual-ref-variables.rst | sed -n 
-e 's/^\(.*\)\(:term:`\)\(.*\)\(`\)/\3/p' > /tmp/bitbake-vars.txt

In Yocto docs, find all variables:
grep "^   :term:" documentation/ref-manual/variables.rst | sed -n -e 
's/^\(.*\)\(:term:`\)\(.*\)\(`\)/\3/p' > /tmp/yocto-vars.txt

Then find all the Bitbake variables not in the Yocto Docs:

grep -F -x -v -f /tmp/yocto-vars.txt /tmp/bitbake-vars.txt > 
/tmp/bitbake-only.txt


Then, I added the variables to documentation/ref-manual/variables.rst 
manually.

>
> In any case,
> Reviewed-by: Quentin Schulz <foss+yocto@0leil.net>


Thanks for the review!
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


