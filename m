Received: from bsmtp.bon.at (bsmtp.bon.at [213.33.87.14])
 by mx.groups.io with SMTP id smtpd.web09.6763.1610442988420593129
 for <docs@lists.yoctoproject.org>;
 Tue, 12 Jan 2021 01:16:29 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.14, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp.bon.at (Postfix) with ESMTPSA id 4DFQ1P1VtCz5tlC;
	Tue, 12 Jan 2021 10:16:25 +0100 (CET)
Date: Tue, 12 Jan 2021 10:16:24 +0100
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Leon Anavi <leon.anavi@konsulko.com>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] common-tasks.rst: Fix GNU_HASH in hello.bb
Message-ID: <20210112091623.4puwnclbtw4nixno@qschulz>
References: <20210111191655.23792-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
In-Reply-To: <20210111191655.23792-1-leon.anavi@konsulko.com>
User-Agent: NeoMutt/20180716
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Leon,

On Mon, Jan 11, 2021 at 09:16:55PM +0200, Leon Anavi wrote:
> Add TARGET_CC_ARCH += "${LDFLAGS}" to the "Single .c File Package
> (Hello World!)" example to fix the following GNU_HASH issue,
> following the recommendations from section "Default Linker Hash
> Style Changed":
> 
> ERROR: hello-1.0-r0 do_package_qa: QA Issue: File /usr/bin/helloworld in package hello doesn't have GNU_HASH (didn't pass LDFLAGS?) [ldflags]
> 
> Reported-by: Matthew Tsenkov <matthew.tsenkov@konsulko.com>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> ---
>  documentation/dev-manual/common-tasks.rst               | 2 ++
>  documentation/ref-manual/examples/hello-single/hello.bb | 2 ++
>  2 files changed, 4 insertions(+)
> 
> diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
> index e1dee8ecd..b816536d9 100644
> --- a/documentation/dev-manual/common-tasks.rst
> +++ b/documentation/dev-manual/common-tasks.rst
> @@ -2297,6 +2297,8 @@ directory BitBake uses for the build.
>  
>     S = "${WORKDIR}"
>  
> +   TARGET_CC_ARCH += "${LDFLAGS}"
> +
>     do_compile() {
>         ${CC} helloworld.c -o helloworld
>     }

Shouldn't it just be:

do_compile() {
- 	${CC} helloworld.c -o helloworld
+	${CC} ${LDFLAGS} helloworld.c -o helloworld
}

instead?

Might even want to pass CFLAGS to the line too.

Cheers,
Quentin
