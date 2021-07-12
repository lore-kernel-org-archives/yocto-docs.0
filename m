Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web08.8982.1626085709467089420
 for <docs@lists.yoctoproject.org>;
 Mon, 12 Jul 2021 03:28:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 9DE5B20009;
	Mon, 12 Jul 2021 10:28:27 +0000 (UTC)
Subject: Re: [docs][PATCH] ref-manual: Document BUILDHISTORY_PATH_PREFIX_STRIP
To: Joshua Watt <JPEWhacker@gmail.com>, docs@lists.yoctoproject.org
References: <20210709132224.35196-1-JPEWhacker@gmail.com>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <7b69fe95-4a68-4092-37ed-fb25125f9f91@bootlin.com>
Date: Mon, 12 Jul 2021 12:28:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210709132224.35196-1-JPEWhacker@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Joshua,

Many thanks for this addition to the reference manual!

On 7/9/21 3:22 PM, Joshua Watt wrote:
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  documentation/ref-manual/variables.rst | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index 71c2e11d9..f78b3beec 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -1021,6 +1021,20 @@ system and gives an overview of their function and contents.
>  
>           BUILDHISTORY_IMAGE_FILES ?= "/etc/passwd /etc/group"
>  
> +   :term:`BUILDHISTORY_PATH_PREFIX_STRIP`
> +      When inheriting the :ref:`buildhistory <ref-classes-buildhistory>`
> +      class, this variable specifies a common path prefix that should be
> +      stripped off the beginning of paths in the task signature list when the
> +      ``task`` feature is active in :term:`BUILDHISTORY_FEATURES`. This can be
> +      useful when build history is populated from multiple sources that may not
> +      all use the same top level directory.
> +
> +      By default, the ``buildhistory`` class sets the variable as follows::
> +
> +         BUILDHISTORY_PATH_PREFIX_STRIP ?= ""
> +
> +      and no prefixes will be stripped.
> +
>     :term:`BUILDHISTORY_PUSH_REPO`
>        When inheriting the :ref:`buildhistory <ref-classes-buildhistory>`
>        class, this variable optionally specifies a remote repository to


Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
I just modified the last line to be a full sentence. Otherwise, it was
looking a bit strange in my opinion.

Merged into master-next. Thanks again!
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

