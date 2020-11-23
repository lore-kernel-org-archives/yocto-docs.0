Received: from bsmtp3.bon.at (bsmtp3.bon.at [213.33.87.17])
 by mx.groups.io with SMTP id smtpd.web08.37301.1606147515952589575
 for <docs@lists.yoctoproject.org>;
 Mon, 23 Nov 2020 08:05:16 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.17, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp3.bon.at (Postfix) with ESMTPSA id 4CfsS86DZ9z5tlN;
	Mon, 23 Nov 2020 17:05:12 +0100 (CET)
Date: Mon, 23 Nov 2020 17:05:11 +0100
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: Paul Barker <pbarker@konsulko.com>,
	YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH v2 2/9] dev-manual-common-tasks: Fix refs to testing branches
Message-ID: <20201123160511.2uxmxgsabqrbmqqa@qschulz>
References: <20201118100705.3656-1-pbarker@konsulko.com>
 <20201118100705.3656-2-pbarker@konsulko.com>
 <CAP71Wjw449WP=VZncMDF5c+GtYYMbAssWMLtYK6E-=3+J8qzaA@mail.gmail.com>
 <CAM9ZRVs8C0uoZOSVEqZ7Es1Az+mbSp-7JfFpKjp7smhcGJaVYg@mail.gmail.com>
 <CAP71WjyJjZGDZZ1_S3iAWrA7ht0snV9XjFU1a2F7Q-uoEdniQA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP71WjyJjZGDZZ1_S3iAWrA7ht0snV9XjFU1a2F7Q-uoEdniQA@mail.gmail.com>
User-Agent: NeoMutt/20180716
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

On Mon, Nov 23, 2020 at 05:00:32PM +0100, Nicolas Dechesne wrote:
> On Mon, Nov 23, 2020 at 4:40 PM Paul Barker <pbarker@konsulko.com> wrote:
> >
> > On Wed, 18 Nov 2020 at 11:23, Nicolas Dechesne
> > <nicolas.dechesne@linaro.org> wrote:
> > >
> > > On Wed, Nov 18, 2020 at 11:07 AM Paul Barker <pbarker@konsulko.com> wrote:
> > > >
> > > > After discussions on IRC with Ross we concluded that the `ross/mut`
> > > > branch shouldn't really be listed in the docs as it's more of a personal
> > > > test branch. Instead we should list the -next branches for
> > > > openembedded-core and poky.
> > > >
> > > > Signed-off-by: Paul Barker <pbarker@konsulko.com>
> > > > ---
> > > >  .../dev-manual/dev-manual-common-tasks.rst    | 33 ++++++++++++-------
> > > >  1 file changed, 21 insertions(+), 12 deletions(-)
> > > >
> > > > diff --git a/documentation/dev-manual/dev-manual-common-tasks.rst b/documentation/dev-manual/dev-manual-common-tasks.rst
> > > > index 27aacde60..6f526c203 100644
> > > > --- a/documentation/dev-manual/dev-manual-common-tasks.rst
> > > > +++ b/documentation/dev-manual/dev-manual-common-tasks.rst
> > > > @@ -10665,18 +10665,27 @@ to a contribution repository that is upstream. See the ":ref:`gs-git-workflows-a
> > > >  section in the Yocto Project Overview and Concepts Manual for additional
> > > >  concepts on working in the Yocto Project development environment.
> > > >
> > > > -Two commonly used testing repositories exist for OpenEmbedded-Core:
> > > > -
> > > > --  *"ross/mut" branch:* The "mut" (master-under-test) tree exists in the
> > > > -   ``poky-contrib`` repository in the
> > > > -   :yocto_git:`Yocto Project source repositories <>`.
> > > > -
> > > > --  *"master-next" branch:* This branch is part of the main "poky"
> > > > -   repository in the Yocto Project source repositories.
> > > > -
> > > > -Maintainers use these branches to test submissions prior to merging
> > > > -patches. Thus, you can get an idea of the status of a patch based on
> > > > -whether the patch has been merged into one of these branches.
> > > > +Maintainers commonly use ``-next`` branches to test submissions prior to
> > > > +merging patches. Thus, you can get an idea of the status of a patch based on
> > > > +whether the patch has been merged into one of these branches. The commonly
> > > > +used testing branches for OpenEmbedded-Core are as follows:
> > > > +
> > > > +-  *openembedded-core "master-next" branch:* This branch is part of the
> > > > +   :oe_git:`openembedded-core </openembedded-core/>` repository contains
> > > > +   proposed changes to the core metadata.
> > > > +
> > > > +-  *poky "master-next" branch:* This branch is part of the
> > > > +   :yocto_git:`poky </cgit/cgit.cgi/poky/>` repository and combines proposed
> > > > +   changes to bitbake, the core metadata and the poky distro.
> > > > +
> > > > +Similarly, stable branches maintained by the project may have corresponding
> > > > +``-next`` branches which collect proposed changes. For example,
> > > > +``dunfell-next`` and ``gatesgarth-next`` branches in both the
> > > > +"openembdedded-core" and "poky" repositories.
> > >
> > > Perhaps using DISTRO_NAME_NO_CAP and DISTRO_NAME_NO_CAP_MINUS_ONE
> > > here, so that the documentation stays 'current' over the years?
> > > I think it's a good idea to keep 'dunfell-next' though (since it's
> > > LTS), so perhaps we can add DISTRO_NAME_NO_CAP_LTS variable which
> > > points to latest LTS, and use it and DISTRO_NAME_NO_CAP here.
> >
> > I'm making the changes today and I realised this may lead to confusion
> > for the next LTS release. How about we define
> > DISTRO_NAME_NO_CAP_PREV_LTS and then we can say that it will never be
> > equal to DISTRO_NAME_NO_CAP?
> 
> I think we need:
> 
> DISTRO_NAME_NO_CAP : the current release
> DISTRO_NAME_NO_CAP_MINUS_ONE : the previous release

Do we actually need this one?

> DISTRO_NAME_NO_CAP_LTS : the current LTS release (and yes, it might be
> DISTRO_NAME_NO_CAP right after an LTS)

Quentin
