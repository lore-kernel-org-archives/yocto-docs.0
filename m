Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D606CD5BC2
	for <webhook@archiver.kernel.org>; Tue, 19 Sep 2023 13:52:36 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.9188.1695131552509229822
 for <docs@lists.yoctoproject.org>;
 Tue, 19 Sep 2023 06:52:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=L6Vu1bAx;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 205821C0002;
	Tue, 19 Sep 2023 13:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695131550;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ls607gM5BEKIfd9X14z7uXOX88xP6I4/pufWhlMwGNE=;
	b=L6Vu1bAxapFr2ZfMaJNF8ycjOPi5MZ4dEBeraIo979Zb7y89+skJRvSUnVhkbl9s+G731e
	cPHNzQ9XFIwXo4KnqeAnKO9dIbpz4WGvGjrxAI73aQiWgBR6smIgQ1v0wTtGyBB7ZkP70t
	mSRS1jF4D4G0rVo/dG10yc6JVIOXSYr3ZCYYEqIsM+vkwpoQjWDXjmzvlLlZ/LfgGaBDCn
	V7TI7DCrPKq9zTlVeUAJB67H0mv1cc+4C2qhSgxvN7A9FYsWRVgMKGPbRN8UJPk8bOl/vP
	U8sDN/ZsHzOPskCh/XbwW/wmYn351kcHFyfdST7tPpdAi/EP1UGWgRhETe8Utg==
Message-ID: <39499fd4-7392-afc2-c926-ea794f257a5a@bootlin.com>
Date: Tue, 19 Sep 2023 15:52:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [RESEND] [PATCH] template: fix typo in section header
To: Roland Hieber <rhi@pengutronix.de>
References: <20230919125757.1571746-1-rhi@pengutronix.de>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20230919125757.1571746-1-rhi@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 19 Sep 2023 13:52:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4232

Hi Roland,

Oops, I can't find your original patches!

On 19.09.23 at 14:57, Roland Hieber wrote:
> Signed-off-by: Roland Hieber <rhi@pengutronix.de>
> ---
>   documentation/template/template.svg | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/documentation/template/template.svg b/documentation/template/template.svg
> index 43043e3afbfd..50715c08b0ca 100644
> --- a/documentation/template/template.svg
> +++ b/documentation/template/template.svg
> @@ -1019,7 +1019,7 @@
>            id="tspan1183-1-8"
>            x="-52.348656"
>            y="518.42615"
> -         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:37.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;stroke:none">Objets</tspan></text>
> +         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:37.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;stroke:none">Objects</tspan></text>
>       <text
>          xml:space="preserve"
>          style="font-weight:bold;font-size:13.3333px;line-height:125%;font-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"


Good catch.
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
... and merged into master-next.

Thanks
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


