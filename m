Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DC59CDB46E
	for <webhook@archiver.kernel.org>; Thu, 12 Oct 2023 11:46:11 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.9125.1697111168653793297
 for <docs@lists.yoctoproject.org>;
 Thu, 12 Oct 2023 04:46:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=WqlHpqgx;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 297131C000C;
	Thu, 12 Oct 2023 11:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697111166;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dC0fIAoIziA6CVodyXI0SthBJxPVU694RKPj3qaxVnY=;
	b=WqlHpqgx48B1PiwGm2YDjryjFp61ttRnHG/q0+sRifHVvVS9bexNMWDIwQODaZBs/CUHLQ
	xBPgf7h7TOn24EnDtGDHaFq/jl1T9bZE8T5Pcfc3yK4FH3XJxb/ohVV1nVzN6rOSYbNMgC
	gPvLCyKoTHy21sONcMZVUdF3XER9FPel7AcWxo7/H6eBNZVeQWKbg/GyDkVHIKNgx1Of9p
	/Wz8gevC+0uO0hQ1WMUvdrh69xOysyAUqJI+J8+zt3DSKZGtS8B/oybvjtZuJxeEA4/bKm
	C74M2qS4ZMrlotnXYu+5slb7FCP3gNEZ3rDlTqUvSofJAIGFoIOhFzaxldpDqQ==
Message-ID: <351ebb38-a74a-4692-b6f7-e5c2f7b4fa86@bootlin.com>
Date: Thu, 12 Oct 2023 13:46:04 +0200
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
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <d3c3d3ff-6dd8-7ed7-585c-e884323283@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 12 Oct 2023 11:46:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4360


On 12.10.23 at 12:47, Robert P. J. Day wrote:
> On Thu, 12 Oct 2023, Michael Opdenacker wrote:
>
>> Hello Robert,
>>
>> On 12.10.23 at 08:38, Robert P. J. Day wrote:
>>>     here:
>>>
>>> https://docs.yoctoproject.org/bsp-guide/bsp.html#developing-a-board-support-package-bsp
>>>
>>> the Note refers to (among other core intel BSPs) intel-quark. what is
>>> actually in that layer these days is intel-skylake-64, not sure what
>>> sort of rewriting that would involve.
>> Actually, I'd update this note to remove the "edgerouter" machine.
>    except that edgerouter is the poky MIPS-based reference machine,
> even to this day.


Are you sure?
I don't find the machine in Poky any more.

>
>> And why does it mention "meta-ti" as a part of the Yocto Project
>> release? I don't see "meta-intel" in recent releases (except maybe
>> for Dunfell). Maybe we could just remove the part of this note
>> mentioning meta-intel.
>>
>> Feel free to update this in the patches you are preparing. I could
>> do it too.
>    you can clean up that bit as you wish, i'll keep working on other
> sections.

All right, will do. Thanks!
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


