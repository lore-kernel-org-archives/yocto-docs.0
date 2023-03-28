Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5106EC76196
	for <webhook@archiver.kernel.org>; Tue, 28 Mar 2023 17:26:50 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.2559.1680024400172436176
 for <docs@lists.yoctoproject.org>;
 Tue, 28 Mar 2023 10:26:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ZSBrjP13;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 4B967FF803;
	Tue, 28 Mar 2023 17:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1680024397;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kh3iyk/BQKq8CtIAGtHs10ZPmQv8zrBr3tZAnbXD4a0=;
	b=ZSBrjP13JYdmrzhksekektM5/Pi/6wYaujvvneHlPjEiI0f+B6y0KvzVF+CrX9/vEH977e
	O1bMnb0moA2eNPpCMabvGJBCAzINrFkoXGGAG0Sp9pbbdj9I0xFH8w8CBndVEMPTrgCuG1
	VnUXOZX5bus38Zmrv7Km+p9QUWmfdHCIWTbh0skiiD9ht0JHl7tCJRd+HoVeQVfLV8tHim
	mmyXEKErDbVAn4eV6QqrX4R8Dge4x5X6rgXz/JJkzg6aZOmhTRupkJNqqi4vvoRX7zdC4n
	/pRPk0e29+EbTYdGHgYVqV5Z8qlRdTgMsKKrYYfW7Q3g9cTXHBul/Qgc0Tq0uw==
Message-ID: <447bc0ac-99ca-a102-8332-b974c8e7a938@bootlin.com>
Date: Tue, 28 Mar 2023 19:26:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Cc: yocto@pengutronix.de
Subject: Re: [docs] [PATCH 2/2] ref-manual: classes.rst: fix typo
Content-Language: en-US
To: =?UTF-8?Q?Ulrich_=c3=96lmann?= <u.oelmann@pengutronix.de>,
 Yocto Project Documentation <docs@lists.yoctoproject.org>
References: <20230328104853.1897266-1-u.oelmann@pengutronix.de>
 <20230328104853.1897266-2-u.oelmann@pengutronix.de>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20230328104853.1897266-2-u.oelmann@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 28 Mar 2023 17:26:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3818

Hi Ulrich

Many thanks for these fixes!

On 28.03.23 at 12:48, Ulrich Ölmann wrote:
> Signed-off-by: Ulrich Ölmann <u.oelmann@pengutronix.de>
> ---
>   documentation/ref-manual/classes.rst | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

For both patches:
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
... and merged into "master-next".

Thanks again
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


