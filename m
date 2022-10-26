Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E753FA373E
	for <webhook@archiver.kernel.org>; Wed, 26 Oct 2022 15:15:14 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web08.8736.1666797308595456228
 for <docs@lists.yoctoproject.org>;
 Wed, 26 Oct 2022 08:15:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=IuYse0ZH;
 spf=pass (domain: bootlin.com, ip: 217.70.178.231, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 399B5100006;
	Wed, 26 Oct 2022 15:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1666797306;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aQkIECloUyH35dw+uoXn17gv+CNPmKnVuNgfg8ZutfY=;
	b=IuYse0ZHIYZDs94gluTTzEunQBFCshovflsVLqW0P5uubMr1FSmOGP7PUUv8okMeOtnwga
	tiYx9Nqv3Q1LlOCBE8BTCj/TW79J+oSsZNdmczgC6pgjJyuZjGYCU7gahmnSf3E7nyDSnC
	/tudavNyVvGpC+VbEv76FF9dWpbVLiNTTjbn8X6AOSLG0QO/pJZqWt9KCi0FLDPag/hdNv
	M8yARFOfnYVX2dzoO68azZ9+19naYRvdDhzwCydQj1lRR0ODZt/cRhIIw3R1DHz+XCmlAj
	YJvrMi882OFozUIFkRhAys4ZWVdcqkDY/cxLJhksAXWfB8jzua4JUR7APEf4eA==
Message-ID: <8cbbaf99-3a67-6625-ae6e-7716a837a8e7@bootlin.com>
Date: Wed, 26 Oct 2022 17:15:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [docs] [PATCH 2/4] classes.rst: improve documentation for
 cve-check.bbclass
Content-Language: en-US
To: Mikko Rapeli <mikko.rapeli@linaro.org>
References: <20221026131207.3655961-1-mikko.rapeli@linaro.org>
 <20221026131207.3655961-3-mikko.rapeli@linaro.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
Cc: docs@lists.yoctoproject.org
In-Reply-To: <20221026131207.3655961-3-mikko.rapeli@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 26 Oct 2022 15:15:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3414

On 10/26/22 15:12, Mikko Rapeli wrote:
> From: Mikko Rapeli <mikko.rapeli@linaro.org>
>
> It is a quite important tools for maintaining yocto based products
> so documentation should include the best practices.
>
> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> ---
>   documentation/ref-manual/classes.rst | 52 ++++++++++++++++++++++++++--
>   1 file changed, 50 insertions(+), 2 deletions(-)
>
> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
> index 1880e44486..cee4fcf555 100644
> --- a/documentation/ref-manual/classes.rst
> +++ b/documentation/ref-manual/classes.rst
> @@ -412,13 +412,61 @@ discussion on these cross-compilation tools.
>   =====================
>   
>   The :ref:`cve-check <ref-classes-cve-check>` class looks for known CVEs (Common Vulnerabilities
> -and Exposures) while building an image. This class is meant to be
> +and Exposures) while building with BitBake. This class is meant to be
>   inherited globally from a configuration file::
>   
>      INHERIT += "cve-check"
>   
> +To filter out obsolete CVE database entries which are known not to impact SW from Poky and OE-Core,

I replaced "SW" by "software" everywhere in this patchset.

> +add following line to the build configuration file::
> +
> +   include cve-extra-exclusions.inc
> +
>   You can also look for vulnerabilities in specific packages by passing
> -``-c cve_check`` to BitBake. You will find details in the
> +``-c cve_check`` to BitBake.
> +
> +After buildin the SW with Bitbake, CVE check output reports are available in ``tmp/deploy/cve``

s/buildin/building/

Fixed.

> +and image specific summaries in ``tmp/deploy/images/*.cve`` or ``tmp/deploy/images/*.json`` files.
> +
> +When building, the CVE checker will emit build time warnings for any detected
> +issues which are in the state ``Unpatched``, meaning that CVE issue seems to affect the SW component
> +and version being compiled and no patches to address the issue are applied. Other states
> +for detected CVE issues are: ``Patched`` meaning that a patch to address the issue is already
> +applied, and ``Ignored`` meaning that the issue can be ignored.
> +
> +The ``Patched`` state of a CVE issue is detected from patch files with the format
> +``CVE-ID.patch``, e.g. ``CVE-2019-20633.patch``, in the :term:`SRC_URI` and using
> +CVE metadata of format ``CVE: CVE-ID`` in the commit message of the patch file.
> +
> +If recipe lists the ``CVE-ID`` in :term:`CVE_CHECK_IGNORE` variable, then the CVE state is reported

s/recipe/the recipe/
Fixed.

> +as ``Ignored``. Multiple CVEs can be listed separated by spaces. Example::
> +
> +   CVE_CHECK_IGNORE += "CVE-2020-29509 CVE-2020-29511"
> +
> +If CVE check report for a recipe contains false positives or false negatives, these may be

s/report for/reports that/
Fixed.

> +fixed in recipes by adjusting the CVE product name using :term:`CVE_PRODUCT` and :term:`CVE_VERSION` variables.
> +:term:`CVE_PRODUCT` defaults to the plain recipe name :term:`BPN` which can be adjusted to one or more CVE
> +database vendor and product pairs using syntax::

s/syntax/the syntax/

> +
> +   CVE_PRODUCT = "flex_project:flex"
> +
> +where ``flex_project`` is the CVE database vendor name and ``flex`` is the product name. Similarly
> +if the default recipe version :term:`PV` does not match the version numbers of the SW component
> +in upstream releases or the CVE database, then the :term:`CVE_VERSION` variable can be used to set the
> +CVE database compatible version number, for example::
> +
> +   CVE_VERSION = "2.39"
> +
> +Any bugs or missing or incomplete information in the CVE database entries should be fixed in the CVE database
> +via `NVD feedback form <https://nvd.nist.gov/info/contact-form>`__.


s/via/via the/
Fixed

> +
> +Users should note that security is a process, not a product, and thus also CVE checking, analyzing results,
> +patching and updating the SW should be done as a regular process. The data and assumptions
> +required for CVE checker to reliably detect issues are frequently broken in various ways.
> +These can only be detected by reviewing the details of the issues and iterating over the generated reports,
> +and following what happens in other Linux distributions and the greater open source community.


s/the greater/in the greater/ (sounds a little better)
Fixed

Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Thanks again
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


