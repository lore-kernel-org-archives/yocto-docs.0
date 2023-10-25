Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7200DC25B6B
	for <webhook@archiver.kernel.org>; Wed, 25 Oct 2023 09:54:27 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.39937.1698227660333154876
 for <docs@lists.yoctoproject.org>;
 Wed, 25 Oct 2023 02:54:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=VWNe6dnH;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 59D0AE0006;
	Wed, 25 Oct 2023 09:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1698227657;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SchDQwtUYCncaHm8Lceg6JV5lEuiGouW9Irw8rFYXiY=;
	b=VWNe6dnHdmV7cImYP4rTvtrLXNnB51i+xXv2ANmfO5A7bSO6zPjLyIPxXIiKLTPahxZsq2
	CN5uVJ+CgcLH6WG2G9iLGoWGjihFSuZuDKKgwpP8hdOzjAqo2/Ken68za5ZLpP5B95zLP2
	SsMLDFCfbpE/JnwaKq1aXUy1y4GpsnRs8/06TWf0qIMQvnNH/AODzJP1EDbDi/1UQG24RC
	OE0lLN1vzDbA2PoIUu7tM/HbRaad400ujnlMiqmz9g6yRLbZ3staXetd0oZ+4Y1b2qAB8H
	MFkq7CfDgvgAmHvoYaCwSYgn4qOeD9J1e3qbCBksET6zA2oAgOWfCxVLXERdiQ==
Message-ID: <32fb6a65-d855-409c-91a8-0e3e7091cbdc@bootlin.com>
Date: Wed, 25 Oct 2023 11:54:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [yocto-docs][dunfell] documentation: update for 3.1.29
To: Steve Sakoman <steve@sakoman.com>
References: <cover.1698168357.git.steve@sakoman.com>
 <1ec2b22e02315e00520e7c0291e9c4ac1990b21d.1698168357.git.steve@sakoman.com>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <1ec2b22e02315e00520e7c0291e9c4ac1990b21d.1698168357.git.steve@sakoman.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 25 Oct 2023 09:54:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4494

Hi Steve,

On 24.10.23 at 19:27, Steve Sakoman wrote:
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
>   documentation/poky.yaml | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)


Thanks for the update!
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Merged into "dunfell".
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


