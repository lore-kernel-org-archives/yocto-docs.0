Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C089C4332F
	for <webhook@archiver.kernel.org>; Thu, 10 Nov 2022 13:07:21 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web12.7140.1668085638815087560
 for <docs@lists.yoctoproject.org>;
 Thu, 10 Nov 2022 05:07:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=jX1idKuX;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 0E790C0019;
	Thu, 10 Nov 2022 13:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1668085636;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PgeDhkba3w1ZFKtAQvUaHBb0oZQzEtkPVeIFsjOwh+Y=;
	b=jX1idKuXxI8j4ps4QgYK3+3Hwcdh2Yhwe6MrX9ObyI1zS53KA6CbZ1q0s2NF4o46X+DBJv
	txyfiIJXofMmkoQtbBbj2o1krOnSzkHJdbsBuvxLR9eyDyToaVhwVvF6A6iBklOGqw2xBD
	ijXZ6IQwjQZrrC5DtOKot/3EHnDP/OhjaLkOEtZfJ4nvaIoyv5iAIDzS63F2h5RY6NZqM/
	8BC3gXXczpoOqVYw61+KI3qfg3eb0LbOgW5QytVcN1l78p6QxEpvUdTbsKjfTf8qCTVRjV
	72RUmgi4393t5XNW9accEfmrHIa5TwkaEVlozV08QN6qvSjzUIz/Tx6aOzAJ5Q==
Message-ID: <961763ad-d42a-2425-e333-05dcbe18f11f@bootlin.com>
Date: Thu, 10 Nov 2022 14:07:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH v2] qemu.rst: audio: reference to Command-Line
 options
Content-Language: en-US
To: quentin.schulz@theobroma-systems.com,
 Atanas Bunchev <atanas.bunchev@konsulko.com>
References: <20221110055306.6450-1-atanas.bunchev@konsulko.com>
 <ecba039d-3429-1cd7-f4c1-a2bb493ec757@theobroma-systems.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <ecba039d-3429-1cd7-f4c1-a2bb493ec757@theobroma-systems.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 10 Nov 2022 13:07:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3489

Hi Atanas

On 11/10/22 11:17, Quentin Schulz via lists.yoctoproject.org wrote:
> Hi Atanas,
>
> On 11/10/22 06:53, Atanas Bunchev wrote:
>> The previous statement can cause confusion, because this is the
>> first time when the `audio` argument is mentioned.
>>
>> Signed-off-by: Atanas Bunchev <atanas.bunchev@konsulko.com>
>
> Reviewed-by: Quentin Schulz <foss+yocto@0leil.net>


Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
and merged into "master-next".

Many thanks for the patch!
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


