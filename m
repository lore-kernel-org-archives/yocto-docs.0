Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web08.2495.1627463619364810565
 for <docs@lists.yoctoproject.org>;
 Wed, 28 Jul 2021 02:13:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 82416FF802;
	Wed, 28 Jul 2021 09:13:37 +0000 (UTC)
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH v2 2/3] manuals: simplify references to BitBake manual
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>
References: <1695B21F5A0B37B5.3345@lists.yoctoproject.org>
 <20210727171147.132288-1-michael.opdenacker@bootlin.com>
 <20210727171147.132288-3-michael.opdenacker@bootlin.com>
 <20210728084650.ynbq3fofbe2c3jug@fedora>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <8006e924-ec35-ef90-233a-3e7869867357@bootlin.com>
Date: Wed, 28 Jul 2021 11:13:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210728084650.ynbq3fofbe2c3jug@fedora>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hi Quentin,

Thanks for your review!

On 7/28/21 10:46 AM, Quentin Schulz wrote:
> Hi Michael,
>
> On Tue, Jul 27, 2021 at 07:11:46PM +0200, Michael Opdenacker wrote:
>> Replacing ":ref:`section name<bitbake:bitbake-user-manual/bitbake-user-manual-<section>:section name>`"
>> by ":ref:`bitbake:bitbake-user-manual/bitbake-user-manual-<section>:section name`"
>> when the reference description is the same as the section name.
>> In this case, that's unnecessary to repeat the section name in the description part.
>>
>> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
>> ---
>>  documentation/brief-yoctoprojectqs/index.rst     |  4 ++--
>>  documentation/dev-manual/common-tasks.rst        |  2 +-
>>  documentation/migration-guides/migration-2.4.rst |  4 ++--
>>  documentation/overview-manual/concepts.rst       |  6 +++---
>>  documentation/ref-manual/tasks.rst               |  4 ++--
>>  documentation/ref-manual/variables.rst           | 12 ++++++------
>>  documentation/sdk-manual/extensible.rst          |  2 +-
>>  7 files changed, 17 insertions(+), 17 deletions(-)
>>
>> diff --git a/documentation/brief-yoctoprojectqs/index.rst b/documentation/brief-yoctoprojectqs/index.rst
>> index 8e2f2d423c..e999d925b8 100644
>> --- a/documentation/brief-yoctoprojectqs/index.rst
>> +++ b/documentation/brief-yoctoprojectqs/index.rst
>> @@ -267,8 +267,8 @@ an entire Linux distribution, including the toolchain, from source.
>>  
>>     For information on using the ``bitbake`` command, see the
>>     :ref:`overview-manual/concepts:bitbake` section in the Yocto Project Overview and
>> -   Concepts Manual, or see the ":ref:`BitBake Command
>> -   <bitbake:bitbake-user-manual/bitbake-user-manual-intro:the bitbake command>`" section in the BitBake User Manual.
>> +   Concepts Manual, or see the
> Spurious `the` since I assume it's part of the section title just below.


Actually, this one was intentional, as "The"  is part of the section
name. The result is:
"see the The BitBake Command
<https://docs.yoctoproject.org/bitbake/bitbake-user-manual/bitbake-user-manual-intro.html#the-bitbake-command> section
in the BitBake User Manual"

I could put "The BitBake Command" between double quotes, but I agree
that this still sounds weird if you read out loud.

I could either revert the change or just drop "the"  and "section" and get:
"see The BitBake Command in the BitBake User Manual"

Any preference? The second solution has the simplest source code.
Thanks again,
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

