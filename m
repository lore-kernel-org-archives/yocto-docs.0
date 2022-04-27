Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97FF2C433F5
	for <webhook@archiver.kernel.org>; Wed, 27 Apr 2022 13:20:30 +0000 (UTC)
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web12.8114.1651065624940869701
 for <docs@lists.yoctoproject.org>;
 Wed, 27 Apr 2022 06:20:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=IUPfFyRI;
 spf=pass (domain: bootlin.com, ip: 217.70.178.232,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 7B59720000B;
	Wed, 27 Apr 2022 13:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1651065623;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cPxOCDLJUFb4fSQCHIbe4OYge+sPHp/lcUmdcqe0/LY=;
	b=IUPfFyRIYF0nxCaPNnEHl2pvVdBukJOtLMvyW1fKKBbYRffB6KwG6+qYqeTM0o8RgNEvgB
	ECdy82zoFUj1bC01FOCh+ThZzkZ2u5gbwjJSDc0dYI/510lJUcIXI6g2hUJpiYcYJQgqpd
	yZ/cNCEIRAZBrc8tRzqD4NAalkCNYUqQJrFsoJUH9YhmsVwqFaIXmi/cceGx4hvYEesOUd
	4QYYQhuCuxSsfwFkIzKetQQno9ZrACu+mJVgiVI51FBD9D6joZHyw04/euP8bBuuVrPP6s
	x6xiH55T6ETEjdSXC15asAw4PEWX7iOaG7gcSAwJU1QYzM36eLQc44/zvaCmzw==
Message-ID: <00d76df6-5610-4240-724b-747b902baee8@bootlin.com>
Date: Wed, 27 Apr 2022 15:20:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Cc: docs@lists.yoctoproject.org, yocto@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] migration-guides: stop including documents with
 ".. include"
Content-Language: en-US
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>
References: <16E9C0CE66240BBD.28362@lists.yoctoproject.org>
 <20220427123341.228526-1-michael.opdenacker@bootlin.com>
 <b3764592-5af0-6ae0-baf9-31c7df5427aa@theobroma-systems.com>
 <CAP71WjwBPCGrRwAarqB5BEgK3p4Sao5NmRUqALGhpe_tEMsgsw@mail.gmail.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: 
 <CAP71WjwBPCGrRwAarqB5BEgK3p4Sao5NmRUqALGhpe_tEMsgsw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 27 Apr 2022 13:20:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2892


On 4/27/22 15:16, Nicolas Dechesne wrote:
>
>
> On Wed, Apr 27, 2022 at 2:51 PM Quentin Schulz
> <quentin.schulz@theobroma-systems.com> wrote:
>
>     Hi Michael,
>
>     On 4/27/22 14:33, Michael Opdenacker via lists.yoctoproject.org
>     <http://lists.yoctoproject.org> wrote:
>     > From: Michael Opdenacker <michael.opdenacker@bootlin.com>
>     >
>
>     Technically incorrect, it's Nicolas who's the author :)
>
>     git commit --author="Nicolas Dechesne <nicolas.dechesne@linaro.org>"
>
>
> heh.. I don't mind either way.. I could have sent a proper patch too,
> i quickly sent it to share with everyone..


My bad. I didn't update my patch, but in my latest version, Nico is the
author, and I'm just a reviewer.

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


