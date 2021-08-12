Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web09.20068.1628762115187456294
 for <docs@lists.yoctoproject.org>;
 Thu, 12 Aug 2021 02:55:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id E8D72E0005;
	Thu, 12 Aug 2021 09:55:12 +0000 (UTC)
Subject: Re: [docs] [PATCH] docs: overview-manual: concepts: remove long-gone BBHASHDEPS variable
To: Quentin Schulz <foss@0leil.net>, docs@lists.yoctoproject.org
References: <20210811201310.12996-1-foss@0leil.net>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <ea66797f-fdc2-a7a8-0919-42a4fb836f94@bootlin.com>
Date: Thu, 12 Aug 2021 11:55:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210811201310.12996-1-foss@0leil.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Quentin,

On 8/11/21 10:13 PM, Quentin Schulz wrote:
> BBHASHDEPS was removed from bitbake in April 2014, with the following
> commit:
> 92526eadd09d "bitbake-worker: Drop BBHASH variables"
>
> so let's remove mentions from the docs.
>
> Signed-off-by: Quentin Schulz <foss@0leil.net>
> ---
>  documentation/overview-manual/concepts.rst | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
> index 4f8e6cb04..8667ef6da 100644
> --- a/documentation/overview-manual/concepts.rst
> +++ b/documentation/overview-manual/concepts.rst
> @@ -1774,9 +1774,6 @@ the build. This information includes:
>  -  ``BB_BASEHASH_``\ filename\ ``:``\ taskname: The base hashes for each
>     dependent task.
>  
> --  ``BBHASHDEPS_``\ filename\ ``:``\ taskname: The task dependencies for
> -   each task.
> -
>  -  :term:`BB_TASKHASH`: The hash of the currently running task.
>  
>  Shared State

Thanks for the patch!
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>

Merged into "master-next".

Michael

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

