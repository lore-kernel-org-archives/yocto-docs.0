Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20E9DD132A2
	for <webhook@archiver.kernel.org>; Mon,  4 Nov 2024 10:01:02 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.54270.1730714458945295357
 for <docs@lists.yoctoproject.org>;
 Mon, 04 Nov 2024 02:00:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=GLRt7ukR;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EA299240005;
	Mon,  4 Nov 2024 10:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730714457;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Igv6v+avHX+qwaIHVVbeUT/pApNtQM7ysO3eD1x3kLM=;
	b=GLRt7ukREMHBP11uwsp0XaMSJ0MtPMyjLVDoJjDNBjiPXHVXsmc3+lGbz+3qVhVaP21vbw
	CPXHRf8K8RXptS0e8A5zqz3GbKoOQOBXGfJkPfrPmMhegVxSvvTJgqYRyNqz+E3jC2z3lW
	oywiGihLUkZVqlykAEUHldaSaCYyxpCCs6gXsyYcLJvM14uYTedOiRRF0UCj33yjN0JPkn
	S2J9kpXxRIl7OiRlhiiZICqPc50x4T6EcFieAWI12eR9hs0Q2wP+UWOPt0VSJeMSQLV8ok
	soJV+GHmdMCIazcdU2NA98ZLfW65CTgvSkihtrV3fvndYZ/ZUJHM0Jv+yIS1CQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 04 Nov 2024 11:00:56 +0100
Message-Id: <D5DB2L73DR5N.W2NESKUIBQM1@bootlin.com>
Subject: Re: [docs] docs.yoctoproject.org appears to be broken
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Mark Hatle" <mark.hatle@kernel.crashing.org>,
 <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.18.2.r87.gd0484b15
References: <daa37959-b3cd-4cd5-a6a6-e7c3814ec5ae@kernel.crashing.org>
 <1804B57D7851769E.18610@lists.yoctoproject.org>
In-Reply-To: <1804B57D7851769E.18610@lists.yoctoproject.org>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 04 Nov 2024 10:01:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5647

On Mon Nov 4, 2024 at 9:08 AM CET, Antonin Godard via lists.yoctoproject.or=
g wrote:
> Hi Mark,
>
> On Sat Nov 2, 2024 at 8:47 PM CET, Mark Hatle wrote:
>> I was searching for the documentation for the NVD API KEY when I noticed=
 that I=20
>> wasn't able to switch to different versions of the document.
>>
>> https://docs.yoctoproject.org
>>
>> Then try to switch to 'Unable (dev)' nothing happens.
>>
>> Going to https://docs.yoctoproject.org/dev/ lets me review the 'dev' doc=
s, so=20
>> the docs themselves are there, it's only the selection that appears to b=
e broken.
>>
>> --Mark
>
> Thanks for reporting that, I'll try to see what went wrong there.

Fixed. Thanks!

Antonin

--
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


