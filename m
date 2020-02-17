Received: from bsmtp2.bon.at (bsmtp2.bon.at [213.33.87.16])
 by mx.groups.io with SMTP id smtpd.web10.8718.1581947590739594677
 for <docs@lists.yoctoproject.org>;
 Mon, 17 Feb 2020 05:53:11 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.16, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp2.bon.at (Postfix) with ESMTPSA id 48Lln030F7z5tlM
	for <docs@lists.yoctoproject.org>; Mon, 17 Feb 2020 14:53:07 +0100 (CET)
Date: Mon, 17 Feb 2020 14:53:06 +0100
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] dev-manual: mention RM_WORK_EXCLUDE with inheriting rm_work
Message-ID: <20200217135306.6w2lowkif7grh2ox@qschulz>
References: <alpine.LFD.2.21.2002170811030.2323392@localhost.localdomain>
MIME-Version: 1.0
In-Reply-To: <alpine.LFD.2.21.2002170811030.2323392@localhost.localdomain>
User-Agent: NeoMutt/20180716
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Robert,

On Mon, Feb 17, 2020 at 08:12:35AM -0500, rpjday@crashcourse.ca wrote:
> 
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> 
> ---
> 
> diff --git a/documentation/dev-manual/dev-manual-common-tasks.xml b/documentation/dev-manual/dev-manual-common-tasks.xml
> index 1e6addde4..721b6c719 100644
> --- a/documentation/dev-manual/dev-manual-common-tasks.xml
> +++ b/documentation/dev-manual/dev-manual-common-tasks.xml
> @@ -8986,6 +8986,12 @@
>              </literallayout>
>              Adding this statement deletes the work directory used for building
>              a recipe once the recipe is built.
> +            If "rm_work" is currently selected, you can override that cleaning
> +            on a per-recipe basis (typically for debugging purposes) by adding a
> +            line of this form to your <filename>local.conf</filename> file:
> +            <literallayout class='monospaced'>
> +     RM_WORK_EXCLUDE += "busybox"
> +            </literallayout>
>              For more information on "rm_work", see the
>              <ulink url='&YOCTO_DOCS_REF_URL;#ref-classes-rm-work'><filename>rm_work</filename></ulink>
>              class in the Yocto Project Reference Manual.
> 

RM_WORK_EXCLUDE is explained in the link provided just below your
change.
I'd think it's not needed to duplicate the information, especially
because we link to it?

Quentin
