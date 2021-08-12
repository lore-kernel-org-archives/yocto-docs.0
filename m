Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web12.19754.1628758120982651194
 for <docs@lists.yoctoproject.org>;
 Thu, 12 Aug 2021 01:48:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id AF4BE20008;
	Thu, 12 Aug 2021 08:48:38 +0000 (UTC)
Subject: Re: [docs] [PATCH] docs: fix new override syntax migration
To: Quentin Schulz <foss@0leil.net>, docs@lists.yoctoproject.org
References: <20210811200601.12265-1-foss@0leil.net>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <5804b362-3801-28f8-8c95-d9a057ed2d63@bootlin.com>
Date: Thu, 12 Aug 2021 10:48:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210811200601.12265-1-foss@0leil.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Quentin,

Many thanks for these updates.

On 8/11/21 10:06 PM, Quentin Schulz wrote:
> Fix bits missed by the migration script.
>
> Signed-off-by: Quentin Schulz <foss@0leil.net>
> ---
>
> Depends on:
>  - https://lists.openembedded.org/g/openembedded-core/message/154733
>  - https://lists.yoctoproject.org/g/docs/message/1640
>
>  documentation/dev-manual/common-tasks.rst     | 80 +++++++++----------
>  documentation/kernel-dev/advanced.rst         |  2 +-
>  documentation/kernel-dev/common.rst           | 10 +--
>  documentation/kernel-dev/faq.rst              |  2 +-
>  .../migration-guides/migration-3.1.rst        |  2 +-
>  .../migration-guides/migration-3.2.rst        |  6 +-
>  .../migration-guides/migration-3.3.rst        |  2 +-
>  documentation/overview-manual/concepts.rst    |  4 +-
>  documentation/overview-manual/yp-intro.rst    |  2 +-
>  documentation/ref-manual/classes.rst          |  8 +-
>  documentation/ref-manual/qa-checks.rst        | 16 ++--
>  documentation/ref-manual/variables.rst        | 52 ++++++------
>  .../sdk-manual/appendix-customizing.rst       |  6 +-
>  documentation/sdk-manual/extensible.rst       |  2 +-
>  .../test-manual/reproducible-builds.rst       |  2 +-
>  15 files changed, 98 insertions(+), 98 deletions(-)


The changes look good to me. However, I have a doubt about the migration
guides, which I intentionally didn't touch.

You didn't touch the old ones, but what about the newest ones, for 3.1,
3.2, 3.3? While the change makes sense for 3.1 and 3.3 which will be
updated in the next weeks with support for the new syntax, I'm not sure
we will get an update to 3.2, so the migration guide will be
incompatible with that version.

But then, if we skip the changes to 3.2, it may be confusing in
comparison with 3.3.

On the other hand, if people take a migration path, I guess they won't
stop at 3.2, so I guess keeping the changes that you propose are fine.

Any thoughts?

There is one more comment below...

>
>  
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index 847df8ee4..51723d8e0 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
...
>
> @@ -5785,7 +5785,7 @@ system and gives an overview of their function and contents.
>  
>        .. note::
>  
> -         The ``\_forcevariable`` override is not handled specially. This override
> +         The ``\:forcevariable`` override is not handled specially. This override
>           only works because the default value of :term:`OVERRIDES` includes "forcevariable".


This one looks wrong, and you get ``\:forcevariable`` in the output.
I'll put ``:forcevariable`` instead. I can make the change by myself.

Thanks again,

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

