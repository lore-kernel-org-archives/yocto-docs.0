Received: from bsmtp3.bon.at (bsmtp3.bon.at [213.33.87.17])
 by mx.groups.io with SMTP id smtpd.web10.6085.1618820961316062034
 for <docs@lists.yoctoproject.org>;
 Mon, 19 Apr 2021 01:29:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.17, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp3.bon.at (Postfix) with ESMTPSA id 4FP0NF3PqCz5tlM;
	Mon, 19 Apr 2021 10:29:17 +0200 (CEST)
Date: Mon, 19 Apr 2021 10:29:16 +0200
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH v2 0/3] manuals: simplify colon usage
Message-ID: <20210419082916.jhlpzb6os63ykjyi@qschulz>
References: <20210416175549.161851-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <20210416175549.161851-1-michael.opdenacker@bootlin.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Michael,

On Fri, Apr 16, 2021 at 07:55:46PM +0200, Michael Opdenacker wrote:
> Following yesterday's discussions, here is an update to the
> changes I propose:
> 
> - The first patch fixes an alignment issue
>   Without this fix, the 3rd patch doesn't generate
>   exactly identical HTML code
> 

Good catch!

> - The second patch (replacing ": ::" by "::")
>   is unmodified
> 
> - The third patch was suggested by Quentin Schulz,
>   and applies similarly on two consecutive lines.
>   It was applied automatically.
> 
> Same HTML code from fewer bytes!
> 

Not sure we care the fewer bytes part, but we certainly do care about
the same output! I can't reasonably give you my Reviewed-By, nor can I
give you an Acked-by, so mmmm... well LGTM since you verified that the
HTML output is unchanged :)

Many thanks, one step closer to consistency \o/

Cheers,
Quentin

> Michael Opdenacker (3):
>   dev-manual: fix code insertion
>   manuals: simplify code insertion
>   manuals: code insertion simplification over two lines
> 
>  documentation/brief-yoctoprojectqs/index.rst  |    2 +-
>  documentation/bsp-guide/bsp.rst               |   56 +-
>  documentation/dev-manual/common-tasks.rst     | 1020 ++++++-----------
>  documentation/dev-manual/qemu.rst             |   24 +-
>  documentation/dev-manual/start.rst            |   30 +-
>  documentation/kernel-dev/advanced.rst         |   87 +-
>  documentation/kernel-dev/common.rst           |  225 ++--
>  documentation/kernel-dev/concepts-appx.rst    |    6 +-
>  documentation/kernel-dev/faq.rst              |    6 +-
>  documentation/kernel-dev/maint-appx.rst       |   15 +-
>  documentation/overview-manual/concepts.rst    |   51 +-
>  .../development-environment.rst               |    6 +-
>  documentation/profile-manual/intro.rst        |   10 +-
>  documentation/profile-manual/usage.rst        |  184 +--
>  documentation/ref-manual/classes.rst          |   87 +-
>  .../ref-manual/devtool-reference.rst          |   51 +-
>  documentation/ref-manual/faq.rst              |   20 +-
>  documentation/ref-manual/features.rst         |    3 +-
>  documentation/ref-manual/images.rst           |    5 +-
>  documentation/ref-manual/kickstart.rst        |    6 +-
>  documentation/ref-manual/migration-1.3.rst    |    7 +-
>  documentation/ref-manual/migration-1.4.rst    |    6 +-
>  documentation/ref-manual/migration-1.6.rst    |    8 +-
>  documentation/ref-manual/migration-1.7.rst    |    6 +-
>  documentation/ref-manual/migration-1.8.rst    |    6 +-
>  documentation/ref-manual/migration-2.0.rst    |    9 +-
>  documentation/ref-manual/migration-2.1.rst    |    9 +-
>  documentation/ref-manual/migration-2.2.rst    |   14 +-
>  documentation/ref-manual/migration-2.3.rst    |   16 +-
>  documentation/ref-manual/migration-2.5.rst    |    8 +-
>  documentation/ref-manual/migration-2.6.rst    |   15 +-
>  documentation/ref-manual/migration-3.1.rst    |    7 +-
>  documentation/ref-manual/migration-3.2.rst    |    6 +-
>  documentation/ref-manual/qa-checks.rst        |   19 +-
>  documentation/ref-manual/structure.rst        |   18 +-
>  .../ref-manual/system-requirements.rst        |   69 +-
>  documentation/ref-manual/tasks.rst            |   48 +-
>  documentation/ref-manual/terms.rst            |    3 +-
>  documentation/ref-manual/variables.rst        |  861 +++++---------
>  .../sdk-manual/appendix-customizing.rst       |   27 +-
>  documentation/sdk-manual/appendix-obtain.rst  |   30 +-
>  documentation/sdk-manual/extensible.rst       |   81 +-
>  documentation/sdk-manual/using.rst            |    6 +-
>  documentation/sdk-manual/working-projects.rst |   60 +-
>  44 files changed, 1129 insertions(+), 2104 deletions(-)
> 
> -- 
> 2.25.1
> 

> 
> 
> 


-- 
StreamUnlimited Engineering GmbH
High Tech Campus Vienna, Gutheil-Schoder-Gasse 10, 1100 Vienna, Austria
Fax: +43 1 667 20 02 4401
quentin.schulz@streamunlimited.com, www.streamunlimited.com
