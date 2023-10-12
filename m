Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90E86CDB47E
	for <webhook@archiver.kernel.org>; Thu, 12 Oct 2023 11:47:31 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.9143.1697111251066759241
 for <docs@lists.yoctoproject.org>;
 Thu, 12 Oct 2023 04:47:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ZMok2Fi4;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D8751E0002;
	Thu, 12 Oct 2023 11:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697111249;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=If/Wjpw63cR+N9CAca9sUQSqoGTb2NjdlL5iLWUtdlQ=;
	b=ZMok2Fi4oYsym7w5an542+XmiQWZpD7N70nD0HQGcDCsbXpyG+0n4fpQBOV1d/In3NMoR6
	ATsGIMxEYnfn0TAxMry5mncSQbZKifALBwe2InlpSdjv6K3Z0845CvLJhtsbrfO7CzVGtu
	S6Htf1FJ4DmnjoZEyncO6XfMuPiOataBuhv/HYBqy6/vxjACQo6aDgU3ZT9dLm08/Blne1
	Uo4ILvyf2HpPkg0BY12hLHyrvZ+qZUpX9R35WPc9h1vguhiqAP+IVyP2T+k8Y9HF39muXz
	rujtsSKqm/NF9mDJv0JVnWUah8w3HM67CT2tpQsZQr+8pCYk1+rcQmCn7q01pg==
Message-ID: <0e79d27e-3671-4f5f-96f2-468caaf87eda@bootlin.com>
Date: Thu, 12 Oct 2023 13:47:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] BSP Guide: intel-quark not in meta-intel anymore,
 intel-skylake-64 is
Content-Language: en-US
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
References: <e5a575c3-b75c-1289-6380-c5f73c8a154c@crashcourse.ca>
 <d39c0048-b1b5-4d3e-9694-a8c02fe27c6a@bootlin.com>
 <d3c3d3ff-6dd8-7ed7-585c-e884323283@crashcourse.ca>
 <178D599DEF0A8393.21112@lists.yoctoproject.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <178D599DEF0A8393.21112@lists.yoctoproject.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 12 Oct 2023 11:47:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4361


On 12.10.23 at 13:46, Michael Opdenacker via lists.yoctoproject.org wrote:
>
> On 12.10.23 at 12:47, Robert P. J. Day wrote:
>> On Thu, 12 Oct 2023, Michael Opdenacker wrote:
>>
>>> Hello Robert,
>>>
>>> On 12.10.23 at 08:38, Robert P. J. Day wrote:
>>>>     here:
>>>>
>>>> https://docs.yoctoproject.org/bsp-guide/bsp.html#developing-a-board-support-package-bsp 
>>>>
>>>>
>>>> the Note refers to (among other core intel BSPs) intel-quark. what is
>>>> actually in that layer these days is intel-skylake-64, not sure what
>>>> sort of rewriting that would involve.
>>> Actually, I'd update this note to remove the "edgerouter" machine.
>>    except that edgerouter is the poky MIPS-based reference machine,
>> even to this day.
>
>
> Are you sure?
> I don't find the machine in Poky any more.


See 
https://git.yoctoproject.org/poky/commit/?id=0c64d0e4317e3749f7f7ed9ecd5d08bbb0cedc9e
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


