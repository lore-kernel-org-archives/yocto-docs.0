Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5206BCEDDA1
	for <webhook@archiver.kernel.org>; Wed,  9 Oct 2024 14:34:01 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.18172.1728484437775105217
 for <docs@lists.yoctoproject.org>;
 Wed, 09 Oct 2024 07:33:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=n6gReyAY;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CED22FF80C;
	Wed,  9 Oct 2024 14:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1728484436;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8jTtYoFSkPhqcXbdmP8MkKRI5KWvQ2YcPCWZSLi7xY8=;
	b=n6gReyAYiIf3G+8nVADR6/sV9IP9djl6ToYqmTBIn6lLRei/7D8E+A0arcTxIzdO+Bzp5U
	osi6xxMhpXHecUXuS5p5aG6pWINon8mD4uf3oJW8KjFg9q7GxAo7d5JOPDgTm0t6P6lbgo
	osMRPWx7ytuewyGYol+mlZf0T0KAnjbhHZHjJOdzEjU1L3pvAXbkpACzUwmBTqU6nbJ76Y
	UPiOsCpmvpb6r/kj1/rWxIvxrYT5hZaM/UaifDHHVu4SZg6WZf78q5Bc21eVZwvAf7DgRO
	H6YTSV/QB/359DaRo4B8Y+rjmhfkJpMQryM9IvrY9NswdldNSADmR4ZHMbvvfA==
Message-ID: <0062b62a-0c75-4a78-ab67-3a22033ef060@bootlin.com>
Date: Wed, 9 Oct 2024 16:33:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 16/16] release-notes-5.1: update release note for
 styhead
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 docs@lists.yoctoproject.org
References: <20241009074120.866786-1-antonin.godard@bootlin.com>
 <20241009074120.866786-17-antonin.godard@bootlin.com>
 <71c1b7f5af4f8fbcdf736246e1fc7eadd46bce9f.camel@linuxfoundation.org>
Content-Language: en-US
From: Antonin Godard <antonin.godard@bootlin.com>
In-Reply-To: <71c1b7f5af4f8fbcdf736246e1fc7eadd46bce9f.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 09 Oct 2024 14:34:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5426

>> +-  Rust related issues:
>> +
>> +   -  Rust builds are not fully reproducible (only ``rust-dbg`` and
>> +      ``rust-rustdoc`` are not).
>> +
>> +   -  There are some remaining rust selftest failures that need to be fixed, due
>> +      to the way it is being built.
> 
> In general these look really good, thanks.
> 
> I wanted to note that the above is now incorrect, rust is fully
> reproducible. There were points during development where it was not but
> those issues were resolved. These known issues can therefore be
> removed.

Thank you. I must've misread the log or got the order wrong. Anyway I
will send a v2 without this.

Cheers,
Antonin

