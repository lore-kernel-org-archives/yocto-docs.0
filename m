Received: from bsmtp2.bon.at (bsmtp2.bon.at [213.33.87.16])
 by mx.groups.io with SMTP id smtpd.web12.8450.1618836757596380548
 for <docs@lists.yoctoproject.org>;
 Mon, 19 Apr 2021 05:52:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.16, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp2.bon.at (Postfix) with ESMTPSA id 4FP6D23rjKz5tlF;
	Mon, 19 Apr 2021 14:52:34 +0200 (CEST)
Date: Mon, 19 Apr 2021 14:52:33 +0200
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	docs <docs@lists.yoctoproject.org>
Subject: Re: [docs] [OE-core] [PATCH 4/4] dev-manual/common-tasks.rst: correct the documentation for debuginfod
Message-ID: <20210419125233.dfdhre6ojxgphocb@qschulz>
References: <20210419090044.582453-4-alex.kanavin@gmail.com>
 <8b2212544d8f565c7343a88d837c8c6f390e82e8.camel@linuxfoundation.org>
 <20210419103354.3gq6dn2c2tw7f3k2@qschulz>
 <CANNYZj9DDzJfoAzXwz+yJbHfsDfbBHdhZvewCZXXsELP9B_uEQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANNYZj9DDzJfoAzXwz+yJbHfsDfbBHdhZvewCZXXsELP9B_uEQ@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Alex,

On Mon, Apr 19, 2021 at 02:39:00PM +0200, Alexander Kanavin wrote:
> Thank you, I will fix these up and resend. Is docs@ the right destination
> for patches to documentation/ ?
> 

Yes, as far as my understanding goes, documentation/ in poky is handled
the same way as e.g. meta layer (which comes from openembedded-core).
So, the actual git repo/branch to base your patch against is:
https://git.yoctoproject.org/cgit/cgit.cgi/yocto-docs branch master
or master-next if there are conflicts not straightforward to fix.

There, you can read
https://git.yoctoproject.org/cgit/cgit.cgi/yocto-docs/tree/README to
know how to contribute and
https://git.yoctoproject.org/cgit/cgit.cgi/yocto-docs/tree/documentation/README
to know a bit more about what's what and the rules (until we get a
CONTRIBUTING or GUIDELINES or whatever file to explain the implicit
rules).

Let us know if there's anything that needs clarification or if you need
help!

Cheers,
Quentin

> Alex
> 
> On Mon, 19 Apr 2021 at 12:33, Quentin Schulz <
> quentin.schulz@streamunlimited.com> wrote:
> 
> > Hi all,
> >
> > On Mon, Apr 19, 2021 at 11:11:21AM +0100, Richard Purdie wrote:
> > > Forwarded from OE-Core to ensure docs people see it.
> > >
> > > Cheers,
> > >
> > > Richard
> >
> > > Date: Mon, 19 Apr 2021 11:00:44 +0200
> > > From: Alexander Kanavin <alex.kanavin@gmail.com>
> > > To: openembedded-core@lists.openembedded.org
> > > Cc: Alexander Kanavin <alex.kanavin@gmail.com>
> > > Subject: [OE-core] [PATCH 4/4] dev-manual/common-tasks.rst: correct the
> > >  documentation for debuginfod
> > >
> > > Particularly,
> > > - correctly describe the use of DEBUGINFOD_URLS; drop it from bitbake
> > variables
> > > - all necessary component tweaks are enabled by default via
> > DISTRO_FEATURES
> > > - provide on-target examples of what to look for when things work
> > properly
> > >
> > > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > > ---
> > >  documentation/dev-manual/common-tasks.rst | 34 +++++++++++++++--------
> > >  documentation/ref-manual/variables.rst    |  6 ----
> > >  2 files changed, 22 insertions(+), 18 deletions(-)
> > >
> > > diff --git a/documentation/dev-manual/common-tasks.rst
> > b/documentation/dev-manual/common-tasks.rst
> > > index 176025f9e8..9f33b6b2c8 100644
> > > --- a/documentation/dev-manual/common-tasks.rst
> > > +++ b/documentation/dev-manual/common-tasks.rst
> > > @@ -10005,34 +10005,44 @@ debug symbols from the server.
> > >
> > >  To run a debuginfod server, you need to do the following:
> > >
> > > --  Ensure that this variable is set in your ``local.conf`` file:
> > > +-  Ensure that "debuginfod" is present in :term:`DISTRO_FEATURES
> >
> > Missing trailing `.
> >
> > > +   (it already is in oe-core defaults and poky reference distribution).
> >
> > s/oe-core/``OpenEmbedded-core/ ?
> > s/poky/``poky``/ ?
> >
> > > +   If not, set:
> > >     ::
> > >
> > > -      PACKAGECONFIG_pn-elfutils-native = "debuginfod libdebuginfod"
> > > +      DISTRO_FEATURES_append = " debuginfod"
> > >
> > > -   This :term:`PACKAGECONFIG` option enables debuginfod and
> > libdebuginfod for
> > > -   "elfutils-native".
> > > +   This distro feature enables the server and client library in
> > elfutils,
> >
> > s/elfutils/``elfutils``/ ?
> >
> > > +   and enables debuginfod support in clients (at the moment, gdb and
> > binutils).
> > >
> >
> > s/debuginfod/``debuginfod``/ ?
> > s/gdb/``gdb``/ ?
> > s/binutils/``binutils``/ ?
> >
> > > --  Run the following commands to set up the "debuginfod" server:
> > > +-  Run the following commands to launch the "debuginfod" server on the
> > host:
> >
> > s/"debuginfod"/``debuginfod``/ ?
> >
> > >     ::
> > >
> > >        $ oe-debuginfod
> > >
> > > +-  To use debuginfod on the target, you need to know the ip:port where
> > > +   debuginfod is listening on the host (port defaults to 8002), and
> > export
> >
> > s/debuginfod/``debuginfod``/ for both debuginfod?
> >
> > > +   that into the shell environment, for example in qemu:
> >
> > s/qemu/``qemu``/ ?
> >
> > > +   ::
> > >
> >
> > It should be:
> >
> > that into the shell environment, for example in qemu::
> >
> > instead.
> >
> > > -To use debuginfod on the target, you need the following:
> > > +      root@qemux86-64:~# export DEBUGINFOD_URLS="
> > http://192.168.7.1:8002/"
> > >
> > > --  Ensure that this variable is set in your ``local.conf`` file:
> > > +-  Then debug info fetching should simply work when running the target
> > gdb,
> >
> > s/gdb/``gdb``/ ?
> >
> > > +   readelf or objdump, for example:
> >
> > s/readelf/``readelf``/ ?
> > s/objdump/``objdump``/ ?
> >
> > >     ::
> > >
> >
> > It should be:
> >
> > readelf or objdump, for example::
> >
> > instead.
> >
> > > -      DEBUGINFOD_URLS = "http://localhost:8002/"
> > > -
> > > -   This :term:`DEBUGINFOD_URLS` option does the client configuration.
> > > +      root@qemux86-64:~# gdb /bin/cat
> > > +      ...
> > > +      Reading symbols from /bin/cat...
> > > +      Downloading separate debug info for /bin/cat...
> > > +      Reading symbols from
> > /home/root/.cache/debuginfod_client/923dc4780cfbc545850c616bffa884b6b5eaf322/debuginfo...
> > >
> > > +-  It's also possible to use "debuginfod-find" to just query the server:
> >
> > s/"debuginfod-find"/``debuginfod-find``/ ?
> >
> > >     ::
> > >
> >
> > It should be:
> >
> > It's also possible to use "debuginfod-find" to just query the server::
> >
> > instead.
> >
> > Cheers,
> > Quentin
> >

> 
> 
> 


-- 
StreamUnlimited Engineering GmbH
High Tech Campus Vienna, Gutheil-Schoder-Gasse 10, 1100 Vienna, Austria
Fax: +43 1 667 20 02 4401
quentin.schulz@streamunlimited.com, www.streamunlimited.com
