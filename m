Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web09.20770.1627915794617575639
 for <docs@lists.yoctoproject.org>;
 Mon, 02 Aug 2021 07:49:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 77B4BFF80B;
	Mon,  2 Aug 2021 14:49:52 +0000 (UTC)
Cc: docs@lists.yoctoproject.org,
 Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: Re: [docs] [PATCH] manuals: initial documentation for CVE management
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>
References: <20210730185433.188851-1-michael.opdenacker@bootlin.com>
 <20210802093618.npbsjvxyh7x3pbtl@fedora>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <bce5cfa0-9a3e-d5a0-b1e6-ef0482e001db@bootlin.com>
Date: Mon, 2 Aug 2021 16:49:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210802093618.npbsjvxyh7x3pbtl@fedora>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Quentin,

Many thanks for reviewing my patch and for all your contributions to
YP's documentation!

On 8/2/21 11:36 AM, Quentin Schulz wrote:
> s/ignore/ignored/


Oops, fixed, thanks.

>
>> +   bitbake -c cve_check libarchive -R conf/distro/include/cve-extra-exclusions.inc
>> +
>> +Enabling vulnerabily tracking in recipes
>> +----------------------------------------
>> +
>> +The :term:`CVE_PRODUCT` variable defines the name used to match the recipe name
>> +against the name in the upstream `NIST CVE database <https://urldefense.proofpoint.com/v2/url?u=https-3A__nvd.nist.gov_&d=DwIDAg&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=hekyLAdEcYu52ifxV5ERIziCTL0mv8hKI_2zFGHfCiY&s=2VyieDwk2kXSn66jsySlUL_eB6CvuUWR-yRh-DMaIv0&e= >`__.
>> +
>> +The CVE database is created by a recipe and stored in :term:`DL_DIR`.
> A bit unclear to me the "created by a recipe" part. I'm not sure it is
> important information?
>
>> +For example, you can look inside the database using the ``sqlite3`` command
>> +as follows::
>> +
>> +   sqlite3 downloads/CVE_CHECK/nvdcve_1.1.db .dump | grep CVE-2021-37462
>> +
> What about:
>
> The CVE database is stored in :term:`DL_DIR` and can be inspected using
> ``sqlite3`` command as follows:
>
> [...]
>
> ?

This sounds good to me. The initial text was written by Richard and I
admit I didn't pay enough attention to this detail. Richard, would this
be OK?
>
> If the "created by a recipe" part is important maybe it needs to be a
> bit more explicit what it means?

Yes, in this case, it would be good to know which recipe we are
referring to.
>
>>  Using the Error Reporting Tool
>>  ==============================
>>  
>> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
>> index b61de1993d..72e1c832c6 100644
>> --- a/documentation/ref-manual/variables.rst
>> +++ b/documentation/ref-manual/variables.rst
>> @@ -1471,6 +1471,17 @@ system and gives an overview of their function and contents.
>>           variable only in certain contexts (e.g. when building for kernel
>>           and kernel module recipes).
>>  
>> +   :term:`CVE_PRODUCT`
>> +      In a recipe, defines the name used to match the recipe name
>> +      against the name in the upstream `NIST CVE database <https://urldefense.proofpoint.com/v2/url?u=https-3A__nvd.nist.gov_&d=DwIDAg&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=hekyLAdEcYu52ifxV5ERIziCTL0mv8hKI_2zFGHfCiY&s=2VyieDwk2kXSn66jsySlUL_eB6CvuUWR-yRh-DMaIv0&e= >`__.
>> +
>> +      This is only needed in case of a mitmatch, or if the
> s/mitmatch/mismatch/
>
> Technically, it is needed by all recipes, it's just that the default is
> ${BPN}.
>
> I'd rather say that "
> The default is ${:term:`BPN`}. If it does not match the name in NIST CVE
> database or matches with multiple entries in the database, the default
> value needs to be changed.
> "
>
> What do you think?

It sounds better than my original text. Adopted, thanks!

>> +      Here is an example from the Berkeley DB recipe (``db_${PV}.bb``)::
>> +
> ``db_${PV}.bb`` is an invalid name for a recipe name I think, can we
> just give it the current version (and eventually says from which release
> it is?). Or maybe we can just not give the full recipe name but just
> that it's named db and link to its page on the layer index:
> https://layers.openembedded.org/layerindex/recipe/544/ so that it's
> always up-to-date?


I like this idea, and I'll remember this way of referring to recipes.
Adopted too. I'll send a V2 very soon.

Many thanks,
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

