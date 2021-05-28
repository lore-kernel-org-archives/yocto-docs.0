Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.7964.1622206996453148510
 for <docs@lists.yoctoproject.org>;
 Fri, 28 May 2021 06:03:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id D665E4000F;
	Fri, 28 May 2021 13:03:13 +0000 (UTC)
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] ref-manual: add SRCTREECOVEREDTASKS to variable glossary
To: Quentin Schulz <quentin.schulz@streamunlimited.com>,
 "Robert P. J. Day" <rpjday@crashcourse.ca>
References: <7a97671f-9ba8-2c0-9a68-3483a57113f@crashcourse.ca>
 <20210527105422.d2s777ostilbroyv@qschulz>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <dee31f29-dbcc-a4f1-eedb-f50cf9a36246@bootlin.com>
Date: Fri, 28 May 2021 15:03:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210527105422.d2s777ostilbroyv@qschulz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Robert, Quentin,

On 5/27/21 12:54 PM, Quentin Schulz wrote:
> On Sun, May 23, 2021 at 08:22:50AM -0400, Robert P. J. Day wrote:
>> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
>>
>> ---
>>
>> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
>> index df6413b68..b179abf74 100644
>> --- a/documentation/ref-manual/variables.rst
>> +++ b/documentation/ref-manual/variables.rst
>> @@ -7092,6 +7092,30 @@ system and gives an overview of their function and contents.
>>           ":ref:`dev-manual/common-tasks:automatically incrementing a package version number`"
>>           section, which is in the Yocto Project Development Tasks Manual.
>>
>> +   :term:`SRCTREECOVEREDTASKS`
>> +      A list of tasks that are typically not relevant (and therefore skipped)
> I'm not sure it really matters here, but they are actually removed for
> most of them (except for fetch and unpack if there's a file:// npsmw:// or kmeta
> type). Therefore, it can break your task tree if you're not careful
> where you hook your own tasks.
>
> Reviewed-by: Quentin Schulz <foss@0leil.net>

Thanks for the patch and the review. I merged it into master-next for
inclusion in master.

Quentin, don't hesitate to propose an add-on if you wish.

Thanks again,

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

