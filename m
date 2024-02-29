Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 443ADC48BF6
	for <webhook@archiver.kernel.org>; Thu, 29 Feb 2024 12:42:53 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.24086.1709210567867782810
 for <docs@lists.yoctoproject.org>;
 Thu, 29 Feb 2024 04:42:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=iHFfUWUT;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9F3FAE000B;
	Thu, 29 Feb 2024 12:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709210566;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jHEt0+4olyqDHiQD9twE8yYobxCVvQuD9ys3f1rUtlQ=;
	b=iHFfUWUTlKrxUd+eoNQhGlOV9t778wbQcNHyiu03H8CNCLU+L9MIDSe4TqrbXwZ9cb9kA4
	9i3+fGfR8+PAdp/oG3EG6L8M2VhzMJbIkQv5xGGXy4rSecWTbAKTdRF8AM0VxrESlGD1H9
	jAPqHG1RWg17BafhxoC3qabSwkWkj+M8+G3LiT8reQLlsXhKRD8/IPRulDPdpuisd0Q+02
	x2iTDN0j2Sheo28+OnOGAS4vAmfnj10EaxcVUX5Izmakamk0BOIC0ThZ29rDGRJkzmwo8d
	pvFHz1tJgtzalOScNlKBysDQyO5P7XQG+A9lvwx7GoPlt4WYyxDqaami7d+Q5A==
Message-ID: <35fbf022-990b-4f73-90d5-cedc2e272bc6@bootlin.com>
Date: Thu, 29 Feb 2024 13:42:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: Geoff Parker <geoffrey.parker@arthrex.com>, docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] ref-manual: variables.rst: adding multiple groups
 in GROUPADD_PARAM
Content-Language: en-US
To: Geoff Parker <geoffhp@gmail.com>
References: <20240228072455.1452176-1-geoffrey.parker@arthrex.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20240228072455.1452176-1-geoffrey.parker@arthrex.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 29 Feb 2024 12:42:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4919

Hi Geoff

On 2/28/24 at 08:24, Geoff Parker wrote:
> From: Geoff Parker <geoffrey.parker@arthrex.com>
>
> Add missing documentation on how to add multiple groups with a single
> GROUPADD_PARAM:${PN}
>
> Signed-off-by: Geoff Parker <geoffrey.parker@arthrex.com>
> ---
>   documentation/ref-manual/variables.rst | 8 ++++++++
>   1 file changed, 8 insertions(+)


Many thanks for this improvement to the docs!
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Merged into master-next.
Cheers
Michael.

>
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index a0187a6d47..fdebcc9ba4 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -3234,6 +3234,14 @@ system and gives an overview of their function and contents.
>   
>            GROUPADD_PARAM:${PN} = "-r netdev"
>   
> +      More than one group can be added by separating each set of different
> +      groups' parameters with a semicolon.
> +
> +      Here is an example adding multiple groups from the ``useradd-example.bb``
> +      file in the ``meta-skeleton`` layer::
> +
> +         GROUPADD_PARAM:${PN} = "-g 880 group1; -g 890 group2"
> +
>         For information on the standard Linux shell command
>         ``groupadd``, see https://linux.die.net/man/8/groupadd.
>   
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#4910): https://lists.yoctoproject.org/g/docs/message/4910
> Mute This Topic: https://lists.yoctoproject.org/mt/104619596/1051844
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [michael.opdenacker@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


