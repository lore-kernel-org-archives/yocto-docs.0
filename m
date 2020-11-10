Received: from bsmtp3.bon.at (bsmtp3.bon.at [213.33.87.17])
 by mx.groups.io with SMTP id smtpd.web11.25551.1605000814256521035
 for <docs@lists.yoctoproject.org>;
 Tue, 10 Nov 2020 01:33:34 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.17, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp3.bon.at (Postfix) with ESMTPSA id 4CVjNC1YVzz5tlJ;
	Tue, 10 Nov 2020 10:33:31 +0100 (CET)
Date: Tue, 10 Nov 2020 10:33:29 +0100
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] CI/CD for YP and bitbake docs
Message-ID: <20201110093329.iu3jbb3qvtp2zqzl@qschulz>
References: <CAP71Wjztx0OTgNou4L44LfFqbE3tReGeM3=N6=1CPO464bH6Ww@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP71Wjztx0OTgNou4L44LfFqbE3tReGeM3=N6=1CPO464bH6Ww@mail.gmail.com>
User-Agent: NeoMutt/20180716
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

On Mon, Nov 09, 2020 at 07:12:20PM +0100, Nicolas Dechesne wrote:
> hi there,
> 
> I wanted to let everyone know what we have put in place some CI/CD to
> deploy docs onto our new docs.yoctoproject.org website. And we are
> doing it with the YP autobuilder, of course ;)
> 
> The autobuilder job can be found here:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/114
> 
> We are deploying several 'versions' of the docs:
> * 'master' is published to https://docs.yoctoproject.org/.
> * 'gatesgarth' to https://docs.yoctoproject.org/gatesgarth/
> * 'master-next' to https://docs.yoctoproject.org/next/
> * each 'tag/release' is published to https://docs.yoctoproject.org/<VERSION>
> 
> Similarly, for bitbake, we have:
> * https://docs.yoctoproject.org/bitbake/
> * https://docs.yoctoproject.org/bitbake/1.48
> * https://docs.yoctoproject.org/bitbake/next/
> 
> There are more details on this bug report, if you are curious:
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=14114
> 
> The whole deployment is now done automatically (for all branches, not
> tags/releases), and this should be a great benefit for all of us.
> 
> We are still working on polishing some details.. but I wanted to bring
> that to your attention, in case you notice any new issues. In which
> case, please report them here, or on Bugzilla!
> 
> Many thanks to Richard for working out the AB magic..
> 

Thanks all!

May I suggest we turn warnings into errors with "-W" by default? We
probably want to add "--keep-going" also so that it prints all warnings
and not only the first one found. And probably "-w" to also redirect to
a file (in addition to stderr).

I should maybe start converting <#>__ links into :ref: :)

Maybe we also want to run linkcheck every now and then to check for
deadlinks in the documentation (maybe monitor redirects too if they don't
really make sense).

Cheers,
Quentin
