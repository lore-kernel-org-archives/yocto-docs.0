Received: from bsmtp3.bon.at (bsmtp3.bon.at [213.33.87.17])
 by mx.groups.io with SMTP id smtpd.web10.22978.1617031147564265425
 for <docs@lists.yoctoproject.org>;
 Mon, 29 Mar 2021 08:19:08 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.17, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp3.bon.at (Postfix) with ESMTPSA id 4F8GSn0S6gz5tlD;
	Mon, 29 Mar 2021 17:19:04 +0200 (CEST)
Date: Mon, 29 Mar 2021 17:19:03 +0200
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] Fix typos and spacing
Message-ID: <20210329151903.vvooyzogdn3n7gxb@qschulz>
References: <20210329132302.52046-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <20210329132302.52046-1-michael.opdenacker@bootlin.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Michael,

On Mon, Mar 29, 2021 at 03:23:02PM +0200, Michael Opdenacker wrote:
> Fix double words, punctuation spacing issues, spacing issues,
> "its" instead of "it's", and other trivial issues.
> 
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
[...]
> @@ -2111,8 +2111,7 @@ accomplished using fakeroot.
>     under fakeroot. Otherwise, the task cannot run root-only operations,
>     and cannot see the fake file ownership and permissions set by the
>     other task. You need to also add a dependency on
> -   virtual/fakeroot-native:do_populate_sysroot
> -   , giving the following:
> +   virtual/fakeroot-native:do_populate_sysroot, giving the following:
>     ::

This is usually the tell of a bad outcome of the migration tool. I'm
pretty sure what was meant here is:
other task. You need to also add a dependency on
``virtual/fakeroot-native:do_populate_sysroot``, giving the following:

>  
>        fakeroot do_mytask () {
> diff --git a/documentation/overview-manual/yp-intro.rst b/documentation/overview-manual/yp-intro.rst
> index 0ec7e2b96..6a33a5ab7 100644
> --- a/documentation/overview-manual/yp-intro.rst
> +++ b/documentation/overview-manual/yp-intro.rst
> @@ -262,8 +262,7 @@ with the string ``meta-``.
>  .. note::
>  
>     It is not a requirement that a layer name begin with the prefix
> -   meta-
> -   , but it is a commonly accepted standard in the Yocto Project
> +   meta-, but it is a commonly accepted standard in the Yocto Project

Same here, ``meta-``.

Basically, you just encountered the files we haven't manually reviewed
yet :)

Outside of obvious typos, anything with a weird indentation/syntax
usually requires manual inspection. I used to compare with 3.0 docs to
check what was intended and then fix it to match whatever was the state
before.

I would say it's better to leave those indentation/syntax issues as is
and take the time to fix them properly because they are pretty easy to
spot once your brain has picked up the patterns :)

Cheers,
Quentin
