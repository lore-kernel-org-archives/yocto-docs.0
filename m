Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web09.32562.1623687748285611352
 for <docs@lists.yoctoproject.org>;
 Mon, 14 Jun 2021 09:22:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 992A4C000F;
	Mon, 14 Jun 2021 16:22:25 +0000 (UTC)
Cc: docs@lists.yoctoproject.org,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
 Quentin Schulz <foss@0leil.net>
Subject: Re: [docs] [PATCH v3] test-manual: add initial reproducible builds documentation
To: Quentin Schulz <quentin.schulz@streamunlimited.com>
References: <1686F0ED5A1183FF.18579@lists.yoctoproject.org>
 <20210609144728.103458-1-michael.opdenacker@bootlin.com>
 <20210609155552.nwjdirom4lkqi4n7@qschulz>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <b8a3b5f8-fe9e-260a-cc2d-c7cee298c435@bootlin.com>
Date: Mon, 14 Jun 2021 18:22:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210609155552.nwjdirom4lkqi4n7@qschulz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hello Quentin,

On 6/9/21 5:55 PM, Quentin Schulz wrote:
>> +The project aligns with the `Reproducible Builds project
>> +<https://reproducible-builds.org/>`_, which shares information about why
>> +reproducibility matters. The primary focus of the project is the ability to
>> +detect security issues being introduced. However, from a Yocto Project
>> +perspective, it is also hugely important that our builds are deterministic. When
>> +you build a given input set of metadata, we expect you to get consistent output.
>> +This has always been a key focus but, since release 3.1 ("dunfell"), it is now true
> Just picking nits here, but I could see a reference to:
> https://docs.yoctoproject.org/ref-manual/migration-3.1.html#reproducible-builds-now-enabled-by-default


Good idea. I implemented it.

Thanks!
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

