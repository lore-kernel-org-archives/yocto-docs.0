Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44FE9CDB482
	for <webhook@archiver.kernel.org>; Thu, 19 Oct 2023 09:10:29 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.23494.1697706627353271628
 for <docs@lists.yoctoproject.org>;
 Thu, 19 Oct 2023 02:10:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=e3++ZjSj;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1938740010;
	Thu, 19 Oct 2023 09:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697706625;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cuhMe1Q3SVOt/0OgYQJrPnQFTZoNzi0G/N2Zu4vcEpw=;
	b=e3++ZjSjzuDpeIUleMRnNdPa6ufg0DH+Bj9roEUaPTTOv5J7Rix/MeFaAlUMY9YJ06AO8K
	mDi661oGX8bMoRMxYSTodsralO6jyY5KvggSQuTriVPD5jU1XhUfC/LzUZdqDBylIGDfJk
	9hdAZS3eT46JaVAek/Sk1oLZZoJX12TwIPolB04R9afaJqSrSaJX6H1wZjl3JKdj39WQoe
	LHtyxogpxKYnRLBNLZEyFdwwj2Ly+3wR7U7n1TtkZ3NbtQhBkP+rGrsoSAJEkzsMbOkguP
	g1EtF0gIUEd+u/AUXuUoVzC6KINdJNpYEchxVNwsf771sf2xwzC44VjiYO2FTQ==
Message-ID: <09680b08-be41-4dde-8620-f0ca141bdf12@bootlin.com>
Date: Thu, 19 Oct 2023 11:10:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: YP docs mailing list <docs@lists.yoctoproject.org>,
 yocto-security@lists.yoctoproject.org
Subject: Re: [docs] Documenting YP processes
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Marta Rybczynska <rybczynska@gmail.com>
References: <CAApg2=TOJg06EP3JJmaoC-mxzPM3=4WkW0y3ADuuXRVsccoefw@mail.gmail.com>
 <ef4d2c98-e7f2-4c3d-8a59-dd5d1e181dea@bootlin.com>
 <f296756f07267e29d23732acf41e7c799d7f4d22.camel@linuxfoundation.org>
 <CAApg2=TMPH+RX4=+uZh7-cG4URFEcYwroxybPMnoBtDZBVk=0Q@mail.gmail.com>
 <e59bc7cf-4b40-4767-806d-75bc57a2c807@bootlin.com>
 <501a35be909bd40dcb4bc4682f7b9e27fe8efbd5.camel@linuxfoundation.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <501a35be909bd40dcb4bc4682f7b9e27fe8efbd5.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 19 Oct 2023 09:10:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4415


On 19.10.23 at 11:08, Richard Purdie wrote:
> My concern is whether there is enough content for a dedicated manual. I
> know it often feels like there is but when you write it down, I think
> there is a lot less than it feels like there is. We should have a
> relatively high bar to a new manual. Perhaps we start with a section
> and then migrate to a manual if it feels like there is enough content
> to make sense?


This sounds like a sensible approach.
+1

Michael.
-- 

Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


