Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6FE2EB64DC
	for <webhook@archiver.kernel.org>; Fri, 21 Jul 2023 14:53:10 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.9188.1689951182895995256
 for <docs@lists.yoctoproject.org>;
 Fri, 21 Jul 2023 07:53:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=LDDEG920;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E11DA40003;
	Fri, 21 Jul 2023 14:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689951180;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VRzhs/w3U495PIrH8/kSiZJzEmO3nycMtORLnTXvL94=;
	b=LDDEG920tskeOpbamkvqljlpFD2wdXvys+G/rl6vsvXDV+G4FwT8ndMcOaVI9+ZpGHbdRg
	haNv85RMx+9iIVBiYNsI5ixaJ7gAFjxULvimDNgEqGNeTyv7PaMHbrZDDPtvPmBqpcXDUy
	Zry/1B6jyfc4N76pGP1ZHmAVzqW3tsoVvY8jqKJ9XAvVuOqicNJfyP0ZQeSThPiryoyzke
	VS2f1336rJxQx/lodXia7rlPe9iPTom139IlLBd//OoKdqPxjc/dOo7oyaZnuhIQ3rSwe6
	qs92bwcJjakl8O5L+QWreU49KmWSbiesL+6iNWXqO2CYYSjkMzTP6VB8kMOPAw==
Message-ID: <ceecd494-0902-15dd-ba3b-7c1f90d06364@bootlin.com>
Date: Fri, 21 Jul 2023 16:52:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Cc: mikko.rapeli@linaro.org, Peter Marko <peter.marko@siemens.com>,
 docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH v2] ref-manual: document CVE_STATUS and
 CVE_CHECK_STATUSMAP
Content-Language: en-US
To: andrej.valek@siemens.com
References: <20230519085823.90027-1-andrej.valek@siemens.com>
 <20230720073130.41355-1-andrej.valek@siemens.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20230720073130.41355-1-andrej.valek@siemens.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 21 Jul 2023 14:53:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4075

Hi Andrej

Many thanks for the patch and documentation update!

See my comments below.

On 20.07.23 at 09:31, Andrej Valek via lists.yoctoproject.org wrote:
> Deprecate CVE_CHECK_IGNORE with CVE_STATUS
>
> Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>   documentation/dev-manual/new-recipe.rst      |  3 +-
>   documentation/dev-manual/vulnerabilities.rst | 13 +++++---
>   documentation/ref-manual/classes.rst         |  6 ++--
>   documentation/ref-manual/variables.rst       | 33 +++++++++++++++++---
>   4 files changed, 41 insertions(+), 14 deletions(-)
>
> diff --git a/documentation/dev-manual/new-recipe.rst b/documentation/dev-manual/new-recipe.rst
> index 1be04a765..af390773a 100644
> --- a/documentation/dev-manual/new-recipe.rst
> +++ b/documentation/dev-manual/new-recipe.rst
> @@ -1253,8 +1253,7 @@ In the following example, ``lz4`` is a makefile-based package::
>   
>      S = "${WORKDIR}/git"
>   
> -   # Fixed in r118, which is larger than the current version.
> -   CVE_CHECK_IGNORE += "CVE-2014-4715"
> +   CVE_STATUS[CVE-2014-4715] = "fixed-version: Fixed in r118, which is larger than the current version"
>   
>      EXTRA_OEMAKE = "PREFIX=${prefix} CC='${CC}' CFLAGS='${CFLAGS}' DESTDIR=${D} LIBDIR=${libdir} INCLUDEDIR=${includedir} BUILD_STATIC=no"
>   
> diff --git a/documentation/dev-manual/vulnerabilities.rst b/documentation/dev-manual/vulnerabilities.rst
> index 0ee3ec52c..6d87d02ec 100644
> --- a/documentation/dev-manual/vulnerabilities.rst
> +++ b/documentation/dev-manual/vulnerabilities.rst
> @@ -130,7 +130,8 @@ Fixing vulnerabilities in recipes
>   =================================
>   
>   If a CVE security issue impacts a software component, it can be fixed by updating to a newer
> -version of the software component or by applying a patch. For Poky and OE-Core master branches, updating
> +version of the software component, by applying a patch or by marking it as patched via
> +:term:`CVE_STATUS` variable flag. For Poky and OE-Core master branches, updating
>   to a newer software component release with fixes is the best option, but patches can be applied
>   if releases are not yet available.
>   
> @@ -158,7 +159,8 @@ CVE checker will then capture this information and change the CVE status to ``Pa
>   in the generated reports.
>   
>   If analysis shows that the CVE issue does not impact the recipe due to configuration, platform,
> -version or other reasons, the CVE can be marked as ``Ignored`` using the :term:`CVE_CHECK_IGNORE` variable.
> +version or other reasons, the CVE can be marked as ``Ignored`` by using
> +the :term:`CVE_STATUS` variable flag with appropriate reason which is mapped to ``Ignored``.
>   As mentioned previously, if data in the CVE database is wrong, it is recommend to fix those
>   issues in the CVE database directly.
>   
> @@ -175,6 +177,8 @@ is found in the name of the file, the corresponding CVE is considered as patched
>   Don't forget that if multiple CVE IDs are found in the filename, only the last
>   one is considered. Then, the code looks for ``CVE: CVE-ID`` lines in the patch
>   file. The found CVE IDs are also considered as patched.
> +Additionally ``CVE_STATUS`` variable flags are parsed for reasons mapped to ``Patched``
> +and these are also considered as patched.
>   
>   Then, the code looks up all the CVE IDs in the NIST database for all the
>   products defined in :term:`CVE_PRODUCT`. Then, for each found CVE:
> @@ -182,8 +186,9 @@ products defined in :term:`CVE_PRODUCT`. Then, for each found CVE:
>   -  If the package name (:term:`PN`) is part of
>      :term:`CVE_CHECK_SKIP_RECIPE`, it is considered as ``Patched``.
>   
> --  If the CVE ID is part of :term:`CVE_CHECK_IGNORE`, it is
> -   set as ``Ignored``.
> +-  If the CVE ID has status ``CVE_STATUS[<CVE ID>] = "ignored"`` or if it's set to
> +   any reason which is mapped to status ``Ignored`` via ``CVE_CHECK_STATUSMAP``,
> +   it is  set as ``Ignored``.
>   
>   -  If the CVE ID is part of the patched CVE for the recipe, it is
>      already considered as ``Patched``.
> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
> index e555a80b5..b8d07f102 100644
> --- a/documentation/ref-manual/classes.rst
> +++ b/documentation/ref-manual/classes.rst
> @@ -517,10 +517,10 @@ The ``Patched`` state of a CVE issue is detected from patch files with the forma
>   ``CVE-ID.patch``, e.g. ``CVE-2019-20633.patch``, in the :term:`SRC_URI` and using
>   CVE metadata of format ``CVE: CVE-ID`` in the commit message of the patch file.
>   
> -If the recipe lists the ``CVE-ID`` in :term:`CVE_CHECK_IGNORE` variable, then the CVE state is reported
> -as ``Ignored``. Multiple CVEs can be listed separated by spaces. Example::
> +If the recipe adds ``CVE-ID`` as flag of the :term:`CVE_STATUS` variable with status
> +mapped to ``Ignored``, then the CVE state is reported as ``Ignored``::
>   
> -   CVE_CHECK_IGNORE += "CVE-2020-29509 CVE-2020-29511"
> +   CVE_STATUS[CVE-2020-15523] = "not-applicable-platform: Issue only applies on Windows"
>   
>   If CVE check reports that a recipe contains false positives or false negatives, these may be
>   fixed in recipes by adjusting the CVE product name using :term:`CVE_PRODUCT` and :term:`CVE_VERSION` variables.
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index ac5b97a52..7e93f731a 100644
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
> +      This variable is deprecated and should be replaced by :term:`CVE_STATUS`.
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
> +         CVE_STATUS[CVE-2020-15523] = "not-applicable-platform: Issue only applies on Windows"
> +
> +      It has format "reason: description" and description is optional.
> +      Reason is mapped to final CVE state by mapping via :term:`CVE_CHECK_STATUSMAP`

Should use "the format" and "the description".
Also "The reason" and "the final  CVE state".

I made the change by myself.

> +
> +   :term:`CVE_STATUS_GROUPS`
> +      If there are many CVEs with the same status and reason, they can by simplified by using this
> +      variable instead of many similar lines with :term:`CVE_STATUS`::
> +
> +         CVE_STATUS_GROUPS = "CVE_STATUS_WIN CVE_STATUS_PATCHED"
> +
> +         CVE_STATUS_WIN = "CVE-1234-0001 CVE-1234-0002"
> +         CVE_STATUS_WIN[status] = "not-applicable-platform: Issue only applies on Windows"
> +         CVE_STATUS_PATCHED = "CVE-1234-0003 CVE-1234-0004"
> +         CVE_STATUS_PATCHED[status] = "fixed-version: Fixed externally"
> +
> +   :term:`CVE_CHECK_STATUSMAP`
> +      Mapping variable for all possible reasons of :term:`CVE_STATUS` to
> +      set of ``Patched``, ``Unpatched`` and ``Ignored``.

I modified to this too:
"Mapping variable for all possible reasons of :term:`CVE_STATUS`:
``Patched``, ``Unpatched`` and ``Ignored``.

> +      See :ref:`ref-classes-cve-check` or ``meta/conf/cve-check-map.conf`` for more details::
> +
> +         CVE_CHECK_STATUSMAP[cpe-incorrect] = "Ignored"
> +
>      :term:`CVE_VERSION`
>         In a recipe, defines the version used to match the recipe version
>         against the version in the `NIST CVE database <https://nvd.nist.gov/>`__


Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
... and merged into master-next.


Many thanks again!
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


