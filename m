Received: from bsmtp1.bon.at (bsmtp1.bon.at [213.33.87.15])
 by mx.groups.io with SMTP id smtpd.web08.297.1623081550289706654
 for <docs@lists.yoctoproject.org>;
 Mon, 07 Jun 2021 08:59:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.15, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp1.bon.at (Postfix) with ESMTPSA id 4FzJ2h0vLzz5tlB;
	Mon,  7 Jun 2021 17:59:07 +0200 (CEST)
Date: Mon, 7 Jun 2021 17:59:06 +0200
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: docs <docs@lists.yoctoproject.org>
Subject: Re: [docs] [poky] [PATCH] README.poky: Update to switch to markdown format and update
Message-ID: <20210607155906.3hgtcl6fsyedstrh@qschulz>
References: <16865661A55682C8.7118@lists.yoctoproject.org>
 <3c7b1f74d4b989316e24be08db75f34720198e2d.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <3c7b1f74d4b989316e24be08db75f34720198e2d.camel@linuxfoundation.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Richard,

On Mon, Jun 07, 2021 at 04:36:22PM +0100, Richard Purdie wrote:
> Mentioning on the docs list.
> 
> I a plan is forming to migrate the various READMEs in the repos to markdown
> format and display these in the git web interface in the about page. If this

Does it need to be in MarkDown format to be displayed in the About
section?

> merges I'll work with MichaelH to make sure it displays properly on the
> about page.
> 
> I've had a go at improving the poky one which needed a bit of modernisation
> anyway. Help with others welcome.
> 

Anyway to have those two changes separate so we can properly review each
separately?

> I am a little torn on this as it does make the README harder to read
> outside of rendered interfaces.
> 

But it'd be displayed correctly in the Github mirror and Gitlab for
those using it I guess.

Most projects hosted on Github/Gitlab use MarkDown so I don't think it's
such a bad idea, I'm just not sure it has as much benefit on cgit since
it's not the landing page of the repo (the summary page is).

If we can display the non-MD version in the about page, I don't think
there's a huge benefit of migrating to MD?

If we absolutely need MD for the about page, go for it as it'll cover
Github, Gitlab and probably others.

We might want to modify bitbake-layers create-layer to provide a
README.md too instead of the current template?

Cheers,
Quentin
