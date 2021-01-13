Received: from bsmtp3.bon.at (bsmtp3.bon.at [213.33.87.17])
 by mx.groups.io with SMTP id smtpd.web12.5408.1610527986958331795
 for <docs@lists.yoctoproject.org>;
 Wed, 13 Jan 2021 00:53:08 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.17, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp3.bon.at (Postfix) with ESMTPSA id 4DG1S003gzz5tlL;
	Wed, 13 Jan 2021 09:53:03 +0100 (CET)
Date: Wed, 13 Jan 2021 09:53:02 +0100
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Leon Anavi <leon.anavi@konsulko.com>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCHv2] common-tasks.rst: Fix GNU_HASH in hello.bb
Message-ID: <20210113085302.2fll7sf3zbqdsegh@qschulz>
References: <20210112174600.4731-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
In-Reply-To: <20210112174600.4731-1-leon.anavi@konsulko.com>
User-Agent: NeoMutt/20180716
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Leon,

On Tue, Jan 12, 2021 at 07:46:00PM +0200, Leon Anavi wrote:
> Fix the following GNU_HASH issue in "Single .c File Package
> (Hello World!)" example:
> 
> ERROR: hello-1.0-r0 do_package_qa: QA Issue: File /usr/bin/helloworld in package hello doesn't have GNU_HASH (didn't pass LDFLAGS?) [ldflags]
> 
> Reported-by: Matthew Tsenkov <matthew.tsenkov@konsulko.com>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> ---
>  documentation/dev-manual/common-tasks.rst               | 2 +-
>  documentation/ref-manual/examples/hello-single/hello.bb | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
> index e1dee8ecd..6281e0e3b 100644
> --- a/documentation/dev-manual/common-tasks.rst
> +++ b/documentation/dev-manual/common-tasks.rst
> @@ -2298,7 +2298,7 @@ directory BitBake uses for the build.
>     S = "${WORKDIR}"
>  
>     do_compile() {
> -       ${CC} helloworld.c -o helloworld
> +       ${CC} ${LDFLAGS} helloworld.c -o helloworld
>     }
>  
>     do_install() {
> diff --git a/documentation/ref-manual/examples/hello-single/hello.bb b/documentation/ref-manual/examples/hello-single/hello.bb
> index 0812743e3..90d3aefd8 100644
> --- a/documentation/ref-manual/examples/hello-single/hello.bb
> +++ b/documentation/ref-manual/examples/hello-single/hello.bb
> @@ -8,7 +8,7 @@ SRC_URI = "file://helloworld.c"
>  S = "${WORKDIR}"
>  
>  do_compile() {
> -	${CC} helloworld.c -o helloworld
> +	${CC} ${LDFLAGS} helloworld.c -o helloworld
>  }
>  

Thanks for the patch,
Reviewed-by: Quentin Schulz <foss@0leil.net>

Quentin
