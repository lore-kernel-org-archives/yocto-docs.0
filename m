Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C8B2C25B79
	for <webhook@archiver.kernel.org>; Thu, 23 May 2024 08:46:00 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.12248.1716453956407024239
 for <docs@lists.yoctoproject.org>;
 Thu, 23 May 2024 01:45:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Tj7IV/Ei;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 553831C0012;
	Thu, 23 May 2024 08:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1716453954;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X+C3fEPG9JfQ7L7dXy09hroHgoxj6o4x+rHPCled12w=;
	b=Tj7IV/Eiu0wNnViDYqNU2EjpNCVoIJpxb8GF8qgZSTa+mSidNOdm2cOBHvx1xDy3t/ZjUO
	90/xAMAxyx2x9UT1jEi22uD31H0SjSnRDg0Xa1oy4r3ZNCt4k8+Mz5HimZwHj8kSdXcv4v
	NSTSG47okOZ6xsYAo409JlY9vKHPKBNdCWKRAE4MFiBPm5hUR77wc5XmJ8R8g1bsSCvOyG
	OtCH4IhIpLxydEUDOizH/QfjRaZjP15FuaDPMvk8JM1JROogUIDx6jJn72auY294VdRP0K
	nOhig/dcD7FtweZ3HYu/UI1j6TdieP8KywbH9nYCg7wFRg+IqH4Rkr0kpVjicw==
Message-ID: <670bf859-e9ac-43c9-a566-482f26c1b27b@bootlin.com>
Date: Thu, 23 May 2024 10:45:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: yocto@lists.yoctoproject.org, docs@lists.yoctoproject.org
Subject: Re: [docs] [yocto] Workaround for uid_map error on Ubuntu 24.04
To: ecordonnier@snap.com, Quentin Schulz <quentin.schulz@cherry.de>
References: <CAHUKmYbx81srtVGCh1iyts893T7d7Sf44fgq+MTaxDSwMsXzZg@mail.gmail.com>
 <c21a8c13-98e1-41fd-8c05-d6f25023ed45@cherry.de>
 <CAHUKmYbp8K0J0UkVToq=6Aiw-mB9hzotO1_Xd05V7QB=v2Ev8w@mail.gmail.com>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <CAHUKmYbp8K0J0UkVToq=6Aiw-mB9hzotO1_Xd05V7QB=v2Ev8w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 23 May 2024 08:46:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5234


On 5/21/24 at 16:31, Etienne Cordonnier via lists.yoctoproject.org wrote:
> The way I see to patch this at the moment is to print instructions for 
> the users to run this command manually when this specific error 
> happens (we can't run it automatically as part of bitbake since it 
> needs sudo, and also it decreases the security on the machine 
> so end-users should be aware of it). I can send a patch if you want, 
> but this isn't really a clean solution.
>
> Ubuntu 24.04 is not yet supported by yocto officially, and I hope the 
> Ubuntu bug will be fixed before yocto officially supports 24.04. What 
> people could do to help at this point is add themselves to the Ubuntu 
> launchpad bug as "affected user". This would raise the "Bug heat" 
> score and hopefully will increase the bug priority as well.


Right, I don't know how to document a workaround for a version that we 
don´t support yet.
What about a wiki page for work-arounds on not-supported-yet versions? 
That's something we could refer to in the documentation.

Cheers
Michael.

-- 

Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


