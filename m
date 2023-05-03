Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1273DC77B7F
	for <webhook@archiver.kernel.org>; Wed,  3 May 2023 09:37:59 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.14894.1683106676879209050
 for <docs@lists.yoctoproject.org>;
 Wed, 03 May 2023 02:37:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=m3yRJl8b;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 376C51BF20A;
	Wed,  3 May 2023 09:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1683106674;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aQiUo+LUVkVli9Xw5Q95cwGyt2UKuSJKWzAvuhl+BuA=;
	b=m3yRJl8b1x0giVgoE5ukNgNlZekUOD3Es0Cp/F+uBELj5ugBeUSnrC4n72L6fePReJVhY6
	fkhf1wzDEdml4+vNsVa6YtGus3hr6Whlle5Wcq5auTnu1dGJEu+zxJnx0fBOqkk1N/7usD
	LVx+Tp10PS6RPQHI58OT5ACI2UwBOvNWNVshJEVBDEJeRGuISZWqFeXTe/tKHyYNHi+IaP
	bUIDS2kOGr2ywNuaZA3TuKomOGNh5E+SnQyZQ4ovjYR+TdpUXbhhvMzEVCn5uFiW5YEbS+
	0SkRjZ3nqjcnDd2AHeu0Gr6rHLlxp3Zj2x7qyfxof0Lyf0M6eA3V65Dzb9EV0Q==
Message-ID: <65845df5-37a5-202f-f5ec-00d2199bc347@bootlin.com>
Date: Wed, 3 May 2023 11:37:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] poky.yaml.in: simplify host package requirements
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20230503090136.2483595-1-michael.opdenacker@bootlin.com>
 <cdaf1f42bc82c7a9146070925079ea0ceba3e98e.camel@linuxfoundation.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <cdaf1f42bc82c7a9146070925079ea0ceba3e98e.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 03 May 2023 09:37:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3898

Hi Richard,

Thank you for reviewing this patch!

On 03.05.23 at 11:13, Richard Purdie wrote:
> On Wed, 2023-05-03 at 11:01 +0200, Michael Opdenacker via
> lists.yoctoproject.org wrote:
>> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
>>
>> Some of the listed host packages were no longer necessary.
>>
>> [YOCTO #14873]
>>
>> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
>> ---
>>   documentation/poky.yaml.in | 28 ++++++++--------------------
>>   1 file changed, 8 insertions(+), 20 deletions(-)
> I think this is another "it depends" situation.
>
> The cut down lists you have below probably works fine if you just want
> to build and image and hopefully let you run it under runqemu.
>
> Where things will start to get problematic is some of the testing
> workflows such as "oe-selftest -j X" which definitely needs python3-
> subunit, or resulttool which does need python3-jinja2 for some options
> iirc.
>
> As such, which this change is right for some workflows, it isn't
> correct for others.


Right, I just tested for the use case advertised in the manual, that is 
running "bitbake core-image-minimal" and "runqemu qemux86-64". The 
latter command didn't need extra SDL host packages.

>
> Ideally there would be two levels of dependencies, those needed for the
> basics and those needed to cover all the needs.
>
> Looking at the original bug, I think we did remove some of the
> SDL/xterm/vnc requirements. Even then some vnc pieces are still needed
> for some autobuilder setups though.
>
> We likely should define which workflows we expect to work with this
> "essential" dependency list?


Maybe we could document this elsewhere (in a section for developers / 
testers ?), to keep the list short for regular users.

The thing is it's easier to add new requirements than to remove the ones 
which are no longer needed.

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


