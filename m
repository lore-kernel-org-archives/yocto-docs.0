Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web08.417.1616521086029228527
 for <docs@lists.yoctoproject.org>;
 Tue, 23 Mar 2021 10:38:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
X-Originating-IP: 92.150.42.106
Received: from [10.0.0.8] (lfbn-mar-1-834-106.w92-150.abo.wanadoo.fr [92.150.42.106])
	(Authenticated sender: michael.opdenacker@bootlin.com)
	by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 295E2FF806;
	Tue, 23 Mar 2021 17:38:03 +0000 (UTC)
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] Spellcheck and capitalization fixes
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
References: <20210323170624.112564-1-michael.opdenacker@bootlin.com>
 <23e95d84-fec2-70b9-65d7-baeaee6df836@linaro.org>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <24ff30ac-a70e-a366-aab7-d0abf337df6f@bootlin.com>
Date: Tue, 23 Mar 2021 18:38:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <23e95d84-fec2-70b9-65d7-baeaee6df836@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hi Nico,

Thanks for your review!

On 3/23/21 6:31 PM, Nicolas Dechesne wrote:
> On 3/23/21 6:06 PM, Michael Opdenacker wrote:
>> - Spelling fixes found using Emacs' spelling checker
>>    configured for US English
>> - Fixes for some capitalization issues, especially some
>>    project names (QEMU, openSUSE, BusyBox), that were not
>>    consistently used with the same capitalization anyway.
>> - A few whitespace fixes too
>>
>> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
>
> Looks good to me. Thanks!


I was really impressed by the scarcity of typos and style issues found
so far. Congrats to the authors, contributors and reviewers, who seem to
have done a great job!

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

