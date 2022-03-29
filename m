Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDBC0C433EF
	for <webhook@archiver.kernel.org>; Tue, 29 Mar 2022 21:05:22 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web12.2229.1648587921306580291
 for <docs@lists.yoctoproject.org>;
 Tue, 29 Mar 2022 14:05:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=WCAr+ho2;
 spf=pass (domain: bootlin.com, ip: 217.70.178.230,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 7D04D240006
	for <docs@lists.yoctoproject.org>; Tue, 29 Mar 2022 21:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1648587919;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=njc7ylWD+yr4yQTI8gV9sfeD/mSRZvntbg8tDBM9iA0=;
	b=WCAr+ho2ZwqELpYKD1kXpmZlO/fxQtPIcfRR9Or0cxgGnUFQJfF+5gRBNn9eJu6Qx+YSLz
	wx2/nJJtr8+O5D5hY5tMe9PusKK67pI9GDS4eNAy3YhW2PHKl7Xuuzb0bGUS1dnDSwjE1F
	5EdcFnlxXR0wrO/V5N8WrKjiUQzLmyYdo1dFozcbAe0OyCS0l3zBrRflwuH74SrgPAAKTE
	vK9a/tOe62qv9d2246DZfcG9g6TqL5f90xhsoshWC3utIu9bMgbDUHweLfvozXxIBRFi7x
	LpZwQSKdbRKwM1yicmBpQCsTFT1bLU37wr0U7ZR8b9evO/EqksBLYDEqnG7kUw==
Message-ID: <c7ea8c0b-7891-dd08-6e3b-4c0c4cb24a5c@bootlin.com>
Date: Tue, 29 Mar 2022 23:05:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [docs] [PATCH] migration-guides: preliminary description for 3.5
Content-Language: en-US
To: docs@lists.yoctoproject.org
References: <16E0F5A48386ECD1.16938@lists.yoctoproject.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <16E0F5A48386ECD1.16938@lists.yoctoproject.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 29 Mar 2022 21:05:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2736

Greetings,

The changes below are quick descriptions. Your careful reviews will be
useful to double check, correct and complete the content!

On 3/29/22 22:59, Michael Opdenacker via lists.yoctoproject.org wrote:
> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
>
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ---
>  .../migration-guides/migration-3.5.rst        | 54 ++++++++++++++++++-
>  1 file changed, 53 insertions(+), 1 deletion(-)
>
> diff --git a/documentation/migration-guides/migration-3.5.rst b/documentation/migration-guides/migration-3.5.rst
> index 8ce2306e42..269e0fab2f 100644
> --- a/documentation/migration-guides/migration-3.5.rst
> +++ b/documentation/migration-guides/migration-3.5.rst
> @@ -64,10 +64,17 @@ Recipe changes
>  - :ref:`allarch <ref-classes-allarch>` packagegroups can no longer depend on packages
>    which use :term:`PKG` renaming such as :ref:`ref-classes-debian`.
>  
> +- :term:`LICENSE` definitions now have to use `SPDX identifiers <https://spdx.org/licenses/>`__.
> +  A :oe_git:`convert-spdx-licenses.py </openembedded-core/tree/scripts/contrib/convert-spdx-licenses.py>`
> +  script can be used to update your recipes.
> +
> +- :term:`SRC_URI`: a new :ref:`bitbake:bitbake-user-manual/bitbake-user-manual-fetching:crate fetcher (\`\`crate://\`\`)`
> +  is available for Rust packages.


This part may be part of the release notes instead (?)

> +
>  Class changes
>  -------------
>  
> -- The `distutils*.bbclasses` have been moved to `meta-python`. The classes and
> +- The ``distutils*.bbclasses`` have been moved to ``meta-python``. The classes and
>    `DISTUTILS*` variables have been removed from the documentation.
>  
>  - ``blacklist.bbclass`` is removed and the functionality moved to the
> @@ -76,3 +83,48 @@ Class changes
>    function. The usage will remain the same::
>  
>       SKIP_RECIPE[my-recipe] = "Reason for skipping recipe"
> +
> +- The Python package build process based on `wheels <https://pythonwheels.com/>`__.
> +  Here are the new Python packaging classes that should be used:
> +  :ref:`python-flit_core <ref-classes-python_flit_core>`,
> +  :ref:`setuptools_python-build_meta <ref-classes-python_setuptools_build_meta>`
> +  and :ref:`python_poetry_core <ref-classes-python_poetry_core>`.


Here, this was a very quick description based on existing classes. For
sure, this need improving, and probably correcting.

> +
> +- ``image-prelink.bbclass`` class is removed.
> +
> +- New :ref:`overlayfs <ref-classes-overlayfs>` and
> +  :ref:`overlayfs-etc <ref-classes-overlayfs-etc>` classes are available
> +  to make it easier to overlay read-only filesystems (for example)
> +  with `OverlayFS <https://en.wikipedia.org/wiki/OverlayFS>`__.
> +
> +Configuration changes
> +---------------------
> +
> +- The Yocto Project now allows to reuse Shared State from its autobuilder.
> +  If the network connection between our server and your machine is faster
> +  than you would build recipes, you can try to speed up your builds
> +  by using such Share State and Hash Equivalence by setting::
> +
> +     BB_SIGNATURE_HANDLER = "OEEquivHash"
> +     BB_HASHSERVE = "auto"
> +     BB_HASHSERVE_UPSTREAM = "typhoon.yocto.io:8687"
> +     SSTATE_MIRRORS ?= "file://.* https://sstate.yoctoproject.org/&YOCTO_DOC_VERSION;/PATH;downloadfilename=PATH"
> +
> +Supported host distribution changes
> +-----------------------------------
> +
> +- New support for `AlmaLinux <https://en.wikipedia.org/wiki/AlmaLinux>`__
> +  hosts replacing `CentOS <https://en.wikipedia.org/wiki/CentOS>`__.
> +  The following distribution versions were dropped: CentOS 8, Ubuntu 16.04 and Fedora 30, 31 and 32.


Not sure this should be in migration notes.

> +
> +Changes for release notes
> +-------------------------
> +
> +- Share State cache: now using `ZStandard (zstd) <https://en.wikipedia.org/wiki/Zstd>`__
> +  instead of Gzip compression, for better performance.
> +
> +- BitBake has an improved ``setscene`` task display.
> +
> +- This release fixes the reproducibility issues with ``rust-llvm`` and ``golang``.
> +  Recipes in OpenEmbedded-Core are now fully reproducible.


Same here. These should probably go in release notes. Don't hesitate to
propose to remove them after they made it to the release notes.

How are the release notes drafted by the way? I'm talking about the "New
features / Enhancements" part. Is there a public review?

Thanks in advance for your help. I can take raw comments and take care
of updating the .rst document accordingly.
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


