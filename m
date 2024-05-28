Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 509D2C25B78
	for <webhook@archiver.kernel.org>; Tue, 28 May 2024 15:25:33 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.25023.1716909931829179386
 for <docs@lists.yoctoproject.org>;
 Tue, 28 May 2024 08:25:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=OZZYdBsh;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8574A40005;
	Tue, 28 May 2024 15:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1716909930;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rcMH7Nz4W+yXgs8yvM6U1hToZAWRdD9ip0KMDDmtOQE=;
	b=OZZYdBshPtKR/rJn05dOMQsWbc6POtV9ofkj+W4SQYsn6S0Mb1GOJq2/GjU+6VwLdj2IS1
	SW3YpN0tWufnWNe6VaZ7LTY02Xy25i/RDcBIs7nSBx7wPC89YcvOlzBgUJycMVyKmpdRt4
	YGL6eND/9/3DmtcxhchlQUu9hUu3B8CKO1qqbUWtm0CUIwJjN/+tgMhDCSYrCJE+Q2rXKH
	TFS83wVDHKIlmaGl02gKod+FfA/MOeL2CloPzFYOqvElwA9Q+3+83S4Q+NkZrgF4P5MZal
	9yXIltMIcHMRgK1V8Oxm+aSfjufw+rKnZDR8d0KgOps8/XC7IEhfQN6ot+HJSw==
Message-ID: <a00157ee-0420-4361-840c-41e25950dd9c@bootlin.com>
Date: Tue, 28 May 2024 17:25:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: Quentin Schulz <quentin.schulz@cherry.de>, docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH v2] migration-5.1.rst: fix incorrect title, Styhead
 is not an LTS
To: Quentin Schulz <foss@0leil.net>, foss+yocto@0leil.net
References: <20240528-styhead-not-lts-v2-1-72cdb9ba8905@cherry.de>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20240528-styhead-not-lts-v2-1-72cdb9ba8905@cherry.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 28 May 2024 15:25:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5261

Hi Quentin,

On 5/28/24 at 17:21, Quentin Schulz wrote:
> From: Quentin Schulz <quentin.schulz@cherry.de>
>
> Styhead is not an LTS so remove the mention from the section title.
>
> Fixes: ae12a6711a06 ("migration-guides: placeholder files for 5.1")
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
> ---
> Changes in v2:
> - update commit log to not let people assume Styhead could become an LTS
> - Link to v1: https://lore.kernel.org/r/20240528-styhead-not-lts-v1-1-189c031e0152@cherry.de
> ---
>   documentation/migration-guides/migration-5.1.rst | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/documentation/migration-guides/migration-5.1.rst b/documentation/migration-guides/migration-5.1.rst
> index 84ef35e28..c1cc711a4 100644
> --- a/documentation/migration-guides/migration-5.1.rst
> +++ b/documentation/migration-guides/migration-5.1.rst
> @@ -1,7 +1,7 @@
>   .. SPDX-License-Identifier: CC-BY-SA-2.0-UK
>   
> -Release 5.1 LTS (styhead)
> -===========================
> +Release 5.1 (styhead)
> +=====================
>   
>   Migration notes for 5.1 (styhead)
>   ------------------------------------
>
> ---
> base-commit: b2e1ec551a73e1d0ecf980324a8ec400c9cf5586
> change-id: 20240528-styhead-not-lts-87e7e06aa01f
>
> Best regards,
>
Many thanks for the fix. My bad!!!
I took your patch but eventually merged it with the original commit, 
which hadn't been merged in master yet.

master-next has been updated.
Thanks again!
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


