Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED638C25B67
	for <webhook@archiver.kernel.org>; Fri, 27 Oct 2023 08:17:24 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.2397.1698394642676010680
 for <docs@lists.yoctoproject.org>;
 Fri, 27 Oct 2023 01:17:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=CcA8I7lC;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E476A240002;
	Fri, 27 Oct 2023 08:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1698394640;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zAXcv1nP8/ieSlvj8lY+sNEf7wNybuce8mr5/lmg6lc=;
	b=CcA8I7lCO1wrDYXwThFLXQPqBkHhy0Q+R3w7BRYmpAgqghf74ZSybkHw5gDXVApvhaxSgs
	3pwU5UAH8jBWw1PD0RvqtLRjMKuYzk11l5oHj4kSeb8T05Kvsq1VAYS/tPbG5aJzxaa2yJ
	hVima4gqZR+xMvwP35tNMWNknG1ymMPUi29kQCJe6Uz3lCAcL31B4NWqxFkuwgygXTZLoY
	EBm8eZ3tEbGMl6pyagDlAa2BxYBd9ATReCMy+Wg/oQ2yY8nzaVBfM6ZtOXBBdqCbQPzwmE
	LTVJ7VQJ7Q+3l9ddGCGBBViXF92rZMZDWZUdmYKAk0QNPfUXTx+5PzcaQgY6ew==
Message-ID: <acba70be-9670-4ff3-a0f0-bb13add4559a@bootlin.com>
Date: Fri, 27 Oct 2023 10:17:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] Yocto Tasks Detailed Diagram Proposal
To: Talel BELHADJ SALEM <bhstalel@gmail.com>
References: <18651.1687433672747999997@lists.yoctoproject.org>
 <29645.1697569015596670723@lists.yoctoproject.org>
 <5c668a44-d9e3-4ca2-ad1d-e42730c76530@bootlin.com>
 <CAOgG7m0eQPFhnrmXd8GhbZJJEf_0dDRAj6Vpthh-NOtVPbZAjg@mail.gmail.com>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <CAOgG7m0eQPFhnrmXd8GhbZJJEf_0dDRAj6Vpthh-NOtVPbZAjg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 27 Oct 2023 08:17:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4507

Hi Talel

On 20.10.23 at 20:03, Talel BELHADJ SALEM wrote:
> Hello Michael,
>
> If I understand correctly:
>
>   * The diagram is correct and I only need to:
>   * Change the font
>
Right!
>
>   * Remove the color coding indication (Should I keep the coloring as
>     well ? Or make everything with 2 colors at max?)
>
Just think about colorblind people, for whom red and green look the 
same, for example. So, you could use up to 3 types of colors actually: 
bright (like white), dark (like black) and an intermediate one, so that 
the 3 colors can be distinguished on an e-ink display or by colorblind 
people.

That's what I tried to do with 
https://docs.yoctoproject.org/_images/releases.svg

>   * Complete the section content and append the diagram and submit the
>     patch
>
Right! Thanks in advance :)
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


