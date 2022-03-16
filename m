Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51D94C433EF
	for <webhook@archiver.kernel.org>; Wed, 16 Mar 2022 20:48:56 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.2102.1647463731005577252
 for <docs@lists.yoctoproject.org>;
 Wed, 16 Mar 2022 13:48:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=HqPiWeiG;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id F1BC140009;
	Wed, 16 Mar 2022 20:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1647463728;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QpbIzZG6zMNFwPTVsrpir1vENyW0SlrzMJrc4+inEeA=;
	b=HqPiWeiGmVDoCo3zbADtoy4x9yY9F9x/4wrG0Enlfuyqz/f+OTk54wnA/2bdfWR5HujOMn
	7+JeQvIh49YqesBDi4MtqmNERShFOHPQKAQBVStC/g9mrKK4UerH1ZJdCBxUEOHg2zn4tq
	Yt9zwPeBTG6ht5rIOxcHpyE2zKa7u82wCvSccR+PtwUZUdt/p6WJSlWj+4E0LfJxjKx1Jm
	JjZg+k5TFNFIgYepspPHfnSUYNc3jDqzUGSR654nKpYsi9PUQMwk4m4HZJKXgGiNYEhG+1
	0GSvnz8kEVMxfaEh22PJjA7GZbFUUuLnzHOF3tkKfg17FVHh+GsohFlUAg3SMA==
Message-ID: <09f89f08-b6f5-2217-29e1-447cd5e1a8b0@bootlin.com>
Date: Wed, 16 Mar 2022 21:48:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] classes: update Python class documentation
Content-Language: en-US
To: Ross Burton <ross@burtonini.com>
References: <20220316183305.885500-1-ross.burton@arm.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20220316183305.885500-1-ross.burton@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 16 Mar 2022 20:48:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2615

Hi Ross,

Thanks for the patch!

On 3/16/22 19:33, Ross Burton wrote:
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  documentation/ref-manual/classes.rst | 61 ++++++++++++++++------------
>  1 file changed, 36 insertions(+), 25 deletions(-)
>
> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
> index 4dd0901623..60fcd98928 100644
> --- a/documentation/ref-manual/classes.rst
> +++ b/documentation/ref-manual/classes.rst
> @@ -602,22 +602,6 @@ variables are not met, the recipe will be skipped, and if the
>  build system attempts to build the recipe then an error will be
>  triggered.
>  
> -.. _ref-classes-flit_core:
> -
> -``flit_core.bbclass``
> -=====================
> -
> -The ``flit_core`` class enables building Python modules which declare
> -the  `PEP-517 <https://www.python.org/dev/peps/pep-0517/>`__ compliant
> -``flit_core.buildapi`` ``build-backend`` in the ``[build-system]``
> -section of ``pyproject.toml`` (See `PEP-518 <https://www.python.org/dev/peps/pep-0518/>`__).
> -
> -Python modules built with ``flit_core.buildapi`` are pure Python (no
> -``C`` or ``Rust`` extensions).
> -
> -The resulting ``wheel`` (See `PEP-427 <https://www.python.org/dev/peps/pep-0427/>`__)
> -is installed with the :ref:`python_pep517 <ref-classes-python_pep517>` class.
> -
>  .. _ref-classes-fontcache:
>  
>  ``fontcache.bbclass``
> @@ -1978,20 +1962,48 @@ When inherited by a recipe, the ``perlnative`` class supports using the
>  native version of Perl built by the build system rather than using the
>  version provided by the build host.
>  
> +.. _ref-classes-python_flit_core:
> +
> +``python_flit_core.bbclass``
> +=====================
> +
> +The ``python_flit_core`` class enables building Python modules which declare
> +the  `PEP-517 <https://www.python.org/dev/peps/pep-0517/>`__ compliant
> +``flit_core.buildapi`` ``build-backend`` in the ``[build-system]``
> +section of ``pyproject.toml`` (See `PEP-518 <https://www.python.org/dev/peps/pep-0518/>`__).
> +
> +Python modules built with ``flit_core.buildapi`` are pure Python (no
> +``C`` or ``Rust`` extensions).
> +
> +Internally this uses the :ref:`python_pep517 <ref-classes-python_pep517>` class.
> +
>  .. _ref-classes-python_pep517:
>  
>  ``python_pep517.bbclass``
>  =============================
>  
> -The ``python_pep517`` class installs a Python ``wheel`` binary archive (see
> -`PEP-517 <https://peps.python.org/pep-0517/>`__).
> +The ``python_pep517`` class builds and installs a Python ``wheel`` binary
> +archive (see `PEP-517 <https://peps.python.org/pep-0517/>`__).
> +
> +Recipes wouldn't inherit this directly, instead typically another class will
> +inherit this, add the relevant native dependencies, and set
> +:term:`PEP517_BUILD_API` to the Python class which implements the PEP-517 build
> +API.
> +
> +Examples of classes which do this are :ref:`python_flit_core
> +<ref-classes-python_flit_core>`, :ref:`setuptools_build_meta
> +<ref-classes-setuptools_build_meta>`, and :ref:`python_poetry_core
> +<ref-classes-python_poetry_core>`.
> +
> +.. _ref-classes-python_poetry_core:
> +
> +``python_poetry_core.bbclass``
> +=====================
>  
> -The Python ``wheel`` can be built with several classes, including :ref:`flit_core <ref-classes-flit_core>`,
> -:ref:`setuptools_build_meta <ref-classes-setuptools_build_meta>`, and :ref:`setuptools3 <ref-classes-setuptools3>`.
> +The ``python_poetry_core`` class enables building Python modules which use the
> +`Poetry Core <https://python-poetry.org>`__ build system.
>  
> -The path to the wheel to be installed is defined by :term:`PEP517_WHEEL_PATH`.
> -This defaults to ``${D}/dist`` and should be respected by the builder class
> -(such as :ref:`flit_core <ref-classes-flit_core>`).
> +Internally this uses the :ref:`python_pep517 <ref-classes-python_pep517>` class.
>  
>  .. _ref-classes-pixbufcache:
>  
> @@ -2362,8 +2374,7 @@ section of ``pyproject.toml`` (See `PEP-518 <https://www.python.org/dev/peps/pep
>  Python modules built with ``setuptools.build_meta`` can be pure Python or
>  include ``C`` or ``Rust`` extensions).
>  
> -The resulting ``wheel`` (See `PEP-427 <https://www.python.org/dev/peps/pep-0427/>`__)
> -is installed with the :ref:`python_pep517 <ref-classes-python_pep517>` class.
> +Internally this uses the :ref:`python_pep517 <ref-classes-python_pep517>` class.
>  
>  .. _ref-classes-setuptools3:


The contents look good, but I've got issues at compile time (using
Sphinx 4.4):

/home/mike/work/git/git.yoctoproject.org/yocto-docs/documentation/ref-manual/classes.rst:1968:
WARNING: Title underline too short.

``python_flit_core.bbclass``
=====================
/home/mike/work/git/git.yoctoproject.org/yocto-docs/documentation/ref-manual/classes.rst:1968:
WARNING: Title underline too short.

``python_flit_core.bbclass``
=====================
/home/mike/work/git/git.yoctoproject.org/yocto-docs/documentation/ref-manual/classes.rst:2001:
WARNING: Title underline too short.

``python_poetry_core.bbclass``
=====================
/home/mike/work/git/git.yoctoproject.org/yocto-docs/documentation/ref-manual/classes.rst:2001:
WARNING: Title underline too short.

``python_poetry_core.bbclass``
=====================
looking for now-outdated files... none found
pickling environment... done
checking consistency... done
preparing documents... done
/home/mike/work/git/git.yoctoproject.org/yocto-docs/documentation/ref-manual/classes.rst:1988:
WARNING: term not in glossary: PEP517_BUILD_API

Could you add a description for PEP517_BUILD_API?
Thanks again
Michael.


-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


