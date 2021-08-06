Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web09.3212.1628246584599266470
 for <docs@lists.yoctoproject.org>;
 Fri, 06 Aug 2021 03:43:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 31069240006
	for <docs@lists.yoctoproject.org>; Fri,  6 Aug 2021 10:43:01 +0000 (UTC)
Subject: Re: [docs] [PATCH] manuals: further documentation for cve-check
To: docs@lists.yoctoproject.org
References: <1698B15566F381B1.20643@lists.yoctoproject.org>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <587ec66e-f5cc-b18c-d7e4-b8cfad9963d2@bootlin.com>
Date: Fri, 6 Aug 2021 12:43:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1698B15566F381B1.20643@lists.yoctoproject.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Greetings,

On 8/6/21 12:37 PM, Michael Opdenacker wrote:
> +Implementation details
> +----------------------
> +
> +Here's what ``cve-check.bbclass`` does to find unpatched CVE IDs.
> +
> +First the code goes through each patch file provided by a recipe. If a valid CVE ID
> +is found in the name of the file, the corresponding CVE is considered as patched.
> +Don't forget that if multiple CVE IDs are found in the file name, only the last
> +one is considered. Then, the code looks for ``CVE: CVE-ID`` lines in the patch
> +file. The found CVE IDs are also considered as patched.
> +
> +Then, the code looks-up all the CVE IDs in the NIST database for all the
> +products defined in :term:`CVE_PRODUCT`. Then, for each found CVE:
> +
> + - If the package name (:term:`PN`) is part of
> +   :term:`CVE_CHECK_PN_WHITELIST`, it is considered as patched.
> +
> + - If the CVE ID is part of :term:`CVE_CHECK_WHITELIST`, it is
> +   considered as patched too.
> +
> + - If the CVE ID is part of the patched CVEs for the recipe, it is
> +   already considered as patched.
> +
> + - Otherwise, the code checks whether the recipe version (:term:`PV`)
> +   is within the range of versions impacted by the CVE. If so, the CVE
> +   is considered as unpatched.


I guess this description would save time to people trying to understand
the cve-check.bbclass code. I bet most code readers won't think about
checking the documentation first.

Would it make sense to add a link to such documentation as a comment in
the code, or directly add the above text as comments?

Thanks in advance,
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

