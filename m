Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.41.1631808769782436232
 for <docs@lists.yoctoproject.org>;
 Thu, 16 Sep 2021 09:12:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id A878620008;
	Thu, 16 Sep 2021 16:12:41 +0000 (UTC)
Cc: docs <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH v3 3/5] ref-manual: improve "devtool check-upgrade-status" details
To: Alexander Kanavin <alex.kanavin@gmail.com>
References: <16A4FF8E231E8D2E.4682@lists.yoctoproject.org>
 <20210915175842.2998541-1-michael.opdenacker@bootlin.com>
 <20210915175842.2998541-4-michael.opdenacker@bootlin.com>
 <CANNYZj_Ap3UAr3DJt3FPT1Efu0EHKZy2+9uWfNEynH_HZPM0Qw@mail.gmail.com>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <5f5e32a1-a986-6235-3531-3232514763db@bootlin.com>
Date: Thu, 16 Sep 2021 18:12:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CANNYZj_Ap3UAr3DJt3FPT1Efu0EHKZy2+9uWfNEynH_HZPM0Qw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Alex

Thanks for the reviews!

On 9/15/21 8:39 PM, Alexander Kanavin wrote:
> Another point to mention is that UPSTREAM_* variables do not need to
> be set, most of the time. They are only required when upstream does
> something unusual, and defaults do not work.


Right, I understood that, but this is definitely worth outlining in the
documentation.
I'll share my updates.

Thanks again,
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

