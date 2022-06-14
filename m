Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C61AC43334
	for <webhook@archiver.kernel.org>; Tue, 14 Jun 2022 17:20:30 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web12.66.1655227224118168990
 for <docs@lists.yoctoproject.org>;
 Tue, 14 Jun 2022 10:20:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=U7kHPjub;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 42C0E1BF204;
	Tue, 14 Jun 2022 17:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1655227221;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=llhp1wI3p3xLwWz3I1b9BzJ1KiJNdxVAp4Jm+E9d8H8=;
	b=U7kHPjubRsfzMY5APb0Tybq+4B2hSrj0lrEkMPXeOnpBenhyqQJJwZZggj3fWhR/HxFBBc
	0OdW7MtEa24JLuEw6KJ1torEh0mirEnq4wdmGc9EB0aUxhiVPmnZ+tfd4ozanFFoLqaIad
	+g6152w/yI9CS3hVfuowdxWJYeb4sOOXO38gpY0fZNh7CARQ8Yp6on8WdQM4jeRuob0HfS
	itmnjS+kDKaA3tRbSFEuYEglvLs78+pZSLJRlpJ7rr0j6WyUzo/GC0HbMilHe3eU3ZOShW
	8OPEdEHRdU+DJd+XN6AyBXuOc2rGk5mmxvT/5EVcRw+guiEqQiGXUhuSUdPdyg==
Message-ID: <bd26f1ec-5e7e-2aa2-192e-e5046d47a0a3@bootlin.com>
Date: Tue, 14 Jun 2022 19:20:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [docs] [PATCH] ref-manual: add description for the "sysroot" term
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 docs@lists.yoctoproject.org
References: <20220613155939.94911-1-michael.opdenacker@bootlin.com>
 <73a31eefa84a8416adb982e76aa19b3b7660e5ae.camel@linuxfoundation.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: 
 <73a31eefa84a8416adb982e76aa19b3b7660e5ae.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 14 Jun 2022 17:20:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2997

Hi Richard,

On 6/13/22 18:55, Richard Purdie wrote:
> On Mon, 2022-06-13 at 17:59 +0200, Michael Opdenacker via
> lists.yoctoproject.org wrote:
>> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
>>
>> This term is used throughout the manual but is not properly
>> introduced anywhere.
>>
>> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
>> ---
>>   documentation/ref-manual/terms.rst | 25 +++++++++++++++++++++++++
>>   1 file changed, 25 insertions(+)
>>
>> diff --git a/documentation/ref-manual/terms.rst b/documentation/ref-manual/terms.rst
>> index cba514c345..76f3fb0d08 100644
>> --- a/documentation/ref-manual/terms.rst
>> +++ b/documentation/ref-manual/terms.rst
>> @@ -383,6 +383,31 @@ universal, the list includes them just in case:
>>        ":ref:`overview-manual/development-environment:repositories, tags, and branches`"
>>        section in the Yocto Project Overview and Concepts Manual.
>>   
>> +   :term:`Sysroot`
>> +
> How about:
>
> """
> When cross compiling, the target file system may be differently laid
> out and contain different things to the of the host system. The concept
> of a sysroot is directory which looks like the target filesystem and
> can be used to cross compile against.
> """
>
> then go on and explain target vs. native.


Thanks for the better description! I sent a new version with it, though 
I forgot to call it "v2".
Were you suggesting to drop the description of what a sysroot is in the 
context of a cross-compiling toolchain?

Thanks again for the review
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


