Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8142DC25B74
	for <webhook@archiver.kernel.org>; Fri, 24 May 2024 08:26:09 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.11157.1716539165066567794
 for <docs@lists.yoctoproject.org>;
 Fri, 24 May 2024 01:26:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=f8x6P4o5;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0CEF160002;
	Fri, 24 May 2024 08:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1716539163;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A1GEGGv5Fz/h+0BnMnwjeMwo0YD/KIVpN+d3jCXvMSs=;
	b=f8x6P4o5pO97MVVGk88pQZKDgOJj6eB34QgrR6C4ACZwXZss0158BcJQD65/RbINv+5c0/
	cFdJWFcbe+7+KWdEwtt43siKbzZvZZe35NxJIGO6kgu/ZIMwn7Hqquiq79MgmDTMPwQ2vn
	5jrfa9Zh3tL5hXMaNkyj59yl0a8mSlSFXzTSG6xvVV55PsWBQ/QF2EQVCoBX2eLtS4SRP5
	KHgK3tsR4AiJIhOaIJhBwhTAkJ2To7vHcUiBoJgKXi9BFfGWx4GKnISOyaaM9zXLsBvcn4
	x1h4I9vK6gRgELOimdwx19qT/yaLEtFmAr1xJx385I398tsSSzkpqcezEgoGHQ==
Message-ID: <cdf74200-11d6-465f-976a-f17b7b4d0ee9@bootlin.com>
Date: Fri, 24 May 2024 10:26:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 2/3] ref-manual: introduce UNPACKDIR variable
To: Andrew Murray <amurray@thegoodpenguin.co.uk>
References: <20240523135628.3076018-1-michael.opdenacker@bootlin.com>
 <20240523135628.3076018-2-michael.opdenacker@bootlin.com>
 <CALqELGzk_0CS4LU_TEwzg1=vrNZcdnNNGOTEZH2T7hhLYM-NWQ@mail.gmail.com>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <CALqELGzk_0CS4LU_TEwzg1=vrNZcdnNNGOTEZH2T7hhLYM-NWQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 24 May 2024 08:26:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5248

Hi Andy

On 5/23/24 at 16:15, Andrew Murray wrote:
> Hi Michael,
>
> On Thu, 23 May 2024 at 14:56, Michael Opdenacker via
> lists.yoctoproject.org
> <michael.opdenacker=bootlin.com@lists.yoctoproject.org> wrote:
>> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
>>
>> Note that this doesn't touch the "Source Fetching" section
>> in overview-manual/concepts.rst yet, as the unpack implementation
>> may not be finalized yet.
>>
>> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
>> ---
>>   documentation/ref-manual/tasks.rst     | 8 ++++----
>>   documentation/ref-manual/variables.rst | 5 +++++
>>   2 files changed, 9 insertions(+), 4 deletions(-)
>>
>> diff --git a/documentation/ref-manual/tasks.rst b/documentation/ref-manual/tasks.rst
>> index 2e4b23408d..70c0dea3bb 100644
>> --- a/documentation/ref-manual/tasks.rst
>> +++ b/documentation/ref-manual/tasks.rst
>> @@ -412,12 +412,12 @@ them. You can learn more by looking at the
>>   -------------
>>
>>   Unpacks the source code into a working directory pointed to by
>> -``${``\ :term:`WORKDIR`\ ``}``. The :term:`S`
>> -variable also plays a role in where unpacked source files ultimately
>> -reside. For more information on how source files are unpacked, see the
>> +``${``\ :term:`UNPACKDIR`\ ``}``. Another, legacy way to specify
>> +this directory is through the :term:`S` and :term:`WORKDIR` variables.
> I find this sentence a little confusing to read.
>
> "Another, legacy" suggests you've already given a method that was
> legacy. But here you're really saying "Another way, which is legacy".
> Perhaps this could be phrased differently, e.g. "A legacy way to
> specify this directory is through..."
>
> Also it doesn't really tell you how to use S and WORKDIR. I wonder if
> you need to mention these at all, given they'll be described elsewhere
> in the document. Why point a user to something legacy?

This definitely makes sense, thanks!

I simplified my paragraph as follows:

Unpacks the source code into a working directory pointed to by
``${``\ :term:`UNPACKDIR`\ ``}``. A legacy way to specify
this directory is through the :term:`S` and :term:`WORKDIR` variables.
For more information on how source files are unpacked, see the
":ref:`overview-manual/concepts:source fetching`"
section in the Yocto Project Overview and Concepts Manual.

Thanks again
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


