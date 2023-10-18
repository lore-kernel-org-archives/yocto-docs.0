Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56F2DCDB47E
	for <webhook@archiver.kernel.org>; Wed, 18 Oct 2023 14:57:57 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.283758.1697641072812826386
 for <docs@lists.yoctoproject.org>;
 Wed, 18 Oct 2023 07:57:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Yasq6ulp;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4C2CC240004;
	Wed, 18 Oct 2023 14:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697641070;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IuiUqxj1+OFV0XyYg1PKhDyDK6ytPhtR95S4y5EUEAQ=;
	b=Yasq6ulpiH/AKb/zaUu91pUYR7Oc/YZSB+WBwWJO/wgPgI1OlDxYxGJYhN83+ecZmKV2Rd
	9MMMO3jiz9HKREeNR3bK3ehJnuk5rJ/aKoxjTIueV9ptXkf0W2VIJMjZQx8h+rE/VV+gXO
	RZ/QIuPUrO5Y3jEutVPy/EyDops9eXmf4WmIyW92dWt0E+5J2O12ysk2fd8eoWhaXQiBqj
	ScD4h4128gEWe2hiW0NwZk9U32rYHgdmOJum9IrFfqeKjzwerzXF2II5T4/g++ibjeOYcJ
	xLhUn9DZX8UpOBtNYgQFIoACAw7ze7VXJRWiV4pElNarPnlAYtO94FzJougybg==
Message-ID: <ef4d2c98-e7f2-4c3d-8a59-dd5d1e181dea@bootlin.com>
Date: Wed, 18 Oct 2023 16:57:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: YP docs mailing list <docs@lists.yoctoproject.org>,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
 yocto-security@lists.yoctoproject.org
Subject: Re: [docs] Documenting YP processes
To: Marta Rybczynska <rybczynska@gmail.com>
References: <CAApg2=TOJg06EP3JJmaoC-mxzPM3=4WkW0y3ADuuXRVsccoefw@mail.gmail.com>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <CAApg2=TOJg06EP3JJmaoC-mxzPM3=4WkW0y3ADuuXRVsccoefw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 18 Oct 2023 14:57:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4409

Hi Marta

On 18.10.23 at 16:23, Marta Rybczynska wrote:
> Hello,
> I'm writing the "official" documentation for the YP security processes
> and I'm realizing that I do not know which document to put it into.
> There is no "YP Processes" manual. What about adding a "Security
> manual"? It can then include:
> - security processes
> - a single place describing how to submit CVE fixes
> - links to other manuals for relevant material and/or rewrites if necessary

IMHO, it does makes sense to create a new "Security Manual". We 
currently have 
https://docs.yoctoproject.org/dev-manual/vulnerabilities.html with some 
useful details contributed over time, but a separate manual would 
probably get more of the attention this topic deserves.

You've got at least my vote!
Thanks
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


