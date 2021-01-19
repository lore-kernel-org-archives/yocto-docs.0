Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web11.13115.1611072050798743502
 for <docs@lists.yoctoproject.org>;
 Tue, 19 Jan 2021 08:00:51 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.100.179]:50758 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1l1tR3-0003Zh-1t; Tue, 19 Jan 2021 11:00:49 -0500
Date: Tue, 19 Jan 2021 11:00:47 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Joshua Watt <jpewhacker@gmail.com>
cc: docs@lists.yoctoproject.org, quentin.schulz@streamunlimited.com, 
    richard.purdie@linuxfoundation.org
Subject: Re: [docs][PATCH] ref-manual: Clarify recommended operator for PROVIDES
In-Reply-To: <20210119155751.11243-1-JPEWhacker@gmail.com>
Message-ID: <85c36be-a53-2c84-f35b-4b1a80c9bd67@crashcourse.ca>
References: <20210119155751.11243-1-JPEWhacker@gmail.com>
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

On Tue, 19 Jan 2021, Joshua Watt wrote:

> Updates the documentation for PROVIDES so that it recommends "+="
> instead of "=".
>
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  documentation/ref-manual/variables.rst | 16 +++++-----------
>  1 file changed, 5 insertions(+), 11 deletions(-)
>
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index 4ce264813..2ea0cc36c 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -5915,23 +5915,17 @@ system and gives an overview of their function and contents.
>        file ``eudev_3.2.9.bb``:
>        ::
>
> -         PROVIDES = "udev"
> +         PROVIDES += "udev"
>
>        The ``PROVIDES`` statement
>        results in the "eudev" recipe also being available as simply "udev".
>
>        .. note::
>
> -         Given that a recipe's own recipe name is already implicitly in its
> -         own PROVIDES list, it is unnecessary to add aliases with the "+=" operator;
> -         using a simple assignment will be sufficient. In other words,
> -         while you could write:
> -         ::
> -
> -                 PROVIDES += "udev"
> -
> -
> -         in the above, the "+=" is overkill and unnecessary.
> +         A recipe's own recipe name (:term:`${PN}`) is always implicitly
> +         included in the recipe aliases, so while using "+=" in the above
> +         example may not be strictly necessary it is recommend to avoid
                                                        recommended

rday
