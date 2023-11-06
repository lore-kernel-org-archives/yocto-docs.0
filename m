Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7F18C4332F
	for <webhook@archiver.kernel.org>; Mon,  6 Nov 2023 17:07:51 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.59738.1699290466042410867
 for <docs@lists.yoctoproject.org>;
 Mon, 06 Nov 2023 09:07:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=OynE2OX9;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 18F5A1C0008;
	Mon,  6 Nov 2023 17:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1699290463;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wZkbb72LdINgYYbKhi96FuoUIFAr4wYtHlIgKH1d7YY=;
	b=OynE2OX9TcoRCQKQMaEDfPD4FsyhEUCM7V1R5NBlLf8eSE3oOOcgfHfq0jvLiw+3rcD0po
	dFC/b1HXuJjt5zxENboHugA3DqV4TnJtUrcm47VR38+R5GT79KGSyS9FCO9/vpO/cxZ5YG
	CZgQ+26LmEFdgTDfkDlSGtwcRjpm+WdvAxgIQmFlr6DzVY0zfuAXEAZGfisInXzZDuBCfG
	5igMrx08GZnckKXyqXRxwTu0tE85t9ltlv2nll+0xq8Y2IDuRPIf5rlINnzfT0OEcpUSIS
	5/5FfO+ZwWxenMQUyCzf1IX3P6euyMTyZwbx4Hg3KibqZ39IqVWa2IdcQ+uHvw==
Message-ID: <66fe41fb-6479-4ae1-a5dc-3ee78a2dffe6@bootlin.com>
Date: Mon, 6 Nov 2023 18:07:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 06/12] release-notes-4.3: add CVEs, recipe
 upgrades, license changes, contributors
Content-Language: en-US
To: Paul Eggleton <bluelightning@bluelightning.org>
References: <cover.1699266393.git.bluelightning@bluelightning.org>
 <e46a9e5e10cbb28925025cb68d3c33e6a3292fab.1699266393.git.bluelightning@bluelightning.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <e46a9e5e10cbb28925025cb68d3c33e6a3292fab.1699266393.git.bluelightning@bluelightning.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 06 Nov 2023 17:07:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4606

Hi Paul

On 06.11.23 at 11:29, Paul Eggleton wrote:
>   Security Fixes in 4.3
>   ~~~~~~~~~~~~~~~~~~~~~
>   
> +- bind: :cve:`2023-2911`, :cve:`2023-2828`, :cve:`2023-3341`, :cve:`2023-4236`

Oops, I realize that in the docs we usually use two spaces after "-", 
though its not required by Sphinx. However, the script doesn't do that. 
That was already the case for previous release notes.

I fixed that manually, but I don't think I'll modify past release notes. 
If the script could do that too, that would be nice to have... Not 
urgent at all, of course! I can ask again when a future point release is 
made.

Thanks
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


