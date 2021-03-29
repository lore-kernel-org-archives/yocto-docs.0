Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web08.22383.1617027056607029725
 for <docs@lists.yoctoproject.org>;
 Mon, 29 Mar 2021 07:10:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.178.231, mailfrom: michael.opdenacker@bootlin.com)
Received: from [10.0.0.12] (lfbn-mar-1-834-106.w92-150.abo.wanadoo.fr [92.150.42.106])
	(Authenticated sender: michael.opdenacker@bootlin.com)
	by relay11.mail.gandi.net (Postfix) with ESMTPSA id B852F100020
	for <docs@lists.yoctoproject.org>; Mon, 29 Mar 2021 14:10:54 +0000 (UTC)
Subject: Re: [docs] [PATCH] Quick build: checkout a branch instead of a fixed tag
To: docs@lists.yoctoproject.org
References: <166FACE5797F8BE0.19792@lists.yoctoproject.org>
 <f61354e9-28ad-ee0b-c14a-dcb76c5c2945@bootlin.com>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <16d91d4b-5b8a-a15f-cbaa-5b038052b992@bootlin.com>
Date: Mon, 29 Mar 2021 16:10:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <f61354e9-28ad-ee0b-c14a-dcb76c5c2945@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Greetings,

On 3/25/21 8:40 PM, Michael Opdenacker wrote:
> On 3/25/21 8:34 PM, Michael Opdenacker wrote:
>> - Add guidelines for choosing a release
>> - Check-out a branch instead of a fixed tag
>>   This way it's possible to pull release updates later
>
> The idea was proposed by rr123 on IRC (don't know her/his e-mail address
> for the "Reported-by" field).
>
> If this makes things easier to review, see a screenshot of the result on
> https://pasteboard.co/JUi4Wtd.png (by the way, if you have a better
> screenshot sharing to propose, which keeps links forever too, don't
> hesitate to make suggestions)
>
> Of course, your comments and suggestions about the proposed changes are
> welcome!


Not getting any negative feedback, I pushed this change to the
"master-next" branch:
http://git.yoctoproject.org/cgit/cgit.cgi/yocto-docs/commit/?h=master-next&id=3572ee5a1b5afc419af25cf125aacf4af2151fc1

Not too late to give your feedback, though :)

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

