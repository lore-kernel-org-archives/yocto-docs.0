Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.10802.1623428691308793919
 for <docs@lists.yoctoproject.org>;
 Fri, 11 Jun 2021 09:24:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 600901BF203;
	Fri, 11 Jun 2021 16:24:49 +0000 (UTC)
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH 2/2] ref-manual: variables: document IMGDEPLOYDIR
To: Daniel Wagenknecht <dwagenknecht@emlix.com>,
 Nicolas Dechesne <nicolas.dechesne@linaro.org>
References: <20210611062613.188300-1-dwagenknecht@emlix.com>
 <20210611062613.188300-3-dwagenknecht@emlix.com>
 <CAP71WjxGyxR=2tTK8LyVrmPsOX4rd9_NsOTMbEYfr+kTH4UoLw@mail.gmail.com>
 <de72c018-6ba1-b210-8599-2bd1a142c054@bootlin.com>
 <93f00ed0eb5e91a8b74a350f7ae43948474002f6.camel@emlix.com>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <d829d015-e395-c96f-14a5-30106e235d03@bootlin.com>
Date: Fri, 11 Jun 2021 18:24:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <93f00ed0eb5e91a8b74a350f7ae43948474002f6.camel@emlix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Daniel,

On 6/11/21 12:14 PM, Daniel Wagenknecht wrote:
> Hello Michael,
>
> On Fri, 2021-06-11 at 11:13 +0200, Michael Opdenacker wrote:
>> I can try to take care of this to save you time, Daniel... Here's what
>> I've included in my local branch meant to merge your changes into
>> "master-next" of yocto-docs.
>>
>>       It must not be used directly in recipes when deploying files. Instead,
>>       it's only useful when a recipe needs to "read" a file already deployed
>>       by a dependency. So, it should be filled with the contents of
>>       :term:`DEPLOYDIR` by the :ref:`deploy <ref-classes-deploy>` class or
>>       with the contents of :term:`IMGDEPLOYDIR` by the :ref:`image
>>       <ref-classes-image>` class.
> Yes, that looks good, thank you!


Thanks for confirming. I merged your changes into "master-next" in
yocto-docs.

Cheers,

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

