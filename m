Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF1F7C77B7A
	for <webhook@archiver.kernel.org>; Fri, 19 May 2023 13:01:18 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.25758.1684501268883601810
 for <docs@lists.yoctoproject.org>;
 Fri, 19 May 2023 06:01:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=o7JmY3tL;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 4A91C240004;
	Fri, 19 May 2023 13:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1684501266;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2p2a7RsN8LsCvEgx0653bl4vwbagXWqo/QEtcry5gAU=;
	b=o7JmY3tL3AqtYcIfuStknSMq0/1Tv2mYdmIpzzSNO/J/hr1RhIHNki2L9WPVZSE37vRjbP
	Anv8TvMJf/5I4k9JMD3DC6aK0kfeAkxa3jeqvexb5FHbSMb16N4bIfXmi5w2GpSNSYN3NY
	KzMzHPXqQkuVe8suVmIni3DTUprQkopnsmRg0hfm9u8ZZ7ilz1jmY4uSKq8+ZFhIwXTkdY
	FdoBYCV2eeeth8i5SjD/Yy1D7VKJxUgu0yWUdNJo9MufIkBpAtLDI5mfDRYV1FvKRF9WDl
	Ue+1vf3vrH/AEB5l2nSUyoNHAq69+kReC2UEmnQFxPTwQAdk0CVe9AWg3iDEBQ==
Message-ID: <5a278212-90dc-78eb-fa5a-ee01b9d1fca5@bootlin.com>
Date: Fri, 19 May 2023 15:01:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Cc: mikko.rapeli@linaro.org, Peter Marko <peter.marko@siemens.com>
Subject: Re: [docs] [PATCH] ref-manual: document CVE_STATUS and
 CVE_STATUS_REASONING
Content-Language: en-US
To: andrej.valek@siemens.com, docs@lists.yoctoproject.org
References: <20230505111814.491483-1-andrej.valek@siemens.com>
 <20230519085823.90027-1-andrej.valek@siemens.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20230519085823.90027-1-andrej.valek@siemens.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 19 May 2023 13:01:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3952

Hi Andrej

Many thanks for the documentation update!

See my comments below.

On 19.05.23 at 10:58, Andrej Valek via lists.yoctoproject.org wrote:
> Deprecate CVE_CHECK_IGNORE with CVE_STATUS
>
> Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>   documentation/dev-manual/new-recipe.rst      |  4 +--
>   documentation/dev-manual/vulnerabilities.rst | 11 ++++---
>   documentation/ref-manual/classes.rst         |  9 ++++--
>   documentation/ref-manual/variables.rst       | 33 +++++++++++++++++---
>   4 files changed, 42 insertions(+), 15 deletions(-)
>
> diff --git a/documentation/dev-manual/new-recipe.rst b/documentation/dev-manual/new-recipe.rst
> index 4e74246a4..008f4b1ce 100644
> --- a/documentation/dev-manual/new-recipe.rst
> +++ b/documentation/dev-manual/new-recipe.rst
> @@ -1253,8 +1253,8 @@ In the following example, ``lz4`` is a makefile-based package::
>   
>      S = "${WORKDIR}/git"
>   
> -   # Fixed in r118, which is larger than the current version.
> -   CVE_CHECK_IGNORE += "CVE-2014-4715"
> +   CVE_STATUS[CVE-2014-4715] = "Patched"
> +   CVE_STATUS_REASONING[CVE-2014-4715] = "Fixed in r118, which is larger than the current version"

Don't we say "higher" instead of "larger" for version numbers?

>   
>      EXTRA_OEMAKE = "PREFIX=${prefix} CC='${CC}' CFLAGS='${CFLAGS}' DESTDIR=${D} LIBDIR=${libdir} INCLUDEDIR=${includedir} BUILD_STATIC=no"
>   
> diff --git a/documentation/dev-manual/vulnerabilities.rst b/documentation/dev-manual/vulnerabilities.rst
> index 0ee3ec52c..071d80cbd 100644
> --- a/documentation/dev-manual/vulnerabilities.rst
> +++ b/documentation/dev-manual/vulnerabilities.rst
> @@ -158,7 +158,8 @@ CVE checker will then capture this information and change the CVE status to ``Pa
>   in the generated reports.
>   
>   If analysis shows that the CVE issue does not impact the recipe due to configuration, platform,
> -version or other reasons, the CVE can be marked as ``Ignored`` using the :term:`CVE_CHECK_IGNORE` variable.
> +version or other reasons, the CVE can be marked as ``Ignored`` or ``Not applicable`` using
> +the :term:`CVE_STATUS` variable flag.
>   As mentioned previously, if data in the CVE database is wrong, it is recommend to fix those
>   issues in the CVE database directly.
>   
> @@ -182,11 +183,11 @@ products defined in :term:`CVE_PRODUCT`. Then, for each found CVE:
>   -  If the package name (:term:`PN`) is part of
>      :term:`CVE_CHECK_SKIP_RECIPE`, it is considered as ``Patched``.
>   
> --  If the CVE ID is part of :term:`CVE_CHECK_IGNORE`, it is
> -   set as ``Ignored``.
> +-  If the CVE ID has status ``CVE_STATUS[<CVE ID>] = "Ignored"``, it is
> +   set as ``Ignored`` as same as for ``CVE_STATUS[<CVE ID>] = "Not applicable"``.

The "as same as for" expression sounds unusual to me. What about
"If  ``CVE_STATUS[<CVE ID>] = "Ignored"`` or ``CVE_STATUS[<CVE ID>] = 
"Not applicable"``, the CVE ID is considered as ``Ignored``"?

>   
> --  If the CVE ID is part of the patched CVE for the recipe, it is
> -   already considered as ``Patched``.
> +-  If the CVE ID is part of the patched CVE for the recipe or has status
> +   ``CVE_STATUS[<CVE ID>] = "Patched"``, it is considered as ``Patched``.
>   
>   -  Otherwise, the code checks whether the recipe version (:term:`PV`)
>      is within the range of versions impacted by the CVE. If so, the CVE
> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
> index ab1628401..04c992a6b 100644
> --- a/documentation/ref-manual/classes.rst
> +++ b/documentation/ref-manual/classes.rst
> @@ -517,10 +517,13 @@ The ``Patched`` state of a CVE issue is detected from patch files with the forma
>   ``CVE-ID.patch``, e.g. ``CVE-2019-20633.patch``, in the :term:`SRC_URI` and using
>   CVE metadata of format ``CVE: CVE-ID`` in the commit message of the patch file.
>   
> -If the recipe lists the ``CVE-ID`` in :term:`CVE_CHECK_IGNORE` variable, then the CVE state is reported
> -as ``Ignored``. Multiple CVEs can be listed separated by spaces. Example::
> +If the recipe adds the ``CVE-ID`` as flag of :term:`CVE_STATUS` variable with status

"If the recipe adds ``CVE-ID`` as flag of the :term:`CVE_STATUS` variable with status"?

> +``Ignored`` or ``Not applicable``, then the CVE state is reported as ``Ignored``::
>   
> -   CVE_CHECK_IGNORE += "CVE-2020-29509 CVE-2020-29511"
> +   CVE_STATUS[CVE-2020-15523] = "Ignored"
> +
> +Possible CVE's statuses are ``Ignored``, ``Not applicable`` and ``Patched``. Check :term:`CVE_STATUS`
> +for more details.

I'd change "CVE's statuses" by "CVE statuses". I don't think "'s" is 
needed here.

>   
>   If CVE check reports that a recipe contains false positives or false negatives, these may be
>   fixed in recipes by adjusting the CVE product name using :term:`CVE_PRODUCT` and :term:`CVE_VERSION` variables.
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index 6ee65e178..9575c5371 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -1653,11 +1653,7 @@ system and gives an overview of their function and contents.
>            and kernel module recipes).
>   
>      :term:`CVE_CHECK_IGNORE`
> -      The list of CVE IDs which are ignored. Here is
> -      an example from the :oe_layerindex:`Python3 recipe</layerindex/recipe/23823>`::
> -
> -         # This is windows only issue.
> -         CVE_CHECK_IGNORE += "CVE-2020-15523"
> +      Is deprecated and should be replaced by :term:`CVE_STATUS`


This variable is deprecated and should be replaced by :term:`CVE_STATUS`.
(notice the "." at the end of the sentence too).

>   
>      :term:`CVE_CHECK_SHOW_WARNINGS`
>         Specifies whether or not the :ref:`ref-classes-cve-check`
> @@ -1698,6 +1694,33 @@ system and gives an overview of their function and contents.
>   
>            CVE_PRODUCT = "vendor:package"
>   
> +   :term:`CVE_STATUS`
> +      The CVE ID which is patched or should be ignored. Here is
> +      an example from the :oe_layerindex:`Python3 recipe</layerindex/recipe/23823>`::
> +
> +         CVE_STATUS[CVE-2020-15523] = "Ignored"
> +
> +      Possible CVE's statuses ``Ignored``, ``Not applicable`` or ``Patched``, while the ``reasoning``
> +      is optional.


Same here, I would replace "CVE's" by "CVE".
Another issue is that ``reasoning`` is not explained here.

What about adding "(see :term:`CVE_STATUS_REASONING`)"?

> +
> +   :term:`CVE_STATUS_GROUPS`
> +      If there is a many CVEs with the same status and reason can by simplified by using this


"If there are many CVEs with the same status and reason, they can by 
simplified by using this"

All the rest sounds great!
Thanks again,
Cheers,
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


