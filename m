Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web10.3648.1603134509629145110
 for <docs@lists.yoctoproject.org>;
 Mon, 19 Oct 2020 12:08:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpef81d0f814063-cmf81d0f814060.cpe.net.cable.rogers.com ([174.114.57.56]:42598 helo=localhost.localdomain)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1kUaWB-0085Qq-Q3; Mon, 19 Oct 2020 15:08:28 -0400
Date: Mon, 19 Oct 2020 15:08:24 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: Quentin Schulz <foss@0leil.net>
cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] docs: bsp-guide: bsp: fix typos, highlights and links
In-Reply-To: <20201019170833.9991-1-foss@0leil.net>
Message-ID: <alpine.LFD.2.23.451.2010191502360.5122@localhost.localdomain>
References: <20201019170833.9991-1-foss@0leil.net>
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=-1.0
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel8.indieserve.net
X-AntiAbuse: Original Domain - lists.yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel8.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel8.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Content-Type: text/plain; charset=US-ASCII

On Mon, 19 Oct 2020, Quentin Schulz wrote:

> Signed-off-by: Quentin Schulz <foss@0leil.net>
> ---
>  documentation/bsp-guide/bsp.rst | 76 +++++++++++++++++----------------
>  1 file changed, 40 insertions(+), 36 deletions(-)
>
> diff --git a/documentation/bsp-guide/bsp.rst b/documentation/bsp-guide/bsp.rst
> index 34206d159..d0275eea9 100644
> --- a/documentation/bsp-guide/bsp.rst
> +++ b/documentation/bsp-guide/bsp.rst
> @@ -31,14 +31,14 @@ convention: ::
>     meta-bsp_root_name
>
>  The string "meta-" is prepended to the
> -machine or platform name, which is bsp_root_name in the above form.
> +machine or platform name, which is "bsp_root_name" in the above form.
>
>  .. note::
>
>     Because the BSP layer naming convention is well-established, it is
>     advisable to follow it when creating layers. Technically speaking, a
> -   BSP layer name does not need to start with
> -   meta-. However, various scripts and tools in the Yocto Project development
> +   BSP layer name does not need to start with ``meta-``.
> +   However, various scripts and tools in the Yocto Project development
>     environment assume this convention.

  this is sort of ambiguous ... "technically, you don't need to use
the 'meta-' prefix but, if you don't, stuff breaks." kind of a mixed
message.

rday
