Received: from bsmtp2.bon.at (bsmtp2.bon.at [213.33.87.16])
 by mx.groups.io with SMTP id smtpd.web10.8207.1600416851381934466
 for <docs@lists.yoctoproject.org>;
 Fri, 18 Sep 2020 01:14:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.16, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp2.bon.at (Postfix) with ESMTPSA id 4Bt6743NFDz5tlP;
	Fri, 18 Sep 2020 10:14:08 +0200 (CEST)
Date: Fri, 18 Sep 2020 10:14:07 +0200
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: Quentin Schulz <foss@0leil.net>, docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 1/2] docs: static: theme_overrides.css: fix responsive design on <640px screens
Message-ID: <20200918081406.zr6u2evo55tfmgvz@qschulz>
References: <20200917210947.51974-1-foss@0leil.net>
 <CAP71Wjwm_LYCVGAhm8O+0tC1K=aCLhwjmF_j5mh_gJGi4nYmJw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP71Wjwm_LYCVGAhm8O+0tC1K=aCLhwjmF_j5mh_gJGi4nYmJw@mail.gmail.com>
User-Agent: NeoMutt/20180716
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Nicolas,

On Thu, Sep 17, 2020 at 11:47:34PM +0200, Nicolas Dechesne wrote:
> On Thu, Sep 17, 2020 at 11:10 PM Quentin Schulz <foss@0leil.net> wrote:
> >
> > From experience the body takes the whole space anyway and the text stays
> > within the screen boundaries by default, no need to make the min-width
> > 640px then.
> >
> > Signed-off-by: Quentin Schulz <foss@0leil.net>
> > ---
> >  documentation/sphinx-static/theme_overrides.css | 2 --
> >  1 file changed, 2 deletions(-)
> >
> > diff --git a/documentation/sphinx-static/theme_overrides.css b/documentation/sphinx-static/theme_overrides.css
> > index c18053398..55da38a2b 100644
> > --- a/documentation/sphinx-static/theme_overrides.css
> > +++ b/documentation/sphinx-static/theme_overrides.css
> > @@ -4,8 +4,6 @@
> >
> >  body {
> >    font-family: Verdana, Sans, sans-serif;
> > -
> > -  min-width: 640px;
> 
> hmm. interesting. I made this change very early when I was still using
> the default theme, not the one we use currently. I just made a few
> tests, and it looks it might not be useful at all with the rtd theme..
> i will test it more. Is that fixing the rendering issues you noticed
> on 'mobile'?
> 

I didn't test on "real" mobile but I could emulate a screen from within
Firefox with the Developer console with Ctrl+Shift+M. You can select
Galaxy S9 for example and you'll have what I had on my mobile phone.
With my patch, using my desktop resolution, iPad's and S9's, it seems
removing it has a good impact on low resolution and none on bigger
resolution from the few tests I did.

Use Shift+Mouse wheel to navigate horizontally (at least on my distro
and in FF).
It is obvious without the horizontal scrolling when displaying the navbar
(click on the hamburger top left).

Also, I've spent an hour or sotrying to find a solution to make sphinx detect
static files changes but couldn't figure anything out.
Beware, removing the _build/html directory isn't even enough to copy
newly changed static files. I had to remove the whole _build directory
to make it rebuild. There's probably a smarter way to do it but for
automation you might to know what does not work well for now.

c.f.: https://github.com/sphinx-doc/sphinx/issues/2090

I didn't want to go the route of the last comment which is ALWAYS
rebuilding index.rst and didn't want to hack to much.

So, static_css_files and static_js_files are copied only on the first
build but not later on.

Quentin

> >    margin:  0em auto;
> >    color: #333;
> >  }
> > --
> > 2.26.2
> >
> >
> > 
> >

> 
> 
> 


-- 
StreamUnlimited Engineering GmbH
High Tech Campus Vienna, Gutheil-Schoder-Gasse 10, 1100 Vienna, Austria
Fax: +43 1 667 20 02 4401
quentin.schulz@streamunlimited.com, www.streamunlimited.com
