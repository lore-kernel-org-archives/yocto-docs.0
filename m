Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web12.5132.1628258704371214480
 for <docs@lists.yoctoproject.org>;
 Fri, 06 Aug 2021 07:05:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 9FABBE000C;
	Fri,  6 Aug 2021 14:05:02 +0000 (UTC)
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] manuals: further documentation for cve-check
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>
References: <20210806103720.50047-1-michael.opdenacker@bootlin.com>
 <20210806114113.4453gl435gtde7xy@fedora>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <1add53c8-11b6-3575-12bf-30124b38de97@bootlin.com>
Date: Fri, 6 Aug 2021 16:05:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210806114113.4453gl435gtde7xy@fedora>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Quentin

Thank you once again for the quick (and thorough!) review!

On 8/6/21 1:41 PM, Quentin Schulz wrote:
>
> I think we could afford saying a few words about this class in the
> Reference Manual? In which case:
> s/``cve-check.bbclass``/:ref:`cve-check.bbclass <ref-classes-cve-check>`/ ?

Very good idea, and it wouldn't cost too much. I'll do it (good catch by
the way).

>
>> +way is to use a patch file name that matches the below pattern::
>> +
> Not sure about that one but s/file name/filename/ ? If chosen, fix the
> other occurences at the same time :)

Good idea!

$ git grep "filename" |wc -l
56
git grep "file name" |wc -l
22

So "filename" wins. That's an even stronger win for the plural variant.
I'll update.

>
>> +   cve_file_name_match = re.compile(".*([Cc][Vv][Ee]\-\d{4}\-\d+)")
>> +
>> +As shown in the example above, multiple CVE IDs can appear in a patch file name,
>> +but the ``cve-check.bbclass`` code will only consider the last CVE ID in the
>> +file name as patched.
>> +
>> +The second way to recognize a patched CVE ID is when a line matching the
>> +below pattern is found in any patch file provided by the recipe::
>> +
>> +  cve_match = re.compile("CVE:( CVE\-\d{4}\-\d+)+")
>> +
>> +This allows a single patch file to address multiple CVE IDs at the same time.
>> +
>> +Of course, another way to fix vulnerabilities is to upgrade to a version
>> +of the package which is not impacted, typically a more recent one.
>> +The NIST database knows which versions are vulnerable and which ones
>> +are not.
>> +
>> +Last but not least, you can choose to ignore vulnerabilities through
>> +the :term:`CVE_CHECK_PN_WHITELIST` and :term:`CVE_CHECK_WHITELIST`
>> +variables.
>> +
>> +Implementation details
>> +----------------------
>> +
>> +Here's what ``cve-check.bbclass`` does to find unpatched CVE IDs.
>> +
> Would need the :ref: link here too if chosen.


Sure.

>
>> +First the code goes through each patch file provided by a recipe. If a valid CVE ID
>> +is found in the name of the file, the corresponding CVE is considered as patched.
>> +Don't forget that if multiple CVE IDs are found in the file name, only the last
>> +one is considered. Then, the code looks for ``CVE: CVE-ID`` lines in the patch
>> +file. The found CVE IDs are also considered as patched.
>> +
>> +Then, the code looks-up all the CVE IDs in the NIST database for all the
> s/looks-up all the CVE IDs/looks all the CVE IDs up/ ?


Pfooh, it seems that both are valid buth "all the CVE IDs" is perhaps a
bit too long for "shifting" to be the preferred solution. See
https://en.wikipedia.org/wiki/English_phrasal_verbs#Shifting (nice
reading by the way, at least the first sections that I read).

Actually, the hyphen is bad, so I'll write:

"looks up all the CVE IDs"

>
>> +      The list of package names (:term:`PN`) for which
>> +      CVE vulnerabilities are ignored.
>> +
> Since CVE stands for "Common Vulnerabilities and Exposures", isn't
> adding vulnerabilities redundant?


Oh yes, agreed!

>
>> +   :term:`CVE_CHECK_WHITELIST`
>> +      The list of vulnerability CVE IDs which are ignored. Here is
> Ditto.
>
> Thanks for the patch :)
Thanks again for the review.
Cheers,
Michael

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

