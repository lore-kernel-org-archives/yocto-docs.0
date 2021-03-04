Received: from bsmtp3.bon.at (bsmtp3.bon.at [213.33.87.17])
 by mx.groups.io with SMTP id smtpd.web11.6329.1614865176142048857
 for <docs@lists.yoctoproject.org>;
 Thu, 04 Mar 2021 05:39:37 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.17, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp3.bon.at (Postfix) with ESMTPSA id 4DrsRS5FFQz5tlM;
	Thu,  4 Mar 2021 14:39:32 +0100 (CET)
Date: Thu, 4 Mar 2021 14:39:31 +0100
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: Gilles Maire <gilles@gillesmaire.com>,
	YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] bitbake user manual
Message-ID: <20210304133931.ibcfzpzj3vucjs7i@qschulz>
References: <5bc0c0d6-10c6-c264-8026-ac7997d20e0e@gillesmaire.com>
 <CAP71WjwWKREMD2ZsUBSHU8nPOrHFvq_cJDmwP22QDdA=tb8erA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP71WjwWKREMD2ZsUBSHU8nPOrHFvq_cJDmwP22QDdA=tb8erA@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 04, 2021 at 12:58:08PM +0100, Nicolas Dechesne wrote:
> hey,
> 
> 
> On Thu, Mar 4, 2021 at 9:04 AM Gilles Maire <gilles@gillesmaire.com> wrote:
> >
> >
> >  Hello
> >
> >  in 6.4 chapter under 9 point Creating a layer
> >
> >
> >  BBPATH .= ":${LAYERDIR}"
> >  BBFILES += "${LAYERDIR}/\*.bb"

Remove the \ before the * and it should work now. Please send a patch
with the removed ` and \ :)

Thanks for the report,
Quentin
