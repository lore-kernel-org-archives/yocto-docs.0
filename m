Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web09.6873.1623933372761151257
 for <docs@lists.yoctoproject.org>;
 Thu, 17 Jun 2021 05:36:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.178.231, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay11.mail.gandi.net (Postfix) with ESMTPSA id 6F333100005;
	Thu, 17 Jun 2021 12:36:10 +0000 (UTC)
Cc: YP docs mailing list <docs@lists.yoctoproject.org>,
 Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: Re: [docs] [PATCH] docs: replace ``FOO`` by :term:`FOO` where possible
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
To: Quentin Schulz <foss@0leil.net>
References: <20210527184117.80067-1-foss@0leil.net>
 <CAP71Wjy9rLUs3kF7k9jjK04p8K4qLbqvzKXRtOQiKhOctxffxw@mail.gmail.com>
 <707599b21e074097e0a8a89873354a8c@0leil.net>
 <65a33804-8952-b322-3103-1a758920a0fe@bootlin.com>
 <CAP71Wjy+_tu6VAdWOZAFqfYeE3UQgYDcufFw2LJwOY0NM6efUg@mail.gmail.com>
 <a7b2178f-f6c7-4332-1b70-aa3c3835947f@bootlin.com>
 <20210607084435.fi4hrzga6rkijsl3@qschulz>
 <168640D2C2EE2863.13459@lists.yoctoproject.org>
Organization: Bootlin
Message-ID: <42b639ec-25bf-5b01-7171-e45e7a44b8ca@bootlin.com>
Date: Thu, 17 Jun 2021 14:36:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <168640D2C2EE2863.13459@lists.yoctoproject.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Quentin

On 6/7/21 10:53 AM, Michael Opdenacker wrote:
> Hi Quentin,
>
> On 6/7/21 10:44 AM, Quentin Schulz wrote:
>> Yes I will. It was a long (and sunny) week-end in Austria, sorry for the
>> delay :)
>
> No problem, take your time! I just wanted to avoid any possible
> missunderstanding.


I decided to merge your patch into "master-next".

What prompted me to do this was...

  * I was about to propose a patch touching one of the lines modified by
    yours
  * This patch was getting harder to apply because of recent changes
  * It already had been reviewed and the changes matter more than their
    description IMHO.

Thanks again,

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

