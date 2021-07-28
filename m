Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web10.6589.1627486909850983119
 for <docs@lists.yoctoproject.org>;
 Wed, 28 Jul 2021 08:41:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.178.230, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay10.mail.gandi.net (Postfix) with ESMTPSA id 98A7E240005;
	Wed, 28 Jul 2021 15:41:47 +0000 (UTC)
Cc: foss@0leil.net, 972931182@qq.com
Subject: Re: [docs] [PATCH] dev-manual: fix wrong file
To: Mingrui Ren <jiladahe1997@gmail.com>, docs@lists.yoctoproject.org
References: <45f034b6-c943-de00-86a7-dfce48cbffa9@gmail.com>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <40389349-3aab-cd16-3fe1-69b770358c54@bootlin.com>
Date: Wed, 28 Jul 2021 17:41:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <45f034b6-c943-de00-86a7-dfce48cbffa9@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Greetings,

Apologies for the late reply!

On 6/21/21 4:33 PM, Mingrui Ren wrote:
> From 43e67b6c7c5e29d608b5459c6041b195ac94e4cc Mon Sep 17 00:00:00 2001
> From: Mingrui Ren <jiladahe1997@gmail.com>
> Date: Mon, 21 Jun 2021 21:38:45 +0800
> Subject: [PATCH] dev-manual: fix wrong file
>
> The file 'meta/classes/core-image.bbclass' seems have nothing about
> 'IMAGE_FEATURES' variable, maybe it should be
> 'meta/classes/image.bbclass'.
>
> Signed-off-by: Mingrui Ren <jiladahe1997@gmail.com>
> ---
>  documentation/dev-manual/common-tasks.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/documentation/dev-manual/common-tasks.rst
> b/documentation/dev-manual/common-tasks.rst
> index 762636a17c..9ff33a4ce8 100644
> --- a/documentation/dev-manual/common-tasks.rst
> +++ b/documentation/dev-manual/common-tasks.rst
> @@ -872,7 +872,7 @@ a recipe and using :term:`EXTRA_IMAGE_FEATURES`
> from within your
>  :term:`Build Directory`.
>
>  To understand how these features work, the best reference is
> -``meta/classes/core-image.bbclass``. This class lists out the available
> +``meta/classes/image.bbclass``. This class lists out the available
>  :term:`IMAGE_FEATURES` of which most map to package groups while
> some, such
>  as ``debug-tweaks`` and ``read-only-rootfs``, resolve as general
>  configuration settings.

Thanks for reporting this. I agree with your proposal.

I couldn't apply the patch with "git am", but I recreated it manually.
It's now in the "master-next"  branch of "yocto-docs" and should be in
"master" (in the public documentation) in the next days.

Thanks again!
Cheers,
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

