Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.33131.1628833374516908188
 for <docs@lists.yoctoproject.org>;
 Thu, 12 Aug 2021 22:42:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 42A7AFF803;
	Fri, 13 Aug 2021 05:42:52 +0000 (UTC)
Cc: Daniel Gomez <dagmcr@gmail.com>
Subject: Re: [docs] [PATCH] releases: fix typo
To: Daniel Gomez <daniel@qtec.com>, docs@lists.yoctoproject.org
References: <20210812190309.347619-1-daniel@qtec.com>
 <CAH1Ww+SS0iaAMChNzEGKrGJf9h=fmv-HAnSPAgk8oPG-FyOj4A@mail.gmail.com>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <5180c3f8-d798-cc1f-13b0-61c3f0ed9046@bootlin.com>
Date: Fri, 13 Aug 2021 07:42:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAH1Ww+SS0iaAMChNzEGKrGJf9h=fmv-HAnSPAgk8oPG-FyOj4A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Daniel,

On 8/13/21 7:18 AM, Daniel Gomez wrote:
> Adding Signed-off-by.
>
> On Thu, 12 Aug 2021 at 21:04, Daniel Gomez <daniel@qtec.com> wrote:
>> Fix dunfell typo for releases 3.1.9 and 3.1.10.
> Signed-off-by: Daniel Gomez <daniel@qtec.com>

Good catch, thanks!

Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
I merged your fix into "master-next", and I will send a pull-request
today for this branch, so that this is fixed quickly, together with
other updates.

Thanks again
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

