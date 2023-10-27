Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B681C25B47
	for <webhook@archiver.kernel.org>; Fri, 27 Oct 2023 15:09:47 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.9286.1698419379264807365
 for <docs@lists.yoctoproject.org>;
 Fri, 27 Oct 2023 08:09:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=bCayDBmc;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6A05960005;
	Fri, 27 Oct 2023 15:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1698419376;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dhPs2p9/ruMdCyZvExLCr8Fm81JLs2VtpQ3i2vJUDUc=;
	b=bCayDBmcBbKcEOjzS3VzgJOGyx/HRuMWUbCgQoqPovioo078PBJ79eopyCzUIZcDFjzVWd
	n2t3BB3IyDrNufdW+PQMweOBv7Jgqm++EGDlLZlQjamVuT68jMehnVyr310K5F6QOJAZ6z
	KRT8bqZQO7tBUFu2EjvMSiRxtsPzIa0pmRv0RDfFn0Xl3ydR3vU+e5RUXWkT4hBOTWTLdU
	HWNL23zKs6K6KasjipwOf41fkRuv76Z1q0TrUf/pjILfOimopQdHnKTHn/rbcUL97u1gLz
	LKCEBLBJ3wwH93RN3DetmvK/gZkkYVKDK0/d+U8mIHSVvSsYUEvZBo8/wFDQtQ==
Message-ID: <eeeaafba-880b-4140-a622-b77d2ffef6e6@bootlin.com>
Date: Fri, 27 Oct 2023 17:09:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] ref-manual: document KERNEL_LOCALVERSION
Content-Language: en-US
To: Daniel Ammann <daniel.ammann@bytesatwork.ch>
References: <20231027092935.1601588-1-michael.opdenacker@bootlin.com>
 <8454ccc7-bf66-463a-842b-da30c6332a9e@bytesatwork.ch>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <8454ccc7-bf66-463a-842b-da30c6332a9e@bytesatwork.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 27 Oct 2023 15:09:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4515

Hi Daniel,

Thanks for the review!

On 27.10.23 at 13:27, Daniel Ammann wrote:
> Hi Michael
>
> Comment inline.
>
> Kind regards
>
> Daniel
>
>
> On 10/27/23 11:29, Michael Opdenacker via lists.yoctoproject.org wrote:
>> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
>>
>> Introduced by
>> https://git.yoctoproject.org/poky/commit/?id=66ed174ccdf7a89cb998f503cc6b631e2d1adcc0 
>>
>>
>> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
>> CC: Bruce Ashfield <bruce.ashfield@gmail.com>
>> ---
>>   documentation/ref-manual/variables.rst | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>>
>> diff --git a/documentation/ref-manual/variables.rst 
>> b/documentation/ref-manual/variables.rst
>> index 03234d3f78..771eb91af6 100644
>> --- a/documentation/ref-manual/variables.rst
>> +++ b/documentation/ref-manual/variables.rst
>> @@ -2485,6 +2485,16 @@ system and gives an overview of their function 
>> and contents.
>>         external tools. See the :ref:`ref-classes-kernel-yocto` class in
>>         ``meta/classes-recipe`` to see how the variable is used.
>>   +   :term:`KERNEL_LOCALVERSION`
>> +      This variable allows to appends a string to the version
>
> allows to append


Oops, good catch. Fixed in master-next.
Thanks again,
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


