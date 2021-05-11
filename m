Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web10.2185.1620763035251434216
 for <docs@lists.yoctoproject.org>;
 Tue, 11 May 2021 12:57:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.178.231, mailfrom: michael.opdenacker@bootlin.com)
Received: from [192.168.1.25] (amontpellier-552-1-199-211.w109-210.abo.wanadoo.fr [109.210.254.211])
	(Authenticated sender: michael.opdenacker@bootlin.com)
	by relay11.mail.gandi.net (Postfix) with ESMTPSA id CAEC4100004;
	Tue, 11 May 2021 19:57:12 +0000 (UTC)
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] manuals: improve SSTATE_MIRRORS documentation
To: Quentin Schulz <quentin.schulz@streamunlimited.com>
References: <20210507155209.147892-1-michael.opdenacker@bootlin.com>
 <20210510093257.ovej5z4h7pcxn74u@qschulz>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <121e1881-070d-9198-77b2-f22c0bed9b76@bootlin.com>
Date: Tue, 11 May 2021 21:57:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210510093257.ovej5z4h7pcxn74u@qschulz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Quentin,

Many thanks for the much needed review and guidance for this patch!

On 5/10/21 11:32 AM, Quentin Schulz wrote:
> Hi Michael,
>
> On Fri, May 07, 2021 at 05:52:09PM +0200, Michael Opdenacker wrote:
>> Mention the Yocto Project mirrors
>> Use a more sensible order for such mirrors (dev, latest, latest - 1)
>> Assign the variable through "?=" (for consistency)
>>
> A list in commit log usually means separate commits should be made.

That's a good guideline to follow. However, in this particular case, all
items touch the same lines in the files, so I thought it would make
sense to have only one commit.

>
>> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
>> ---
>>  documentation/brief-yoctoprojectqs/index.rst      |  7 +++----
>>  documentation/overview-manual/concepts.rst        |  5 +++++
>>  documentation/ref-manual/variables.rst            | 10 ++++++++++
>>  documentation/sdk-manual/appendix-customizing.rst |  7 ++++++-
>>  4 files changed, 24 insertions(+), 5 deletions(-)
>>
>> diff --git a/documentation/brief-yoctoprojectqs/index.rst b/documentation/brief-yoctoprojectqs/index.rst
>> index 6a12b19ca0..ad26ad05ea 100644
>> --- a/documentation/brief-yoctoprojectqs/index.rst
>> +++ b/documentation/brief-yoctoprojectqs/index.rst
>> @@ -240,14 +240,13 @@ an entire Linux distribution, including the toolchain, from source.
>>        failures by using mirrors. To use mirrors, add these lines to your
>>        local.conf file in the Build directory::
>>  
>> -         SSTATE_MIRRORS = "\
>> +         SSTATE_MIRRORS ?= "\
>>           file://.* http://sstate.yoctoproject.org/dev/PATH;downloadfilename=PATH \n \
>> -         file://.* http://sstate.yoctoproject.org/&YOCTO_DOC_VERSION_MINUS_ONE;/PATH;downloadfilename=PATH \n \
>>           file://.* http://sstate.yoctoproject.org/&YOCTO_DOC_VERSION;/PATH;downloadfilename=PATH \n \
>> +         file://.* http://sstate.yoctoproject.org/&YOCTO_DOC_VERSION_MINUS_ONE;/PATH;downloadfilename=PATH \n \
>>           "
>>  
>> -
>> -      The previous examples showed how to add sstate paths for Yocto Project
>> +      The previous examples showed how to add sstate mirrors for Yocto Project
>>        &YOCTO_DOC_VERSION_MINUS_ONE;, &YOCTO_DOC_VERSION;, and a development
>>        area. For a complete index of sstate locations, see http://sstate.yoctoproject.org/.
>>  
>> diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
>> index 2e3f1af442..00aa502855 100644
>> --- a/documentation/overview-manual/concepts.rst
>> +++ b/documentation/overview-manual/concepts.rst
>> @@ -1924,6 +1924,11 @@ shared state files. Here is an example::
>>         file://.\* http://someserver.tld/share/sstate/PATH;downloadfilename=PATH \n \
>>         file://.\* file:///some/local/dir/sstate/PATH"
>>  
>> +It's also possible to directly take advantage of Yocto Project's own mirrors,
>> +for example, for the latest release::
>> +
>> +   SSTATE_MIRRORS ?= "file://.* http://sstate.yoctoproject.org/&YOCTO_DOC_VERSION;/PATH;downloadfilename=PATH"
>> +
> This is actually not really working right now, only 55% of the
> sstate-cache is matched because since dunfell (I think?) hashserv is
> enabled by default and the hashserv data is not shared yet.
>
> Richard would probably be able to help more with this but here's the
> quick IRC log from a month ago of our discussion:
> https://www.yoctoproject.org/irc/%23yocto.2021-04-06.log.html#t2021-04-06T13:56:41
>
> I'd be against suggesting it until we figure it out, it'll bring more
> questions than help IMO.


Understood, many thanks for the pointers. So, I guess for the moment
it's better to use your own sstate caches.

>>        When pointing to sstate build artifacts on another machine that uses
>>        a different GCC version for native builds, you must configure
>>        ``SSTATE_MIRRORS`` with a regular expression that maps local search
>> diff --git a/documentation/sdk-manual/appendix-customizing.rst b/documentation/sdk-manual/appendix-customizing.rst
>> index fb2d78452b..ddc8850dbf 100644
>> --- a/documentation/sdk-manual/appendix-customizing.rst
>> +++ b/documentation/sdk-manual/appendix-customizing.rst
>> @@ -269,7 +269,12 @@ source, you need to do a number of things:
>>     to find the configuration. The variable you need to set is
>>     :term:`SSTATE_MIRRORS`::
>>  
>> -      SSTATE_MIRRORS = "file://.* http://example.com/some_path/sstate-cache/PATH"
>> +      SSTATE_MIRRORS ?= "file://.* http://example.com/some_path/sstate-cache/PATH"
>> +
> Wondering if this shouldn't rather be:
> SSTATE_MIRRORS ?= "file://.* http://example.com/some_path/sstate-cache/PATH;downloadfilename=PATH"
> like we have in other places in the docs?
>
> It seems "PATH;downloadfilename=PATH" might not be even needed at all
> since we set up a sstate mirror and forgot to append this and it seemed
> to work ok (we added it during review anyway, just to match documentation).


I'll make my own tests then.

>
>> +   It's even possible to directly take advantage of Yocto Project's own mirrors,
>> +   for example for the current release::
>> +
>> +      SSTATE_MIRRORS ?= "file://.* http://sstate.yoctoproject.org/&YOCTO_DOC_VERSION;/PATH;downloadfilename=PATH"
>>  
> Not fully working yet. I'd remove it. See comments above.

Yes, understood. I'd check what I can keep and update from the original
patch. Thanks again!

Anyway, you're helping me to understand the topic better :)

Cheers,

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

