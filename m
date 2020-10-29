Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.5441.1604012189625442923
 for <docs@lists.yoctoproject.org>;
 Thu, 29 Oct 2020 15:56:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.183.196, mailfrom: foss@0leil.net)
Received: from webmail.gandi.net (webmail14.sd4.0x35.net [10.200.201.14])
	(Authenticated sender: foss@0leil.net)
	by relay4-d.mail.gandi.net (Postfix) with ESMTPA id 3DACAE0002;
	Thu, 29 Oct 2020 22:56:26 +0000 (UTC)
MIME-Version: 1.0
Date: Thu, 29 Oct 2020 23:56:26 +0100
From: "Quentin Schulz" <foss@0leil.net>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] normalize use of trailing "::" across docs
In-Reply-To: <afdb4476-bdb4-3df0-be7-457ebd473db0@crashcourse.ca>
References: <afdb4476-bdb4-3df0-be7-457ebd473db0@crashcourse.ca>
Message-ID: <c550db4b55fbc2b77d0a96d87ab5edf1@0leil.net>
X-Sender: foss@0leil.net
User-Agent: Roundcube Webmail/1.3.15
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

Hi Robert,

On 2020-10-29 23:00, Robert P. J. Day wrote:
> Rather than terminate a line with a single ":" and follow that up with
> a line of simply "::" to start a code block, we can simply terminate

I think it's actually called a literal block? (was looking for 
documentation on this :) ).
https://www.sphinx-doc.org/en/master/usage/restructuredtext/basics.html#literal-blocks

> the text line with "::" which has the same effect. While we're there,
> we can change a few terminating "." to "::" just for aesthetics.
> 
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> 
> ---
> 
>   this appears to build, but some confirmation would be nice.
> 

The easiest way would be to build without and with your patch and the 
HTML shouldn't change.

> diff --git a/documentation/dev-manual/dev-manual-common-tasks.rst
> b/documentation/dev-manual/dev-manual-common-tasks.rst
> index 0630040e6..ede7b494c 100644
> --- a/documentation/dev-manual/dev-manual-common-tasks.rst
> +++ b/documentation/dev-manual/dev-manual-common-tasks.rst
[...]
> @@ -4207,10 +4149,9 @@ happens, which changes the way you build them.
> You can also modify the
>  filesystem itself or select a different filesystem.
> 
>  First, find out what is hogging your root filesystem by running the
> -``dirsize.py`` script from your root directory:
> -::
> +``dirsize.py`` script from your root directory::
> 
> -   $ cd root-directory-of-image
> +   $ cd root-directory-of-image:

Unwanted change here.

[...]
> @@ -11669,8 +11473,8 @@ Wayland with Kernel Mode Setting
>  (`KMS <https://wiki.archlinux.org/index.php/Kernel_Mode_Setting>`__)
>  support, include the "wayland" flag in the
>  :term:`DISTRO_FEATURES`
> -statement in your ``local.conf`` file:
> -::
> +s:tatement in your ``local.conf`` file:
> +

s/s:tatement/statement/

+ missing : at the end

+ no need for additional newline.

> 
>     DISTRO_FEATURES_append = " wayland"
> 
> @@ -11687,8 +11491,8 @@ Installing Wayland and Weston
>  To install the Wayland feature into an image, you must include the
>  following
>  :term:`CORE_IMAGE_EXTRA_INSTALL`
> -statement in your ``local.conf`` file:
> -::
> +s:tatement in your ``local.conf`` file:
> +

s/s:tatement/statement/

+ missing : at the end

+ no need for additional newline.

Moreover, I think we sometime have literal blocks inside of notes (so 
the double colon does not start a line, it has some spaces before it for 
indentation purposes). We should probably tackle those as well?

Thanks,
Quentin
