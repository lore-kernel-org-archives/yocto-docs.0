Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14B8DCDB47E
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 09:22:27 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.50449.1697793742975976932
 for <docs@lists.yoctoproject.org>;
 Fri, 20 Oct 2023 02:22:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Nt/o+18L;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6FAE0E0003;
	Fri, 20 Oct 2023 09:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697793740;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k5c3p75Q3BGQQBIrLzcp1ZuznbVFVP1VCVJ+7n7oQqc=;
	b=Nt/o+18LZTif1M50qsJTS3kX7pZsOAbAv2hvFzLo9p2Iq3ZIWHDtyudZISFRdpmWACcKUh
	vR/0ufMGushOe8anNeHGV/VEgAdxardu0dQvanrAI8KTrO2R2EOFa6jaPin0qX/7CjTGDz
	zoB+UE8OA/HOaEAuLJ1bAzuUw5dWJLJzE2s6VC6yMFWhR0DpO+t+/M2oVkmKktVHcgzPBW
	pKeGl65Yz64/g/sCz8wmrilIZeR0RYO7ROmT0FjtlaoPf9LpB3DiRbvWHkoxTafbv9O5e7
	6TastIzk7HTsoM2FFwDyG1vImMl/IfEhQOJC8ycQ8PN4mxq4z4rKV9n2bZ58KQ==
Message-ID: <ee800f1a-e584-4424-b15b-0904deb4d007@bootlin.com>
Date: Fri, 20 Oct 2023 11:22:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 1/3] ref-manual: variabls: Add RECIPE_SYSROOT and
 RECIPE_SYSROOT_NATIVE variables
Content-Language: en-US
To: BELHADJ SALEM Talel <bhstalel@gmail.com>
References: <20231019214827.405886-1-bhstalel@gmail.com>
 <178FC5C86561F9EA.11247@lists.yoctoproject.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <178FC5C86561F9EA.11247@lists.yoctoproject.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 20 Oct 2023 09:22:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4435


On 20.10.23 at 11:10, Michael Opdenacker via lists.yoctoproject.org wrote:
> Hi Talel,
>
> Thanks for this update!
> I still have a few comments. See below...


Ah, also fix the typo in the commit title (s/variabls/variables/) and 
make it shorter:

ref-manual: variables: add RECIPE_SYSROOT and RECIPE_SYSROOT_NATIVE

Thanks
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


