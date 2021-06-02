Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web08.13753.1622643053790112218
 for <docs@lists.yoctoproject.org>;
 Wed, 02 Jun 2021 07:10:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 9B4091BF212
	for <docs@lists.yoctoproject.org>; Wed,  2 Jun 2021 14:10:51 +0000 (UTC)
Subject: Re: [docs] [PATCH] docs: ref-manual: migration-3.0: remove reference to non-existing BB_SETSCENE_VERIFY_FUNCTION2
To: docs@lists.yoctoproject.org
References: <20210601193248.10232-1-foss@0leil.net>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <3ffcedad-b109-eafb-1a3c-351b3cddd775@bootlin.com>
Date: Wed, 2 Jun 2021 16:10:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210601193248.10232-1-foss@0leil.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Quentin,

On 6/1/21 9:32 PM, Quentin Schulz wrote:
> This variable has been removed in July 2019 with commit
> 5deaa5df730a "runqueue: Drop unused BB_SETSCENE_VERIFY_FUNCTION2" in
> bitbake git repo.
>
> The glossary entry for the variable has been recently removed from bitbake
> documentation, therefore the ref breaks the build.
>
> Let's remove the reference so that the build still passes.
>
> Signed-off-by: Quentin Schulz <foss@0leil.net>
> ---
>
> This is related to
> https://lists.openembedded.org/g/bitbake-devel/message/12353 patch
>
>  documentation/ref-manual/migration-3.0.rst | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/documentation/ref-manual/migration-3.0.rst b/documentation/ref-manual/migration-3.0.rst
> index f3d20e2ed..a3da85015 100644
> --- a/documentation/ref-manual/migration-3.0.rst
> +++ b/documentation/ref-manual/migration-3.0.rst
> @@ -184,10 +184,9 @@ The following BitBake changes have occurred.
>     exceptions. Remove this argument in any calls to
>     ``bb.build.exec_func()`` in custom classes or scripts.
>  
> --  The
> -   :term:`bitbake:BB_SETSCENE_VERIFY_FUNCTION2`
> -   is no longer used. In the unlikely event that you have any references
> -   to it, they should be removed.
> +-  The ``BB_SETSCENE_VERIFY_FUNCTION2`` variable is no longer used. In
> +   the unlikely event that you have any references to it, they should be
> +   removed.
>  
>  -  The ``RunQueueExecuteScenequeue`` and ``RunQueueExecuteTasks`` events
>     have been removed since setscene tasks are now executed as part of

Thanks for the patch!

Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>

Merged in master-next.
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

