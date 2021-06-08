Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web08.9405.1623139439625414738
 for <docs@lists.yoctoproject.org>;
 Tue, 08 Jun 2021 01:04:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id C5F1A20015;
	Tue,  8 Jun 2021 08:03:57 +0000 (UTC)
Subject: Re: [docs] [PATCH] test-manual: Add initial reproducibile builds documentation
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 docs@lists.yoctoproject.org
References: <16865B5B6683D232.21761@lists.yoctoproject.org>
 <56b2b0aa26a20d6e06c1d594feb143b8cfe44c96.camel@linuxfoundation.org>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <936fc639-f040-5e5d-f71b-51f8f82afbc4@bootlin.com>
Date: Tue, 8 Jun 2021 10:03:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <56b2b0aa26a20d6e06c1d594feb143b8cfe44c96.camel@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hi Richard,

On 6/7/21 7:03 PM, Richard Purdie wrote:
> On Mon, 2021-06-07 at 17:59 +0100, Richard Purdie via lists.yoctoproject.org wrote:
>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> ---
>>  documentation/test-manual/index.rst           |  1 +
>>  .../test-manual/reproducible-builds.rst       | 60 +++++++++++++++++++
>>  2 files changed, 61 insertions(+)
>>  create mode 100644 documentation/test-manual/reproducible-builds.rst
>>
>> diff --git a/documentation/test-manual/index.rst b/documentation/test-manual/index.rst
>> index e2198c4c3..d122b5e27 100644
>> --- a/documentation/test-manual/index.rst
>> +++ b/documentation/test-manual/index.rst
>> @@ -13,6 +13,7 @@ Yocto Project Test Environment Manual
>>     intro
>>     test-process
>>     understand-autobuilder
>> +   reproducible-builds
>>     history
> As background, I've had this sitting around half finished for a while. I've
> had a push to at least get the minimal content in and wanted to get something 
> out which we can improve upon from here. I know some variables aren't quite 
> right syntax wise and so on but I'm hoping Michael or someone else might be
> able to help from here?


Sure, many thanks for the initial documentation on this topic! I'm
taking care of fixing a few typos and adding proper index references for
variables, and I'll share a V2 soon.

Thanks again,

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

