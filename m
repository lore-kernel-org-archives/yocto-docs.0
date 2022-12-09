Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06688C4332F
	for <webhook@archiver.kernel.org>; Fri,  9 Dec 2022 18:24:48 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.231.1670610278627319238
 for <docs@lists.yoctoproject.org>;
 Fri, 09 Dec 2022 10:24:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=oS/bCqDN;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 7211920008;
	Fri,  9 Dec 2022 18:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1670610275;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=No3W9/7V4ACe7kD7KpqboMtsOL7wCzyu5eKZUci+yAY=;
	b=oS/bCqDNs76c0Yd6Nr9LtDkMRp+nXvlr9qX+jRcvF9Fw7zin42YJ6nISH6OD9gAPXfBhkq
	sYowYCwAbf2VmGtf0SE/WbKvnhiohRPtLspEJOHCioFzeNqdyjoZ+486zAPCFaQ8n6CKqN
	/xT9VXESO2U1hYTM3a8yva+p0zVeM7l7Rv2SXk+3LqrIC5crSMQGa1iY6OzYy1vmJ0n3Md
	l+ai+CHRv5JrJuEybJeuMI6MylrAfbl/JmTGfUdycarU4a+Fg/kQS4vX55ksDBdWAdY4xa
	r3tJQ4wYibSatARK8HhMP+TUDBzf+BAx2J9A0iJA97aGlfuxGkol/mwB21Su7w==
Message-ID: <ac8e0626-c3c3-8cf4-aead-ba8eba290526@bootlin.com>
Date: Fri, 9 Dec 2022 19:24:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] ref-manual: update references to release notes
Content-Language: en-US
To: quentin.schulz@theobroma-systems.com
References: <20221208151610.20370-1-michael.opdenacker@bootlin.com>
 <0238be8d-2341-45d5-dd5d-ebfd1ea1ccf1@theobroma-systems.com>
 <f1540530-9eeb-fa58-a60c-93e1ef8e8d40@bootlin.com>
 <4a4bc51a-f4a0-bf06-9234-b8dd8d0f2bd3@theobroma-systems.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <4a4bc51a-f4a0-bf06-9234-b8dd8d0f2bd3@theobroma-systems.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 09 Dec 2022 18:24:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3544


Am 09.12.22 um 17:38 schrieb Quentin Schulz via lists.yoctoproject.org:
> Hi Michael,
>
> On 12/9/22 16:22, Michael Opdenacker wrote:
>> Hi Quentin,
>>
>> Thanks for the review.
>>
>> Am 09.12.22 um 11:05 schrieb Quentin Schulz via lists.yoctoproject.org:
>>> Hi Michael,
>>>
>>> On 12/8/22 16:16, Michael Opdenacker via lists.yoctoproject.org wrote:
>>>>
>>>> +         components might cause build problems. See
>>>> +         :yocto_docs:`Release Information </migration-guides/>` 
>>>> for your
>>>> +         version of the Yocto Project, to find the specific 
>>>> components with
>>>> +         which the toolchain must be compatible.
>>>
>>> Where is this info located exactly?
>>
>> Well, information is scarce. In the release notes, you have at least 
>> the glibc version which is supported, and sometimes but not 
>> systematically the supported gcc and binutils versions.
>>
>> Shall I say "where you may find the specific components..."?
>
> I'm just wondering how this would help people if there's no actual way 
> of knowing the specific components or their version.
>
> In the end, if there's not more information than the previous 
> location, I guess the patch in itself is fine and another 
> patch/workflow/process can be put in place to make this more helpful 
> (if even possible).


Agreed. We can improve this in a future commit.
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


