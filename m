Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web08.1939.1627396179537014952
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Jul 2021 07:29:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.178.232, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay12.mail.gandi.net (Postfix) with ESMTPSA id 0D5A2200009;
	Tue, 27 Jul 2021 14:29:36 +0000 (UTC)
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 1/2] documentation/README: improve BitBake manual referencing guidelines
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>
References: <20210727141200.128209-1-michael.opdenacker@bootlin.com>
 <20210727141459.otifwpfjjigvu2gq@fedora>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <1d5772ec-2039-02da-b0bb-98f7d55fe95b@bootlin.com>
Date: Tue, 27 Jul 2021 16:29:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210727141459.otifwpfjjigvu2gq@fedora>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Quentin,

On 7/27/21 4:14 PM, Quentin Schulz wrote:
> Hi Michael,
>
> On Tue, Jul 27, 2021 at 04:11:59PM +0200, Michael Opdenacker wrote:
>> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
>> ---
>>  documentation/README | 12 ++++++++----
>>  1 file changed, 8 insertions(+), 4 deletions(-)
>>
>> diff --git a/documentation/README b/documentation/README
>> index f9e803a28b..1d4d213076 100644
>> --- a/documentation/README
>> +++ b/documentation/README
>> @@ -328,11 +328,15 @@ The sphinx.ext.intersphinx extension is enabled by default
>>  so that we can cross reference content from other Sphinx based
>>  documentation projects, such as the BitBake manual.
>>  
>> -References to the bitbake manual can be done like this:
>> -
>> -  See the ":ref:`-D <bitbake:bitbake-user-manual/bitbake-user-manual-intro:usage and syntax>`" option
>> -or
>> +References to the BitBake manual can be done:
>> + - With a specific description instead of the section name:
>> +  :ref:`Azure Storage fetcher (az://) <bitbake:bitbake-user-manual/bitbake-user-manual-fetching:fetchers>`
>> + - With the section name:
>> +  ":ref:`bitbake:bitbake-user-manual/bitbake-user-manual-intro:usage and syntax` option
>> + - With a BitBake variable name:
>>    :term:`bitbake:BB_NUMBER_PARSE_THREADS`
> I'd rather not specify bitbake: for terms so that they can be overriden
> from within yocto-docs if need be, without needing to modify all the
> refs spread over the whole git repo.


Thanks for the feedback. However, I'm not sure what you mean here... Do
you mean we should replace all instances of ":term:`bitbake:VARIABLE`"
by ":term:`VARIABLE`"?

If I understand well, if VARIABLE is only defined in the BitBake manual,
we will directly get a reference in that manual.

Cheers,
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

