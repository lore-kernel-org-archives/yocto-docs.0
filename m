Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web10.4653.1626877192251072355
 for <docs@lists.yoctoproject.org>;
 Wed, 21 Jul 2021 07:19:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.178.230, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay10.mail.gandi.net (Postfix) with ESMTPSA id 7460E240006;
	Wed, 21 Jul 2021 14:19:49 +0000 (UTC)
Subject: Re: [docs] [PATCH] kickstart: update busybox note regarding PARTUUID
To: Ross Burton <ross@burtonini.com>, docs@lists.yoctoproject.org
References: <20210721125025.3996595-1-ross.burton@arm.com>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <e82b8e4f-d068-b8a5-f201-4b96ac1d9470@bootlin.com>
Date: Wed, 21 Jul 2021 16:19:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210721125025.3996595-1-ross.burton@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Ross,

Thank you for this patch!
See my comments and questions below...

On 7/21/21 2:50 PM, Ross Burton wrote:
> As of oe-core c996cabf the default BusyBox configuration supports
> PARTUUID, so update the note to reflect this.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  documentation/ref-manual/kickstart.rst | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/documentation/ref-manual/kickstart.rst b/documentation/ref-manual/kickstart.rst
> index fc723ccbe..9de3f763d 100644
> --- a/documentation/ref-manual/kickstart.rst
> +++ b/documentation/ref-manual/kickstart.rst
> @@ -54,8 +54,9 @@ must also provide one of the ``--ondrive``, ``--ondisk``, or
>  .. note::
>  
>     The mount program must understand the PARTUUID syntax you use with
> -   ``--use-uuid`` and non-root *mountpoint*, including swap. The BusyBox
> -   versions of these application are currently excluded.
> +   ``--use-uuid`` and non-root *mountpoint*, including swap. The default
> +   configuration of BusyBox in OpenEmbedded support this, but this may
> +   be disabled in custom configurations.

s/support/supports/ ... but I can update this by myself.

Written this way (not your fault, unless you wrote the initial text
too!), this suggests that "mount" has a "--use-uuid" option, but I can't
seem to use it.

Here's what works for me:
mount UUID=675e2a50-fd3b-43b7-aede-6714e2404070 /mnt/mount/

Reading further, I know understand that this corresponds to Wic's
option. Could we say "... you use with Wic's ``--use-uuid`` option for
non-root mountpoints" instead?

I'm proposing "for" instead of "and" here because I first believed the
text was talking about the "mountpoints" BusyBox command run as a
non-root user. I may be a little twisted, but I think that would be less
confusing.

Let me propose my own V2 for this patch, that may be easier to understand...

Cheers,

Michael.


>  
>  Here is an example that uses "/" as the mountpoint. The command uses
>  ``--ondisk`` to force the partition onto the ``sdb`` disk::
>
> 
>
-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

