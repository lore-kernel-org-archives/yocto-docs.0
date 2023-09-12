Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BC6DEE3F08
	for <webhook@archiver.kernel.org>; Tue, 12 Sep 2023 17:25:12 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.379.1694539504661609193
 for <docs@lists.yoctoproject.org>;
 Tue, 12 Sep 2023 10:25:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=By4Z+WQ+;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4D74EE000A;
	Tue, 12 Sep 2023 17:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1694539502;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SE4LP2UxhwfxnKaYT0SHcVrfT79Rs1y/mR5mW415AZ8=;
	b=By4Z+WQ+ZY2qRxSQzc46c4S5CA9kRfXm8ZfNu2BYrs/WIt5srUqDlma8A26M3b1kH8Fh64
	a9XHSdP+a501ScBHeoVNB21p3Vjh7S92TtSBx6oFeasBBzjxwd2j29g4vOaf0BnDdxwRlK
	ep+2er0lqMdTQV4mld0+xpUoM6rdJJZjt+aqEs8OhTfbr6jrTcqhXDYNv19CRnxqSiCJjg
	aEbZDhxwhh00eZhdMV31sugefJIPihkKo3W7+LyqwiThkG1FaUc64QeCOd/7Pp6tLQbRb/
	d7gKxJgSIjWX3mK0zv0GHBJPII7w5L9OyjDZqSJ+AG+Mu7/umipt5Zz+r8Rjjg==
Message-ID: <7632c83d-795e-f38f-cc65-52614cb7dc75@bootlin.com>
Date: Tue, 12 Sep 2023 19:25:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [yocto-docs][dunfell] documentation: update for 3.1.28
Content-Language: en-US
To: Steve Sakoman <steve@sakoman.com>
References: <cover.1694526878.git.steve@sakoman.com>
 <f3a7dfd029aa25a0f34ca080d879bb9d3250d05d.1694526878.git.steve@sakoman.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <f3a7dfd029aa25a0f34ca080d879bb9d3250d05d.1694526878.git.steve@sakoman.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 12 Sep 2023 17:25:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4212

Hi Steve

On 12.09.23 at 15:55, Steve Sakoman wrote:
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
>   documentation/poky.yaml | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)


Thanks for the update!
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Merged into the "dunfell" branch.

Cheers
Michael

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


