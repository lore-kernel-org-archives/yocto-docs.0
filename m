Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A02AAC64ED6
	for <webhook@archiver.kernel.org>; Wed,  1 Mar 2023 09:52:26 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.18392.1677664339699768293
 for <docs@lists.yoctoproject.org>;
 Wed, 01 Mar 2023 01:52:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=CE+XBn+i;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 800EFFF811;
	Wed,  1 Mar 2023 09:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1677664337;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lizQ7ndVTk+UzPHf8/gEyZtmjQYFpkhPHglum0HxWb0=;
	b=CE+XBn+idxqr7K+ASUIjieVkZ5nZJIjJ9FWpxWjB8cAQ8SiyhqNQbJ2VYiCnL1+FhPLmLu
	HVH9V3Lq0gSzxY5obY56UZjLLasPguzX/OAXA/AOPnu5eHgWpTfGm8KZKc7yd9cS0UK9A+
	EHD2z94cZxmll7HGaJpHCtAAvYrz+eSheGsIhbDsdf/2/23lZuMLUq+d57oNV573DaVM+c
	fBZ4EKa8y+8d0JvLQcn8jZQmUsCNC52Eael5kXCe8rrChXKlHnbhf6oMNIE8pMBVd7883J
	Pjsu82q+iaH+FP45ZhnBbDIK8QPGc091U/k/385yY7GpPLR1rslTnRc3Emz4Pw==
Message-ID: <51c83c09-598f-173b-acbe-b013d7c27fb9@bootlin.com>
Date: Wed, 1 Mar 2023 10:52:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Cc: Yoann Congal <yoann.congal@smile.fr>, docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 1/1] ref-manual: Add info on "mixin" layers
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>
References: <20230228221309.82156-1-yoann.congal@smile.fr>
 <20230228221309.82156-2-yoann.congal@smile.fr>
 <cd39cbba-51e6-3c91-24c2-41c1edaed0c2@bootlin.com>
 <CANNYZj9jtHeKnKprAJraa7mZaYz+pa1kV8EMGJ2faJXvroSF2A@mail.gmail.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <CANNYZj9jtHeKnKprAJraa7mZaYz+pa1kV8EMGJ2faJXvroSF2A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 01 Mar 2023 09:52:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3764


On 01.03.23 at 10:49, Alexander Kanavin wrote:
> On Wed, 1 Mar 2023 at 10:44, Michael Opdenacker via
> lists.yoctoproject.org
> <michael.opdenacker=bootlin.com@lists.yoctoproject.org> wrote:
>> This makes me wonder about how official these are, though we said they
>> are not officially supported by the project itself. Maybe we could just
>> mention this repository in the next paragraph...
> They are not official. Official things get tested on the AB and
> breakage blocks the changes; these layers are ad hoc, as is.


Right, but it was the wording that was giving me this impression.
Thanks!
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


