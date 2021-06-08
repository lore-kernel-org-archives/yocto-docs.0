Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web11.10431.1623146797212760070
 for <docs@lists.yoctoproject.org>;
 Tue, 08 Jun 2021 03:06:37 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.178.230, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay10.mail.gandi.net (Postfix) with ESMTPSA id 514CA240002;
	Tue,  8 Jun 2021 10:06:34 +0000 (UTC)
Subject: Re: [docs] [PATCH] test-manual: Add initial YP Compatible documentation
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 docs@lists.yoctoproject.org
References: <16868FF087903AB7.10003@lists.yoctoproject.org>
 <94804013e19f7f1c7b09f71a63755f0c870a078c.camel@linuxfoundation.org>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <1d87008e-7566-c418-776e-8d4912b1ddbe@bootlin.com>
Date: Tue, 8 Jun 2021 12:06:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <94804013e19f7f1c7b09f71a63755f0c870a078c.camel@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hi Richard,

On 6/8/21 11:06 AM, Richard Purdie wrote:
> On Tue, 2021-06-08 at 10:02 +0100, Richard Purdie via lists.yoctoproject.org wrote:
>> We need to document the Yocto Project Compatible badging programme. This
>> adds an initial piece of documentation about it from which we can improve
>> as needed.
>>
>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> ---
>>  documentation/test-manual/index.rst           |  1 +
>>  .../test-manual/yocto-project-compatible.rst  | 52 +++++++++++++++++++
>>  2 files changed, 53 insertions(+)
>>  create mode 100644 documentation/test-manual/yocto-project-compatible.rst
> Again, I've sent this out since I've had it languishing in a branch for too 
> long. I appreciate the text needs wrapping properly and various other cleanups 
> but hopefully it is at a point where Michael can take it as some base text 
> and get it into the manual? 
>
> I did try and at least get the content basically complete (there is much 
> more we could add but it is a start).

Thanks for this too. I'll take care of it soon too.

Cheers,

Michael.
-- 

Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

