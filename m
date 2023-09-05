Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E4EBCA0FFF
	for <webhook@archiver.kernel.org>; Tue,  5 Sep 2023 19:03:15 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.31040.1693940587592632739
 for <docs@lists.yoctoproject.org>;
 Tue, 05 Sep 2023 12:03:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Em8NR3cw;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D32BEE0002;
	Tue,  5 Sep 2023 19:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1693940585;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vRLlfo2N5f8p+w/bW5c3rgulzNz0s0/DKpn1BkxQFIQ=;
	b=Em8NR3cwvj2EGwuvjUPzYj9WIeEzFAdsHDmSRHSDJ1wmzyBgV1ru6MCfL8EPgXtWvAGmGa
	lBOavcFicrgO7dzPMvqH1mnz0vq4z40wkFqdM7x1sqAvd+mtFyst2DcDM2LOWrl3HOy5ab
	19SwWH7er7j/CAav6ENUxSCl2bveLKV6SNUzZzuWxO+TYRQY5w0vk2bvfVU84Vqv3tQZXO
	eS7HdxUv/4lKG/+/K5iDXUzWpI76XgowuqnrmqJjOXEKYrYLclKrQehtlUwmpyNUV0N4+V
	s3j4A9IqmLaMnlHNlRGTiS9jCC7QUAyJB/MDHRu1KpskLV5w5h1o45PP+FCE2g==
Message-ID: <22f00508-6c59-31a5-176e-c79cb5778689@bootlin.com>
Date: Tue, 5 Sep 2023 21:03:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] dev-manual: remove unsupported :term: markup
 inside markup
To: Yoann Congal <yoann.congal@smile.fr>
References: <20230904102111.472125-1-yoann.congal@smile.fr>
 <20af2d30-c531-7285-073d-030fc58d44cf@bootlin.com>
 <ef36bc2e-c29c-a06f-3520-ae0a2e3f4521@smile.fr>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <ef36bc2e-c29c-a06f-3520-ae0a2e3f4521@smile.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 05 Sep 2023 19:03:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4192

Hi Yoann,

On 05.09.23 at 15:34, Yoann Congal wrote:
> On 9/5/23 10:21, Michael Opdenacker wrote:
>> Hi Yoann
> Hi Michael,
>
>> On 04.09.23 at 12:21, Yoann Congal wrote:
>>> ":term:`Initramfs`" in bold text appears verbatim (no link is created).
>>>
>>> The term link is present elsewhere in the text so remove the extra
>>> markup.
>>>
>>> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
>>> ---
>>>    documentation/dev-manual/building.rst | 4 ++--
>>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/documentation/dev-manual/building.rst b/documentation/dev-manual/building.rst
>>> index 1f1642e84..a39579349 100644
>>> --- a/documentation/dev-manual/building.rst
>>> +++ b/documentation/dev-manual/building.rst
>>> @@ -273,12 +273,12 @@ loading modules needed to locate and mount the final root filesystem.
>>>      Follow these steps to create an :term:`Initramfs` image:
>>>    -#. *Create the :term:`Initramfs` Image Recipe:* You can reference the
>>> +#. *Create the Initramfs Image Recipe:* You can reference the
>>>       ``core-image-minimal-initramfs.bb`` recipe found in the
>>>       ``meta/recipes-core`` directory of the :term:`Source Directory`
>>>       as an example from which to work.
>>>    -#. *Decide if You Need to Bundle the :term:`Initramfs` Image Into the Kernel
>>> +#. *Decide if You Need to Bundle the Initramfs Image Into the Kernel
>>>       Image:* If you want the :term:`Initramfs` image that is built to be bundled
>>>       in with the kernel image, set the :term:`INITRAMFS_IMAGE_BUNDLE`
>>>       variable to ``"1"`` in your ``local.conf`` configuration file and set the
>>
>> Thank you for the patch!
>> Actually, I'd prefer to keep the code as it is. It doesn't hurt as the output is the same, and it makes it easier to look for terms which are not referred to through a ":term:" statement.
> Maybe I was not clear enough in my message.
>
> The output does not stay the same :
> It goes from ":term:`Initramfs`" (":term:" is visible in the output!). see https://photos.app.goo.gl/KqRnXGy4B5UGi4Wi6 or https://docs.yoctoproject.org/dev/dev-manual/building.html#building-an-initial-ram-filesystem-initramfs-image
> ... to just "Initramfs".
>   


Thanks. I see the problem now. I guess I was looking at the wrong lines.

Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
... and merged into "master-next".

Thanks again
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


