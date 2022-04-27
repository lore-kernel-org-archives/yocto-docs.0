Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42B61C4332F
	for <webhook@archiver.kernel.org>; Wed, 27 Apr 2022 12:32:20 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web08.7640.1651062729805786280
 for <docs@lists.yoctoproject.org>;
 Wed, 27 Apr 2022 05:32:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Mm2Mle24;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 78DE81C000F;
	Wed, 27 Apr 2022 12:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1651062727;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wi+lo3SbOYMXVt6c2ET/qdxtmpG28ypQBjJ7qXEon+o=;
	b=Mm2Mle24n12AUXWwRv1atBIfwV/bBU8/78AnVzlgpvTTIEJbBKpUiqxxd1l8lRgFn9NXZd
	89ZO8v1L+oHqHYSkwAF8QThIv6z4sHbWdQBsNGtt6ezPyR9MtDGKRMP6TQhu6WKaxOUgsf
	vpnLkH6sjoafWLCJu3tnJKAxjX0aZhc4kVaNbQpGRqnttDdrMXvWyNFu7UN2uVAGPAj4yt
	DcRGqcflDQfya4TH5BIPRQluLnSVjWqeOyrrMyzA7mpxg7Pj/YRDkF3baBO5h/dTW/7iMg
	cHrxMj+dMAr2qFTSUlT8DEfJ/7R66axJK9YvPijDO+kCs434Vr5psJ/MGF9j0Q==
Message-ID: <76e1719f-7a20-990c-34e9-90cf9dcdcd98@bootlin.com>
Date: Wed, 27 Apr 2022 14:32:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Cc: Jose Quaresma <quaresma.jose@gmail.com>,
 Paul Barker <paul.barker@sancloud.com>,
 "Lee, Chee Yang" <chee.yang.lee@intel.com>,
 "yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
 YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [yocto] [ANNOUNCEMENT] Yocto Project 4.0 is Released
Content-Language: en-US
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
References: 
 <DM5PR1101MB236176E376BD554365050E72B9FA9@DM5PR1101MB2361.namprd11.prod.outlook.com>
 <90b05148-5215-584e-0080-24cd411b2ba8@sancloud.com>
 <CANPvuR=Sp+tuOAmFRzw207e_1+jNzOyR1AST9J=jh7_KgsOS2Q@mail.gmail.com>
 <9790963d-0e8d-c713-cc97-ab6f8ca4fef3@bootlin.com>
 <CAP71Wjw=OL8e=EqgPaLfPbQisTeFuVE2FkXq7+M9nWKckK4Y_Q@mail.gmail.com>
 <CAP71WjwG2PCT=ceuZpBmeF-Xzn9yVQi1PG2+d6+wRjouoAZ0Aw@mail.gmail.com>
 <CAP71WjzkiGLiJk7PPz0jkd1gfo9Ru36+zHxk6xRUp1Hch-Zi8g@mail.gmail.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: 
 <CAP71WjzkiGLiJk7PPz0jkd1gfo9Ru36+zHxk6xRUp1Hch-Zi8g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 27 Apr 2022 12:32:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2887

Hi Nico,

On 4/27/22 13:56, Nicolas Dechesne wrote:
>
> yes, that seems correct. I don't think we should continue to use the
> include directive here. Since you try to make one section (for 3.4 and
> 4.0) with the migration and the release notes, I think something along
> these lines would work, maybe there is simpler..

Good catch!

Yes, this works for me. Let me re-send a full patch as a follow-up.
Thanks
Michael.

-- 

Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


