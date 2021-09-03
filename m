Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web08.567.1630688670769099030
 for <docs@lists.yoctoproject.org>;
 Fri, 03 Sep 2021 10:04:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 92A4860005;
	Fri,  3 Sep 2021 17:04:27 +0000 (UTC)
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] ref-manual: update SYSROOT_DIRS_* variable entries
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 "Robert P. J. Day" <rpjday@crashcourse.ca>
References: <bf17e3e4-41a2-5558-2375-0faad5eff80@crashcourse.ca>
 <20210830073619.afpffceu4pkf7uf2@fedora>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <a35c493c-8667-a84e-74be-f4e0d03647cc@bootlin.com>
Date: Fri, 3 Sep 2021 19:04:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210830073619.afpffceu4pkf7uf2@fedora>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 8/30/21 9:36 AM, Quentin Schulz wrote:
> Hi Robert,
>
> On Sun, Aug 29, 2021 at 01:08:25PM -0400, Robert P. J. Day wrote:
>> Both SYSROOT_DIRS and SYSROOT_DIRS_BLACKLIST have more current
>> values.
>>
>> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
>>
> Reviewed-by: Quentin Schulz <foss@0leil.net>

Merged into master-next. Thanks for the patch and review!

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

