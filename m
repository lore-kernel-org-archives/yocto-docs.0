Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8629EC77B7C
	for <webhook@archiver.kernel.org>; Tue,  9 May 2023 12:45:22 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.31180.1683636314000464023
 for <docs@lists.yoctoproject.org>;
 Tue, 09 May 2023 05:45:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=MEMHaV9+;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 572B11BF21D;
	Tue,  9 May 2023 12:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1683636312;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cJUuLgRDVZaTPSnp02NH3OzdLXbrumMLifg4uPoOavw=;
	b=MEMHaV9+GNfXB9ndKivYSWQjqxJr9gOjbPCjFdb+mJPipkeyQB/D3JhhmmjpQnpVLfFkLE
	OCLPmpDVSzZCotb3idwkkJiYMtMGi27XOj6gpPqlCiicP01uKtn+pZlkjhHNNoGXhsSEmG
	pabpI/PMTRWmeUrrSWVgTHDa8w9Z58yMGrDkkumWFxtrYzCxHGx5dT50G1NnLx0pq+HGJe
	QfCl0ndRqpguyb6qeb/DBbFb+oQplx5HPvaGg7F5g7+o4vNAushhktans7/BnFFB+yQ0GV
	6K9t/mgLljP+/tyC0aAs/kNStHQX1J7qyoeUFkveCErJnnNVe8P7lE8pMkqKaQ==
Message-ID: <cf5bb128-94cf-b66d-ca14-40844d7c1196@bootlin.com>
Date: Tue, 9 May 2023 14:45:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: Re: [docs] [PATCH 4/4] ref-manual: classes: kernel: document
 automatic defconfig usage
Content-Language: en-US
To: docs@lists.yoctoproject.org
References: <20230509124038.2265185-1-michael.opdenacker@bootlin.com>
 <175D7A12A151A6F9.26836@lists.yoctoproject.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <175D7A12A151A6F9.26836@lists.yoctoproject.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 09 May 2023 12:45:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3928


On 09.05.23 at 14:40, Michael Opdenacker via lists.yoctoproject.org wrote:
> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
>
> From: Luca Ceresoli <luca.ceresoli@bootlin.com>
>
> Since a very long time the kernel bbclass uses a defconfig file from
> SRC_URI automatically. Document this feature.
>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ---
>   documentation/ref-manual/classes.rst | 7 +++++++
>   1 file changed, 7 insertions(+)


These last two changes are for Mickledore too (I've just fixed their title).
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


