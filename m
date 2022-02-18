Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CF15C433F5
	for <webhook@archiver.kernel.org>; Fri, 18 Feb 2022 18:03:14 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web08.507.1645207392003657252
 for <docs@lists.yoctoproject.org>;
 Fri, 18 Feb 2022 10:03:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=AnaVX9CQ;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id CB9CDE0002;
	Fri, 18 Feb 2022 18:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1645207390;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GkaZqoJhD/tV4AqGw2bUgVkVYCyvGThYvUXyP0H8VMM=;
	b=AnaVX9CQevefXz3exH5DZnIciTCq71f046gKIjX0iOOR1+PGGyXCCslhjVxKPOwVMShcHC
	3YYFYqmUeQ18FIR0oYf5uTcO5dKT4gZYkWI8y/rXXaxmJHCajWj3ex6TKKarsss7JfMIT6
	msIOFCViWNJ4gsCWkl7mParP2BhTOXwYJp4eyYz6BUthY7f5TEVHBzZ/oYVuRHDOb5nLyd
	+6OZw9zDCiFAcCVAiXO4q05KKUW/kiC6k95aAl046cKWKqNU1l6MRw8hzTA0SIdAx9d31g
	VJy+fPEMfYteiOu3Rgrj5F+bE/K7QTX32AoWHwQRzkkORWueQitfZLvjCmpfNQ==
Message-ID: <add8d843-ade6-59c1-7844-bc02c206a082@bootlin.com>
Date: Fri, 18 Feb 2022 19:03:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [master] Pull request
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <288d00ca-e20d-fafa-5962-6086504141ad@bootlin.com>
 <cfd4049897d8631c458d9ff916b1d956ab55a810.camel@linuxfoundation.org>
 <16D4F2CEEB1A79AE.28672@lists.yoctoproject.org>
 <54127154-cef1-101f-bcae-31dc6f380649@bootlin.com>
 <046477f4c63a2c6f088e65f9cb3916c11d421d2b.camel@linuxfoundation.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: 
 <046477f4c63a2c6f088e65f9cb3916c11d421d2b.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 18 Feb 2022 18:03:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2481


On 2/18/22 18:58, Richard Purdie wrote:
>
> Merged, thanks. Not sure if there was an issue with Peter's patch?


Great, thanks!
What patch from Peter are you referring to? I hope I didn't miss any...
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


