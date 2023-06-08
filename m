Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BD82C7EE25
	for <webhook@archiver.kernel.org>; Thu,  8 Jun 2023 20:26:26 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.4769.1686255978032654323
 for <docs@lists.yoctoproject.org>;
 Thu, 08 Jun 2023 13:26:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=MFdoYQYz;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
X-GND-Sasl: michael.opdenacker@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1686255976;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HY6wuF1xiuVspNRWOUcckkztqQAqui6JYRQQra+PMLI=;
	b=MFdoYQYzRgJ9yrQeWGT/n6Pwn4abxCvrX8Ue8cyTleTp3Zg0k7TAaxY4BPxCkyRDo9pBlo
	Uy+KqkTkimVGe4Gb+N8UlTqJ9XXKfnX1zYKL2enjsI6ikcHkQ1MnnZQM03z3ams1W2Y4QC
	upFnZbGQuxnU1YaiQ/uC1J09hF8+EqUZDG6sUYlb6Y2Lmd8eV7qkq0HW97pR+bPv/vPyKW
	PBwKMdij9Xdif9CQ+nPDv030YoHceFgTdesR7dQj6Vb+PufVdf/o3MsvBddLoayuJiSYpo
	PAjqL7YhYqHTr6+4M4wwlVTcmN11ZW50kDEWDzNYLybORf/kkQWJ3KFO9LdSbQ==
X-GND-Sasl: michael.opdenacker@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id BD1B240004;
	Thu,  8 Jun 2023 20:26:15 +0000 (UTC)
Message-ID: <66b38497-888d-ac4d-6420-27658941e9db@bootlin.com>
Date: Thu, 8 Jun 2023 22:26:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] profile-manual: fix blktrace remote usage
 instructions
Content-Language: en-US
To: hannu.lounento@vaisala.com
References: <20230608114213.18309-1-hannu.lounento@vaisala.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20230608114213.18309-1-hannu.lounento@vaisala.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 08 Jun 2023 20:26:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3992

Hi Hannu

Thank you very much for the patch.

On 08.06.23 at 13:42, Hannu Lounento via lists.yoctoproject.org wrote:
> From: Hannu Lounento <hannu.lounento@vaisala.com>
>
> The references to the target and host systems (i.e. the client and
> server respectively) were swapped in the instructions.
>
> Also, there's no need to specify the device node on the server command
> line that is run on the host system.
>
> The previous, incorrect, instructions resulted typically in:
>
>      target# blktrace -l /dev/mmcblk1
>      server: waiting for connections...
>
> and
>
>      host$ blktrace -d /dev/mmcblk2 -h target
>      Invalid path /dev/mmcblk2 specified: 2/No such file or directory
>
> unless the same device node happened to exist on the host system.
>
> Based on
>
>      target# blktrace --version
>      blktrace version 2.0.0
>
> and
>
>      host$ blktrace --version
>      blktrace version 2.0.0
>
> Signed-off-by: Hannu Lounento <hannu.lounento@vaisala.com>


Makes sense, thanks again.

Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
... and merged into master-next.

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


