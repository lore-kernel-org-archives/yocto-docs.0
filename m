Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57B0CC433EF
	for <webhook@archiver.kernel.org>; Tue,  1 Mar 2022 09:40:28 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.6355.1646127627316563801
 for <docs@lists.yoctoproject.org>;
 Tue, 01 Mar 2022 01:40:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=MDBgywQM;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 9B8CD1C000B;
	Tue,  1 Mar 2022 09:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1646127625;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BUwOoSytR4IuXHFQKuSsya7VCvnZF4TQe2ORW0jpYMY=;
	b=MDBgywQMnO1Ly1/5wYSxapXvSykuN4SwBTJdRNy0f2jJUdCQF4HKNzZHHxBH+iikyBj7a6
	PPCFneALs1HpO6Bwh9YOZvq0GbcmbscIowpsSl78lucAih/S6WT96SU6ZvkS/C/41UmEXc
	vQXWQzpi98sOp/5ujXiF+aH7L53FCcLBJ1cpdwpUwt6wL/aEVLKcPLHCBBaO2SCokJN1Kh
	hZWSxuPvY+WHanZl6U4DSWEy3cJ3Owe22+jVdw3oLA6eMxO29sv+EnNUUG3XiiW3qXsPY3
	jOd5fFIp6Etxv8tftGlZ9n+u5l+jdX+ZD0av1sf4+3Vpa5/ccaIN1wwKm1DkYw==
Message-ID: <c8c39d36-ee90-2643-b5d1-d70b9dd75d02@bootlin.com>
Date: Tue, 1 Mar 2022 10:40:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: Re: [docs] [PATCH v2] docs: update setuptools3 class
Content-Language: en-US
To: Tim Orling <ticotimo@gmail.com>, docs@lists.yoctoproject.org
References: <20220228040405.1135905-1-tim.orling@konsulko.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20220228040405.1135905-1-tim.orling@konsulko.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 01 Mar 2022 09:40:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2514

Hi Tim

Thanks for the patch!

On 2/28/22 05:04, Tim Orling wrote:
> Add notes to inform about the new `wheel` behavior of the
> setuptools3.bbclass.
>
> Signed-off-by: Tim Orling <tim.orling@konsulko.com>
> ---
> Change in v2:
>   - improve formatting of notes
>
>  documentation/ref-manual/classes.rst | 22 ++++++++++++++++++++--
>  1 file changed, 20 insertions(+), 2 deletions(-)
>
> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
> index 2338ef6b3..5e4bacc13 100644
> --- a/documentation/ref-manual/classes.rst
> +++ b/documentation/ref-manual/classes.rst
> @@ -2439,8 +2439,26 @@ is installed with the :ref:`pip_install_wheel <ref-classes-pip_install_wheel>` c
>  =======================
>  
>  The ``setuptools3`` class supports Python version 3.x extensions that
> -use build systems based on ``setuptools``. If your recipe uses these
> -build systems, the recipe needs to inherit the ``setuptools3`` class.
> +use build systems based on ``setuptools`` (e.g. only have a ``setup.py`` and
> +have not migrated to the official ``pyproject.toml`` format). If your recipe
> +uses these build systems, the recipe needs to inherit the ``setuptools3`` class.
> +
> +   .. note::
> +
> +      The ``setuptools3`` class ``do_compile()`` task now calls
> +      ``setup.py bdist_wheel`` to build the ``wheel`` binary archive format
> +      (See `PEP-427 <https://www.python.org/dev/peps/pep-0427/>`__).
> +
> +      A consequence of this is that legacy software still using deprecated
> +      ``distutils`` from the Python standard library cannot be packaged as
> +      ``wheels``. A common solution is the replace
> +      ``from distutils.core import setup`` with ``from setuptools import setup``.
> +
> +   .. note::
> +
> +     The ``setuptools3`` class ``do_install()`` task now calls ``pip install``
> +     to install the ``wheel`` binary archive. In current versions of
> +     ``setuptools`` the legacy ``setup.py install`` method is deprecated.
>  
>  .. _ref-classes-setuptools3-base:


Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
... and queued into master-next.

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


