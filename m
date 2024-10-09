Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E08BCEDDA2
	for <webhook@archiver.kernel.org>; Wed,  9 Oct 2024 14:39:21 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.18408.1728484757875708770
 for <docs@lists.yoctoproject.org>;
 Wed, 09 Oct 2024 07:39:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Z60hs+hz;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C52E11BF207;
	Wed,  9 Oct 2024 14:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1728484756;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YlUrD2LGONWUAgX9W0z0rRIa+X+XhtoHuqFevAp5MQs=;
	b=Z60hs+hzr7J060fSk5p4jQcLsvp8V60ZsZXhhZq2j5hm9rJERqA/e5/qc70RNXEQWQsEoA
	25TsgMXU3zf148GDgcLUWLehXjZmQxsUZbQ5cNKQulXL6GU6T/yfnLUpm40C+lYxpz5II8
	WsiN32/RW5Fbod2rP/hCTNZ0yL/8rZEusvV7u4OPdzxEeIGkaZPGWJQoEgckgKQCpK0pUq
	3+B0UfTGQJUKXmJC6J2AdTBp1T1tPdoMBGdvT9KcdzHoKqq/5EEw4dczvi5aMVy6ouUyO3
	llokwHoV/kuJC2L1owFhRCFpjFVHm3sf5xNL71YANlGXh//LESI738DMmzJWhw==
Message-ID: <445b73cf-42d2-4d64-a235-c26cc70aa446@bootlin.com>
Date: Wed, 9 Oct 2024 16:39:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 12/16] ref-manual: add missing variable
 PRSERVER_UPSTREAM
To: Michael Opdenacker <michael.opdenacker@rootcommit.com>,
 docs@lists.yoctoproject.org
References: <20241009074120.866786-1-antonin.godard@bootlin.com>
 <20241009074120.866786-13-antonin.godard@bootlin.com>
 <7b229531-3d0f-4507-a7a8-090bc08ac45e@rootcommit.com>
Content-Language: en-US
From: Antonin Godard <antonin.godard@bootlin.com>
In-Reply-To: <7b229531-3d0f-4507-a7a8-090bc08ac45e@rootcommit.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 09 Oct 2024 14:39:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5427

Hi Michael,

On 09/10/2024 16:28, Michael Opdenacker wrote:
>> +   :term:`PRSERVER_UPSTREAM`
>> +      This variable can be used to specify an upstream PR server for 
>> the local
>> +      PR server to connect to, in the form of ``host:port``.
>> +
>> +      This makes it possible to implement local fixes to an upstream 
>> package.
> 
> 
> Actually, the right variable should be PRSERV_UPSTREAM (instead of 
> PRSERVER_UPSTREAM), as used in the rest of the BitBake code.
> I've submitted a patch last week to fix this in bin/bitbake-prserv, but 
> it hasn't been merged yet.
> https://lore.kernel.org/bitbake-devel/20241002150747.85513-1- 
> michael.opdenacker@rootcommit.com/T/#u

Thanks! I got tricked by grepping for PRSERVER_UPSTREAM actually.
Will update in v2.

Cheers,
Antonin

