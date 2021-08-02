Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web08.19537.1627909527868046755
 for <docs@lists.yoctoproject.org>;
 Mon, 02 Aug 2021 06:05:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 198ACE0009;
	Mon,  2 Aug 2021 13:05:25 +0000 (UTC)
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] profile-manual: document how to build perf manpages on target
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>
References: <20210730160617.185319-1-michael.opdenacker@bootlin.com>
 <20210802093816.vndv4fa25mbypjca@fedora>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <f0d355f9-c994-d202-9fa2-b86ffb9bf75b@bootlin.com>
Date: Mon, 2 Aug 2021 15:05:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210802093816.vndv4fa25mbypjca@fedora>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Quentin,

Many thanks for the review!

On 8/2/21 11:38 AM, Quentin Schulz wrote:
> Hi Michael,
>
> On Fri, Jul 30, 2021 at 06:06:17PM +0200, Michael Opdenacker wrote:
>> Thanks to closing yocto bug #3388, there is now a simple way
>> to build the perf manpages for use on the target
>>
>> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
>> ---
>>  documentation/profile-manual/usage.rst | 11 ++++++-----
>>  1 file changed, 6 insertions(+), 5 deletions(-)
>>
>> diff --git a/documentation/profile-manual/usage.rst b/documentation/profile-manual/usage.rst
>> index 825290c3f8..ae4efa7f4c 100644
>> --- a/documentation/profile-manual/usage.rst
>> +++ b/documentation/profile-manual/usage.rst
>> @@ -1157,13 +1157,14 @@ section can be found here:
>>  Normally, you should be able to invoke the man pages via perf itself
>>  e.g. 'perf help' or 'perf help record'.
>>  
>> -However, by default Yocto doesn't install man pages, but perf invokes
>> -the man pages for most help functionality. This is a bug and is being
>> -addressed by a Yocto bug: :yocto_bugs:`Bug 3388 - perf: enable man pages for
>> -basic 'help' functionality </show_bug.cgi?id=3388>`.
>> +To have the perf manpages installed on your target, modify your
> s/perf/``perf``/ ?


While I tend to agree here, I believe this change should be made in
another commit. You have many other instances of the "perf" word in this
chapter, like instances of "ftrace" and other tool names.

Let me first propose a coding style for documentation, and once we agree
on one, we'll be able to roll it out progressively on the various documents.

Cheers,

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

