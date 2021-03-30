Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.907.1617121169622203929
 for <docs@lists.yoctoproject.org>;
 Tue, 30 Mar 2021 09:19:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
X-Originating-IP: 92.150.42.106
Received: from [10.0.0.8] (lfbn-mar-1-834-106.w92-150.abo.wanadoo.fr [92.150.42.106])
	(Authenticated sender: michael.opdenacker@bootlin.com)
	by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id ABA5660008;
	Tue, 30 Mar 2021 16:19:27 +0000 (UTC)
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 0/1] YP overview manual: style improvements
To: Quentin Schulz <quentin.schulz@streamunlimited.com>
References: <167127D8F46CF10E.18414@lists.yoctoproject.org>
 <75714db2-fbb9-eded-0b60-a08fbe346063@bootlin.com>
 <167128A8C71457FE.21770@lists.yoctoproject.org>
 <20210330153638.xgbtnl7zenp36wb5@qschulz>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <918653a3-2d4d-3954-7f38-dcba16d98ce7@bootlin.com>
Date: Tue, 30 Mar 2021 18:19:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210330153638.xgbtnl7zenp36wb5@qschulz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi again Quentin,

On 3/30/21 5:36 PM, Quentin Schulz wrote:
> On Tue, Mar 30, 2021 at 05:34:00PM +0200, Quentin Schulz wrote:
>> Hi Michael,
>>
>> On Tue, Mar 30, 2021 at 05:27:41PM +0200, Michael Opdenacker wrote:
>>> Hello,
>>>
>>> On 3/30/21 5:19 PM, Michael Opdenacker wrote:
>>>> Thanks in advance for your reviews!
>>>
>>> Sorry, I missed again! When I sent the e-mail to myself, both the cover
>>> letter and patch were on the same thread.
>>>
> They seem to be on the same mail thread in my mail client, not sure if
> anyone else than you has the issue?
>
> It is possible your mail client is confused because git send-email will
> add yourself to the recipients (since you're the author and added your
> SoB), so you might receive the mail twice, once from the mailing list,
> once "from" git send-email (your own mail server reading the recipients
> basically).


Yes, indeed, I checked after removing the message sent directly to me,
just keeping the messages from the list.

It's good to know that you and Nicolas see the same e-mail thread. There
is a reference to the first message in the second one, so most probably
my e-mail client (Thunderbird) and the web interface on
https://lists.yoctoproject.org/g/docs/topics are confused because they
both see two different threads.

I'll file a bug on https://lists.yoctoproject.org in case that's just a
configuration issue.

Thanks!

Michael.

-- 

Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

