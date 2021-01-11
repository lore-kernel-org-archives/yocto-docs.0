Received: from bsmtp.bon.at (bsmtp.bon.at [213.33.87.14])
 by mx.groups.io with SMTP id smtpd.web09.33278.1610367118455569273
 for <docs@lists.yoctoproject.org>;
 Mon, 11 Jan 2021 04:11:59 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.14, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp.bon.at (Postfix) with ESMTPSA id 4DDsyN3xBZz5tlQ;
	Mon, 11 Jan 2021 13:11:56 +0100 (CET)
Date: Mon, 11 Jan 2021 13:11:55 +0100
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Quentin Schulz <foss@0leil.net>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] documentation: sphinx-static: switchers.js: add release name in dropdown menu
Message-ID: <20210111121155.zgrmq3bh6roynjhv@qschulz>
References: <20210111120938.20633-1-foss@0leil.net>
MIME-Version: 1.0
In-Reply-To: <20210111120938.20633-1-foss@0leil.net>
User-Agent: NeoMutt/20180716
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Couldn't test properly on a local server so might want to keep an eye on
it.

As usual, css or js files changes aren't picked up by sphinx so you need
to rebuild from scratch.

When/If it gets approved, let me know so I can send backport patches.

Cheers,
Quentin

On Mon, Jan 11, 2021 at 01:09:38PM +0100, Quentin Schulz wrote:
> Up until now, only the version of a Yocto release was printed, which
> isn't very user-friendly.
> 
> Add the release name too so that it's obvious to users which release of
> Yocto the currently open docs are applying to.
> 
> Signed-off-by: Quentin Schulz <foss@0leil.net>
> ---
>  documentation/sphinx-static/switchers.js | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/documentation/sphinx-static/switchers.js b/documentation/sphinx-static/switchers.js
> index 754de2e6a..fd4dd607d 100644
> --- a/documentation/sphinx-static/switchers.js
> +++ b/documentation/sphinx-static/switchers.js
> @@ -3,10 +3,10 @@
>  
>    var all_versions = {
>      'dev': 'dev (3.3)',
> -    '3.2.1': '3.2.1',
> -    '3.1.4': '3.1.4',
> -    '3.0.4': '3.0.4',
> -    '2.7.4': '2.7.4',
> +    '3.2.1': 'gatesgarth (3.2.1)',
> +    '3.1.4': 'dunfell (3.1.4)',
> +    '3.0.4': 'zeus (3.0.4)',
> +    '2.7.4': 'warrior (2.7.4)',
>    };
>  
>    var all_doctypes = {
> -- 
> 2.29.2
> 

> 
> 
> 


-- 
StreamUnlimited Engineering GmbH
High Tech Campus Vienna, Gutheil-Schoder-Gasse 10, 1100 Vienna, Austria
Fax: +43 1 667 20 02 4401
quentin.schulz@streamunlimited.com, www.streamunlimited.com
